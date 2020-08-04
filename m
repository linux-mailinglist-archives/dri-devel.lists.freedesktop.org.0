Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C320A23C18A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86506E4C9;
	Tue,  4 Aug 2020 21:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D106E40B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so33651810wrs.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1czY7T+I7CjvoeWnbX2ijjaxlsc1HIHBxtqM93aOiTE=;
 b=BBP3kPn8JTzLH2tRNhz1e52SrwGXMRf1c82NORg/z/crRO+YSVK5Z2L4b2IAdRBbeD
 9Ul8qVpXGm7LTOmpQNn2/PsubbM569qFAugVCUK1+6Dx2hZJq7qhHyp7udSPRASX9ZFf
 dJ3Qyza06/DV1xE0wZUQLfyDq+dthe8FxRYxudsQ5yQTW1JkMfHOND1lRjP/mg9JbcTz
 zNbRi0ZP6AlNHtDlMFMCorWEKOgUjBSW0zqwOb/iqIXh3dGWFfJF11LZNBcz/Z76lVL1
 420NvzVgnXgJ/oj0tDHJ1Xwv5OEABJlWq4hGNGv0aKuGMWt0GAnrSLEtbFB04I/JthBB
 hbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1czY7T+I7CjvoeWnbX2ijjaxlsc1HIHBxtqM93aOiTE=;
 b=OSIpy73L6bMzxIJCpRhCfAjzNWDtmXsRE8a6whkvZkZdod/RCC8q5mbI7rhDbEKWvE
 E2sZWj9lEvaU8Mbt6G6CaCwK+SabkRdw0fmFmCXeizHMQhnxiQHqZQo+1cvXPBBEwvro
 +P02cKCEZUnwM9OFWvs7sFEYzD+P1CnO+nOxxm/mKbF0BE1IDYCFkJSY2opKHKbgr2hC
 cHQqIG8IGgRLrjkTfYowj6D+2cbP0NWvCzJOoXogKI5dQXqAXTCFG9AeGBTBM+XJPld8
 siFmaPv5BhBm+3hxWohOyzIqnacJ+HkJcLCXZdLm7y6a6OEUcrpovj9uaLSoXIqJzecD
 Wi7g==
X-Gm-Message-State: AOAM531u4aM4JbYn0FyJgcDjYZ8Cz2PREMyI8AzcDLDsbfQFdKr5rY0+
 A9sGn3dqNRKbmze5ZCcpyEm+wQ==
X-Google-Smtp-Source: ABdhPJwTjYa5/WswBhamvdRmNtvvX+EkRnJmkpAYe43L6bfjXfmt7+QxppxewWAk+O4VCaZWq8c2Vw==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr20637024wrq.404.1596576734197; 
 Tue, 04 Aug 2020 14:32:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:13 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/amd/display: Set DC options from modifiers.
Date: Tue,  4 Aug 2020 23:31:17 +0200
Message-Id: <20200804213119.25091-7-bas@basnieuwenhuizen.nl>
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

This sets the DC tiling options from the modifier, if modifiers
are used for the FB. This patch by itself does not expose the
support yet though.

There is not much validation yet to limit the scope of this
patch, but the current validation is at the same level as
the BO metadata path.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 109 +++++++++++++++++-
 1 file changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6ef7f2f8acab..ac913b8f10ef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3754,6 +3754,93 @@ fill_gfx9_plane_attributes_from_flags(struct amdgpu_device *adev,
 	return 0;
 }
 
+static bool
+modifier_has_dcc(uint64_t modifier)
+{
+	return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier);
+}
+
+static unsigned
+modifier_gfx9_swizzle_mode(uint64_t modifier)
+{
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return 0;
+
+	return AMD_FMT_MOD_GET(TILE, modifier);
+}
+
+static void
+fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
+				  union dc_tiling_info *tiling_info,
+				  uint64_t modifier)
+{
+	unsigned int mod_bank_xor_bits = AMD_FMT_MOD_GET(BANK_XOR_BITS, modifier);
+	unsigned int mod_pipe_xor_bits = AMD_FMT_MOD_GET(PIPE_XOR_BITS, modifier);
+	unsigned int pkrs_log2 = AMD_FMT_MOD_GET(PACKERS, modifier);
+	unsigned int pipes_log2 = min(4u, mod_pipe_xor_bits);
+
+	fill_gfx9_tiling_info_from_device(adev, tiling_info);
+
+	if (!IS_AMD_FMT_MOD(modifier))
+		return;
+
+	tiling_info->gfx9.num_pipes = 1u << pipes_log2;
+	tiling_info->gfx9.num_shader_engines = 1u << (mod_pipe_xor_bits - pipes_log2);
+
+	if (adev->family >= AMDGPU_FAMILY_NV) {
+		tiling_info->gfx9.num_pkrs = 1u << pkrs_log2;
+	} else {
+		tiling_info->gfx9.num_banks = 1u << mod_bank_xor_bits;
+
+		/* for DCC we know it isn't rb aligned, so rb_per_se doesn't matter. */
+	}
+}
+
+static void
+block_alignment(unsigned int blocksize_log2, unsigned int *width, unsigned int *height)
+{
+	unsigned int height_log2 = blocksize_log2 / 2;
+	unsigned int width_log2 = blocksize_log2 - height_log2;
+
+	*width = 1u << width_log2;
+	*height = 1u << height_log2;
+}
+
+static int
+fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
+				      const struct amdgpu_framebuffer *afb,
+				      const enum surface_pixel_format format,
+				      const enum dc_rotation_angle rotation,
+				      const struct plane_size *plane_size,
+				      union dc_tiling_info *tiling_info,
+				      struct dc_plane_dcc_param *dcc,
+				      struct dc_plane_address *address,
+				      const bool force_disable_dcc)
+{
+	const uint64_t modifier = afb->base.modifier;
+	int ret;
+
+	fill_gfx9_tiling_info_from_modifier(adev, tiling_info, modifier);
+	tiling_info->gfx9.swizzle = modifier_gfx9_swizzle_mode(modifier);
+
+	if (modifier_has_dcc(modifier) && !force_disable_dcc) {
+		uint64_t dcc_address = afb->address + afb->base.offsets[1];
+
+		dcc->enable = 1;
+		dcc->meta_pitch = afb->base.pitches[1];
+		dcc->independent_64b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_64B, modifier);
+
+		address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
+		address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
+	}
+
+	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int
 fill_plane_buffer_attributes(struct amdgpu_device *adev,
 			     const struct amdgpu_framebuffer *afb,
@@ -3823,12 +3910,22 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 
 
 	if (adev->family >= AMDGPU_FAMILY_AI) {
-		ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
-							    plane_size, tiling_info, dcc,
-							    address, tiling_flags,
-							    force_disable_dcc);
-		if (ret)
-			return ret;
+		if (afb->base.flags & DRM_MODE_FB_MODIFIERS) {
+			ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
+								      rotation, plane_size,
+								      tiling_info, dcc,
+								      address,
+								      force_disable_dcc);
+			if (ret)
+				return ret;
+		} else {
+			ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
+								  plane_size, tiling_info, dcc,
+								  address, tiling_flags,
+								  force_disable_dcc);
+			if (ret)
+				return ret;
+		}
 	} else {
 		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
