Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AA99128C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 00:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C715910E125;
	Fri,  4 Oct 2024 22:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="kiNgiya4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060010E0CB;
 Fri,  4 Oct 2024 22:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=FN4JOMsiKWWAmejdS2L0j2XRB8TBUWM1mrrmECl6/d0=; b=kiNgiya4fZLu/PzQ
 4NvTxWltAErUp1Mhhr6nxO6B6WvGjp5GL4aq0rcgfWcCQnsOhYYkmbkGxhJYVTZoNKu77e151ch3Q
 rnC9oB6gTCpaIHUs+Ls+Vs3azAMFgILib+hcIic/5x5a4B7drzWPIsc3Xcws0XKaX6hfBONyaOG0j
 DOiXxA2oKNUXI+iO6riy7++pxuWcUvzfuut5AEpjEXt4Tgw+CwLGB+TCGaJRc4KxzHiDo55FpOKSW
 H2zYXdsaTBsJ+wnT7tvTqCxF8l6zWIwl9ta+O5/mAJnTV4z0Gj87ZOH0OpfQxSLuUUaxVN+VQ4iqR
 SFQHekDM6pXK7XRkRg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1swrE3-0090pr-0H;
 Fri, 04 Oct 2024 22:56:43 +0000
From: linux@treblig.org
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/display: Remove unused regamma functions
Date: Fri,  4 Oct 2024 23:56:42 +0100
Message-ID: <20241004225642.280616-1-linux@treblig.org>
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

calculate_user_regamma_coeff() and calculate_user_regamma_ramp() were
added in 2018 in commit
55a01d4023ce ("drm/amd/display: Add user_regamma to color module")

but never used.

Remove them and their helpers.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../amd/display/modules/color/color_gamma.c   | 307 ------------------
 .../amd/display/modules/color/color_gamma.h   |  11 -
 2 files changed, 318 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index 3699e633801d..a71df052cf25 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -1399,71 +1399,6 @@ static void scale_gamma_dx(struct pwl_float_data *pwl_rgb,
 				pwl_rgb[i-1].b, 2), pwl_rgb[i-2].b);
 }
 
