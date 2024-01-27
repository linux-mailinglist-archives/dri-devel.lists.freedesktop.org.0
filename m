Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87B83EE03
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 16:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9340A10F26A;
	Sat, 27 Jan 2024 15:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653FA10F1E7;
 Sat, 27 Jan 2024 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706370160; x=1737906160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=99Yuc+wEXWeUtj9mkF+d2h6isinX7/0bxXC9Z1kSg4Q=;
 b=evzLtBj3ZbWgoeBv6jY+pSvnkRBsWNU9Ajiz5lGzfAinU1ukp71IIybh
 19zyMV9IPSeHr11E3uyjwsN5Mmu0pmakV9WsmS1JNHmTAIRq3J99G8rvT
 D9EkGLYf0NdqpJHTJ09MpUgSNjyx0fPtUJdrtbGTCqlTTPOjHILYAAgX/
 xmFvLlccJo6kTTmwnGujHVn8I/YACpZGd+QjB9ni+3HJeoD0YXsunUQJD
 P3MBKqukurdYh5WAVEv6TM9ya9zKeuxizUea2KP5grjz1pZELY7N4gOU3
 k+w6r6a0AV8cPA4ot/6+PNtgfnJazeoFXYmlWH2MGqJ4J4LizdmNUImDY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="21222411"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="21222411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 07:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2877541"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 07:42:36 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix a build error
Date: Sat, 27 Jan 2024 10:53:27 -0500
Message-Id: <20240127155327.423294-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Thomas.Hellstrom@linux.intel.com, Amaranath.Somalapuram@amd.com,
 lucas.demarchi@intel.com, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a build failure on drm-tip. This issue was introduced during
merge of "drm/ttm: replace busy placement with flags v6". For some
reason, the xe_bo.c part of above change is not merged. Manually merge
the missing part to drm_tip

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 686d716c5581..d6a193060cc0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -38,22 +38,26 @@ static const struct ttm_place sys_placement_flags = {
 static struct ttm_placement sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags,
 };
 
-static const struct ttm_place tt_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = XE_PL_TT,
-	.flags = 0,
+static const struct ttm_place tt_placement_flags[] = {
+	{
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = XE_PL_TT,
+		.flags = TTM_PL_FLAG_DESIRED,
+	},
+	{
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = XE_PL_SYSTEM,
+		.flags = TTM_PL_FLAG_FALLBACK,
+	}
 };
 
 static struct ttm_placement tt_placement = {
-	.num_placement = 1,
-	.placement = &tt_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags,
+	.num_placement = 2,
+	.placement = tt_placement_flags,
 };
 
 bool mem_type_is_vram(u32 mem_type)
@@ -230,8 +234,6 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 	bo->placement = (struct ttm_placement) {
 		.num_placement = c,
 		.placement = bo->placements,
-		.num_busy_placement = c,
-		.busy_placement = bo->placements,
 	};
 
 	return 0;
@@ -251,7 +253,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
 			placement->num_placement = 0;
-			placement->num_busy_placement = 0;
 			return;
 		}
 
@@ -1391,8 +1392,6 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
 		.placement = place,
-		.num_busy_placement = 1,
-		.busy_placement = place,
 	};
 
 	return 0;
@@ -2150,9 +2149,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 
 	xe_place_from_ttm_type(mem_type, &requested);
 	placement.num_placement = 1;
-	placement.num_busy_placement = 1;
 	placement.placement = &requested;
-	placement.busy_placement = &requested;
 
 	/*
 	 * Stolen needs to be handled like below VRAM handling if we ever need
-- 
2.26.3

