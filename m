Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7675ABB34
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3312710E947;
	Fri,  2 Sep 2022 23:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B6A10E93E;
 Fri,  2 Sep 2022 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161593; x=1693697593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NNi3JCx5EwE8a0L4CChLESDt3pmZPShkO5H2iOTYQvY=;
 b=QvI27e6PgI52o/OIs341SN6gHT52+pA8I7mVRWY2yOrShg1qEFj6vZSg
 /P3sFQ2mcUmakXNLQ6jerrQ45WBk1F7OzN5epm2dUy1CViGNxcS+iP3Zp
 nY9yOzQ7XN2VV61Ow6S5gjyUV3CIxmMYQPE/EiSffBlNN5bHjOgxBQhCn
 Jm34pUAEhl5wgPjDvaK4l3DaHkmUjGuAxSmkDWqbaXtGZhIHtFLRfZXew
 HMHHH2Ifo0gm9cipHHXf47jJJsU8d6wGFgajtp314YkTjm93SDI0ZL0c1
 9hNHTqwJL30LgK2d05huqjE8xh9AdulDkBh7c8QF++9jWieUWODfScvXd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064663"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464195"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/i915: Rename and expose common GT early init
 routine
Date: Fri,  2 Sep 2022 16:32:50 -0700
Message-Id: <20220902233257.3088492-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The common early GT init is needed for initialization of all GT types
(root/primary, remote tile, standalone media).  Since standalone media
(coming in the next patch) will be implemented in a separate file,
rename and expose the function for use.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 6 +++---
 drivers/gpu/drm/i915/gt/intel_gt.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7b880dbed6ce..fbb5e32979a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -35,7 +35,7 @@
 #include "intel_uncore.h"
 #include "shmem_utils.h"
 
-static void __intel_gt_init_early(struct intel_gt *gt)
+void intel_gt_common_init_early(struct intel_gt *gt)
 {
 	spin_lock_init(&gt->irq_lock);
 
@@ -65,7 +65,7 @@ void intel_root_gt_init_early(struct drm_i915_private *i915)
 	gt->i915 = i915;
 	gt->uncore = &i915->uncore;
 
-	__intel_gt_init_early(gt);
+	intel_gt_common_init_early(gt);
 }
 
 static int intel_gt_probe_lmem(struct intel_gt *gt)
@@ -789,7 +789,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
 
 		gt->uncore = uncore;
 
-		__intel_gt_init_early(gt);
+		intel_gt_common_init_early(gt);
 	}
 
 	intel_uncore_init_early(gt->uncore, gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 4d8779529cc2..c9a359f35d0f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -44,6 +44,7 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
 	return container_of(gsc, struct intel_gt, gsc);
 }
 
+void intel_gt_common_init_early(struct intel_gt *gt);
 void intel_root_gt_init_early(struct drm_i915_private *i915);
 int intel_gt_assign_ggtt(struct intel_gt *gt);
 int intel_gt_init_mmio(struct intel_gt *gt);
-- 
2.37.2

