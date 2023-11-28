Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394A7FC0D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CA310E593;
	Tue, 28 Nov 2023 17:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35B10E324;
 Tue, 28 Nov 2023 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ycOHsQqo7reUG0FAdof+zm5+Q9IG7+WnDOR8oITC9XQ=; b=PGrRCGGcUPhH8uqM1ahyWMEJnx
 km7p2E0/ccljKWYecdirLk5XXNzIgiN/AKaKg9WdocPItOsISPZSG8gaeFtmcKRSSiuA3UbQzsBfa
 lkjjvNNlJmISfx2qNWOfuSyXNLUx/RpxJfgFEJdmgBqVTz0FTi6JRX3yKAJ1AHla3Ykji+lJbVwsk
 M0kqP8NX8S7ysY5ROIpPiGqWuHJQ7CwYakmuqxvWrNCBMBS7+6YpuNXxEcO1veplwMDZYNs+g5+of
 ixopsEeAaPX1KxoB94WZMgCY2z7wb6VBmLFvvpChl64YFDxSg6qXicI9Lz0lOKoifQOr5kQ7YNHF6
 Y2ugwWsA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82Jy-0087Bf-9x; Tue, 28 Nov 2023 18:56:30 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 2/9] drm/amd/display: Add dpp_get_gamut_remap functions
Date: Tue, 28 Nov 2023 16:52:50 -0100
Message-ID: <20231128175623.121356-3-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
References: <20231128175623.121356-1-mwen@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

We want to be able to read the DPP's gamut remap matrix.

v2:
- code-style and doc comments clean-up (Melissa)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/dc/basics/conversion.c    | 34 +++++++++
 .../drm/amd/display/dc/basics/conversion.h    |  4 ++
 .../amd/display/dc/dcn10/dcn10_cm_common.c    | 20 ++++++
 .../amd/display/dc/dcn10/dcn10_cm_common.h    |  4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c  |  3 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h  |  3 +
 .../drm/amd/display/dc/dcn10/dcn10_dpp_cm.c   | 70 ++++++++++++++++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h  |  3 +
 .../drm/amd/display/dc/dcn20/dcn20_dpp_cm.c   | 55 +++++++++++++++
 .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |  1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h  |  2 +
 .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c   | 54 ++++++++++++++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c  |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  3 +
 16 files changed, 256 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/conversion.c b/drivers/gpu/drm/amd/display/dc/basics/conversion.c
index e295a839ab47..f0065a51beb9 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/conversion.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/conversion.c
@@ -101,6 +101,40 @@ void convert_float_matrix(
 	}
 }
 
