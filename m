Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646225DF56
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98D6EC8C;
	Fri,  4 Sep 2020 16:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1B36EC8B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o21so6596051wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuJHWVxsosvb86NQqqzWseSA7dH5opMNswxA2CEbAgQ=;
 b=MqIvhMB4I0O6tFewuwgcKQXYCwDFPHCllmY01wqJpE3tPQOCg72q9qfkhYMK67bEey
 h9QMNDOh0oci1jOdCCPNr8UKnEEUwwsA+VkdkI08wGoYtYzEaTDayUMmBKFruKCPvjSI
 D2ckQm+SQ+MZIjthjX2xNpBAEfu0bPTOZyUSkw4JKdoRzx5hH6fKoNehXdpgDXWerNCA
 jn5tn3HnOBQALvv081gKBV+czZNDu4G5UVurTNGMzRG9MWivMMcQ9gIoQ/DNtMSNjS74
 NesqpjTJvqTMy9sbp7tLbDooWvzFsZTl3pyNy+F1dKBRUoEeXKjuzi0lZC+gBXZNhmZV
 03MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuJHWVxsosvb86NQqqzWseSA7dH5opMNswxA2CEbAgQ=;
 b=XzLSB9SspnGhH8J6eYM96pqcifOSEIbZWDxHpRnv2ZTc7+Z4qTYSkvrhXK5QF5OA4Z
 fD0q5sRzaLFUGWNoMR9qiw/2z2sPex4CKJsRrSDdJNQ/1/87IYuYEd/JZ6TFED9A+ypN
 SfswtDFk4c+OhEmyJxjkwSaPA6bFwFZZYgb3xDUwzgWEV9XNje6yQjkyMlkGXXON1LqW
 rcRTrMW1nO5OXGHSRR1oMi8mLRj7bE/Npx5KiqX6JdQJMP5uj0sdHgDX/DfrJTAQpgmD
 qJAnIBu13hzCgUOFLZzrZA4T0tbh9uZFhj+0/dEETAPtO5qtO6pDjDieDiLrAzFCJBcW
 Ci3w==
X-Gm-Message-State: AOAM533kfLjYLmlcdJwvpRRMfWCVpzmvaQBOMaO78tlmAGf/7fHkl3eD
 tAbbvXaj26uOGOBUqVeXPiypEQ==
X-Google-Smtp-Source: ABdhPJyLAsuQ3uCXZ99AyyOZL9Rc7fvdTI9FkQY+/pGI6F1R566G0zFaqISrNLcx9SicxmQI2OnQ6g==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr8015401wmj.138.1599235637176; 
 Fri, 04 Sep 2020 09:07:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:16 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/amd/display: Set DC options from modifiers.
Date: Fri,  4 Sep 2020 18:07:06 +0200
Message-Id: <20200904160709.123970-9-bas@basnieuwenhuizen.nl>
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

This sets the DC tiling options from the modifier, if modifiers
are used for the FB. This patch by itself does not expose the
support yet though.

There is not much validation yet to limit the scope of this
patch, but the current validation is at the same level as
the BO metadata path.

v2: Add modifier check to should_reset_plane.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 102 ++++++++++++++++--
 1 file changed, 95 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4fb77b25e28c..545d177bf703 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3840,6 +3840,83 @@ fill_gfx9_plane_attributes_from_flags(struct amdgpu_device *adev,
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
+				    union dc_tiling_info *tiling_info,
+				    uint64_t modifier)
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
+static int
+fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
+					  const struct amdgpu_framebuffer *afb,
+					  const enum surface_pixel_format format,
+					  const enum dc_rotation_angle rotation,
+					  const struct plane_size *plane_size,
+					  union dc_tiling_info *tiling_info,
+					  struct dc_plane_dcc_param *dcc,
+					  struct dc_plane_address *address,
+					  const bool force_disable_dcc)
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
@@ -3908,12 +3985,22 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 	}
 
 	if (adev->family >= AMDGPU_FAMILY_AI) {
-		ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
-							    plane_size, tiling_info, dcc,
-							    address, tiling_flags,
-							    force_disable_dcc);
-		if (ret)
-			return ret;
+		if (afb->base.flags & DRM_MODE_FB_MODIFIERS) {
+			ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
+									rotation, plane_size,
+									tiling_info, dcc,
+									address,
+									force_disable_dcc);
+			if (ret)
+				return ret;
+		} else {
+			ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
+								    plane_size, tiling_info, dcc,
+								    address, tiling_flags,
+								    force_disable_dcc);
+			if (ret)
+				return ret;
+		}
 	} else {
 		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
 	}
@@ -8372,7 +8459,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		new_afb = (struct amdgpu_framebuffer *)new_other_state->fb;
 
 		/* Tiling and DCC changes also require bandwidth updates. */
-		if (old_afb->tiling_flags != new_afb->tiling_flags)
+		if (old_afb->tiling_flags != new_afb->tiling_flags ||
+		    old_afb->base.modifier != new_afb->base.modifier)
 			return true;
 	}
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
