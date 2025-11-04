Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67483C328E3
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8008910E65C;
	Tue,  4 Nov 2025 18:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HRQidB2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD6610E664
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso4842845e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279840; x=1762884640; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
 b=HRQidB2FaVcpY/8meC79gRWrCag6l+f5v169hxBCq9Gi3zRAubd3wR9sjK9BuaszM1
 usDVlysxzSv2RQqpbM+p2ocjjDhtY2He9JktDW+pRXNgtr8I6LGz6nE/imuI3DfGd8pu
 /Ezf60OWQEpbNVtWVvXJ5fT0ylaLC5WzcF4R7JKuXs3dvwUQCoZi4lEHxk0WK8NP/HXy
 n2TLZSqkHVAKvbG2vHiSd2agXdVjOqJ1m1FvRoaQE8gJElaXbWXudIpaAUlik65sZ0Zf
 P/axPhV8NxL9snxr0hN+OmZbw8hpcMvX7JVUoe3svoiZSmJJ2CbQGM1cnJZrrjKXPWNm
 s6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279840; x=1762884640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
 b=qtxYVwn0Qpnb4SlA9O8yDkpVrA5CXU55MdgUjW7/9sTdcrE4B75T5XZ66DOD3toBtn
 GpYdbGt5YruE2vGaWSFIruLAe0WG3ftWMBf7IHyP53vfpJoxQNix8fVRtktkkkwy+hfr
 FUSdklZ14GcN5RKRcpI8JuG979S/xuTjOAmf9Ay1Vvjik4/wCS4lmZCUzRGHFCjAWB5k
 jEUbsccUm5FLMORnH/NPw//NStYkpF2xtsGEfhI2Xvi5pvRxXQk09XnHu/BCsaFecbzY
 2cGJuFsOyr17myww3FQqPXgMZD1ECO6EcYOl4hrFc7aL/4UWbTdvxJrHquhWO0EbAFa9
 S4dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF6nKGlgQSuQr2aB6ZEB74ANwl0IW5NhE1LlPqrBf7mK6ukWfDZq+CXaDOPUCdcGXMuMFN/oUYd2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfcQfcYIawEJHdZy5zqLfWaRSooJsmrjTUdeI2EXwUqbvlNLy8
 KwshZ7h6r2MHCsrYa71slow/pk5H4bP4PKRxWdaR2XFtVO7UfMZOO2cv
X-Gm-Gg: ASbGncuIjzGGy3GX2Qj+ceW+kG2bP5HyIfTUqXBABa2CfS88DnzjCCFmihn1px3vyA2
 kcMZDuOC1VAWLyjuKeuv8ardShh15FSAUfzfFTVqPI7doplerszbRbg5JJYT3FbAFLzyhDiKlh+
 /4VfF5vSLfRaM9pR6aoTrK/2SajyVqKqJZuDx6V8NN0nF9O1vNUPBfERNpKnPcK94a2h4nj37PL
 1kuHsBLMQ6kA+YZNpX+4P3BlGzP5uk2da8ydZThqWZhBBphbl8wCyU6QaJTDt9n4bj2hqU/HK03
 rHqButMzsxi0IP/IQ7RUJ6/TQc7hPZe6CidYn710uUJuQV/i4q24NomXniMDsrA3i7vaYJBoREA
 B08TdldAdJFD598OHNIkV9xBLfJsfDFy7VQbMfq33R4gzlfALtZCy7G93CTJy/Ii1pp2tdMd83D
 61WOQMsQS8QAQQ4mamag==
X-Google-Smtp-Source: AGHT+IGiymh/TsRqhwN6N3A97NvG3Bqul+I8b68ZoyUR344zIADNYxpVaPkfS3GzPbVwVEx24Kp+Fg==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-4775ce1874bmr2424725e9.29.1762279839699; 
 Tue, 04 Nov 2025 10:10:39 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Tue,  4 Nov 2025 19:09:42 +0100
Message-ID: <20251104180942.61538-31-jernej.skrabec@gmail.com>
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

It's not used anymore, so remove it. This allows trully independent
layer state from mixer.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
index 50fc20100c90..fde3b677e925 100644
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
index 3948023e095b..e2f83301aae8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -226,7 +226,6 @@ enum {
 
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
2.51.2

