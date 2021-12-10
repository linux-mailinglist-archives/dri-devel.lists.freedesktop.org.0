Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0C46F9EC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 05:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F265910E239;
	Fri, 10 Dec 2021 04:40:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A5E10E1FE;
 Fri, 10 Dec 2021 04:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639111224; x=1670647224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lzATkxtIzU0OjmQB3qSC2M2gSYu+9N6blbrazo0DdtA=;
 b=g8XLPwyM9mbtD/9uzhLAev3L4Ev2n1IXjrmqsoXSQ8TEJ3BMmKgPIPfa
 zDQlJcE7En368BWkim6RP2PnyPMbbjxDmpaiSWeytlrdrjUDKDAbwpeQF
 14tuKHOWDW+Bf+ioWDqdg7JVU1P/VKLXsmBZNRkqJNnuHzMkZ/fepV0To
 qD1FMXvFh6ggNutzxfqxaR049YQO7o9CtCd7RmGzHyCdb30OQ7cg0pdzk
 Fo5dSf2fb6zxSrA37PKc7nAhrDOh3j89YpWSu29xkJ1EhOxQ0j4T40XHR
 5MsJu9vmtyQXzGWgIjKsPyz3JaIECHdWLrNOI6BEG2yg52kEuf94s2Dre A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218294568"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="218294568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 20:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="480606802"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 09 Dec 2021 20:40:23 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/4] drm/i915/guc: Speed up GuC log dumps
Date: Thu,  9 Dec 2021 20:40:20 -0800
Message-Id: <20211210044022.1842938-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210044022.1842938-1-John.C.Harrison@Intel.com>
References: <20211210044022.1842938-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 ++++++--
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 54 +++++++++++++++++--
 2 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index e307ceb99031..1adea367d99b 100644
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
+#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(__name, __size_vf)	\
+static int __name ## _open(struct inode *inode, struct file *file)	\
+{									\
+    return single_open_size(file, __name ## _show, inode->i_private,	\
+			    __size_vf(inode->i_private));		\
+}									\
+__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
+
 void intel_gt_debugfs_register(struct intel_gt *gt);
 
 struct intel_gt_debugfs_file {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
index 46026c2c1722..da7dd099fd93 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
@@ -10,14 +10,62 @@
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
+		return -ENODEV;
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
+		return -ENODEV;
+
+	if (!log->vma)
+		return -ENODEV;
+
+	return obj_to_guc_log_dump_size(log->vma->obj);
+}
 
 static int guc_log_dump_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
+	int ret;
+
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
+		return -ENODEV;
 
-	return intel_guc_log_dump(m->private, &p, false);
+	return obj_to_guc_log_dump_size(uc->load_err_log);
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
 
 static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
 {
@@ -25,7 +73,7 @@ static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
 
 	return intel_guc_log_dump(m->private, &p, true);
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_load_err_log_dump, guc_load_err_dump_size);
 
 static int guc_log_level_get(void *data, u64 *val)
 {
-- 
2.25.1