+static struct fixed31_32 int_frac_to_fixed_point(uint16_t arg,
+						 uint8_t integer_bits,
+						 uint8_t fractional_bits)
+{
+	struct fixed31_32 result;
+	uint16_t sign_mask = 1 << (fractional_bits + integer_bits);
+	uint16_t value_mask = sign_mask - 1;
+
+	result.value = (long long)(arg & value_mask) <<
+		       (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+
+	if (arg & sign_mask)
+		result = dc_fixpt_neg(result);
+
+	return result;
+}
+
+/**
+ * convert_hw_matrix - converts HW values into fixed31_32 matrix.
+ * @matrix: fixed point 31.32 matrix
+ * @reg: array of register values
+ * @buffer_size: size of the array of register values
+ *
+ * Converts HW register spec defined format S2D13 into a fixed-point 31.32
+ * matrix.
+ */
+void convert_hw_matrix(struct fixed31_32 *matrix,
+		       uint16_t *reg,
+		       uint32_t buffer_size)
+{
+	for (int i = 0; i < buffer_size; ++i)
+		matrix[i] = int_frac_to_fixed_point(reg[i], 2, 13);
+}
+
 static uint32_t find_gcd(uint32_t a, uint32_t b)
 {
 	uint32_t remainder = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/basics/conversion.h b/drivers/gpu/drm/amd/display/dc/basics/conversion.h
index 81da4e6f7a1a..a433cef78496 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/conversion.h
+++ b/drivers/gpu/drm/amd/display/dc/basics/conversion.h
@@ -41,6 +41,10 @@ void convert_float_matrix(
 void reduce_fraction(uint32_t num, uint32_t den,
 		uint32_t *out_num, uint32_t *out_den);
 
+void convert_hw_matrix(struct fixed31_32 *matrix,
+		       uint16_t *reg,
+		       uint32_t buffer_size);
+
 static inline unsigned int log_2(unsigned int num)
 {
 	return ilog2(num);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
index 3538973bd0c6..b7e57aa27361 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
@@ -62,6 +62,26 @@ void cm_helper_program_color_matrices(
 
 }
 
+void cm_helper_read_color_matrices(struct dc_context *ctx,
+				   uint16_t *regval,
+				   const struct color_matrices_reg *reg)
+{
+	uint32_t cur_csc_reg, regval0, regval1;
+	unsigned int i = 0;
+
+	for (cur_csc_reg = reg->csc_c11_c12;
+	     cur_csc_reg <= reg->csc_c33_c34; cur_csc_reg++) {
+		REG_GET_2(cur_csc_reg,
+				csc_c11, &regval0,
+				csc_c12, &regval1);
+
+		regval[2 * i] = regval0;
+		regval[(2 * i) + 1] = regval1;
+
+		i++;
+	}
+}
+
 void cm_helper_program_xfer_func(
 		struct dc_context *ctx,
 		const struct pwl_params *params,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
index 0a68b63d6126..decc50b1ac53 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
@@ -114,5 +114,7 @@ bool cm_helper_translate_curve_to_degamma_hw_format(
 				const struct dc_transfer_func *output_tf,
 				struct pwl_params *lut_params);
 
-
+void cm_helper_read_color_matrices(struct dc_context *ctx,
+				   uint16_t *regval,
+				   const struct color_matrices_reg *reg);
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
index ef52e6b6eccf..4e391fd1d71c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
@@ -543,7 +543,8 @@ static const struct dpp_funcs dcn10_dpp_funcs = {
 		.dpp_set_hdr_multiplier = dpp1_set_hdr_multiplier,
 		.dpp_program_blnd_lut = NULL,
 		.dpp_program_shaper_lut = NULL,
-		.dpp_program_3dlut = NULL
+		.dpp_program_3dlut = NULL,
+		.dpp_get_gamut_remap = dpp1_cm_get_gamut_remap,
 };
 
 static struct dpp_caps dcn10_dpp_cap = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
index c9e045666dcc..a039eedc7c24 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
@@ -1521,4 +1521,7 @@ void dpp1_construct(struct dcn10_dpp *dpp1,
 	const struct dcn_dpp_registers *tf_regs,
 	const struct dcn_dpp_shift *tf_shift,
 	const struct dcn_dpp_mask *tf_mask);
+
+void dpp1_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust);
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
index 904c2d278998..2f994a3a0b9c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
@@ -98,7 +98,7 @@ static void program_gamut_remap(
 
 	if (regval == NULL || select == GAMUT_REMAP_BYPASS) {
 		REG_SET(CM_GAMUT_REMAP_CONTROL, 0,
-				CM_GAMUT_REMAP_MODE, 0);
+			CM_GAMUT_REMAP_MODE, 0);
 		return;
 	}
 	switch (select) {
@@ -181,6 +181,74 @@ void dpp1_cm_set_gamut_remap(
 	}
 }
 
+static void read_gamut_remap(struct dcn10_dpp *dpp,
+			     uint16_t *regval,
+			     enum gamut_remap_select *select)
+{
+	struct color_matrices_reg gam_regs;
+	uint32_t selection;
+
+	REG_GET(CM_GAMUT_REMAP_CONTROL,
+					CM_GAMUT_REMAP_MODE, &selection);
+
+	*select = selection;
+
+	gam_regs.shifts.csc_c11 = dpp->tf_shift->CM_GAMUT_REMAP_C11;
+	gam_regs.masks.csc_c11  = dpp->tf_mask->CM_GAMUT_REMAP_C11;
+	gam_regs.shifts.csc_c12 = dpp->tf_shift->CM_GAMUT_REMAP_C12;
+	gam_regs.masks.csc_c12 = dpp->tf_mask->CM_GAMUT_REMAP_C12;
+
+	if (*select == GAMUT_REMAP_COEFF) {
+
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
+
+		cm_helper_read_color_matrices(
+				dpp->base.ctx,
+				regval,
+				&gam_regs);
+
+	} else if (*select == GAMUT_REMAP_COMA_COEFF) {
+
+		gam_regs.csc_c11_c12 = REG(CM_COMA_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_COMA_C33_C34);
+
+		cm_helper_read_color_matrices(
+				dpp->base.ctx,
+				regval,
+				&gam_regs);
+
+	} else if (*select == GAMUT_REMAP_COMB_COEFF) {
+
+		gam_regs.csc_c11_c12 = REG(CM_COMB_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_COMB_C33_C34);
+
+		cm_helper_read_color_matrices(
+				dpp->base.ctx,
+				regval,
+				&gam_regs);
+	}
+}
+
+void dpp1_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust)
+{
+	struct dcn10_dpp *dpp = TO_DCN10_DPP(dpp_base);
+	uint16_t arr_reg_val[12];
+	enum gamut_remap_select select;
+
+	read_gamut_remap(dpp, arr_reg_val, &select);
+
+	if (select == GAMUT_REMAP_BYPASS) {
+		adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+		return;
+	}
+
+	adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+	convert_hw_matrix(adjust->temperature_matrix,
+			  arr_reg_val, ARRAY_SIZE(arr_reg_val));
+}
+
 static void dpp1_cm_program_color_matrix(
 		struct dcn10_dpp *dpp,
 		const uint16_t *regval)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index eaa7032f0f1a..dedc2dcf2691 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -393,6 +393,7 @@ static struct dpp_funcs dcn20_dpp_funcs = {
 	.set_optional_cursor_attributes = dpp1_cnv_set_optional_cursor_attributes,
 	.dpp_dppclk_control = dpp1_dppclk_control,
 	.dpp_set_hdr_multiplier = dpp2_set_hdr_multiplier,
+	.dpp_get_gamut_remap = dpp2_cm_get_gamut_remap,
 };
 
 static struct dpp_caps dcn20_dpp_cap = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h
index e735363d0051..672cde46c4b9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h
@@ -775,4 +775,7 @@ bool dpp2_construct(struct dcn20_dpp *dpp2,
 void dpp2_power_on_obuf(
 		struct dpp *dpp_base,
 	bool power_on);
+
+void dpp2_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust);
 #endif /* __DC_HWSS_DCN20_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
index 598caa508d43..58dc69926e8a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
@@ -234,6 +234,61 @@ void dpp2_cm_set_gamut_remap(
 	}
 }
 
+static void read_gamut_remap(struct dcn20_dpp *dpp,
+			     uint16_t *regval,
+			     enum dcn20_gamut_remap_select *select)
+{
+	struct color_matrices_reg gam_regs;
+	uint32_t selection;
+
+	IX_REG_GET(CM_TEST_DEBUG_INDEX, CM_TEST_DEBUG_DATA,
+		   CM_TEST_DEBUG_DATA_STATUS_IDX,
+		   CM_TEST_DEBUG_DATA_GAMUT_REMAP_MODE, &selection);
+
+	*select = selection;
+
+	gam_regs.shifts.csc_c11 = dpp->tf_shift->CM_GAMUT_REMAP_C11;
+	gam_regs.masks.csc_c11  = dpp->tf_mask->CM_GAMUT_REMAP_C11;
+	gam_regs.shifts.csc_c12 = dpp->tf_shift->CM_GAMUT_REMAP_C12;
+	gam_regs.masks.csc_c12 = dpp->tf_mask->CM_GAMUT_REMAP_C12;
+
+	if (*select == DCN2_GAMUT_REMAP_COEF_A) {
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
+
+		cm_helper_read_color_matrices(dpp->base.ctx,
+					      regval,
+					      &gam_regs);
+
+	} else if (*select == DCN2_GAMUT_REMAP_COEF_B) {
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_B_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_B_C33_C34);
+
+		cm_helper_read_color_matrices(dpp->base.ctx,
+					      regval,
+					      &gam_regs);
+	}
+}
+
+void dpp2_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust)
+{
+	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
+	uint16_t arr_reg_val[12];
+	enum dcn20_gamut_remap_select select;
+
+	read_gamut_remap(dpp, arr_reg_val, &select);
+
+	if (select == DCN2_GAMUT_REMAP_BYPASS) {
+		adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+		return;
+	}
+
+	adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+	convert_hw_matrix(adjust->temperature_matrix,
+			  arr_reg_val, ARRAY_SIZE(arr_reg_val));
+}
+
 void dpp2_program_input_csc(
 		struct dpp *dpp_base,
 		enum dc_color_space color_space,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
index a7268027a472..f809a7d21033 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
@@ -275,6 +275,7 @@ static struct dpp_funcs dcn201_dpp_funcs = {
 	.set_optional_cursor_attributes = dpp1_cnv_set_optional_cursor_attributes,
 	.dpp_dppclk_control = dpp1_dppclk_control,
 	.dpp_set_hdr_multiplier = dpp2_set_hdr_multiplier,
+	.dpp_get_gamut_remap = dpp2_cm_get_gamut_remap,
 };
 
 static struct dpp_caps dcn201_dpp_cap = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 11f7746f3a65..7c18f31bb56c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -1462,6 +1462,7 @@ static struct dpp_funcs dcn30_dpp_funcs = {
 	.set_optional_cursor_attributes	= dpp1_cnv_set_optional_cursor_attributes,
 	.dpp_dppclk_control		= dpp1_dppclk_control,
 	.dpp_set_hdr_multiplier		= dpp3_set_hdr_multiplier,
+	.dpp_get_gamut_remap		= dpp3_cm_get_gamut_remap,
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
index cea3208e4ab1..2ac8045a87a1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
@@ -637,4 +637,6 @@ void dpp3_program_cm_dealpha(
 		struct dpp *dpp_base,
 	uint32_t enable, uint32_t additive_blending);
 
+void dpp3_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust);
 #endif /* __DC_HWSS_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
index e43f77c11c00..54ec144f7b81 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
@@ -408,3 +408,57 @@ void dpp3_cm_set_gamut_remap(
 		program_gamut_remap(dpp, arr_reg_val, gamut_mode);
 	}
 }
