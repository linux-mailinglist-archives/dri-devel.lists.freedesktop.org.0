Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA6BD0B21
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E0F10E1BA;
	Sun, 12 Oct 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B3NG44oO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BB810E1B9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-62ecd3c21d3so5669071a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297037; x=1760901837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
 b=B3NG44oOPmotB1Iqdi+/mhxzg7h/MUHRs1b/wwdMVKxcjNXjXWKW0D/w4ICvGK3k8V
 ewUZicISjYBMC2pwailqSlJ0xwBaqpJiCiKPM74hMDvuKqw215r7pctH/Xf9Xxk+rAb6
 Ea+XyjfqKpouCqi/G6xB2IuIlsZ6i5J3n+MCgZf76DNF8APAB6PatBy4RqTQbKTJx5A1
 MEIKTvjmJPsZBwrFK1iG2JNsRP3OFfn9uKcjFnssRdrWYNcAtPymz5sGsCpd+EGaKP0p
 yUbT/xg5eVt6yeiA4iztj3bDWknV6IBCpuu1T/8azW7VkVwRYpe82LOH56RmNY1RwFF1
 iy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297037; x=1760901837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
 b=IkjuPxN64eXl4umzKxlmxWdJ0X+3uHUmm+dQiXsiOz4GYCkkU7Po3ChoXoQlHeismV
 TwnCeTEWSOzl2FnmuGX4Wdw4ZjP+jWHWrsS7kLM/c0EyWBXVJjjj83uZgUPbF2DNqqEu
 q4b9N7b+LOqW3jl07MFG9NUajcDN6hez82nH1uXImPN/IH/+dNytqVND5yL5ImOZaxBr
 FSVQOJBEe+hekF3CpW22tj/2hoN0THfBf6bg96+v72qwT3S9dyW9yv72jX2eSWwNmSuC
 y0Bl1Rs0Wiw1FB1XRwj46TMEbQp9r5or7+UwdoGC35a/xTZsHJ6WOv7gZLcohrMSKzYn
 oKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDFWqqpKmjzGUy8sCYr6TxhhxTTvFr+vVZmY9phRAPtpbDlDuLOQLSnAD5wEFSPP6OYBds2lhZLsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNwGePR4v3uZYT8rDp7rcdM5/ShSyLx6us+jfCBUlNwrJ4/gLZ
 TITGxGvvLPJrJ0pI4HFgeWZ+01WVOYJvEbNy9G9K64+xyQPK2Tp1sKny
X-Gm-Gg: ASbGncvKPYi2IN84w8DJwrGM2rsBCeLcE2ayXEt/YN6iz0X65v11qLpuIEgcLWiHt+q
 5WRuKQ1U7N9rB8MAEslcLokCHCHBYCLVRy1D6xG4JGwcXKssXVHO1Exu5JB5k1BkP6mWlGfHCSd
 vsdI2CmVc8T/LpQfJG399Zs8yaQKyXdk1lGCKWvdV/wtIXG+Gs0U4w+PU/MJvHwBBXrQSBw/VYX
 AD9uJZgW2HNoQWE+kDLLo1wv76Cvbec/eixRLISYwpxqp1eMzkpUKYltX6X6vTv/Mlva7U8sSpo
 LHEfC4ZMRQ61mUsi3gR0nhl0Ozcoo6g8Z0m2/CqYjqyMOro/eYTwgHEms8zNAmaPD9VW9Ri4TQh
 Nr+vY2e46dNJM5WeK/Z7bVAJl89Zlyr1FSWIFGB1v9y36REFJZtDkD7Cb24/+E4MT7IwZ8Rb/vA
 xvtYXQAd9UfBsXl2AYNYpb
X-Google-Smtp-Source: AGHT+IG0I+CtyMQ9AS5dyUihgRwKpeygER1fugmzO1P668vrEqp3088Kprh13QnASf90ghU3NNQmHg==
X-Received: by 2002:a17:907:2d07:b0:b04:708e:7348 with SMTP id
 a640c23a62f3a-b50ac2cf4cfmr2032278666b.30.1760297037018; 
 Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:56 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Sun, 12 Oct 2025 21:23:14 +0200
Message-ID: <20251012192330.6903-15-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

In the pursuit of making UI/VI layer code independent of DE version,
change meaning of UI index to index of the plane within mixer. DE33 can
split amount of VI and UI planes between multiple mixer in whatever way
it deems acceptable, so simple calculation VI num + UI index won't be
meaningful anymore.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index e7a66d9b622a..17c0ab5860b5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -343,6 +343,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	}
 
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
+		unsigned int index = mixer->cfg->vi_num + i;
 		struct sun8i_layer *layer;
 
 		if (i == 0)
@@ -350,14 +351,14 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
 		}
 
-		planes[mixer->cfg->vi_num + i] = &layer->plane;
+		planes[index] = &layer->plane;
 	}
 
 	return planes;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8d74eddaa294..4f6c8b0acba6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -270,7 +270,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    int index)
 {
-	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
 	int ret;
@@ -281,7 +280,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
+	layer->channel = index;
 	layer->overlay = 0;
 
 	/* possible crtcs are set later */
@@ -303,7 +302,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_plane_create_zpos_property(&layer->plane, channel,
+	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add zpos property\n");
-- 
2.51.0

