Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68ABD0B36
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A6D10E1CB;
	Sun, 12 Oct 2025 19:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQ8NRSBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF42F10E1B9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso558571766b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297055; x=1760901855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
 b=MQ8NRSBUxRwnPamIf2QmN8AGpVmkTaptqaLbjcHCqXVUBa43ULZ4up2gwqSk3mkm1R
 GpjIS2CaUd2qZppcq7ZOyKIgbtI4PiIK8Xday+fR7npmcpEe13ZE4y72LZLUc+Uhlgkp
 DgSI9vKBCVq7nbdNuU9eTS3T3Avp4JkAKP8iFEi4qqbMEqVZKQGvHR0mX9Bn+TZ+jBtf
 qseUhNDFFISQPajA/i1w2PLWgpfEzfR3AeF2ToAIOlxsCL4VCx+oQpZ8GcjdKPQgvWuD
 ZP8RuLjNy7yFhuBvOnpUJ2UG24PoCkCOlqAFbaOYNR4L5Q1YBm4X+IQqZMU1PU414DST
 Kfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297055; x=1760901855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
 b=vQP//bhIKbCpUBfM85RHs2Fc8yH/+mlpDYPBsnD0HEJXKuqpAUgOcfOm8jr+S+xbbM
 XgyxhKHo26/VRtEYcPP4bXuYwdiF91JW+sfdfiV2OyG+qwfTd1t2Ou7H271ZnPKQ3XEK
 8YdpFZm7NwEeOia9fySfW+ynuyHlIiRpU+5QTg4jAZC4MMnEWvpMnSbNvxSwRZ7CAHr7
 59kGnuaSTDG/pzLZkbRu608o/kkPZdwEcXhsNFqN6cs5MWqY2k4iQIXESEcJAmN6KdEN
 E2Hsa7ISBvEGFaQ6qNUSPAqsc17S/dmYU4vbrcMkZWu3E+2jL9j0Qpuzqrz2H+hn6JBL
 Upqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW777kqxZWlEUwkN/k4SHiIWTFZVxLodK1ruAoskGXSUyEtrMPurWuw3VMeG7YDSA9/HaKCyWGkmg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSCCNn1s0Zb6ji4hKZ0foAruz4/nPSZ2BZovtcRjwBRBqANmOz
 VRYFyiEHA4zsVzVlItVEA9zJNsaZyGsotBRyVkfO6nVGSRq2BJDn84uA
X-Gm-Gg: ASbGnctmBFPdTerHvqspLNscAxx0i7tRGmjQSepHEzx8HXxWcdq3mGHn7sCGebTa/Q/
 naHQf0BsJB6EKq/tIongUPN+sXFnY28luRLtmh4fakKzAiWC4JVcj9MBifsZWB7V3TOftCWB+u5
 4uF602M8Gxj3+6vsWRY0a1U4/xopg/nHhXxL7m4abNhtnFa8IiwGY/k3ORcLOORTHdZQTf5noK2
 Cz/6mG8anK/T8a5QPX8RoNvam5vsjck2mC4V45Q1pnBVurDSsjdVmZw34xoj44YhQBhubvRMMa0
 0zTZga5oS1dhbdHL4c+ZX6h4mcucRcFOTfSX03smfTbuQgQ2A+hVko+gUp6B2KcTlZZ49D40n+L
 h0htrkDzA1Tm03LgT7FA4Tlv48vFpi3kOU3Y8RrUQWEQ84f9r10IypuFf6moKDKdpX5FxNPFZi2
 r/0iMtwELKPX9M0TCJuH1P
X-Google-Smtp-Source: AGHT+IHJQrrQMxeS8oZx8uyeW6QR9xFsch3rBeFPh8aSvtGAg80UGkiRC2h+N6V1nwsHDzVkAOCO0g==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id
 a640c23a62f3a-b50ac4d3497mr2029519966b.59.1760297055250; 
 Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Sun, 12 Oct 2025 21:23:30 +0200
Message-ID: <20251012192330.6903-31-jernej.skrabec@gmail.com>
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

It's not used anymore, so remove it. This allows trully independent
layer state from mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 +++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 -
 6 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 10e40ec9a67a..5de68cbb6060 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -268,7 +268,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		int w, h, x, y, zpos;
 		bool enable;
 
-		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
+		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)))
 			continue;
 
 		plane_state = drm_atomic_get_new_plane_state(state, plane);
@@ -336,9 +336,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[i];
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, i,
-						phy_index, plane_cnt,
+		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
+						i, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -362,9 +361,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[index];
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, index,
-						phy_index, plane_cnt,
+		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
+						index, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 52d1b40ab71e..6b59c52ba4d5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -225,7 +225,6 @@ enum {
 
 struct sun8i_layer {
 	struct drm_plane		plane;
-	struct sun8i_mixer		*mixer;
 	int				type;
 	int				index;
 	int				channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dc4298590024..185e4ae8a11a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -258,7 +258,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -272,7 +271,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index c357b39999ff..1581ffc6d4e5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -50,7 +50,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4534998af825..40008c38003d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -409,7 +409,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -426,7 +425,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 6ec68baa2409..29cc5573691f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -55,7 +55,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-- 
2.51.0

