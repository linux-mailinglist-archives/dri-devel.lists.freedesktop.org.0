Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C817AC328A6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0076910E656;
	Tue,  4 Nov 2025 18:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PE6f0U7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8010E655
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so47878885e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279820; x=1762884620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
 b=PE6f0U7RdOqieOd3FZcsJGrOuSB2fKk9mys/hZZHlHnGkUMe8DFUqspjDogSa+rFY9
 t/4uvreXrRLWnK8idzCk+G4EpPzBM8pK+Y6BZLA5yrL2mJq5TpqM8uJXrJNV/ctjzWOs
 o+OJvbRBbd3qElC3ga84ccy+0/WVcMVhFCs3VjZ8ODT8G9OsvY7Agxz4QqOwAgpu0Hlw
 FWZb2TMEAlHbMdYhiXNNGvVGAYtpOM/KS3cH6eJFXhZ3uU2gW2PxLy3PQeYauGN/8KkW
 twz2DePkayGixK3GPdBYawi2j4qpfZOgiRn2nyAAOtMztpM03i+/RIt40MP9VeVZMPpb
 Dbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279820; x=1762884620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
 b=JtpQECXUFNsnPbRvK5tpfcvo3fqhpPty9mKScLbg/l2WXrgtiYp2v9Cbxa3C+0hHVg
 9/KbRMalb2kQCYwftDdbrP09XeJKZAQy5AdK7X2pPMOCumkPQT25YgrxqFX2ZIZRnJ+k
 L6WfViiIKfIKDUQKik2XjPACjSGnY4cFabvvAu3X5Q87EuDfgILpAejeZNSRFsAneKyH
 4cG3A8D5P3AQgjRuwj81QJ++Mf+dknaQFziV/B3HLkrCizDDGCa1vxr4gpR+rYUu1nXY
 Dsxv+5lMil4GCgJtWQsccSOr9rZT1vFSSb2SuaP6GPvSu8HZpkg0qX0/nT2E1Sztr/Fb
 iyiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgHseZDELGvjBYtfg7A/R4uIOdlz7+HEAghAULIJGfL8gIuJxbwSfzVdQCZo4U3wLEbRMk7Seigb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhZKM2bNFY1ML0p3Y8sEIb0DOd1dSviMpALOjp2hEtAYaNEc32
 vnaci93/zys1Ga7PkjzrV8RlS/QzHi8+G1b6BkMBSbFNFDG15YPCySdk
X-Gm-Gg: ASbGncscC6+FkNVSOudrvVTGciUSqzdlIcQxAuRhJRli5OPsOt+l9eN2nFgRVcOFZW+
 mWvPsmf30OmJoMyK6p+aJBQLMga3aux4gbk89kipUF4Ljhfu8+JbAs0Z0ppnRH9DSym56ZSv1sm
 UJH2ICK508jIXQqAdzDzDvXZ8e07R0708NBsKdOtXPtzRy+ai58XpPgJKlMuQTrwAN2xj5mGwbC
 3tiHOFwQ9TkMLfqx/rQLFLcEmzEBeXffpM4XX9xthVFLhbbROgAVO5je/4SIluFx5fUJsj8J1FO
 3QDwGBgoTXQMJhDQCdlcFWmeCTu3Yw79Q7+FhZsYQS6N8AAJlAg2jBpmRWec8GXBVrkNPnaZs4M
 K4uKo1v+oPry5AS1ijhgetX83wTtWmP0/TDtyOKV4HXvCfoIW4EiUC3IRQ7t4RcIXBOBYwdFJY4
 KvGhYJiFLZWIqFDz+bIg==
X-Google-Smtp-Source: AGHT+IE0VNeGup3E339ZS9R9hdH9raL7VWlmheMAS7dvWwXActLDGmTaSE0UPI06AOF5H0yvEXihPQ==
X-Received: by 2002:a05:600c:a0d:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-4775ce24859mr2137695e9.40.1762279819619; 
 Tue, 04 Nov 2025 10:10:19 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:19 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Tue,  4 Nov 2025 19:09:26 +0100
Message-ID: <20251104180942.61538-15-jernej.skrabec@gmail.com>
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

In the pursuit of making UI/VI layer code independent of DE version,
change meaning of UI index to index of the plane within mixer. DE33 can
split amount of VI and UI planes between multiple mixer in whatever way
it deems acceptable, so simple calculation VI num + UI index won't be
meaningful anymore.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

