Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6A82F305
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8F10E5B9;
	Tue, 16 Jan 2024 17:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5C210E554;
 Tue, 16 Jan 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425245; x=1736961245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9THZhwCd0/0UPvq1xNxdGSUMO7q3xhjt6Kz5FlZVRrQ=;
 b=Z781g9SnvI39rGbqPG+BesYF4RgDOvuhwroBP9zu/bEBbw5KfwuyyYaL
 +LgpYwir9dqSHvdpNWngUr4k6HfmrH7Y8MC27Bu/dAZQ5NpEwG5zDEnKJ
 Jsds+22qvJN4APYTLa0dbIBUIRJpydQdxAS+xqMcjxNTOHQbcKUMd/mwa
 lphkOivi5lF8MxZJEzr2vzol97qLv0aHYLFY8F8MhxQUylwxGjWEYjhAX
 BQL/DwiM1BQ1Y7mn0bQ2g27quXPO/LFRDn1kzgVcOEmpv8RwtEdCNxhRU
 NctDV0LDSWLHNWcgxAx+4LAEzHWYrHKjHA3hTuiORoGEnPPQrUB//j98e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593350"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869612"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:45 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Expose dss per group for GuC error capture
Date: Tue, 16 Jan 2024 09:12:30 -0800
Message-Id: <20240116171237.118463-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose helper for dss per group of mcr, GuC error capture feature
need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c          |  4 ++--
 drivers/gpu/drm/xe/xe_gt_mcr.h          |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc_capture.c     | 27 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 +++
 5 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 2029577957a4..80adf6887dd8 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,7 +291,7 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
-static int num_dss_per_grp(struct xe_gt *gt)
+int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -313,7 +313,7 @@ static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = num_dss_per_grp(gt);
+	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..8f2603e2b520 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -14,6 +14,7 @@ struct xe_gt;
 void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
+int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
 
 u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			   int group, int instance);
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 33c69795c16a..784ebf15e301 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,9 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 8bf756fa34e2..5e8b063f723f 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -93,6 +93,33 @@
 	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
 	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
 
+static inline void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
+					     unsigned int *group, unsigned int *instance)
+{
+	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
+
+static inline bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
+{
+	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
+	int index = slice * dss_per_grp + subslice;
+	return index >= XE_MAX_DSS_FUSE_BITS ? false : test_bit(index, gt->fuse_topo.g_dss_mask);
+}
+
+#define _HAS_SS(ss_, gt_, group_, instance_) xe_sseu_has_subslice(gt_, group_, instance_)
+
+/*
+ * Loop over each subslice/DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ */
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index dfeaaac08b7f..c258228b244f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -65,6 +65,9 @@ struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
 
+#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
+#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
+
 /**
  * struct xe_hw_engine_class_intf - per hw engine class struct interface
  *
-- 
2.34.1

