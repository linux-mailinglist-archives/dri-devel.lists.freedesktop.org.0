Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81C995C50
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACD910E61A;
	Wed,  9 Oct 2024 00:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ASvRRizW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4E10E61A;
 Wed,  9 Oct 2024 00:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=d0S5cKEnjvXO92+dvjO8gom+d+982xMXQmKS/ifBGAM=; b=ASvRRizWp3/TXm15
 qfl/xUPo7aLOTwEp0tVSiazJzMvKakXyNb0W39rfSdxjtSm7qg5t7Rg3Zruz2KflZ7gs88fMYIle2
 676qepJtltz/bEBqJVTFCVUnv+4TloHRUiZR7PgO6yOyDSi5L2Fxwr4DsIdFZkYvu/s/DuT52DNtu
 MVrnukn85CTG21NB4TSti8nLrecrcGWZAgLcVYynl3IWAd5sW5s0sQUEHZnrEjW7yVybb5p6C33XA
 Jsgs7k6TzZZODxUph74+0JB3pDnRXiCrsZ7DfY98Us7cF0dcAIdVH8CY5C+wk/ATDw+IaxDGm9OOM
 NOjcSbnCRj3rysRQOQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1syKdz-009q1s-0j;
 Wed, 09 Oct 2024 00:33:35 +0000
From: linux@treblig.org
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/display: Remove unused
 cm3_helper_translate_curve_to_degamma_hw_format
Date: Wed,  9 Oct 2024 01:33:34 +0100
Message-ID: <20241009003334.254537-1-linux@treblig.org>
X-Mailer: git-send-email 2.46.2
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

cm3_helper_translate_curve_to_degamma_hw_format() since it was added in
2020's commit
03f54d7d3448 ("drm/amd/display: Add DCN3 DPP")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../amd/display/dc/dcn30/dcn30_cm_common.c    | 151 ------------------
 .../display/dc/dwb/dcn30/dcn30_cm_common.h    |   4 -
 2 files changed, 155 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index f31f0e3abfc0..9118a0883f03 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -285,157 +285,6 @@ bool cm3_helper_translate_curve_to_hw_format(
 	return true;
 }
 
