Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144811AC99C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238476E301;
	Thu, 16 Apr 2020 15:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B71C6E2FF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y24so5333366wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bR9DiK3aOVvTCz5I8F8jU+7ZtH4qDqB1SoqUxvBNo3Y=;
 b=wycNX20Y/kotaGzxeauNNZ+jmVU4RqjStASYkyQhnG2y0UvXPCvaOzMkJ4dsXjJ2nt
 HmG1YMlucxFZqmEM6kPQSDfa5CKkabdoB67JDd5b+cRnGlCU+3biUrQrtZ+nxgf9HQzJ
 fWYgMIW77IKaoBISpdxOLZykarX9B+DizDoY3QQ9kYNSJx7jBLxZSKXBJ8e9oQgvErHC
 xPMBxZzpsf1oXZDzYpK9O9Ts55ERn2FBN2/aZbRAdtDHetwwIp3Z8kwHCgqG/P0ddSKy
 cU3xS57mXo5H2qscx1ROEMYzX8txLApUbbxa7Iu8foYnD0+snp0YaFPxTDSj/D7T2LS9
 O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bR9DiK3aOVvTCz5I8F8jU+7ZtH4qDqB1SoqUxvBNo3Y=;
 b=qjDfNq8zGoX8Fw9nQKCgTnL36jAkTA0GkLam4wV6dECo+pRgEbRG9WaWO7AS2y6UDy
 iiABBFUe9Ex+F3z/MEHgcA/AWNKELnQi1bsCBimB+i6J/d+VC75VHuKKgkDV22EFge+6
 i0R9wTWLL/hGey45WEOFa5klJwwvoVkte2tmBFOsssfnLFBwZD+dSObnaP0fa2ZyvoXv
 O5U2chkc/ypOBRyXTKw+TF2dp7crjUYyrX4+RGr80x93R5njpi8LYrTHAlJ4Js1JoMEw
 J/BH9vc1kx35RaTPp3Je1oPOas+778ZCpK8uUFA3e8WnyBtUKcf8Ky7uyCpFT2slmBPO
 CPlw==
X-Gm-Message-State: AGi0PubXmjca81KwU6A/8ulW+QgkwkTS1jgOGoBG5p/XK1vdTzqD8tVV
 h2bWMeSSo21kPqlNAqmN0lUviA==
X-Google-Smtp-Source: APiQypJvenUvw7p4+/VYWj+GE96AXgoiSCX0ESQn3/vvWiTeTDfOQSsUALsB6HzTGuIKfGRlSJS0Hw==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr5737386wmj.161.1587050711235; 
 Thu, 16 Apr 2020 08:25:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/8] drm/meson: overlay: setup overlay for Amlogic FBC
Date: Thu, 16 Apr 2020 17:24:55 +0200
Message-Id: <20200416152500.29429-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane.

The VD1 Amlogic FBC decoder is integrated in the pipeline like the
YUV pixel reading/formatter but used a direct memory address instead.

