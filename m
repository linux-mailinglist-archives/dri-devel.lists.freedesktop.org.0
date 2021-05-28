Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954C394B8C
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174746E196;
	Sat, 29 May 2021 10:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD1C6F62A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 20:31:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a5so7141210lfm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8xVloNSwUArvoTMkBR5f76XblNpfoHgt5cDxTC0lU8=;
 b=qmiGFj0YDzYpAbQdR8x5Yzw+RgFdcINbUhgY4M21l4IJXs3PC9WFQmgtnicUC17QC3
 tvEQFiPhz/LgUV+zVIz0f9bOc1eLNAqHT9nqdkTw2BKI4riBH5yLSiVtYkgjXJWadpQM
 eZc5uIH934rlRmuMCTXpUqAmsYEaJqUW3h9grB9YcF9jr4ccC0kfzXMQj8dnmzIwQ7GQ
 LkhbfM51jjv6rf0ohZQfwv/wd5T8gQlbTXG7M+IjmN4+LR7i0MLmQphbH7MZ3h+sR/Wb
 Et4zhpi32ekhRkJE3WQ82gV+ZZFhsZrlePlKJwudDsCAKn6tNFacB878DtYadF+U/GZu
 /1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8xVloNSwUArvoTMkBR5f76XblNpfoHgt5cDxTC0lU8=;
 b=W70H6i8HvETn2IFQNTB0BCs0NqeJW0AVCwDNoCdz4gl0+8O7DEwTSXrUvItwd7aaNA
 rLJxl3LVdt68ywQ7TjjD447KnVZXXCze4SDQDX/1MWavEzCLjZX7p0DXbE/9pWY3sSEw
 yQPu8TWFWNmAa+zYNVROOaetYdQ2Z3D+8RazcTC7xDTmgDJxVSTC9ohDvl4ThXw3Ljwc
 cpkOl3GtMDZdY2cmvV4BzbUWFcB2WUEHW+O+jI0ZSDFKG3lOMsy4Xg27MkOn0VRTB2Dh
 w0e+zg+JpTH1z1Ni7xJf0IfOHc28/6gHO5Zx6uTHqanMTfa1D9qoKApzKuy65JDLCS6A
 sfQg==
X-Gm-Message-State: AOAM531HXwG4nYXwqHy3Cs5wugKa5LBFP4G2biSHcuOuTjPQOsY8dPQ+
 GmAC9lGEknvOXE9iINOUr5Q=
X-Google-Smtp-Source: ABdhPJxvftq8FIoOxl5fmCcw1FqBhlWR+H/WUS+YRoLHTZHCt928nPBZeARvGEfkoohxkBgbI7JSYA==
X-Received: by 2002:a05:6512:31c2:: with SMTP id
 j2mr6708560lfe.69.1622233864968; 
 Fri, 28 May 2021 13:31:04 -0700 (PDT)
Received: from roman-S500CA.. (72-28-179-94.pool.ukrtel.net. [94.179.28.72])
 by smtp.gmail.com with ESMTPSA id a12sm655820ljk.34.2021.05.28.13.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:31:04 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/sun4i: Use CRTC size instead of primary plane size
 as mixer frame
Date: Fri, 28 May 2021 23:30:36 +0300
Message-Id: <20210528203036.17999-3-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528203036.17999-1-r.stratiienko@gmail.com>
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes corrupted display picture when primary plane isn't full-screen.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 28 ++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 --------------------------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 5b42cf25cc86..810c731566c0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -248,6 +248,33 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
+static void sun8i_mode_set(struct sunxi_engine *engine,
+			   struct drm_display_mode *mode)
+{
+	u32 size = SUN8I_MIXER_SIZE(mode->crtc_hdisplay, mode->crtc_vdisplay);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 bld_base = sun8i_blender_base(mixer);
+	u32 val;
+
+	DRM_DEBUG_DRIVER("Mode change, updating global size W: %u H: %u\n",
+			 mode->crtc_hdisplay, mode->crtc_vdisplay);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
+	else
+		val = 0;
+
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
+			   val);
+	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
+			 val ? "on" : "off");
+}
+
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
@@ -301,6 +328,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
+	.mode_set	= sun8i_mode_set,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 0db164a774a1..d66fff582278 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -120,36 +120,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	insize = SUN8I_MIXER_SIZE(src_w, src_h);
 	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		bool interlaced = false;
-		u32 val;
-
-		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
-				 dst_w, dst_h);
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_GLOBAL_SIZE,
-			     outsize);
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
-
-		if (state->crtc)
-			interlaced = state->crtc->state->adjusted_mode.flags
-				& DRM_MODE_FLAG_INTERLACE;
-
-		if (interlaced)
-			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
-		else
-			val = 0;
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
-				   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
-				   val);
-
-		DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
-				 interlaced ? "on" : "off");
-	}
-
 	/* Set height and width */
 	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
 			 state->src.x1 >> 16, state->src.y1 >> 16);
-- 
2.30.2

