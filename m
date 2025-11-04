Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D485C32896
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C9E10E2E4;
	Tue,  4 Nov 2025 18:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEPZ53M0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488510E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-477563bcbbcso5300365e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279805; x=1762884605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
 b=mEPZ53M0H/ICu7/0Iu8hlC80CpoCr+kp57f45EZo1sBClQ99YgWqZXx2o9R6RTS167
 gtVdCfO4TOww8fFoJaj5nWrtgyP209Q8JAlar5Q1jDwZrOi2CCe+dZKYLkbqMiWrLb6r
 IQ1erbAcUR41GBlLpgDOje8CIjsJiATRTEYU9E9xdKq0F3XS8k+miIKTGLWLsLhF+rk/
 l44nEfJQHrsfLDo7OCRidhWykPu7PnuWhNWKCiH7BxjR6kQzMTY2MOrD9ArhGCKLUfLF
 etO3DlJq6OL+p7hBoasLqTEAgWuO9fSTnT+okVK3+SSLaKnir/rCd5vL/9mViUKH3J0c
 LRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279805; x=1762884605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
 b=tMXXw1HUk13wKfUAqoHXB8NMYUurgQPIYp+vzWMnpugSn3YNrDN+67M1ZgM12CXeb1
 VqOFNUqDuCrUwxdLzj4R6jYowIO8tkBhcZTIk2CO9o0sGNFtcmwvxWmqtLcpNyI9hBkT
 FV5B/vsJznMSs3+yhz2VUmJULr/2cT+juj0h2w330gqu353OoZo6Dv3Dr9/p9gCuVpDI
 tSFGzu9E1qZtJ+AuCr+lZadnLIuKWpKghrm0ZQSWEhm2MMJh+EJmK7B1pXZtbGw9fqK9
 TgXjp4mF/psU0c9wkzlJLd5VJQVQ3I/C8vjxMU7evMkVBoR7mJEZJc/nqytiLiTKfPUi
 2RIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYK5bo6yLe8Jpgp9inv/FbC/xeHVB9cwZxAEf5uVIzMKIx6PSB59TcTp+zGOWl4uzGfY6I2v/RfVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVJ7SZOylSxvdB3x9u+HEV5BDuX0YyVI74um0NkdA21rQnB3M0
 96dgiymlu36Vngydvi0OSeXdMDvWmlfhPHtb39ZygOQ8IOQXqkthmcP4rW17IQ==
X-Gm-Gg: ASbGncueQHABEY19wst+YaqMILVFpRHhB2xSKRnSHj62oL42uXjWRDK4ySnUdgfHpYe
 1B9w74DSA2bvE8tOPu/03gwU7ggkgJL/j6kgrT1hnzt0xVK398mGalNfMYZbamYK2Dnl2fufotS
 WvCJTRH4aN5GxYrVMxg0ScvuMvrOJbywffM+4UsL8m1cBAf76UIVXkLh5V0jeZnmzbtQPxFLQpK
 5s/sGM38qBz9hD5Ki/t8jgAT1s78b9MUkBKOUE1NI8J5RlJfXJ6aMLu0ku8WU5SymzTJ2CrheF+
 nDS8iJ5zWCh1HpZMiUYH8kjatDa0ZJCNhRTjeqQ4LwWq4UuEIiHfBmW0DyNVPB42ckklGtO1ccH
 Ds/cbOPbXMtkLAoAaYzF/DOdxNxU15+sR+8kW7bMGb8oqZaxRexiQKrHvF6R9kx3yfd1RRO3dpS
 qOhYfEELNQ7dEsKdK8VQ==
X-Google-Smtp-Source: AGHT+IFE1Vnf7zp2knUPF6yAEnxj56xkN0ItjqfzEh1DT7fbSwSU9DzT/Mss/kHxDSruSnpGcPcZVA==
X-Received: by 2002:a05:600c:699a:b0:46e:32f7:98fc with SMTP id
 5b1f17b1804b1-4775cdf46b2mr2500505e9.21.1762279805418; 
 Tue, 04 Nov 2025 10:10:05 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:05 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Tue,  4 Nov 2025 19:09:15 +0100
Message-ID: <20251104180942.61538-4-jernej.skrabec@gmail.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

