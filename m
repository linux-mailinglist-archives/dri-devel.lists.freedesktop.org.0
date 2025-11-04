Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D24C328A4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B410E30E;
	Tue,  4 Nov 2025 18:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V5sBdSM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0B10E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4710022571cso54538495e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279814; x=1762884614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
 b=V5sBdSM6yN4hS+3+Tub97dM14AXZdf/TPR1a+Kq0LoSWKNDaYEa4BfdRBA8GiK5yEa
 6yQWnYstfEs8B846x+NPRxR/2qCsxHLyL/HZn+/VncblOsl0asayWUdqBLNae4JX3Yq3
 YIDEf07ghQnHU69SYJmBq3NFOw10IYAe6La9AryWsE/jsgy1Mh8uCbXW+JPtuWSiGdPR
 dDoqqH0wxGl6nWRw2FMO8UF8iVNQL36T8BJOnjOKqam0gFja40OuzhWFIOIPjaYYsIkP
 sD23etHvfk5aYB2OpdsMxDNURm0fARXOwUzQhOLldhD0AyvIXXH0oYtqdXzu+r6OFGqL
 JeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279814; x=1762884614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
 b=cjbjTjhp3S5Sp0QWzVZ4eddStmhlXt6wPlQoUWOhjJMMZAHPrAjA/+KLbrEe+w4VYt
 W+JanaEad9AvvWfY2yD7BIx5krJkFspDBaWcvV43dmZ3t/V4x8aBs2sTPsux/D8zhP1D
 VvCeNcVUkt/06LAIf/dQJLBq3OkXXOKRaZSXVBoj56bEdiOkxnxEKYjeKfO05McBBOq3
 4AFKKIh6DS4AJXo25fLM/FdXSB8qLvhUHTsTWi8uYJ4VNxbhsNuIU4hkjcvYzwFSC8LH
 wpTm0CpFAvan8y/nlZeYey88s5M/C+1OSZR2F+HmkihcEEZFo2Az2SYuGegeQtkIRKc8
 lI5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/QRejtmesprHCH0fddL+drGbXMjf/JCYmQL40k2tyLqc4n5D7ualky3mclH41ie/LXBdYP/TtWIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys/ZrgLuImP73ujExQCuEso4O2MPFng9bqhVRWVuSUoH4YoQTm
 4AEWSeMkVI28rRAVwbfLzRIdyUXiylylOCK4W+s+Jag/wshRzrYudW0j
X-Gm-Gg: ASbGncuYfAgjhSNNME1217ktERiRG75jcMwQ6oYi5QlFY0rn0pc1GG2mHs1Rr1cb5mq
 fx/itgORFxXIz8EVnaA3Om+mBwFQAoHOWFueXhkGpCtHCL2doA9VXQWkd/uOgacoFvfl/rQ99dW
 SXptI16eD/pbNBxGZedoYYclXLOcxmQhSOfJyDZZ2b4vLvE/rbWNkIDtWbe6CNQqLSbgJaOSMRw
 tmOfSXxblQU3Hy/6Jv3zvsjLPmzh/M3bcEkeptCMPSBmI1p4akaFDy5G5iLKIs/VGOOkwBne4zR
 a8nuq03que+Wo79s5iHp1cqE9HJZ2bndxXoKZsnzg8rxUnyRmhyciLCrJcvGcJT9kSn/i1/9ig4
 OTktkog8wPd5QuqXMwN9//TjnBTuQUav0Fatsde5WMFufl5J4DkgZXSiOKgn2bOw5ujBW6BZ1n0
 nE95icQFKdULx/pQklHw==
X-Google-Smtp-Source: AGHT+IGHcjr5LVZvJCkn6ps5FsbaEzRecmaWoSpniwlTk12WxNdiygIkQQYkFJg+89wFF5L7fhoGZA==
X-Received: by 2002:a05:600c:821b:b0:477:54cd:2029 with SMTP id
 5b1f17b1804b1-4775cdf4f48mr2528695e9.4.1762279814190; 
 Tue, 04 Nov 2025 10:10:14 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 10/30] drm/sun4i: mixer: Move layer enabling to
 atomic_update
Date: Tue,  4 Nov 2025 19:09:22 +0100
Message-ID: <20251104180942.61538-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
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

Enable or disable layer only in layer atomic update callback. Doing so
will enable having separate layer driver later for DE33.

There is no fear that enable bit would be set incorrectly, as all
read-modify-write sequences for that register are now eliminated.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- rewrited commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 24 ------------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a3194b71dc6d..1fca05a760b8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -250,24 +250,6 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
-static void sun8i_layer_enable(struct sun8i_layer *layer, bool enable)
-{
-	u32 ch_base = sun8i_channel_base(layer->mixer, layer->channel);
-	u32 val, reg, mask;
-
-	if (layer->type == SUN8I_LAYER_TYPE_UI) {
-		val = enable ? SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay);
-	} else {
-		val = enable ? SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay);
-	}
-
-	regmap_update_bits(layer->mixer->engine.regs, reg, mask, val);
-}
-
 static void sun8i_mixer_commit(struct sunxi_engine *engine,
 			       struct drm_crtc *crtc,
 			       struct drm_atomic_state *state)
@@ -304,12 +286,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 				 plane->base.id, layer->channel, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
-		/*
-		 * We always update the layer enable bit, because it can clear
-		 * spontaneously for unknown reasons.
-		 */
-		sun8i_layer_enable(layer, enable);
-
 		if (!enable)
 			continue;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8634d2ee613a..9d5d5e0b7e63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,6 +25,15 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -201,8 +210,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_ui_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dcc4429368d6..727117658c6c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,6 +18,15 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -320,8 +329,10 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_vi_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
-- 
2.51.2

