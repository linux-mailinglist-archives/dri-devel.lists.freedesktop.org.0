Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DEFBD0AFD
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CF010E1A0;
	Sun, 12 Oct 2025 19:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ekQ2LonD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18210E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so588332666b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297023; x=1760901823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
 b=ekQ2LonDoGeHpJBBfawtG1f4BRqZud1/F37RPn5AY7RRyaykOV0Q/zZoJisdDaPuUz
 UpCHNHMuejZlNChBIcIkDd/xAiGu7rU+vcgcC31F3ORmFTGHZ5pUCMhZcTQu12aKUkPz
 W70tB9DeSgJ1HhbzvOiwOafSnC/2Oxc5ytlwKd/cRatNHzSvw9RCkhgBqqKmIuaA4T3C
 TgjeYJPkp7h3cxXtsLaJstnBvfFev9M86wFEHwK7w9b+KaZbtiq/tN+McuL/bAYOpx2n
 h1br38bR9bp/+JpUc5QzuqfvKdjM9BY/aMQwaOm5nlvolIKbx7o88gvkCd6FIP3juQBW
 HYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297023; x=1760901823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
 b=vT+dNBxlgMMKq+SpPaCEzjb6i3EgdHKxAcUsycZEwVrnxez5CgoSEMuGa2ZGExf+bL
 9IRRkL/nGL4h1x3kW7HqMXm5UP7L1BfpvW/OQUi0FdlraLB2nTUnBQ3Qybg+w/TYDul6
 /dLArBl4DHOBv3HgOVlHamIbY98sR1dr5SeSP2D49FfTu1Hbeen8ULHkMs8CBsYErLqe
 ILhGL8pjhKsXRbAhPEjFm/TTXkQSxXNp/pAV+Rs6zBg8PN/VFp/jwfBrlVZ95igotr+b
 ma7wRMzfXvr1cNs3y1u7Fks5TSE3GwSX/HzALK9Q0MN9TIlD4ISzGRcJH4MnTzyT2AVQ
 rxHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWKuz3UKJrfJc8Bxjyyxh2PeuG/36/qVFGvcLKlJ0XZR83qUG2yy2/oVYF42xjqWr2kOdtcC3g+eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDdghIGB0gfVlj2UXnWEJK37boEP5GZB8Jrbda55vIQV09gNEa
 NFyB4VXofM5ZDqvuGQrYVeR+tn/C0Neiql2qAf0Fs9bBGScL3X6VA2t8
X-Gm-Gg: ASbGnctiC55sPHK5eJPYCqkXnWWEfwAjRXCxjOB6GnY5tI4QF+FJ/ap9mZ1kMQDTDH8
 sMssShYve3uHnjkQgUul7oegtF97brPNP7hvHiRQF0nCLU0sk/lcckjFrkLCMlzqDkiVoI8h7/R
 4PeGf3HdrPv639InY3IaeMDjK6M+og73XFoUVqTrU1yrjsz2LzBB4FFTo94QEYSUKRLJrJdjTmq
 O7Hi0R3/fv0m+mpnixLxXQ8qD20P/8Vnku+7FwR+OL5aeYd+yWU/EjfCuETLxvZAFQN6pBt8JMg
 KQxxQOkFuJrYVmcUjsSQ0duMVQQZyYAyYN6x8aUMvO7d/t1oYAK0zJB8Tc24h1t3ty6LMjqxVH1
 upgSnfBkMjZtU/KT5SKXNNisKarxMeAgo9vvzbw1Lj24UnaCXuGqkwTxUIoC2Xb7odaPAy0H5sF
 N51ctO9joupIqcF8nScs/u7/txPuOOGL4=
X-Google-Smtp-Source: AGHT+IFr7DIU5+0XZbE3hR+c44DsyFKY1NvkxnYeQndJ+rW32FEQNP/zDp5N5Glq490y6QrN3W54Mw==
X-Received: by 2002:a17:907:c09:b0:b2b:63a9:223b with SMTP id
 a640c23a62f3a-b50ac1c5db0mr1978491866b.31.1760297023111; 
 Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Sun, 12 Oct 2025 21:23:03 +0200
Message-ID: <20251012192330.6903-4-jernej.skrabec@gmail.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab..9b786e5c7f3c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -304,6 +304,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -334,10 +339,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537..bd6c7915bbc4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -485,6 +485,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -543,10 +548,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.51.0

