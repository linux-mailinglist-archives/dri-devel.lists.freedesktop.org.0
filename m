Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8FB4E264E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 13:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BD110E1A6;
	Mon, 21 Mar 2022 12:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E09610E1A6;
 Mon, 21 Mar 2022 12:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647865691; x=1679401691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0+FjyvN0cQxSyLQQsrcNcSfpyRaadnzgIPETyE0uICU=;
 b=g61OYbLXKo68yAtlGi24Tu5k+vzTI8JdUsqQNhWnxS7/xQU1Krm6mfcI
 3kHU65JRxTI71nTDKkvDavfaQD91KXmnhYBg2Gm/KmSpcK34fML9d8k/G
 wKfGwoX7yh32ksdMNS9m2UPtm9fFulLw8GyJ7kBwnf6ISw9oB5kBlEkw9
 8chLl89aJDHdhPCUebyiD0t8Lg4d3d4xVlW+dlR7ucv8vUP1+ckDSSDI6
 6PB/jYf7XOBTAgXT3PS+iS/fh9+ZqE8F+YCX96KXtSgLpbN4cKxAE/gkx
 FkOSWOQQW9xMhzlBMZr70/78ZyeAgvfe6MNU7ooQTzok096YI5fYlLGBX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257727952"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257727952"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:28:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="543197813"
Received: from schiavaz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.32])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:28:08 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND] drm/i915/debugfs: Do not return '0' if there is
 nothing to return
Date: Mon, 21 Mar 2022 14:27:59 +0200
Message-Id: <20220321122759.227091-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Andi Shyti <andi@etezian.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change functions that always return '0' to be void type.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
Hi,

just resending it once more time. Matt, can you please commit
this refactoring if you are OK with it?

Andi

 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 16 ++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c           |  9 ++++++---
 5 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 6f45b131a0018..d886fdc2c694b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -30,7 +30,7 @@ int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val)
 	}
 }
 
-int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
+void intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
 {
 	/* Flush any previous reset before applying for a new one */
 	wait_event(gt->reset.queue,
@@ -38,7 +38,6 @@ int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
 
 	intel_gt_handle_error(gt, val, I915_ERROR_CAPTURE,
 			      "Manually reset engine mask to %llx", val);
-	return 0;
 }
 
 /*
@@ -52,7 +51,9 @@ static int __intel_gt_debugfs_reset_show(void *data, u64 *val)
 
 static int __intel_gt_debugfs_reset_store(void *data, u64 val)
 {
-	return intel_gt_debugfs_reset_store(data, val);
+	intel_gt_debugfs_reset_store(data, val);
+
+	return 0;
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index 17e79b735cfe9..e4110eebf0937 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
@@ -48,6 +48,6 @@ void intel_gt_debugfs_register_files(struct dentry *root,
 
 /* functions that need to be accessed by the upper level non-gt interfaces */
 int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val);
-int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val);
+void intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val);
 
 #endif /* INTEL_GT_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 4a1c74b8de053..31dbb2b967383 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -24,38 +24,38 @@
 #include "intel_uncore.h"
 #include "vlv_sideband.h"
 
-int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt)
+void intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt)
 {
 	atomic_inc(&gt->user_wakeref);
 	intel_gt_pm_get(gt);
 	if (GRAPHICS_VER(gt->i915) >= 6)
 		intel_uncore_forcewake_user_get(gt->uncore);
-
-	return 0;
 }
 
-int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt)
+void intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt)
 {
 	if (GRAPHICS_VER(gt->i915) >= 6)
 		intel_uncore_forcewake_user_put(gt->uncore);
 	intel_gt_pm_put(gt);
 	atomic_dec(&gt->user_wakeref);
-
-	return 0;
 }
 
 static int forcewake_user_open(struct inode *inode, struct file *file)
 {
 	struct intel_gt *gt = inode->i_private;
 
-	return intel_gt_pm_debugfs_forcewake_user_open(gt);
+	intel_gt_pm_debugfs_forcewake_user_open(gt);
+
+	return 0;
 }
 
 static int forcewake_user_release(struct inode *inode, struct file *file)
 {
 	struct intel_gt *gt = inode->i_private;
 
-	return intel_gt_pm_debugfs_forcewake_user_release(gt);
+	intel_gt_pm_debugfs_forcewake_user_release(gt);
+
+	return 0;
 }
 
 static const struct file_operations forcewake_user_fops = {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
index a8457887ec65e..0ace8c2da0acb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
@@ -14,7 +14,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
 void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
 
 /* functions that need to be accessed by the upper level non-gt interfaces */
-int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt);
-int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt);
+void intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt);
+void intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt);
 
 #endif /* INTEL_GT_PM_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 747fe9f41e1f4..2cbd1f58e754c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -581,8 +581,9 @@ static int i915_wedged_get(void *data, u64 *val)
 static int i915_wedged_set(void *data, u64 val)
 {
 	struct drm_i915_private *i915 = data;
+	intel_gt_debugfs_reset_store(to_gt(i915), val);
 
-	return intel_gt_debugfs_reset_store(to_gt(i915), val);
+	return 0;
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(i915_wedged_fops,
@@ -730,15 +731,17 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
 static int i915_forcewake_open(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
+	intel_gt_pm_debugfs_forcewake_user_open(to_gt(i915));
 
-	return intel_gt_pm_debugfs_forcewake_user_open(to_gt(i915));
+	return 0;
 }
 
 static int i915_forcewake_release(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
+	intel_gt_pm_debugfs_forcewake_user_release(to_gt(i915));
 
-	return intel_gt_pm_debugfs_forcewake_user_release(to_gt(i915));
+	return 0;
 }
 
 static const struct file_operations i915_forcewake_fops = {

base-commit: 35a8bf3837850c0ecf945c58f5611bcc53c4a43f
-- 
2.35.1

