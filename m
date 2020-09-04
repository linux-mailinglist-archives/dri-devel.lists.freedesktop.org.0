Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453825DF55
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89B6EC8B;
	Fri,  4 Sep 2020 16:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A836EC89
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z9so6579913wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JLUKijUScJpKg4Is3sprZjGVGWYATWCMI5iUqFOWdQo=;
 b=F2v9kJJpaHoiAcO/rRv9AMHMJljpnfM4Itic9B/RjgNCxuXg32YSWDtXQT07Ys/FEd
 pq37ydDafwTGqs8boCtCfsgLiUkBH96MyHEr+298kcQ1zAn/Xj9xhAb/QuLGePIlZRB3
 erMuyP+tvOWtRkahYov/Jbty885ojEM2VXrT+tXNBQFVUh/X9w01/q0mEQpNlv4JajOp
 OBzSkV3/HZFodaR9UckZuWpCvLijhUcQdvDYfKx1eGHzybcgTcwfy4wePtUeU5QAvXMo
 BRa1dnn45il8r5F2pZ/WSQGDBrDlr3Y89kvdCMEQEUJ6O+YBuhoBx/DB3VaB4BEG8JAO
 MdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLUKijUScJpKg4Is3sprZjGVGWYATWCMI5iUqFOWdQo=;
 b=uMDmBR6yItf66I9GTsUJUxxMVulGyOSjY3z9MyBMmfaN9SFLdZMVqo9CLiNIgcAJLs
 281GZRMqU13pzUtOHvx0+gdnc+EzgncFmaoQ1rOuIxG4mefagsPTvq+1FrNLta6IbzTR
 gQXhsuTl7cg2FFUae49ohbCEonMI5b3xiBYA4sLPhCK9TFX+j45Z0OHfzjbDI+8fv/jM
 sbOQiTPbohFle1E1qFXo1HbUkVpnraaOvri3bF1QgdW3VoBziAdN7rdRiKieBjLmPFG0
 jkWtec/44Jkfth7jhAWExIketHkXF/vYNTfD0zvBOgXjsjxb9378ZoXAl5LpLILRmc2X
 Zq/g==
X-Gm-Message-State: AOAM532AwYHMHPEhWJ9cVN7ZNF8GcIYOfN2QgSwTkeczpXZbYcQGN0yp
 KqeDJUhlo02FBXpCPCcfltvY/w==
X-Google-Smtp-Source: ABdhPJyWeIivxaInMO3QHwi8SzCAhzAM1pRnC58jJaUi7Neehs4od/4kOmz9HJQZvkmxar9/twYfzw==
X-Received: by 2002:a1c:a953:: with SMTP id s80mr8141270wme.70.1599235636076; 
 Fri, 04 Sep 2020 09:07:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:15 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/amd/display: Refactor surface tiling setup.
Date: Fri,  4 Sep 2020 18:07:05 +0200
Message-Id: <20200904160709.123970-8-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 211 ++++++++++--------
 1 file changed, 116 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 72e16aa03504..4fb77b25e28c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3687,46 +3687,83 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
 	return 0;
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
@@ -3745,17 +3782,60 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
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
@@ -3827,74 +3907,15 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
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
-
-	if (adev->asic_type == CHIP_VEGA10 ||
-	    adev->asic_type == CHIP_VEGA12 ||
-	    adev->asic_type == CHIP_VEGA20 ||
-	    adev->asic_type == CHIP_NAVI10 ||
-	    adev->asic_type == CHIP_NAVI14 ||
-	    adev->asic_type == CHIP_NAVI12 ||
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-		adev->asic_type == CHIP_SIENNA_CICHLID ||
-		adev->asic_type == CHIP_NAVY_FLOUNDER ||
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
-		if (adev->asic_type == CHIP_SIENNA_CICHLID ||
-		    adev->asic_type == CHIP_NAVY_FLOUNDER)
-			tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
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
