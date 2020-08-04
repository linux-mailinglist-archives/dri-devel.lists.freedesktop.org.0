Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60823C188
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6A16E40B;
	Tue,  4 Aug 2020 21:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ACF6E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p20so3834174wrf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rSnwHskuU/Vn9BNsX5dnhQU6rXCRh5IhIHhSUzqHOeM=;
 b=jbayXORG9F5nTq7s7WpepT6j/9ziHT9fNxd+HPpNppCmxU1Al//cWR/bkcplgFzMpB
 QHRY3uDcKnZ2wxxA4qhJllOVkqPSUYsYeb9UJcZgPUwcRs34SM1rwwhuVQZCDZMZwX1l
 AQlQnOipdLgPtK55RBy/AjaJeMgbY+PzrS/T+grp81O64AZLuKxqHWpSbHkv1Ohs8Ltb
 kTDfXBdzp/K1TYu8VscQV2nnhPwz3ufgajoB/GzEXSHvf85hoOtal4aQAkEaoSUZ9RN4
 AwQpKc+zzeWaTdvH1xs7wHo4+W8bAjhUFHsC7BBtdJj59SsVnRWyctiCpeEAP+pIzB2w
 TgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rSnwHskuU/Vn9BNsX5dnhQU6rXCRh5IhIHhSUzqHOeM=;
 b=VSqiF9D5N21HpR/udjKVShJat13k6Znd6JpzZkrwah435qHeJmra1RDXSZihCD0pg5
 rhqkn2LnFRCzMLU1zX7XjXlXJYBCujs4OyWRNBcILhcGxG3OSywGGh17TkvxrFcminFQ
 45Cvp0ZJii1/3Uns52QL4+gjRZ7iiJ8KziXQjc+jJy7IUEtqz1VwrxgTyAyJ3vXgiy9h
 gtNRpVsYXOjRuyGzM1U1j1g6G2wLgREzON0nN0jg0x0p8pllX8R1dtqFtXkRfDahs/Nf
 LGf1rSsP+BcII59WwAtSTGJP+BFc+DMRuqzRG+BXXitgFA1yC2nOoauDs0/jCWfoBluz
 VNqA==
X-Gm-Message-State: AOAM53166ZgpoaY+qVdve+v0KbV0JIy1JLnJVolPvcRqXzcut3+SlZkV
 DwWnDDJIkbPTRAjWkNjivrGN0Q==
X-Google-Smtp-Source: ABdhPJy7FsMKebDEqXaMWNmixRclpQybN+eiEC7d/BFnZttNzm/XpZGbyFdkD5V0vpLWOuvZ1cwq+Q==
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr21153180wrn.80.1596576733337; 
 Tue, 04 Aug 2020 14:32:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:12 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/amd/display: Refactor surface tiling setup.
Date: Tue,  4 Aug 2020 23:31:16 +0200
Message-Id: <20200804213119.25091-6-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for inserting modifiers based configuration, while sharing
a bunch of DCC validation & initializing the device-based configuration.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 209 ++++++++++--------
 1 file changed, 116 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index abc70fbe176d..6ef7f2f8acab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3601,46 +3601,83 @@ static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
 	return r;
 }
 
-static inline uint64_t get_dcc_address(uint64_t address, uint64_t tiling_flags)
+static void
+fill_gfx8_tiling_info_from_flags(union dc_tiling_info *tiling_info,
+				 uint64_t tiling_flags)
 {
-	uint32_t offset = AMDGPU_TILING_GET(tiling_flags, DCC_OFFSET_256B);
+	/* Fill GFX8 params */
+	if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE) == DC_ARRAY_2D_TILED_THIN1) {
+		unsigned int bankw, bankh, mtaspect, tile_split, num_banks;
+
+		bankw = AMDGPU_TILING_GET(tiling_flags, BANK_WIDTH);
+		bankh = AMDGPU_TILING_GET(tiling_flags, BANK_HEIGHT);
+		mtaspect = AMDGPU_TILING_GET(tiling_flags, MACRO_TILE_ASPECT);
+		tile_split = AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT);
+		num_banks = AMDGPU_TILING_GET(tiling_flags, NUM_BANKS);
 