This adds support for the basic layout, and needs to calculate the content
body size since the header is allocated after.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.h     |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c | 252 +++++++++++++++++++++++++-
 2 files changed, 260 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 04fdf3826643..da951964e988 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -80,6 +80,7 @@ struct meson_drm {
 
 		bool vd1_enabled;
 		bool vd1_commit;
+		bool vd1_afbc;
 		unsigned int vd1_planes;
 		uint32_t vd1_if0_gen_reg;
 		uint32_t vd1_if0_luma_x0;
@@ -105,6 +106,21 @@ struct meson_drm {
 		uint32_t vd1_height0;
 		uint32_t vd1_height1;
 		uint32_t vd1_height2;
+		uint32_t vd1_afbc_mode;
+		uint32_t vd1_afbc_en;
+		uint32_t vd1_afbc_head_addr;
+		uint32_t vd1_afbc_body_addr;
+		uint32_t vd1_afbc_conv_ctrl;
+		uint32_t vd1_afbc_dec_def_color;
+		uint32_t vd1_afbc_vd_cfmt_ctrl;
+		uint32_t vd1_afbc_vd_cfmt_w;
+		uint32_t vd1_afbc_vd_cfmt_h;
+		uint32_t vd1_afbc_mif_hor_scope;
+		uint32_t vd1_afbc_mif_ver_scope;
+		uint32_t vd1_afbc_size_out;
+		uint32_t vd1_afbc_pixel_hor_scope;
+		uint32_t vd1_afbc_pixel_ver_scope;
+		uint32_t vd1_afbc_size_in;
 		uint32_t vpp_pic_in_height;
 		uint32_t vpp_postblend_vd1_h_start_end;
 		uint32_t vpp_postblend_vd1_v_start_end;
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 2468b0212d52..3127bd1a5d70 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
  */
 
+#define DEBUG
 #include <linux/bitfield.h>
 
 #include <drm/drm_atomic.h>
@@ -76,6 +77,84 @@
 #define VD_REGION24_START(value)	FIELD_PREP(GENMASK(11, 0), value)
 #define VD_REGION13_END(value)		FIELD_PREP(GENMASK(27, 16), value)
 
+/* AFBC_ENABLE */
+#define AFBC_DEC_ENABLE			BIT(8)
+#define AFBC_FRM_START			BIT(0)
+
+/* AFBC_MODE */
+#define AFBC_HORZ_SKIP_UV(value)	FIELD_PREP(GENMASK(1, 0), value)
+#define AFBC_VERT_SKIP_UV(value)	FIELD_PREP(GENMASK(3, 2), value)
+#define AFBC_HORZ_SKIP_Y(value)		FIELD_PREP(GENMASK(5, 4), value)
+#define AFBC_VERT_SKIP_Y(value)		FIELD_PREP(GENMASK(7, 6), value)
+#define AFBC_COMPBITS_YUV(value)	FIELD_PREP(GENMASK(13, 8), value)
+#define AFBC_COMPBITS_8BIT		0
+#define AFBC_COMPBITS_10BIT		(2 | (2 << 2) | (2 << 4))
+#define AFBC_BURST_LEN(value)		FIELD_PREP(GENMASK(15, 14), value)
+#define AFBC_HOLD_LINE_NUM(value)	FIELD_PREP(GENMASK(22, 16), value)
+#define AFBC_MIF_URGENT(value)		FIELD_PREP(GENMASK(25, 24), value)
+#define AFBC_REV_MODE(value)		FIELD_PREP(GENMASK(27, 26), value)
+#define AFBC_BLK_MEM_MODE		BIT(28)
+#define AFBC_SCATTER_MODE		BIT(29)
+#define AFBC_SOFT_RESET			BIT(31)
+
+/* AFBC_SIZE_IN */
+#define AFBC_HSIZE_IN(value)		FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_VSIZE_IN(value)		FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_DEC_DEF_COLOR */
+#define AFBC_DEF_COLOR_Y(value)		FIELD_PREP(GENMASK(29, 20), value)
+#define AFBC_DEF_COLOR_U(value)		FIELD_PREP(GENMASK(19, 10), value)
+#define AFBC_DEF_COLOR_V(value)		FIELD_PREP(GENMASK(9, 0), value)
+
+/* AFBC_CONV_CTRL */
+#define AFBC_CONV_LBUF_LEN(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_LBUF_DEPTH */
+#define AFBC_DEC_LBUF_DEPTH(value)	FIELD_PREP(GENMASK(27, 16), value)
+#define AFBC_MIF_LBUF_DEPTH(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_OUT_XSCOPE/AFBC_SIZE_OUT */
+#define AFBC_HSIZE_OUT(value)		FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_VSIZE_OUT(value)		FIELD_PREP(GENMASK(12, 0), value)
+#define AFBC_OUT_HORZ_BGN(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_OUT_HORZ_END(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_OUT_YSCOPE */
+#define AFBC_OUT_VERT_BGN(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_OUT_VERT_END(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_VD_CFMT_CTRL */
+#define AFBC_HORZ_RPT_PIXEL0		BIT(23)
+#define AFBC_HORZ_Y_C_RATIO(value)	FIELD_PREP(GENMASK(22, 21), value)
+#define AFBC_HORZ_FMT_EN		BIT(20)
+#define AFBC_VERT_RPT_LINE0		BIT(16)
+#define AFBC_VERT_INITIAL_PHASE(value)	FIELD_PREP(GENMASK(11, 8), value)
+#define AFBC_VERT_PHASE_STEP(value)	FIELD_PREP(GENMASK(7, 1), value)
+#define AFBC_VERT_FMT_EN		BIT(0)
+
+/* AFBC_VD_CFMT_W */
+#define AFBC_VD_V_WIDTH(value)		FIELD_PREP(GENMASK(11, 0), value)
+#define AFBC_VD_H_WIDTH(value)		FIELD_PREP(GENMASK(27, 16), value)
+
+/* AFBC_MIF_HOR_SCOPE */
+#define AFBC_MIF_BLK_BGN_H(value)	FIELD_PREP(GENMASK(25, 16), value)
+#define AFBC_MIF_BLK_END_H(value)	FIELD_PREP(GENMASK(9, 0), value)
+
+/* AFBC_MIF_VER_SCOPE */
+#define AFBC_MIF_BLK_BGN_V(value)	FIELD_PREP(GENMASK(27, 16), value)
+#define AFBC_MIF_BLK_END_V(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_PIXEL_HOR_SCOPE */
+#define AFBC_DEC_PIXEL_BGN_H(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_DEC_PIXEL_END_H(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_PIXEL_VER_SCOPE */
+#define AFBC_DEC_PIXEL_BGN_V(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_DEC_PIXEL_END_V(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_VD_CFMT_H */
+#define AFBC_VD_HEIGHT(value)		FIELD_PREP(GENMASK(12, 0), value)
+
 struct meson_overlay {
 	struct drm_plane base;
 	struct meson_drm *priv;
@@ -157,6 +236,9 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	unsigned int ratio_x, ratio_y;
 	int temp_height, temp_width;
 	unsigned int w_in, h_in;
+	int afbc_left, afbc_right;
+	int afbc_top_src, afbc_bottom_src;
+	int afbc_top, afbc_bottom;
 	int temp, start, end;
 
 	if (!crtc_state) {
@@ -169,7 +251,7 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 
 	w_in = fixed16_to_int(state->src_w);
 	h_in = fixed16_to_int(state->src_h);
-	crop_top = fixed16_to_int(state->src_x);
+	crop_top = fixed16_to_int(state->src_y);
 	crop_left = fixed16_to_int(state->src_x);
 
 	video_top = state->crtc_y;
@@ -243,6 +325,14 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	DRM_DEBUG("vsc startp %d endp %d start_lines %d end_lines %d\n",
 		 vsc_startp, vsc_endp, vd_start_lines, vd_end_lines);
 
+	afbc_top = round_down(vd_start_lines, 4);
+	afbc_bottom = round_up(vd_end_lines + 1, 4);
+	afbc_top_src = 0;
+	afbc_bottom_src = round_up(h_in + 1, 4);
+
+	DRM_DEBUG("afbc top %d (src %d) bottom %d (src %d)\n",
+		  afbc_top, afbc_top_src, afbc_bottom, afbc_bottom_src);
+
 	/* Horizontal */
 
 	start = video_left + video_width / 2 - ((w_in << 17) / ratio_x);
@@ -278,6 +368,16 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	DRM_DEBUG("hsc startp %d endp %d start_lines %d end_lines %d\n",
 		 hsc_startp, hsc_endp, hd_start_lines, hd_end_lines);
 
+	if (hd_start_lines > 0 || (hd_end_lines < w_in)) {
+		afbc_left = 0;
+		afbc_right = round_up(w_in, 32);
+	} else {
+		afbc_left = round_down(hd_start_lines, 32);
+		afbc_right = round_up(hd_end_lines + 1, 32);
+	}
+
+	DRM_DEBUG("afbc left %d right %d\n", afbc_left, afbc_right);
+
 	priv->viu.vpp_vsc_start_phase_step = ratio_y << 6;
 
 	priv->viu.vpp_vsc_ini_phase = vphase << 8;
@@ -293,6 +393,35 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 			VD_H_WIDTH(hd_end_lines - hd_start_lines + 1) |
 			VD_V_WIDTH(hd_end_lines/2 - hd_start_lines/2 + 1);
 
+	priv->viu.vd1_afbc_vd_cfmt_w =
+			AFBC_VD_H_WIDTH(afbc_right - afbc_left) |
+			AFBC_VD_V_WIDTH(afbc_right / 2 - afbc_left / 2);
+
+	priv->viu.vd1_afbc_vd_cfmt_h =
+			AFBC_VD_HEIGHT((afbc_bottom - afbc_top) / 2);
+
+	priv->viu.vd1_afbc_mif_hor_scope = AFBC_MIF_BLK_BGN_H(afbc_left / 32) |
+				AFBC_MIF_BLK_END_H((afbc_right / 32) - 1);
+
+	priv->viu.vd1_afbc_mif_ver_scope = AFBC_MIF_BLK_BGN_V(afbc_top / 4) |
+				AFBC_MIF_BLK_END_H((afbc_bottom / 4) - 1);
+
+	priv->viu.vd1_afbc_size_out =
+			AFBC_HSIZE_OUT(afbc_right - afbc_left) |
+			AFBC_VSIZE_OUT(afbc_bottom - afbc_top);
+
+	priv->viu.vd1_afbc_pixel_hor_scope =
+			AFBC_DEC_PIXEL_BGN_H(hd_start_lines - afbc_left) |
+			AFBC_DEC_PIXEL_END_H(hd_end_lines - afbc_left);
+
+	priv->viu.vd1_afbc_pixel_ver_scope =
+			AFBC_DEC_PIXEL_BGN_V(vd_start_lines - afbc_top) |
+			AFBC_DEC_PIXEL_END_V(vd_end_lines - afbc_top);
+
+	priv->viu.vd1_afbc_size_in =
+				AFBC_HSIZE_IN(afbc_right - afbc_left) |
+				AFBC_VSIZE_IN(afbc_bottom_src - afbc_top_src);
+
 	priv->viu.vd1_if0_luma_y0 = VD_Y_START(vd_start_lines) |
 				    VD_Y_END(vd_end_lines);
 
@@ -350,11 +479,57 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	spin_lock_irqsave(&priv->drm->event_lock, flags);
 
-	priv->viu.vd1_if0_gen_reg = VD_URGENT_CHROMA |
-				    VD_URGENT_LUMA |
-				    VD_HOLD_LINES(9) |
-				    VD_CHRO_RPT_LASTL_CTRL |
-				    VD_ENABLE;
+	if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0)) ==
+			    DRM_FORMAT_MOD_AMLOGIC_FBC(0)) {
+		priv->viu.vd1_afbc = true;
+
+		priv->viu.vd1_afbc_mode = AFBC_MIF_URGENT(3) |
+					  AFBC_HOLD_LINE_NUM(8) |
+					  AFBC_BURST_LEN(2);
+
+		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
+
+		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
+
+		priv->viu.vd1_afbc_dec_def_color = AFBC_DEF_COLOR_Y(1023);
+
+		/* 420: horizontal / 2, vertical / 4 */
+		priv->viu.vd1_afbc_vd_cfmt_ctrl = AFBC_HORZ_RPT_PIXEL0 |
+						  AFBC_HORZ_Y_C_RATIO(1) |
+						  AFBC_HORZ_FMT_EN |
+						  AFBC_VERT_RPT_LINE0 |
+						  AFBC_VERT_INITIAL_PHASE(12) |
+						  AFBC_VERT_PHASE_STEP(8) |
+						  AFBC_VERT_FMT_EN;
+
+		switch (fb->format->format) {
+		/* AFBC Only formats */
+		case DRM_FORMAT_YUV420_10BIT:
+			priv->viu.vd1_afbc_mode |=
+				AFBC_COMPBITS_YUV(AFBC_COMPBITS_10BIT);
+			priv->viu.vd1_afbc_dec_def_color |=
+					AFBC_DEF_COLOR_U(512) |
+					AFBC_DEF_COLOR_V(512);
+			break;
+		case DRM_FORMAT_YUV420_8BIT:
+			priv->viu.vd1_afbc_dec_def_color |=
+					AFBC_DEF_COLOR_U(128) |
+					AFBC_DEF_COLOR_V(128);
+			break;
+		}
+
+		priv->viu.vd1_if0_gen_reg = 0;
+		priv->viu.vd1_if0_canvas0 = 0;
+		priv->viu.viu_vd1_fmt_ctrl = 0;
+	} else {
+		priv->viu.vd1_afbc = false;
+
+		priv->viu.vd1_if0_gen_reg = VD_URGENT_CHROMA |
+					    VD_URGENT_LUMA |
+					    VD_HOLD_LINES(9) |
+					    VD_CHRO_RPT_LASTL_CTRL |
+					    VD_ENABLE;
+	}
 
 	/* Setup scaler params */
 	meson_overlay_setup_scaler_params(priv, plane, interlace_mode);
@@ -370,6 +545,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	priv->viu.vd1_if0_gen_reg2 = 0;
 	priv->viu.viu_vd1_fmt_ctrl = 0;
 
+	/* None will match for AFBC Only formats */
 	switch (fb->format->format) {
 	/* TOFIX DRM_FORMAT_RGB888 should be supported */
 	case DRM_FORMAT_YUYV:
@@ -488,13 +664,28 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
 			drm_format_info_plane_height(fb->format,
-						fb->height, 0);
+						     fb->height, 0);
 		DRM_DEBUG("plane 0 addr 0x%x stride %d height %d\n",
 			 priv->viu.vd1_addr0,
 			 priv->viu.vd1_stride0,
 			 priv->viu.vd1_height0);
 	}
 