-#define NUM_DEGAMMA_REGIONS    12
-
-
-bool cm3_helper_translate_curve_to_degamma_hw_format(
-				const struct dc_transfer_func *output_tf,
-				struct pwl_params *lut_params)
-{
-	struct curve_points3 *corner_points;
-	struct pwl_result_data *rgb_resulted;
-	struct pwl_result_data *rgb;
-	struct pwl_result_data *rgb_plus_1;
-
-	int32_t region_start, region_end;
-	int32_t i;
-	uint32_t j, k, seg_distr[MAX_REGIONS_NUMBER], increment, start_index, hw_points;
-
-	if (output_tf == NULL || lut_params == NULL || output_tf->type == TF_TYPE_BYPASS)
-		return false;
-
-	corner_points = lut_params->corner_points;
-	rgb_resulted = lut_params->rgb_resulted;
-	hw_points = 0;
-
-	memset(lut_params, 0, sizeof(struct pwl_params));
-	memset(seg_distr, 0, sizeof(seg_distr));
-
-	region_start = -NUM_DEGAMMA_REGIONS;
-	region_end   = 0;
-
-
-	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
-		seg_distr[i] = -1;
-	/* 12 segments
-	 * segments are from 2^-12 to 0
-	 */
-	for (i = 0; i < NUM_DEGAMMA_REGIONS ; i++)
-		seg_distr[i] = 4;
-
-	for (k = 0; k < MAX_REGIONS_NUMBER; k++) {
-		if (seg_distr[k] != -1)
-			hw_points += (1 << seg_distr[k]);
-	}
-
-	j = 0;
-	for (k = 0; k < (region_end - region_start); k++) {
-		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
-		start_index = (region_start + k + MAX_LOW_POINT) *
-				NUMBER_SW_SEGMENTS;
-		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
-				i += increment) {
-			if (j == hw_points - 1)
-				break;
-			if (i >= TRANSFER_FUNC_POINTS)
-				return false;
-			rgb_resulted[j].red = output_tf->tf_pts.red[i];
-			rgb_resulted[j].green = output_tf->tf_pts.green[i];
-			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
-			j++;
-		}
-	}
-
-	/* last point */
-	start_index = (region_end + MAX_LOW_POINT) * NUMBER_SW_SEGMENTS;
-	rgb_resulted[hw_points - 1].red = output_tf->tf_pts.red[start_index];
-	rgb_resulted[hw_points - 1].green = output_tf->tf_pts.green[start_index];
-	rgb_resulted[hw_points - 1].blue = output_tf->tf_pts.blue[start_index];
-
-	corner_points[0].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
-					     dc_fixpt_from_int(region_start));
-	corner_points[0].green.x = corner_points[0].red.x;
-	corner_points[0].blue.x = corner_points[0].red.x;
-	corner_points[1].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
-					     dc_fixpt_from_int(region_end));
-	corner_points[1].green.x = corner_points[1].red.x;
-	corner_points[1].blue.x = corner_points[1].red.x;
-
-	corner_points[0].red.y = rgb_resulted[0].red;
-	corner_points[0].green.y = rgb_resulted[0].green;
-	corner_points[0].blue.y = rgb_resulted[0].blue;
-
-	/* see comment above, m_arrPoints[1].y should be the Y value for the
-	 * region end (m_numOfHwPoints), not last HW point(m_numOfHwPoints - 1)
-	 */
-	corner_points[1].red.y = rgb_resulted[hw_points - 1].red;
-	corner_points[1].green.y = rgb_resulted[hw_points - 1].green;
-	corner_points[1].blue.y = rgb_resulted[hw_points - 1].blue;
-	corner_points[1].red.slope = dc_fixpt_zero;
-	corner_points[1].green.slope = dc_fixpt_zero;
-	corner_points[1].blue.slope = dc_fixpt_zero;
-
-	if (output_tf->tf == TRANSFER_FUNCTION_PQ) {
-		/* for PQ, we want to have a straight line from last HW X point,
-		 * and the slope to be such that we hit 1.0 at 10000 nits.
-		 */
-		const struct fixed31_32 end_value =
-				dc_fixpt_from_int(125);
-
-		corner_points[1].red.slope = dc_fixpt_div(
-			dc_fixpt_sub(dc_fixpt_one, corner_points[1].red.y),
-			dc_fixpt_sub(end_value, corner_points[1].red.x));
-		corner_points[1].green.slope = dc_fixpt_div(
-			dc_fixpt_sub(dc_fixpt_one, corner_points[1].green.y),
-			dc_fixpt_sub(end_value, corner_points[1].green.x));
-		corner_points[1].blue.slope = dc_fixpt_div(
-			dc_fixpt_sub(dc_fixpt_one, corner_points[1].blue.y),
-			dc_fixpt_sub(end_value, corner_points[1].blue.x));
-	}
-
-	lut_params->hw_points_num = hw_points;
-
-	k = 0;
-	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
-		if (seg_distr[k] != -1) {
-			lut_params->arr_curve_points[k].segments_num =
-					seg_distr[k];
-			lut_params->arr_curve_points[i].offset =
-					lut_params->arr_curve_points[k].offset + (1 << seg_distr[k]);
-		}
-		k++;
-	}
-
-	if (seg_distr[k] != -1)
-		lut_params->arr_curve_points[k].segments_num = seg_distr[k];
-
-	rgb = rgb_resulted;
-	rgb_plus_1 = rgb_resulted + 1;
-
-	i = 1;
-	while (i != hw_points + 1) {
-		if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
-			rgb_plus_1->red = rgb->red;
-		if (dc_fixpt_lt(rgb_plus_1->green, rgb->green))
-			rgb_plus_1->green = rgb->green;
-		if (dc_fixpt_lt(rgb_plus_1->blue, rgb->blue))
-			rgb_plus_1->blue = rgb->blue;
-
-		rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
-		rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
-		rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
-
-		++rgb_plus_1;
-		++rgb;
-		++i;
-	}
-	cm3_helper_convert_to_custom_float(rgb_resulted,
-						lut_params->corner_points,
-						hw_points, false);
-
-	return true;
-}
-
 bool cm3_helper_convert_to_custom_float(
 		struct pwl_result_data *rgb_resulted,
 		struct curve_points3 *corner_points,
diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
index bd98b327a6c7..b86347c9b038 100644
--- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
+++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
@@ -63,10 +63,6 @@ bool cm3_helper_translate_curve_to_hw_format(
 	const struct dc_transfer_func *output_tf,
 	struct pwl_params *lut_params, bool fixpoint);
 
-bool cm3_helper_translate_curve_to_degamma_hw_format(
-				const struct dc_transfer_func *output_tf,
-				struct pwl_params *lut_params);
-
 bool cm3_helper_convert_to_custom_float(
 		struct pwl_result_data *rgb_resulted,
 		struct curve_points3 *corner_points,
-- 
2.46.2

