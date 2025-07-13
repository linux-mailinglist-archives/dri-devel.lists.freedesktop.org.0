Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB073B031BC
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 17:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D6F10E180;
	Sun, 13 Jul 2025 15:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="oAq5JOJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687A10E180;
 Sun, 13 Jul 2025 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=hrUEXgHrTFqR2/M0VCKko4fRT0H3nYWu5evkl7GPZJU=; b=oAq5JOJNqcvnZEQO
 CRHFT1z/n9pD8hLRqH/Ta5/V0QAacxQvRxKRewAP4hdLxdCBj2/CTD2NbweedqPHpAlnMF/7e4xSh
 B2jeYar1pgD265IjjJAd1j4mHR0qJj9I08A4rSG4ayD6fHirf5jgInC0KVeek6hhlEKN4rBQr9rpS
 1S78vHSVHxTT0UZTrsV4iGnEbmMGuIeQ2y3FyQsF0f1fq9k8M5WOYY2oj+rAwjCGuOWBub8lc51zh
 Qs41+e00BOVXUEEOPeR2dCxBvh3FiAP11OyjPJNa4zn404eG8FJYN6q0WwqD1Utv7MMBIgsNVctLh
 BbaqviksuN3tHM9SiA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uaya4-00FnPv-19;
 Sun, 13 Jul 2025 15:25:32 +0000
From: linux@treblig.org
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/xe: Remove unused functions
Date: Sun, 13 Jul 2025 16:25:31 +0100
Message-ID: <20250713152531.219326-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

xe_bo_create_from_data() last use was removed in 2023 by
commit 0e1a47fcabc8 ("drm/xe: Add a helper for DRM device-lifetime BO
create")

xe_rtp_match_first_gslice_fused_off() last use was removed in 2023 by
commit 4e124151fcfc ("drm/xe/dg2: Drop pre-production workarounds")

Remove them, and xe_dss_mask_empty whose last use was by
xe_rtp_match_first_gslice_fused_off().

(Xe has a bunch ofother symbols that have been added but not used,
given how new it is, I've left those, as opposed to these that
had the code that used them removed).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/xe/xe_bo.c          | 15 ---------------
 drivers/gpu/drm/xe/xe_bo.h          |  3 ---
 drivers/gpu/drm/xe/xe_gt_topology.c |  5 -----
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 --
 drivers/gpu/drm/xe/xe_rtp.c         | 15 ---------------
 drivers/gpu/drm/xe/xe_rtp.h         | 11 -----------
 6 files changed, 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7aa2c17825da..6bd1287869b4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2156,21 +2156,6 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
 }
 
-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
-				     const void *data, size_t size,
-				     enum ttm_bo_type type, u32 flags)
-{
-	struct xe_bo *bo = xe_bo_create_pin_map(xe, tile, NULL,
-						ALIGN(size, PAGE_SIZE),
-						type, flags);
-	if (IS_ERR(bo))
-		return bo;
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
-
-	return bo;
-}
-
 static void __xe_bo_unpin_map_no_vm(void *arg)
 {
 	xe_bo_unpin_map_no_vm(arg);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a23..89b6e1487971 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -118,9 +118,6 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 					      size_t size, u64 offset,
 					      enum ttm_bo_type type, u32 flags,
 					      u64 alignment);
-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
-				     const void *data, size_t size,
-				     enum ttm_bo_type type, u32 flags);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 516c81e3b8dd..b325eb9d3890 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -288,11 +288,6 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
 
-bool xe_dss_mask_empty(const xe_dss_mask_t mask)
-{
-	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
-}
-
 /**
  * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
  * @gt: GT to check
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index a72d26ba0653..c8140704ad4c 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -41,8 +41,6 @@ xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
-bool xe_dss_mask_empty(const xe_dss_mask_t mask);
-
 bool
 xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29e694bb1219..cc6636f6cd98 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -326,21 +326,6 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 		hwe->engine_id == __ffs(render_compute_mask);
 }
 
-bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
-					 const struct xe_hw_engine *hwe)
-{
-	unsigned int dss_per_gslice = 4;
-	unsigned int dss;
-
-	if (drm_WARN(&gt_to_xe(gt)->drm, xe_dss_mask_empty(gt->fuse_topo.g_dss_mask),
-		     "Checking gslice for platform without geometry pipeline\n"))
-		return false;
-
-	dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
-
-	return dss >= dss_per_gslice;
-}
-
 bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4fe736a11c42..86a3f1e4b3dc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -465,17 +465,6 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 					  const struct xe_hw_engine *hwe);
 
-/*
- * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
- *
- * @gt: GT structure
- * @hwe: Engine instance
- *
- * Returns: true if first gslice is fused off, false otherwise.
- */
-bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
-					 const struct xe_hw_engine *hwe);
-
 /*
  * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
  *
-- 
2.50.1

