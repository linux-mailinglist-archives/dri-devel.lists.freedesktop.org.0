Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2245712C2CB
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC8989DD3;
	Sun, 29 Dec 2019 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F58F89944
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 20:28:42 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c23so13106426plz.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 12:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Yk+zLVsSDRHOg6D2iiMvRkTjejM32fOXnmZsURk2P4=;
 b=G5vXA9W8+N+c30YAoRsRVjmw7eyC3MnRCXaPm2xC2VrA9nuAWTaRKeP668iDDXlsQp
 9mCYnODGdPsm+TyobDSKsg463csJ1Ml3lvs+znsULMBUqvBMAeuF/9icWD4NxofqwLVs
 vt/NJ6KS3OHxgddv7DS1NbtcAqsu7U9JNxtPzSds+BzPXlCAq63f86WvfEUJ+316Ru5o
 IMcsmF4QkxidZhDJFqXfHPvYHKW79LAPDkON7RFFeyQOo5K3RqxLR5Qf8PCkYDwhxpDX
 L9bJQPjRKuo4eQJ+VQAW/LyP3ueIowuIt3sDR1mRIVQ5EdSrIknI5zioZC1TmqDTELYI
 u3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Yk+zLVsSDRHOg6D2iiMvRkTjejM32fOXnmZsURk2P4=;
 b=Rdhm/rHbLijb8nfsqI9//P9jGI7M906A5An9bUigOvIUdKHi1xZC6rlMM7ofWhVkEY
 cuNF2Nc4Y5duhNV/m8KrpaI2fAJ9l6by+6kHp6g4gR4gAy6XA+0X/DvheXwCk1eZpca2
 2w6aaUCHBtZowsICmWoy6BJhzRLHJX7SlJ91E0QAcn1ynS8OqFSq2IzLlT/Q/UBlaeC5
 3NAg89dYroX59X4jyjASQ68asNNLqnU6OV9URTVmFtoZ77MIZa5zP03tTaE8uIULRIvl
 NFg5uuwjbRo0HSoB4onukKdMwmiN4J0n25APie5vFsW/Yn4bTnn3Te0dhxXlylwkPzmJ
 X9AA==
X-Gm-Message-State: APjAAAVnLNzBtPX0zCWDRVmVmzDbAS2FFxlg6kTllhoBpsB9nI66AKXd
 WaxKSNpZr32VXXWGDSDDveS/4w==
X-Google-Smtp-Source: APXvYqyruVeTsvVTDvongSk9hM3D2C2stILqnJN+fK1KyPNtx6Eg5fFFl8JDoutL2C1UUwygnykJIg==
X-Received: by 2002:a17:90a:25cb:: with SMTP id
 k69mr35247333pje.121.1577564921974; 
 Sat, 28 Dec 2019 12:28:41 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id i68sm46771169pfe.173.2019.12.28.12.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 12:28:41 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [RFC 2/4] drm/sun4i: Use CRTC size instead of PRIMARY plane size as
 mixer frame.
Date: Sat, 28 Dec 2019 22:28:16 +0200
Message-Id: <20191228202818.69908-3-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
References: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

According to DRM documentation the only difference between PRIMARY
and OVERLAY plane is that each CRTC must have PRIMARY plane and
OVERLAY are optional.

Allow PRIMARY plane to have dimension different from full-screen.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c     |  4 +++
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 35 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 ----------------------
 drivers/gpu/drm/sun4i/sunxi_engine.h   |  8 ++++++
 4 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index 3a153648b369..156ea8f19d7d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -139,8 +139,12 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_encoder *encoder = sun4i_crtc_get_encoder(crtc);
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
+	struct sunxi_engine *engine = scrtc->engine;
 
 	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
+
+	if (engine->ops->mode_set)
+		engine->ops->mode_set(engine, mode);
 }
 
 static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index eea4813602b7..bb9a665fd053 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -257,6 +257,40 @@ const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
 	return NULL;
 }
 
+static void sun8i_mode_set(struct sunxi_engine *engine,
+			   struct drm_display_mode *mode)
+{
+	u32 dst_w = mode->crtc_hdisplay;
+	u32 dst_h = mode->crtc_vdisplay;
+	u32 outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
+	bool interlaced = false;
+	u32 val;
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 bld_base = sun8i_blender_base(mixer);
+
+	DRM_DEBUG_DRIVER("Mode change, updating global size W: %u H: %u\n",
+			 dst_w, dst_h);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_GLOBAL_SIZE,
+		     outsize);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
+
+	interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+
+	if (interlaced)
+		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
+	else
+		val = 0;
+
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
+			   val);
+	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
+			 interlaced ? "on" : "off");
+}
+
 static void sun8i_atomic_begin(struct sunxi_engine *engine,
 			       struct drm_crtc_state *old_state)
 {
@@ -325,6 +359,7 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
 	.atomic_begin	= sun8i_atomic_begin,
+	.mode_set	= sun8i_mode_set,
 };
 
 static struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index c87fd842918e..893076716070 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -99,36 +99,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index 548710a936d5..9783c112d512 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -108,6 +108,14 @@ struct sunxi_engine_ops {
 	 * This function is optional.
 	 */
 	void (*vblank_quirk)(struct sunxi_engine *engine);
+
+	/**
+	 * @mode_set:
+	 *
+	 * This function is optional.
+	 */
+	void (*mode_set)(struct sunxi_engine *engine,
+			 struct drm_display_mode *mode);
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