-/* todo: all these scale_gamma functions are inherently the same but
- *  take different structures as params or different format for ramp
- *  values. We could probably implement it in a more generic fashion
- */
-static void scale_user_regamma_ramp(struct pwl_float_data *pwl_rgb,
-		const struct regamma_ramp *ramp,
-		struct dividers dividers)
-{
-	unsigned short max_driver = 0xFFFF;
-	unsigned short max_os = 0xFF00;
-	unsigned short scaler = max_os;
-	uint32_t i;
-	struct pwl_float_data *rgb = pwl_rgb;
-	struct pwl_float_data *rgb_last = rgb + GAMMA_RGB_256_ENTRIES - 1;
-
-	i = 0;
-	do {
-		if (ramp->gamma[i] > max_os ||
-				ramp->gamma[i + 256] > max_os ||
-				ramp->gamma[i + 512] > max_os) {
-			scaler = max_driver;
-			break;
-		}
-		i++;
-	} while (i != GAMMA_RGB_256_ENTRIES);
-
-	i = 0;
-	do {
-		rgb->r = dc_fixpt_from_fraction(
-				ramp->gamma[i], scaler);
-		rgb->g = dc_fixpt_from_fraction(
-				ramp->gamma[i + 256], scaler);
-		rgb->b = dc_fixpt_from_fraction(
-				ramp->gamma[i + 512], scaler);
-
-		++rgb;
-		++i;
-	} while (i != GAMMA_RGB_256_ENTRIES);
-
-	rgb->r = dc_fixpt_mul(rgb_last->r,
-			dividers.divider1);
-	rgb->g = dc_fixpt_mul(rgb_last->g,
-			dividers.divider1);
-	rgb->b = dc_fixpt_mul(rgb_last->b,
-			dividers.divider1);
-
-	++rgb;
-
-	rgb->r = dc_fixpt_mul(rgb_last->r,
-			dividers.divider2);
-	rgb->g = dc_fixpt_mul(rgb_last->g,
-			dividers.divider2);
-	rgb->b = dc_fixpt_mul(rgb_last->b,
-			dividers.divider2);
-
-	++rgb;
-
-	rgb->r = dc_fixpt_mul(rgb_last->r,
-			dividers.divider3);
-	rgb->g = dc_fixpt_mul(rgb_last->g,
-			dividers.divider3);
-	rgb->b = dc_fixpt_mul(rgb_last->b,
-			dividers.divider3);
-}
-
 /*
  * RS3+ color transform DDI - 1D LUT adjustment is composed with regamma here
  * Input is evenly distributed in the output color space as specified in
@@ -1663,106 +1598,6 @@ static bool calculate_interpolated_hardware_curve(
 	return true;
 }
 
-/* The "old" interpolation uses a complicated scheme to build an array of
- * coefficients while also using an array of 0-255 normalized to 0-1
- * Then there's another loop using both of the above + new scaled user ramp
- * and we concatenate them. It also searches for points of interpolation and
- * uses enums for positions.
- *
- * This function uses a different approach:
- * user ramp is always applied on X with 0/255, 1/255, 2/255, ..., 255/255
- * To find index for hwX , we notice the following:
- * i/255 <= hwX < (i+1)/255  <=> i <= 255*hwX < i+1
- * See apply_lut_1d which is the same principle, but on 4K entry 1D LUT
- *
- * Once the index is known, combined Y is simply:
- * user_ramp(index) + (hwX-index/255)*(user_ramp(index+1) - user_ramp(index)
- *
- * We should switch to this method in all cases, it's simpler and faster
- * ToDo one day - for now this only applies to ADL regamma to avoid regression
- * for regular use cases (sRGB and PQ)
- */
-static void interpolate_user_regamma(uint32_t hw_points_num,
-		struct pwl_float_data *rgb_user,
-		bool apply_degamma,
-		struct dc_transfer_func_distributed_points *tf_pts)
-{
-	uint32_t i;
-	uint32_t color = 0;
-	int32_t index;
-	int32_t index_next;
-	struct fixed31_32 *tf_point;
-	struct fixed31_32 hw_x;
-	struct fixed31_32 norm_factor =
-			dc_fixpt_from_int(255);
-	struct fixed31_32 norm_x;
-	struct fixed31_32 index_f;
-	struct fixed31_32 lut1;
-	struct fixed31_32 lut2;
-	struct fixed31_32 delta_lut;
-	struct fixed31_32 delta_index;
-	const struct fixed31_32 one = dc_fixpt_from_int(1);
-
-	i = 0;
-	/* fixed_pt library has problems handling too small values */
-	while (i != 32) {
-		tf_pts->red[i] = dc_fixpt_zero;
-		tf_pts->green[i] = dc_fixpt_zero;
-		tf_pts->blue[i] = dc_fixpt_zero;
-		++i;
-	}
-	while (i <= hw_points_num + 1) {
-		for (color = 0; color < 3; color++) {
-			if (color == 0)
-				tf_point = &tf_pts->red[i];
-			else if (color == 1)
-				tf_point = &tf_pts->green[i];
-			else
-				tf_point = &tf_pts->blue[i];
-
-			if (apply_degamma) {
-				if (color == 0)
-					hw_x = coordinates_x[i].regamma_y_red;
-				else if (color == 1)
-					hw_x = coordinates_x[i].regamma_y_green;
-				else
-					hw_x = coordinates_x[i].regamma_y_blue;
-			} else
-				hw_x = coordinates_x[i].x;
-
-			if (dc_fixpt_le(one, hw_x))
-				hw_x = one;
-
-			norm_x = dc_fixpt_mul(norm_factor, hw_x);
-			index = dc_fixpt_floor(norm_x);
-			if (index < 0 || index > 255)
-				continue;
-
-			index_f = dc_fixpt_from_int(index);
-			index_next = (index == 255) ? index : index + 1;
-
-			if (color == 0) {
-				lut1 = rgb_user[index].r;
-				lut2 = rgb_user[index_next].r;
-			} else if (color == 1) {
-				lut1 = rgb_user[index].g;
-				lut2 = rgb_user[index_next].g;
-			} else {
-				lut1 = rgb_user[index].b;
-				lut2 = rgb_user[index_next].b;
-			}
-
-			// we have everything now, so interpolate
-			delta_lut = dc_fixpt_sub(lut2, lut1);
-			delta_index = dc_fixpt_sub(norm_x, index_f);
-
-			*tf_point = dc_fixpt_add(lut1,
-				dc_fixpt_mul(delta_index, delta_lut));
-		}
-		++i;
-	}
-}
-
 static void build_new_custom_resulted_curve(
 	uint32_t hw_points_num,
 	struct dc_transfer_func_distributed_points *tf_pts)
