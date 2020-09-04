Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED625DF54
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B0D6EC89;
	Fri,  4 Sep 2020 16:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E4F6EC82
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so6559009wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmtAu/z62HQC364syzG468AoPg5DZcoxc4BKFe77Hs4=;
 b=spr91m45qe6WDklhNg03CZbJHyeva7zyO1jFrqiYW9zqSyS0ZqcVOgTHNndQSw7OKx
 3GDd+FlkFzUh2obR/jiKSvIdbWW+vra7eJ62JhusaeXOW8hRnme6WVbjYl5LyK+0Essx
 Dd7AjQka0a0uUXjuefSnhEG+uh9RQJ+QO5qFKe+/TYtQwfyKq1b+z7/8u8OhdQ4iamfz
 9SHjmZdh+07e+5muOC2DGQrM4pYwwJ8SueEix9GWQ0zgjYdNghkLmJJxgPNcnI5woaH2
 LArQBdnOHhLe0t7WVNTBmP42MX36HC0ri9k5LQWF27y5+umNDuS0r05hPpVll/CWgnVT
 eaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmtAu/z62HQC364syzG468AoPg5DZcoxc4BKFe77Hs4=;
 b=U1VNwWx7n55023pNaomXefRA/LeLD6bxoyez7OuRwjHH0HVbpb4Wqef8uZt/fpPEka
 nW2k+oGTwg9v1+ejcOP5xKJ8RsJe3pA1V56wUS6S0H7//+wFCPOlebq4UCPJuCLOmusZ
 j7g5qnLyFmgHc2Qq48qx1t13lTKUVjN/fXPbnkIcvc5JEoymvBDrbNmytSLIxSBp3ipq
 v8fkaEEUuSuk44jyzQaWh1/o95BqSy9vbwsYdhDNMq1tBbmXBEFGaO36/6me2HAwhnOz
 UbjaMYIDaTh78lz7wJo7cuV5TE+4JqSVrC01IwCmJhHQLsEzfpbd/m7QPv0/3HzSoFCa
 a2tQ==
X-Gm-Message-State: AOAM532tZB1dEXq0bdHKamHq2Egg3Y8gq8qexi4jXhgoeExXcqUvt6+q
 QPrK7veWREc3o/tIhxDkppADOQ==
X-Google-Smtp-Source: ABdhPJzKZBQU4CvThBB01r2n5V72lIbJHrWophxmRJShzddFmLVB6Dc548YfuUI+izbAZolkBjIyLg==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr8115556wmk.69.1599235635053; 
 Fri, 04 Sep 2020 09:07:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:14 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/11] drm/amd/display: Convert tiling_flags to modifiers.
Date: Fri,  4 Sep 2020 18:07:04 +0200
Message-Id: <20200904160709.123970-7-bas@basnieuwenhuizen.nl>
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

This way the modifier path gets exercised all the time, improving
testing. Furthermore, for modifiers this is required as getfb2
will always return the modifier if the driver sets allow_fb_modifiers.

This only triggers once allow_fb_modifiers is set.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 123 ++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 638ce7528d30..af45cc6d8ec1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -38,6 +38,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
 static void amdgpu_display_flip_callback(struct dma_fence *f,
@@ -537,6 +538,121 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	return domain;
 }
 
