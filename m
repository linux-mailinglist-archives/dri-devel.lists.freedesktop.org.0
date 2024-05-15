Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B380F8C6DDF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF6010EC1D;
	Wed, 15 May 2024 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8JEOucQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4F310E1D6;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809380; x=1747345380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GuECcZprAYcfXmWg6j7ESIi6mK+dOHDhpYaf0SgHn74=;
 b=U8JEOucQ3auVoQMClo0i0ebHReWFr4yOn5TnSVKSPVTlox7zdGP8T54v
 pBftRWB3eIEfU00/IwLmsicIG4HknK8faC0EHWG1LaXUIP14SgLq+cFb7
 LHOC1Y+xUvULg1T/dsnAMZUQsohMDqTxYWZBlPwlGOXqm5LUj82OVEBWZ
 h6ORFJ7tCVpV+x4iFxGBUIP93ERwqK5gEF0zhdW8T5bt8RbXElPgGhkRW
 jasVkXRnJ2IMajnW/U+tBdggos0kcL92BfYS9DNovaT98qlPeX6v3+jHh
 og/eogqec9vNjbZ1JD4sUp7od+RmVFSn2q2FbOTrrti6Ovi4I1x+HVBGN g==;
X-CSE-ConnectionGUID: WXcG1EeiSRynAQ8D4gL4CQ==
X-CSE-MsgGUID: VbEpLwU3S3+tWInK2PfKqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739170"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:43:00 -0700
X-CSE-ConnectionGUID: yIWIzUU9SGWjxNH/AOqTJA==
X-CSE-MsgGUID: X3OMBsEKSDSvjrMUSSHWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651142"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Date: Wed, 15 May 2024 14:42:56 -0700
Message-ID: <20240515214258.59209-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gt->info.engine_mask used to indicate the available engines, but that
is not always true anymore: some engines are reserved to kernel and some
may be exposed as a single engine (e.g. with ccs_mode).

Runtime changes only happen when no clients exist, so it's safe to cache
the list of engines in the gt and update that when it's needed. This
will help implementing per client engine utilization so this (mostly
constant) information doesn't need to be re-calculated on every query.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h          | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    | 21 ++++++++++++++++++++-
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e69a03ddd255..5194a3d38e76 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -560,9 +560,32 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_gt_record_user_engines(gt);
+
 	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 }
 
+void xe_gt_record_user_engines(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	gt->user_engines.mask = 0;
+	memset(gt->user_engines.instances_per_class, 0,
+	       sizeof(gt->user_engines.instances_per_class));
+
+	for_each_hw_engine(hwe, gt, id) {
+		if (xe_hw_engine_is_reserved(hwe))
+			continue;
+
+		gt->user_engines.mask |= BIT_ULL(id);
+		gt->user_engines.instances_per_class[hwe->class]++;
+	}
+
+	xe_gt_assert(gt, (gt->user_engines.mask | gt->info.engine_mask)
+		     == gt->info.engine_mask);
+}
+
 static int do_gt_reset(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8474c50b1b30..ad3fd31e0a41 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -38,6 +38,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
+
+/**
+ * @xe_gt_record_user_engines - save data related to engines available to
+ * usersapce
+ * @gt: GT structure
+ *
+ * Walk the available HW engines from gt->info.engine_mask and calculate data
+ * related to those engines that may be used by userspace. To be used whenever
+ * available engines change in runtime (e.g. with ccs_mode) or during
+ * initialization
+ */
+void xe_gt_record_user_engines(struct xe_gt *gt);
+
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index a34c9a24dafc..c36218f4f6c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -134,6 +134,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (gt->ccs_mode != num_engines) {
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
+		xe_gt_record_user_engines(gt);
 		xe_gt_reset_async(gt);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 5a114fc9dde7..aaf2951749a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -112,7 +112,11 @@ struct xe_gt {
 		enum xe_gt_type type;
 		/** @info.reference_clock: clock frequency */
 		u32 reference_clock;
-		/** @info.engine_mask: mask of engines present on GT */
+		/**
+		 * @info.engine_mask: mask of engines present on GT. Some of
+		 * them may be reserved in runtime and not available for user.
+		 * See @user_engines.mask
+		 */
 		u64 engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
@@ -365,6 +369,21 @@ struct xe_gt {
 		/** @wa_active.oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @user_engines: engines present in GT and available to userspace */
+	struct {
+		/**
+		 * @mask: like @info->engine_mask, but take in consideration
+		 * only engines available to userspace
+		 */
+		u64 mask;
+
+		/**
+		 * @instances_per_class: aggregate per class the number of
+		 * engines available to userspace
+		 */
+		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
+	} user_engines;
 };
 
 #endif
-- 
2.43.0

