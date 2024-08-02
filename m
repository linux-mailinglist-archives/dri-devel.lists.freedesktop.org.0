Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A771945D57
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 13:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758B110E043;
	Fri,  2 Aug 2024 11:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PdDugiyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7FF10E043;
 Fri,  2 Aug 2024 11:42:56 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so94768821fa.1; 
 Fri, 02 Aug 2024 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722598975; x=1723203775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOwlLJ3ofGI0TikYJvkZxHGMFAPFrL5NOyAVPrWUQ+k=;
 b=PdDugiyBT7d/RSXIYLonsa3nZF2JLJERysGqSRyplxihmcW9Xmo2QFjQL0e2K6pP33
 YiP5kFdh6z/k3FrlymUX5IfB7r+iViGPxa5Lu12gsdx6fysIC+IWM5iwREkobrUQvbw2
 QMCP+hByUkx/givDW/GFViVQ0eHR6R/RzbcsljgAucvNlRTxCw2wlzPFCJ344guTlH+u
 nATZIJYJkojumM9P432jKlb+aKPb8L1KXZmz/UgJ50JlLs3hfK19tpJZs6fgiP8yf2tn
 24oMQe96swhs0aqiPl8isZ58KlvATa166EWd2hcm1U/Lo6jOKBATBP0DSzzJUiAGSkmW
 9tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722598975; x=1723203775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOwlLJ3ofGI0TikYJvkZxHGMFAPFrL5NOyAVPrWUQ+k=;
 b=rEnG7s3kpeKalIBeYogaIrzK2Rc2PMPlK62PT3rulbCiLuYlE8dpx2VaYkCo9hSEwq
 0LbrXLajehIrmxuNM5QLDlHncG34q1EONITB5LXM4tNtTYV+Gt8K16MzrSitK824GRWW
 c3HC+I12T2Suk1uH6F8iyNmlg76eVIujB6m4xdrxdF3F3/l+DjQV2U/E4VDPV1ue4aAL
 XI1/hVBER5BPlKXbtycEGTnZmcLfmJ2kJj24YEtupJJziR0tGhepzN5g7cgLzMKlUNhI
 EwsoNxCZf4h0+KOlUwN8ZaXADjfK6Dmsql3Mcj/cfgHsPUZBuXT3oLlTs1nTf9IFWk74
 7y9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAUUYwr50ekqKWYErH0AD2pCntpasB1F8oXKPAEEUAHKiMZGM4Ii0vzEbzNrYuwck6+xSHwGYe0ZNMnhSmTwvVHmywlN8P7Mmdqbz2++g4Yg+JbO6jthWFo16sTw6ToRpCDkZOPXUhJXnmofMang==
X-Gm-Message-State: AOJu0YymztT0EOBDhM11o2n9HYVvovo5jB2fmRM1IYHovobMTvycfBJA
 pb3LDBv6XYVzIWeJaiGqYK6Y6n93W6lsCzeWQP2mx2jfIO+rVvPz
X-Google-Smtp-Source: AGHT+IG+hjnJrqP5K8N5VX1i9PsnTAXDZwc4jEIMQBxc57qkv2RRrZbZV6TiQhmdzFY+TrIqpfM45w==
X-Received: by 2002:a2e:4941:0:b0:2ef:28d2:39cc with SMTP id
 38308e7fff4ca-2f15aa7187bmr22236801fa.3.1722598974134; 
 Fri, 02 Aug 2024 04:42:54 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6cd8d67sm30582345e9.0.2024.08.02.04.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 04:42:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: remove extraneous ; after statements
Date: Fri,  2 Aug 2024 12:42:52 +0100
Message-Id: <20240802114252.449452-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are a several statements with two following semicolons, replace
these with just one semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c  | 2 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 2 +-
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c    | 4 ++--
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 65776602648d..9956974c4527 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -1040,7 +1040,7 @@ void dml21_copy_clocks_to_dc_state(struct dml2_context *in_ctx, struct dc_state
 void dml21_extract_legacy_watermark_set(const struct dc *in_dc, struct dcn_watermarks *watermark, enum dml2_dchub_watermark_reg_set_index reg_set_idx, struct dml2_context *in_ctx)
 {
 	struct dml2_core_internal_display_mode_lib *mode_lib = &in_ctx->v21.dml_init.dml2_instance->core_instance.clean_me_up.mode_lib;
-	double refclk_freq_in_mhz = (in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz > 0) ? (double)in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz : mode_lib->soc.dchub_refclk_mhz;;
+	double refclk_freq_in_mhz = (in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz > 0) ? (double)in_ctx->v21.display_config.overrides.hw.dlg_ref_clk_mhz : mode_lib->soc.dchub_refclk_mhz;
 
 	if (reg_set_idx >= DML2_DCHUB_WATERMARK_SET_NUM) {
 		/* invalid register set index */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 13f2c80bad4c..54197d18ab19 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -7218,7 +7218,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 #if defined(DV_BUILD)
 		// Assume a memory config setting of 3 in 420 mode or get a new ip parameter that reflects the programming.
 		if (mode_lib->ms.BytePerPixelC[k] != 0.0 && display_cfg->plane_descriptors[k].pixel_format != dml2_rgbe_alpha) {
-			lb_buffer_size_bits_luma = 34620 * 57;;
+			lb_buffer_size_bits_luma = 34620 * 57;
 			lb_buffer_size_bits_chroma = 13560 * 57;
 		}
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index c54c29711a65..8f3c1c0b1cc1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -6464,8 +6464,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 			p->SwathHeightC[k] = l->MaximumSwathHeightC[k] / 2;
 			l->RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
 			l->RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
-			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
-			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
+			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
+			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
 		}
 
 		if (p->SwathHeightC[k] == 0)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
index 7655501e75d4..9e8ff3a9718e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
@@ -421,7 +421,7 @@ unsigned int dml2_calc_max_scaled_time(
 
 void dml2_extract_writeback_wm(struct dc_state *context, struct display_mode_lib_st *dml_core_ctx)
 {
-	int i, j = 0;;
+	int i, j = 0;
 	struct mcif_arb_params *wb_arb_params = NULL;
 	struct dcn_bw_writeback *bw_writeback = NULL;
 	enum mmhubbub_wbif_mode wbif_mode = PACKED_444_FP16; /*for now*/
-- 
2.39.2

