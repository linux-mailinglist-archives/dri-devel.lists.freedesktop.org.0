Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A947A4213C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618010E3ED;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="r+gDu61r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B2010E0EB;
 Mon, 24 Feb 2025 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=gYxWwFGL5fnjm+u4Nw7xq/QB73ttOIogK7yDqXhMzgM=; b=r+gDu61rIyYgG3N2
 vas8lKfJVLwtEodq5NdKWw8nj5Y4uRjRWCkGn0ZRYeOH9z+HEm5d74dY36JqP8Ew0LiAeZNt+zGOK
 5wikNvqIdOlB/xzucip7tgjy5Obi29dTYGwxCMO7AViHQJYnuuN3B1guXl8ik7jz7c//85YVWdTwB
 NDNP15wEQzF1taq185Ap4RoJ/q8fPBDdt5dDwMu6s2E8VYbBjx7XSPES6D+pT1kdnjwyca6puJ+2Q
 kUJxkLqGoHxEoinsKALwKFnOX4NhRoXwbsIAVm8KrLsnAzdUZlBc9cfayuCLbIY68j+uj6jLq2lqj
 Yn3Smi16p94rAC7ojA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tmNbL-000Eut-2T;
 Mon, 24 Feb 2025 01:49:43 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, chaitanya.dhere@amd.com, jun.lei@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/display: Remove unused optc3_fpu_set_vrr_m_const
Date: Mon, 24 Feb 2025 01:49:42 +0000
Message-ID: <20250224014942.193407-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

The last use of optc3_fpu_set_vrr_m_const() was removed in 2022's
commit 64f991590ff4 ("drm/amd/display: Fix a compilation failure on PowerPC
caused by FPU code")
which removed the only caller (with a similar) name.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  | 76 -------------------
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |  3 -
 2 files changed, 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index aac0a0ae2966..88789987bdbc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -178,82 +178,6 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc = {
 };
 
 
-void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
-		double vtotal_avg)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-	double vtotal_min, vtotal_max;
-	double ratio, modulo, phase;
-	uint32_t vblank_start;
-	uint32_t v_total_mask_value = 0;
-
-	dc_assert_fp_enabled();
-
-	/* Compute VTOTAL_MIN and VTOTAL_MAX, so that
-	 * VOTAL_MAX - VTOTAL_MIN = 1
-	 */
-	v_total_mask_value = 16;
-	vtotal_min = dcn_bw_floor(vtotal_avg);
-	vtotal_max = dcn_bw_ceil(vtotal_avg);
-
-	/* Check that bottom VBLANK is at least 2 lines tall when running with
-	 * VTOTAL_MIN. Note that VTOTAL registers are defined as 'total number
-	 * of lines in a frame - 1'.
-	 */
-	REG_GET(OTG_V_BLANK_START_END, OTG_V_BLANK_START,
-		&vblank_start);
-	ASSERT(vtotal_min >= vblank_start + 1);
-
-	/* Special case where the average frame rate can be achieved
-	 * without using the DTO
-	 */
-	if (vtotal_min == vtotal_max) {
-		REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min);
-
-		optc->funcs->set_vtotal_min_max(optc, 0, 0);
-		REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
-		REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
-		REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
-			OTG_V_TOTAL_MIN_SEL, 0,
-			OTG_V_TOTAL_MAX_SEL, 0,
-			OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
-		return;
-	}
-
-	ratio = vtotal_max - vtotal_avg;
-	modulo = 65536.0 * 65536.0 - 1.0; /* 2^32 - 1 */
-	phase = ratio * modulo;
-
-	/* Special cases where the DTO phase gets rounded to 0 or
-	 * to DTO modulo
-	 */
-	if (phase <= 0 || phase >= modulo) {
-		REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL,
-			phase <= 0 ?
-				(uint32_t)vtotal_max : (uint32_t)vtotal_min);
-		REG_SET(OTG_V_TOTAL_MIN, 0, OTG_V_TOTAL_MIN, 0);
-		REG_SET(OTG_V_TOTAL_MAX, 0, OTG_V_TOTAL_MAX, 0);
-		REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
-		REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
-		REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
-			OTG_V_TOTAL_MIN_SEL, 0,
-			OTG_V_TOTAL_MAX_SEL, 0,
-			OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
-		return;
-	}
-	REG_UPDATE_6(OTG_V_TOTAL_CONTROL,
-		OTG_V_TOTAL_MIN_SEL, 1,
-		OTG_V_TOTAL_MAX_SEL, 1,
-		OTG_SET_V_TOTAL_MIN_MASK_EN, 1,
-		OTG_SET_V_TOTAL_MIN_MASK, v_total_mask_value,
-		OTG_VTOTAL_MID_REPLACING_MIN_EN, 0,
-		OTG_VTOTAL_MID_REPLACING_MAX_EN, 0);
-	REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min);
-	optc->funcs->set_vtotal_min_max(optc, vtotal_min, vtotal_max);
-	REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, (uint32_t)phase);
-	REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, (uint32_t)modulo);
-}
-
 void dcn30_fpu_populate_dml_writeback_from_context(
 		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
index cab864095ce7..e3b6ad6a8784 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
@@ -29,9 +29,6 @@
 #include "core_types.h"
 #include "dcn20/dcn20_optc.h"
 
-void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
-		double vtotal_avg);
-
 void dcn30_fpu_populate_dml_writeback_from_context(
 		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
 
-- 
2.48.1