-	return offset ? (address + offset * 256) : 0;
+		/* XXX fix me for VI */
+		tiling_info->gfx8.num_banks = num_banks;
+		tiling_info->gfx8.array_mode =
+				DC_ARRAY_2D_TILED_THIN1;
+		tiling_info->gfx8.tile_split = tile_split;
+		tiling_info->gfx8.bank_width = bankw;
+		tiling_info->gfx8.bank_height = bankh;
+		tiling_info->gfx8.tile_aspect = mtaspect;
+		tiling_info->gfx8.tile_mode =
+				DC_ADDR_SURF_MICRO_TILING_DISPLAY;
+	} else if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE)
+			== DC_ARRAY_1D_TILED_THIN1) {
+		tiling_info->gfx8.array_mode = DC_ARRAY_1D_TILED_THIN1;
+	}
+
+	tiling_info->gfx8.pipe_config =
+			AMDGPU_TILING_GET(tiling_flags, PIPE_CONFIG);
+}
+
+static void
+fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
+				  union dc_tiling_info *tiling_info)
+{
+	tiling_info->gfx9.num_pipes =
+		adev->gfx.config.gb_addr_config_fields.num_pipes;
+	tiling_info->gfx9.num_banks =
+		adev->gfx.config.gb_addr_config_fields.num_banks;
+	tiling_info->gfx9.pipe_interleave =
+		adev->gfx.config.gb_addr_config_fields.pipe_interleave_size;
+	tiling_info->gfx9.num_shader_engines =
+		adev->gfx.config.gb_addr_config_fields.num_se;
+	tiling_info->gfx9.max_compressed_frags =
+		adev->gfx.config.gb_addr_config_fields.max_compress_frags;
+	tiling_info->gfx9.num_rb_per_se =
+		adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
+	tiling_info->gfx9.shaderEnable = 1;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	if (adev->asic_type == CHIP_SIENNA_CICHLID)
+		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
+#endif
 }
 
 static int
-fill_plane_dcc_attributes(struct amdgpu_device *adev,
-			  const struct amdgpu_framebuffer *afb,
-			  const enum surface_pixel_format format,
-			  const enum dc_rotation_angle rotation,
-			  const struct plane_size *plane_size,
-			  const union dc_tiling_info *tiling_info,
-			  const uint64_t info,
-			  struct dc_plane_dcc_param *dcc,
-			  struct dc_plane_address *address,
-			  bool force_disable_dcc)
+validate_dcc(struct amdgpu_device *adev,
+	     const enum surface_pixel_format format,
+	     const enum dc_rotation_angle rotation,
+	     const union dc_tiling_info *tiling_info,
+	     const struct dc_plane_dcc_param *dcc,
+	     const struct dc_plane_address *address,
+	     const struct plane_size *plane_size)
 {
 	struct dc *dc = adev->dm.dc;
 	struct dc_dcc_surface_param input;
 	struct dc_surface_dcc_cap output;
-	uint64_t plane_address = afb->address + afb->base.offsets[0];
-	uint32_t offset = AMDGPU_TILING_GET(info, DCC_OFFSET_256B);
-	uint32_t i64b = AMDGPU_TILING_GET(info, DCC_INDEPENDENT_64B) != 0;
-	uint64_t dcc_address;
 
 	memset(&input, 0, sizeof(input));
 	memset(&output, 0, sizeof(output));
 
-	if (force_disable_dcc)
-		return 0;
-
-	if (!offset)
+	if (!dcc->enable)
 		return 0;
 
-	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
-		return -EINVAL;
-
-	if (!dc->cap_funcs.get_dcc_compression_cap)
+	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN ||
+	    !dc->cap_funcs.get_dcc_compression_cap)
 		return -EINVAL;
 
 	input.format = format;
@@ -3659,17 +3696,60 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
 	if (!output.capable)
 		return -EINVAL;
 
-	if (i64b == 0 && output.grph.rgb.independent_64b_blks != 0)
+	if (dcc->independent_64b_blks == 0 &&
+	    output.grph.rgb.independent_64b_blks != 0)
 		return -EINVAL;
 
+	return 0;
+}
+
+static void
+fill_dcc_params_from_flags(const struct amdgpu_framebuffer *afb,
+			   struct dc_plane_dcc_param *dcc,
+			   struct dc_plane_address *address,
+			   const uint64_t flags, bool force_disable_dcc)
+{
+	uint64_t dcc_address;
+	uint64_t plane_address = afb->address + afb->base.offsets[0];
+	uint32_t offset = AMDGPU_TILING_GET(flags, DCC_OFFSET_256B);
+	uint32_t i64b = AMDGPU_TILING_GET(flags, DCC_INDEPENDENT_64B) != 0;
+
+	if (!offset || force_disable_dcc)
+		return;
+
 	dcc->enable = 1;
-	dcc->meta_pitch =
-		AMDGPU_TILING_GET(info, DCC_PITCH_MAX) + 1;
+	dcc->meta_pitch = AMDGPU_TILING_GET(flags, DCC_PITCH_MAX) + 1;
 	dcc->independent_64b_blks = i64b;
 
-	dcc_address = get_dcc_address(plane_address, info);
+	dcc_address = plane_address + (uint64_t)offset * 256;
 	address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
 	address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
+}
+
+
+static int
+fill_gfx9_plane_attributes_from_flags(struct amdgpu_device *adev,
+				      const struct amdgpu_framebuffer *afb,
+				      const enum surface_pixel_format format,
+				      const enum dc_rotation_angle rotation,
+				      const struct plane_size *plane_size,
+				      union dc_tiling_info *tiling_info,
+				      struct dc_plane_dcc_param *dcc,
+				      struct dc_plane_address *address,
+				      uint64_t tiling_flags,
+				      bool force_disable_dcc)
+{
+	int ret;
+
+	fill_gfx9_tiling_info_from_device(adev, tiling_info);
+
+	tiling_info->gfx9.swizzle =
+		AMDGPU_TILING_GET(tiling_flags, SWIZZLE_MODE);
+
+	fill_dcc_params_from_flags(afb, dcc, address, tiling_flags, force_disable_dcc);
+	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -3741,73 +3821,16 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 			upper_32_bits(chroma_addr);
 	}
 
