Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C012E538
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F056E065;
	Thu,  2 Jan 2020 10:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0F189C93
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 20:48:13 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p14so21126471pfn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 12:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2SofJSOHMh3xU8jt0Vq5SjDaM8NbyGjoDZ2alxMEzaI=;
 b=TkDoA/GOpLilfkhY45zdpROfXwaqSswl3PEiMomaAj61KJ2mPl7mZP4eoYd0D8cMbV
 koWhIsX4GgD9sXow8D3YnpagmMS9S3Zggr2taw+a4O2OxeMviQfz92w1IbqTFFy9EE07
 Xd6LHQKPaDyGI8HHEIlc40SYq797WDKBfXQvtomfv8Zof7+6cTpfDNVexoPuhCYJkTU5
 N6yOxF99DsuKns+Xry28KLYRYsFK/Nu5vcbb5xzuwo/UWaij5skCatk8MqZ8dDP/Zhox
 C0EmJSNdXTEcicCBbKTUWajjMGx9QTZpHpGaJFAmh6JCz2z9mAZJVXD3GcuZf+auztZD
 Xa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2SofJSOHMh3xU8jt0Vq5SjDaM8NbyGjoDZ2alxMEzaI=;
 b=XH3Dc3c5Ec4Cgj3lErNp6OLguDChiSoRCukmBL6Mg1XSz73hUj25jezdJMub6zQ+Vo
 YW5SC0X2NcEdz1CjRDQ+RYRjNXWnDzUBhJ1Opty19Z62rs9eqV4297ITQCwJWxPIiLid
 EvpCwDK4qMUgeHJ7ItKUWIQ2xmzRipJnxudThqIpuNBMApdHc9iZCBZGU+9D6XgiMnqX
 npvjXSDwmjcxMPQQ2WIaVJvYUSs2BWMqsC+OKPWDoL4EC/sl9iu3ADUgfHlQE521Cz5a
 Vc6AN+x40YNO4tOwaWCBNDnhHspmUujyuxMJgpJD6q3hYEr4o5toOWzCXDspBh6Skl59
 UuNQ==
X-Gm-Message-State: APjAAAXSJDldgFb+V5JCvHmmWp2ncK39f9/D3OEJJRruPDnze4xQzbus
 s8ltGBAwKK+o6qS7PkKRl3EMNQ==
X-Google-Smtp-Source: APXvYqwJxFrNQkwzAgXpkMn+jkAYit5FqFL/OM2wFthBwFkvOSC8RerPz0lZCpFgIYnOSkfBWmsWGQ==
X-Received: by 2002:a63:2355:: with SMTP id u21mr84065943pgm.179.1577911692958; 
 Wed, 01 Jan 2020 12:48:12 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id z22sm53774752pfr.83.2020.01.01.12.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 12:48:12 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v3 2/2] drm/sun4i: Use CRTC size instead of PRIMARY plane size
 as mixer frame.
Date: Wed,  1 Jan 2020 22:47:50 +0200
Message-Id: <20200101204750.50541-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
References: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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

Fixes: 5bb5f5dafa1a ("drm/sun4i: Reorganize UI layer code in DE2")
Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
v2:
- Split commit in 2 parts
- Add Fixes line to the commit message

v3:
- Address review comments of v2 + removed 3 local varibles
- Change 'Fixes' line

Since I've put more changes from my side, please review/sign again.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 28 ++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 --------------------------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b803eb903b8..658cf442c121 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -257,6 +257,33 @@ const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
 	return NULL;
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
@@ -310,6 +337,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
+	.mode_set	= sun8i_mode_set,
 };
 
 static struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4343ea9f8cf8..f01ac55191f1 100644
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