+	if (priv->viu.vd1_afbc) {
+		unsigned long body_size;
+
+		/* Default mode is 4k per superblock */
+		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
+			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
+			    4096;
+
+		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
+
+		/* Header is after body content */
+		priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
+						body_size) >> 4;
+	}
+
 	priv->viu.vd1_enabled = true;
 
 	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
@@ -531,6 +722,42 @@ static const struct drm_plane_helper_funcs meson_overlay_helper_funcs = {
 	.prepare_fb	= drm_gem_fb_prepare_fb,
 };
 
+static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
+					       u32 format, u64 modifier)
+{
+	if (modifier == DRM_FORMAT_MOD_LINEAR &&
+	    format != DRM_FORMAT_YUV420_8BIT &&
+	    format != DRM_FORMAT_YUV420_10BIT)
+		return true;
+
+	if ((modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0)) ==
+			DRM_FORMAT_MOD_AMLOGIC_FBC(0)) {
+		unsigned int layout = modifier &
+			DRM_FORMAT_MOD_AMLOGIC_FBC(
+				DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK);
+
+		if (format != DRM_FORMAT_YUV420_8BIT &&
+		    format != DRM_FORMAT_YUV420_10BIT) {
+			DRM_DEBUG_KMS("%llx invalid format 0x%08x\n",
+				      modifier, format);
+			return false;
+		}
+
+		if (layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
+		return true;
+	}
+
+	DRM_DEBUG_KMS("invalid modifier %llx for format 0x%08x\n",
+		      modifier, format);
+
+	return false;
+}
+
 static const struct drm_plane_funcs meson_overlay_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
@@ -538,6 +765,7 @@ static const struct drm_plane_funcs meson_overlay_funcs = {
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported   = meson_overlay_format_mod_supported,
 };
 
 static const uint32_t supported_drm_formats[] = {
@@ -549,6 +777,14 @@ static const uint32_t supported_drm_formats[] = {
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV411,
 	DRM_FORMAT_YUV410,
+	DRM_FORMAT_YUV420_8BIT, /* Amlogic FBC Only */
+	DRM_FORMAT_YUV420_10BIT, /* Amlogic FBC Only */
+};
+
+static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
 };
 
 int meson_overlay_create(struct meson_drm *priv)
@@ -570,7 +806,7 @@ int meson_overlay_create(struct meson_drm *priv)
 				 &meson_overlay_funcs,
 				 supported_drm_formats,
 				 ARRAY_SIZE(supported_drm_formats),
-				 NULL,
+				 format_modifiers,
 				 DRM_PLANE_TYPE_OVERLAY, "meson_overlay_plane");
 
 	drm_plane_helper_add(plane, &meson_overlay_helper_funcs);
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