@@ -1784,29 +1619,6 @@ static void build_new_custom_resulted_curve(
 	}
 }
 
-static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma,
-		uint32_t hw_points_num, struct calculate_buffer *cal_buffer)
-{
-	uint32_t i;
-
-	struct gamma_coefficients coeff;
-	struct pwl_float_data_ex *rgb = rgb_regamma;
-	const struct hw_x_point *coord_x = coordinates_x;
-
-	build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
-
-	i = 0;
-	while (i != hw_points_num + 1) {
-		rgb->r = translate_from_linear_space_ex(
-				coord_x->x, &coeff, 0, cal_buffer);
-		rgb->g = rgb->r;
-		rgb->b = rgb->r;
-		++coord_x;
-		++rgb;
-		++i;
-	}
-}
-
 static bool map_regamma_hw_to_x_user(
 	const struct dc_gamma *ramp,
 	struct pixel_gamma_point *coeff128,
@@ -1855,125 +1667,6 @@ static bool map_regamma_hw_to_x_user(
 
 #define _EXTRA_POINTS 3
 
-bool calculate_user_regamma_coeff(struct dc_transfer_func *output_tf,
-		const struct regamma_lut *regamma,
-		struct calculate_buffer *cal_buffer,
-		const struct dc_gamma *ramp)
-{
-	struct gamma_coefficients coeff;
-	const struct hw_x_point *coord_x = coordinates_x;
-	uint32_t i = 0;
-
-	do {
-		coeff.a0[i] = dc_fixpt_from_fraction(
-				regamma->coeff.A0[i], 10000000);
-		coeff.a1[i] = dc_fixpt_from_fraction(
-				regamma->coeff.A1[i], 1000);
-		coeff.a2[i] = dc_fixpt_from_fraction(
-				regamma->coeff.A2[i], 1000);
-		coeff.a3[i] = dc_fixpt_from_fraction(
-				regamma->coeff.A3[i], 1000);
-		coeff.user_gamma[i] = dc_fixpt_from_fraction(
-				regamma->coeff.gamma[i], 1000);
-
-		++i;
-	} while (i != 3);
-
-	i = 0;
-	/* fixed_pt library has problems handling too small values */
-	while (i != 32) {
-		output_tf->tf_pts.red[i] = dc_fixpt_zero;
-		output_tf->tf_pts.green[i] = dc_fixpt_zero;
-		output_tf->tf_pts.blue[i] = dc_fixpt_zero;
-		++coord_x;
-		++i;
-	}
-	while (i != MAX_HW_POINTS + 1) {
-		output_tf->tf_pts.red[i] = translate_from_linear_space_ex(
-				coord_x->x, &coeff, 0, cal_buffer);
-		output_tf->tf_pts.green[i] = translate_from_linear_space_ex(
-				coord_x->x, &coeff, 1, cal_buffer);
-		output_tf->tf_pts.blue[i] = translate_from_linear_space_ex(
-				coord_x->x, &coeff, 2, cal_buffer);
-		++coord_x;
-		++i;
-	}
-
-	if (ramp && ramp->type == GAMMA_CS_TFM_1D)
-		apply_lut_1d(ramp, MAX_HW_POINTS, &output_tf->tf_pts);
-
-	// this function just clamps output to 0-1
-	build_new_custom_resulted_curve(MAX_HW_POINTS, &output_tf->tf_pts);
-	output_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-
-	return true;
-}
-
-bool calculate_user_regamma_ramp(struct dc_transfer_func *output_tf,
-		const struct regamma_lut *regamma,
-		struct calculate_buffer *cal_buffer,
-		const struct dc_gamma *ramp)
-{
-	struct dc_transfer_func_distributed_points *tf_pts = &output_tf->tf_pts;
-	struct dividers dividers;
-
-	struct pwl_float_data *rgb_user = NULL;
-	struct pwl_float_data_ex *rgb_regamma = NULL;
-	bool ret = false;
-
-	if (regamma == NULL)
-		return false;
-
-	output_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-
-	rgb_user = kcalloc(GAMMA_RGB_256_ENTRIES + _EXTRA_POINTS,
-			   sizeof(*rgb_user),
-			   GFP_KERNEL);
-	if (!rgb_user)
-		goto rgb_user_alloc_fail;
-
-	rgb_regamma = kcalloc(MAX_HW_POINTS + _EXTRA_POINTS,
-			      sizeof(*rgb_regamma),
-			      GFP_KERNEL);
-	if (!rgb_regamma)
-		goto rgb_regamma_alloc_fail;
-
-	dividers.divider1 = dc_fixpt_from_fraction(3, 2);
-	dividers.divider2 = dc_fixpt_from_int(2);
-	dividers.divider3 = dc_fixpt_from_fraction(5, 2);
-
-	scale_user_regamma_ramp(rgb_user, &regamma->ramp, dividers);
-
-	if (regamma->flags.bits.applyDegamma == 1) {
-		apply_degamma_for_user_regamma(rgb_regamma, MAX_HW_POINTS, cal_buffer);
-		copy_rgb_regamma_to_coordinates_x(coordinates_x,
-				MAX_HW_POINTS, rgb_regamma);
-	}
-
-	interpolate_user_regamma(MAX_HW_POINTS, rgb_user,
-			regamma->flags.bits.applyDegamma, tf_pts);
-
-	// no custom HDR curves!
-	tf_pts->end_exponent = 0;
-	tf_pts->x_point_at_y1_red = 1;
-	tf_pts->x_point_at_y1_green = 1;
-	tf_pts->x_point_at_y1_blue = 1;
-
-	if (ramp && ramp->type == GAMMA_CS_TFM_1D)
-		apply_lut_1d(ramp, MAX_HW_POINTS, &output_tf->tf_pts);
-
-	// this function just clamps output to 0-1
-	build_new_custom_resulted_curve(MAX_HW_POINTS, tf_pts);
-
-	ret = true;
-
-	kfree(rgb_regamma);
-rgb_regamma_alloc_fail:
-	kfree(rgb_user);
-rgb_user_alloc_fail:
-	return ret;
-}
-
 bool mod_color_calculate_degamma_params(struct dc_color_caps *dc_caps,
 		struct dc_transfer_func *input_tf,
 		const struct dc_gamma *ramp, bool map_user_ramp)
diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
index ee5c466613de..97e55278940e 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
@@ -115,15 +115,4 @@ bool mod_color_calculate_degamma_params(struct dc_color_caps *dc_caps,
 		struct dc_transfer_func *output_tf,
 		const struct dc_gamma *ramp, bool mapUserRamp);
 
-bool calculate_user_regamma_coeff(struct dc_transfer_func *output_tf,
-		const struct regamma_lut *regamma,
-		struct calculate_buffer *cal_buffer,
-		const struct dc_gamma *ramp);
-
-bool calculate_user_regamma_ramp(struct dc_transfer_func *output_tf,
-		const struct regamma_lut *regamma,
-		struct calculate_buffer *cal_buffer,
-		const struct dc_gamma *ramp);
-
-
 #endif /* COLOR_MOD_COLOR_GAMMA_H_ */
-- 
2.46.2