+
+static void read_gamut_remap(struct dcn3_dpp *dpp,
+			     uint16_t *regval,
+			     int *select)
+{
+	struct color_matrices_reg gam_regs;
+	uint32_t selection;
+
+	//current coefficient set in use
+	REG_GET(CM_GAMUT_REMAP_CONTROL, CM_GAMUT_REMAP_MODE_CURRENT, &selection);
+
+	*select = selection;
+
+	gam_regs.shifts.csc_c11 = dpp->tf_shift->CM_GAMUT_REMAP_C11;
+	gam_regs.masks.csc_c11  = dpp->tf_mask->CM_GAMUT_REMAP_C11;
+	gam_regs.shifts.csc_c12 = dpp->tf_shift->CM_GAMUT_REMAP_C12;
+	gam_regs.masks.csc_c12 = dpp->tf_mask->CM_GAMUT_REMAP_C12;
+
+	if (*select == GAMUT_REMAP_COEFF) {
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
+
+		cm_helper_read_color_matrices(dpp->base.ctx,
+					      regval,
+					      &gam_regs);
+
+	} else if (*select == GAMUT_REMAP_COMA_COEFF) {
+		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_B_C11_C12);
+		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_B_C33_C34);
+
+		cm_helper_read_color_matrices(dpp->base.ctx,
+					      regval,
+					      &gam_regs);
+	}
+}
+
+void dpp3_cm_get_gamut_remap(struct dpp *dpp_base,
+			     struct dpp_grph_csc_adjustment *adjust)
+{
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint16_t arr_reg_val[12];
+	int select;
+
+	read_gamut_remap(dpp, arr_reg_val, &select);
+
+	if (select == GAMUT_REMAP_BYPASS) {
+		adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+		return;
+	}
+
+	adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+	convert_hw_matrix(adjust->temperature_matrix,
+			  arr_reg_val, ARRAY_SIZE(arr_reg_val));
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
index dcf12a0b031c..681e75c6dbaf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
@@ -133,6 +133,7 @@ static struct dpp_funcs dcn32_dpp_funcs = {
 	.set_optional_cursor_attributes	= dpp1_cnv_set_optional_cursor_attributes,
 	.dpp_dppclk_control			= dpp1_dppclk_control,
 	.dpp_set_hdr_multiplier		= dpp3_set_hdr_multiplier,
+	.dpp_get_gamut_remap		= dpp3_cm_get_gamut_remap,
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index f4aa76e02518..597ebdb4da4c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -290,6 +290,9 @@ struct dpp_funcs {
 	void (*dpp_cnv_set_alpha_keyer)(
 			struct dpp *dpp_base,
 			struct cnv_color_keyer_params *color_keyer);
+
+	void (*dpp_get_gamut_remap)(struct dpp *dpp_base,
+				    struct dpp_grph_csc_adjustment *adjust);
 };
 
 
-- 
2.42.0