-	/* Fill GFX8 params */
-	if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE) == DC_ARRAY_2D_TILED_THIN1) {
-		unsigned int bankw, bankh, mtaspect, tile_split, num_banks;
-
-		bankw = AMDGPU_TILING_GET(tiling_flags, BANK_WIDTH);
-		bankh = AMDGPU_TILING_GET(tiling_flags, BANK_HEIGHT);
-		mtaspect = AMDGPU_TILING_GET(tiling_flags, MACRO_TILE_ASPECT);
-		tile_split = AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT);
-		num_banks = AMDGPU_TILING_GET(tiling_flags, NUM_BANKS);
-
-		/* XXX fix me for VI */
-		tiling_info->gfx8.num_banks = num_banks;
-		tiling_info->gfx8.array_mode =
-				DC_ARRAY_2D_TILED_THIN1;
-		tiling_info->gfx8.tile_split = tile_split;
-		tiling_info->gfx8.bank_width = bankw;
-		tiling_info->gfx8.bank_height = bankh;
-		tiling_info->gfx8.tile_aspect = mtaspect;
-		tiling_info->gfx8.tile_mode =
-				DC_ADDR_SURF_MICRO_TILING_DISPLAY;
-	} else if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE)
-			== DC_ARRAY_1D_TILED_THIN1) {
-		tiling_info->gfx8.array_mode = DC_ARRAY_1D_TILED_THIN1;
-	}
-
-	tiling_info->gfx8.pipe_config =
-			AMDGPU_TILING_GET(tiling_flags, PIPE_CONFIG);
 
-	if (adev->asic_type == CHIP_VEGA10 ||
-	    adev->asic_type == CHIP_VEGA12 ||
-	    adev->asic_type == CHIP_VEGA20 ||
-	    adev->asic_type == CHIP_NAVI10 ||
-	    adev->asic_type == CHIP_NAVI14 ||
-	    adev->asic_type == CHIP_NAVI12 ||
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-		adev->asic_type == CHIP_SIENNA_CICHLID ||
-#endif
-	    adev->asic_type == CHIP_RENOIR ||
-	    adev->asic_type == CHIP_RAVEN) {
-		/* Fill GFX9 params */
-		tiling_info->gfx9.num_pipes =
-			adev->gfx.config.gb_addr_config_fields.num_pipes;
-		tiling_info->gfx9.num_banks =
-			adev->gfx.config.gb_addr_config_fields.num_banks;
-		tiling_info->gfx9.pipe_interleave =
-			adev->gfx.config.gb_addr_config_fields.pipe_interleave_size;
-		tiling_info->gfx9.num_shader_engines =
-			adev->gfx.config.gb_addr_config_fields.num_se;
-		tiling_info->gfx9.max_compressed_frags =
-			adev->gfx.config.gb_addr_config_fields.max_compress_frags;
-		tiling_info->gfx9.num_rb_per_se =
-			adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
-		tiling_info->gfx9.swizzle =
-			AMDGPU_TILING_GET(tiling_flags, SWIZZLE_MODE);
-		tiling_info->gfx9.shaderEnable = 1;
-
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
-		if (adev->asic_type == CHIP_SIENNA_CICHLID)
-			tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
-
-#endif
-		ret = fill_plane_dcc_attributes(adev, afb, format, rotation,
-						plane_size, tiling_info,
-						tiling_flags, dcc, address,
-						force_disable_dcc);
+	if (adev->family >= AMDGPU_FAMILY_AI) {
+		ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
+							    plane_size, tiling_info, dcc,
+							    address, tiling_flags,
+							    force_disable_dcc);
 		if (ret)
 			return ret;
+	} else {
+		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
 	}
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
