Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233F47124B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165DF10E3A3;
	Sat, 11 Dec 2021 06:59:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035110E3B3;
 Sat, 11 Dec 2021 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639205940; x=1670741940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VeaTcmkQV0TSpDcijcaY4A1S2Jhvv9jWM2wC93NKIZ4=;
 b=SHSHOh1MX5YmgvJL7uKEAUbQxbdja1kl1osEfJfM7ry0zDqGuqA4SIt3
 516e0vkyYtIzDe7SlI7yGOtZc8kdOu8g7dV+eIzUGg2Fm45k4r23NKj0v
 cqc7WG0VBR4E4OYuxcwreDIt1/4RU/9y9CckWKDQpZo2H0YrVfJg+oBCs
 rhdb6XEIb+bRkx6yYvcM/lvTOpFeFhVamcH5k/K8vPKLZYwKgDQNfV4zZ
 YPQyDIFvBKthNzdjCROTBK64ZEAA8ZB10wAvqik45sZ5Qd263fv7ukPI0
 xwSL2ARZOco//VPx7aEszwNe9d0OSp256f8KDB0mmjENkAnkW9hYv4kM7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237249046"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237249046"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 22:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463979851"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 22:58:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/4] drm/i915/guc: Speed up GuC log dumps
Date: Fri, 10 Dec 2021 22:58:56 -0800
Message-Id: <20211211065859.2248188-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Add support for telling the debugfs interface the size of the GuC log
dump in advance. Without that, the underlying framework keeps calling
the 'show' function with larger and larger buffer allocations until it
fits. That means reading the log from graphics memory many times - 16
times with the full 18MB log size.

v2: Don't return error codes from size query. Report overflow in the
error dump as well (review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 +++++--
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 58 ++++++++++++++++++-
 2 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index e307ceb99031..17e79b735cfe 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
@@ -10,11 +10,7 @@
 
 struct intel_gt;
 
-#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)				\
-	static int __name ## _open(struct inode *inode, struct file *file) \
-{									\
-	return single_open(file, __name ## _show, inode->i_private);	\
-}									\
+#define __GT_DEBUGFS_ATTRIBUTE_FOPS(__name)				\
 static const struct file_operations __name ## _fops = {			\
 	.owner = THIS_MODULE,						\
 	.open = __name ## _open,					\
@@ -23,6 +19,21 @@ static const struct file_operations __name ## _fops = {			\
 	.release = single_release,					\
 }
 
+#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)			\
+static int __name ## _open(struct inode *inode, struct file *file)	\
+{									\
+	return single_open(file, __name ## _show, inode->i_private);	\
+}									\
+__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
+
+#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(__name, __size_vf)		\
+static int __name ## _open(struct inode *inode, struct file *file)		\
+{										\
+	return single_open_size(file, __name ## _show, inode->i_private,	\
+			    __size_vf(inode->i_private));			\
+}										\
+__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
+
 void intel_gt_debugfs_register(struct intel_gt *gt);
 
 struct intel_gt_debugfs_file {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
index 8fd068049376..ddfbe334689f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
@@ -10,22 +10,74 @@
 #include "intel_guc.h"
 #include "intel_guc_log.h"
 #include "intel_guc_log_debugfs.h"
+#include "intel_uc.h"
+
+static u32 obj_to_guc_log_dump_size(struct drm_i915_gem_object *obj)
+{
+	u32 size;
+
+	if (!obj)
+		return PAGE_SIZE;
+
+	/* "0x%08x 0x%08x 0x%08x 0x%08x\n" => 16 bytes -> 44 chars => x2.75 */
+	size = ((obj->base.size * 11) + 3) / 4;
+
+	/* Add padding for final blank line, any extra header info, etc. */
+	size = PAGE_ALIGN(size + PAGE_SIZE);
+
+	return size;
+}
+
+static u32 guc_log_dump_size(struct intel_guc_log *log)
+{
+	struct intel_guc *guc = log_to_guc(log);
+
+	if (!intel_guc_is_supported(guc))
+		return PAGE_SIZE;
+
+	if (!log->vma)
+		return PAGE_SIZE;
+
+	return obj_to_guc_log_dump_size(log->vma->obj);
+}
 
 static int guc_log_dump_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
+	int ret;
 
-	return intel_guc_log_dump(m->private, &p, false);
+	ret = intel_guc_log_dump(m->private, &p, false);
+
+	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) && seq_has_overflowed(m))
+		pr_warn_once("preallocated size:%zx for %s exceeded\n",
+			     m->size, __func__);
+
+	return ret;
+}
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_log_dump, guc_log_dump_size);
+
+static u32 guc_load_err_dump_size(struct intel_guc_log *log)
+{
+	struct intel_guc *guc = log_to_guc(log);
+	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
+
+	if (!intel_guc_is_supported(guc))
+		return PAGE_SIZE;
+
+	return obj_to_guc_log_dump_size(uc->load_err_log);
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
 
 static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) && seq_has_overflowed(m))
+		pr_warn_once("preallocated size:%zx for %s exceeded\n",
+			     m->size, __func__);
+
 	return intel_guc_log_dump(m->private, &p, true);
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_load_err_log_dump, guc_load_err_dump_size);
 
 static int guc_log_level_get(void *data, u64 *val)
 {
-- 
2.25.1

