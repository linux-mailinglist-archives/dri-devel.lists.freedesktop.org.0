Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B3130207
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C1D6E418;
	Sat,  4 Jan 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AAE6E348
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 21:19:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i23so32702564lfo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 13:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=opKYnKPgrfgs6DL2jExuYki2MokOaTmbOuEyaIwELRw=;
 b=aYNfW9hmDHZtNaeHoqyCpMR9J53zbj/6VaqU8qE1fnAmxk9ZcUmlrHWFJk80Vnl5FR
 5nZD/XcJ95W2QmrkrzYB/FT5pPQHiSPqx1HQJLDomXNwTuY5m3lO2N4NWfdJQTIwRKjv
 f0saAQwGAJMk/1sEIFBe9osBAhyFLoXnvB0cFPIXHY2Htu/GWH6w5L1VXhdRTDv7qKAJ
 zJYKgGH16l8ftjV3S3hixleYtHoi4scbWlEEoaR8Yua1Ied3pLddJTa57bnAd7b3pjWR
 anEcG93NxLMjGnrPdYOFmV4iEFD084Xvaw95Fyxiqh+s+ErAFKwkYs1KEl7Rq5ro5dK7
 PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=opKYnKPgrfgs6DL2jExuYki2MokOaTmbOuEyaIwELRw=;
 b=q3dgbsR79MoxwyERmCrdBnwFdlmYhF+ZWsaFMjt+6tQg1BHnl7cFv8UBmpfN5oE8co
 nnQgu66c9x1SFYKnSQznrApGAZPoo/pb/H5nD4oBCyhmFt64dWvHD+c7sP6dVFDwnjbn
 nHPplQPWOphlFXYEV+8OVnlEQ4/jsOe8UYwtvO/UJE8OgjrBeh+b3dhY0+cwN3/HNfzx
 KMvDs9rh/T0CzJT8sUEnHb+9jL56DtuVyiHZsUbragOggIEwoWHdYVhdYvWgty+F0i/K
 sP2OFN6R9GkSnTgwilOIju8cmFA5z1cJlm8wWuEH28RSWDQ0pTUZ0k9nb02WCWCnoqTe
 rIng==
X-Gm-Message-State: APjAAAXg3aDYWYWvnNUQZOLb5s096wkOvJqrQMtAxCi0a6NrRKZHFa/L
 6h8OMUUh2g/N9LyyHnjH0fV25A==
X-Google-Smtp-Source: APXvYqxpCPH5IJYHJHFcUVveZAYcdzswXwFCrVzCLM6GERC5X7e3+Vbzg+lGUWc0YgZoCV3CLUePYQ==
X-Received: by 2002:ac2:4212:: with SMTP id y18mr50378966lfh.2.1578086354024; 
 Fri, 03 Jan 2020 13:19:14 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id e9sm18107683ljp.75.2020.01.03.13.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 13:19:13 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v3 2/2] drm/sun4i: Add alpha property for sun8i and sun50i VI
 layer
Date: Fri,  3 Jan 2020 23:19:01 +0200
Message-Id: <20200103211901.44201-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103211901.44201-1-roman.stratiienko@globallogic.com>
References: <20200103211901.44201-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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

DE3.0 VI layers supports plane-global alpha channel.
DE2.0 FCC block have GLOBAL_ALPHA register that can be used as alpha source
for blender.

Add alpha property to the DRM plane and connect it to the
corresponding registers in the mixer.

Do not add alpha property for systems with DE2.0 and more than 1 VI planes.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
v2: Initial version by mistake
v3:
- Skip adding & applying alpha property if VI count > 1
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 48 +++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 11 ++++++
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 42d445d23773..e61aec7d6d07 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -65,6 +65,36 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
+static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane)
+{
+	u32 mask, val, ch_base;
+
+	ch_base = sun8i_channel_base(mixer, channel);
+
+	if (mixer->cfg->is_de3) {
+		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
+		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
+		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
+			(plane->state->alpha >> 8);
+
+		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
+			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+
+		regmap_update_bits(mixer->engine.regs,
+				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
+								  overlay),
+				   mask, val);
+	} else if (mixer->cfg->vi_num == 1) {
+		regmap_update_bits(mixer->engine.regs,
+				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
+				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_MASK,
+				   SUN8I_MIXER_FCC_GLOBAL_ALPHA
+					(plane->state->alpha >> 8));
+	}
+}
+
 static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 				       int overlay, struct drm_plane *plane,
 				       unsigned int zpos)
@@ -248,14 +278,6 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
 
-	/* It seems that YUV formats use global alpha setting. */
-	if (mixer->cfg->is_de3)
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
-								  overlay),
-				   SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK,
-				   SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(0xff));
-
 	return 0;
 }
 
@@ -373,6 +395,8 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
+	sun8i_vi_layer_update_alpha(mixer, layer->channel,
+				    layer->overlay, plane);
 	sun8i_vi_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
@@ -464,6 +488,14 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
+	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
+		ret = drm_plane_create_alpha_property(&layer->plane);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add alpha property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index eaa6076f5dbc..48c399e1c86d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -29,14 +29,25 @@
 #define SUN8I_MIXER_CHAN_VI_VDS_UV(base) \
 		((base) + 0xfc)
 
+#define SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG \
+		(0xAA000 + 0x90)
+
+#define SUN8I_MIXER_FCC_GLOBAL_ALPHA(x)			((x) << 24)
+#define SUN8I_MIXER_FCC_GLOBAL_ALPHA_MASK		GENMASK(31, 24)
+
 #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN		BIT(0)
 /* RGB mode should be set for RGB formats and cleared for YCbCr */
 #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE		BIT(15)
 #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET	8
 #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK	GENMASK(12, 8)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK	GENMASK(2, 1)
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)	((x) << 24)
 
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL	((0) << 1)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER	((1) << 1)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
+
 #define SUN8I_MIXER_CHAN_VI_DS_N(x)			((x) << 16)
 #define SUN8I_MIXER_CHAN_VI_DS_M(x)			((x) << 0)
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