+static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
+{
+	struct amdgpu_device *adev = drm_to_adev(afb->base.dev);
+	uint64_t modifier = 0;
+
+	if (!afb->tiling_flags || !AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE)) {
+		modifier = DRM_FORMAT_MOD_LINEAR;
+	} else {
+		int swizzle = AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE);
+		bool has_xor = swizzle >= 16;
+		int block_size_bits;
+		int version;
+		int pipe_xor_bits = 0;
+		int bank_xor_bits = 0;
+		int packers = 0;
+		uint32_t dcc_offset = AMDGPU_TILING_GET(afb->tiling_flags, DCC_OFFSET_256B);
+
+		switch (swizzle >> 2) {
+		case 0: /* 256B */
+			block_size_bits = 8;
+			break;
+		case 1: /* 4KiB */
+		case 5: /* 4KiB _X */
+			block_size_bits = 12;
+			break;
+		case 2: /* 64KiB */
+		case 4: /* 64 KiB _T */
+		case 6: /* 64 KiB _X */
+			block_size_bits = 16;
+			break;
+		default:
+			/* RESERVED or VAR */
+			return -EINVAL;
+		}
+
+		if (adev->asic_type >= CHIP_SIENNA_CICHLID)
+			version = AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS;
+		else if (adev->family == AMDGPU_FAMILY_NV)
+			version = AMD_FMT_MOD_TILE_VER_GFX10;
+		else
+			version = AMD_FMT_MOD_TILE_VER_GFX9;
+
+		switch (swizzle & 3) {
+		case 0: /* Z microtiling */
+			return -EINVAL;
+		case 1: /* S microtiling */
+			if (!has_xor)
+				version = AMD_FMT_MOD_TILE_VER_GFX9;
+			break;
+		case 2:
+			if (!has_xor && afb->base.format->cpp[0] != 4)
+				version = AMD_FMT_MOD_TILE_VER_GFX9;
+			break;
+		case 3:
+			break;
+		}
+
+		if (has_xor) {
+			switch (version) {
+			case AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS:
+				pipe_xor_bits = min(block_size_bits - 8,
+						    ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes));
+				packers = min(block_size_bits - 8 - pipe_xor_bits,
+					      ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs));
+				break;
+			case AMD_FMT_MOD_TILE_VER_GFX10:
+				pipe_xor_bits = min(block_size_bits - 8,
+						    ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes));
+				break;
+			case AMD_FMT_MOD_TILE_VER_GFX9:
+				pipe_xor_bits = min(block_size_bits - 8,
+						    ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes) +
+						    ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
+				bank_xor_bits = min(block_size_bits - 8 - pipe_xor_bits,
+						    ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
+				break;
+			}
+		}
+
+		modifier = AMD_FMT_MOD |
+			   AMD_FMT_MOD_SET(TILE, AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE)) |
+			   AMD_FMT_MOD_SET(TILE_VERSION, version) |
+			   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			   AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			   AMD_FMT_MOD_SET(PACKERS, packers);
+
+		if (dcc_offset != 0) {
+			bool dcc_i64b = AMDGPU_TILING_GET(afb->tiling_flags, DCC_INDEPENDENT_64B) != 0;
+			bool dcc_i128b = version >= AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS;
+
+			/* Enable constant encode on RAVEN2 and later. */
+			bool dcc_constant_encode = adev->asic_type > CHIP_RAVEN ||
+						   (adev->asic_type == CHIP_RAVEN &&
+						    adev->external_rev_id >= 0x81);
+
+			int max_cblock_size = dcc_i64b ? AMD_FMT_MOD_DCC_BLOCK_64B :
+					      dcc_i128b ? AMD_FMT_MOD_DCC_BLOCK_128B :
+					      AMD_FMT_MOD_DCC_BLOCK_256B;
+
+			modifier |= AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, dcc_constant_encode) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, dcc_i64b) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, dcc_i128b) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, max_cblock_size);
+
+			afb->base.offsets[1] = dcc_offset * 256 + afb->base.offsets[0];
+			afb->base.pitches[1] = AMDGPU_TILING_GET(afb->tiling_flags, DCC_PITCH_MAX) + 1;
+		}
+	}
+
+	afb->base.modifier = modifier;
+	afb->base.flags |= DRM_MODE_FB_MODIFIERS;
+	return 0;
+}
+
 static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
 				      uint64_t *tiling_flags, bool *tmz_surface)
 {
@@ -586,6 +702,13 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	if (dev->mode_config.allow_fb_modifiers &&
+	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
+		ret = convert_tiling_flags_to_modifier(rfb);
+		if (ret)
+			goto fail;
+	}
+
 	return 0;
 
 fail:
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
