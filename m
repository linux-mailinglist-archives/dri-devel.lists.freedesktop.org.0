Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07899176742
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8CB6E8D6;
	Mon,  2 Mar 2020 22:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCA36E8D9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so1829674wro.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaqoQK4JapBefAfXiK3AF28YNurDMAX13lAGeSaxSd8=;
 b=XZuNIpd0RLsK2Ohw6sreK64S69PyAKcaxTvu7Ge5eH6DP0jAOJHHlK4pnW8cqaaVY/
 pTkKb8BElNQ1YB6h6+jzByHXsFaF9M3zU++xt3nGG0ALN+7rELx+TdEJgKhC+QrRebL7
 BFiCDK76ofWSW69diu/4lQh+zHMb9sBNLryN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaqoQK4JapBefAfXiK3AF28YNurDMAX13lAGeSaxSd8=;
 b=F1TlEgsddVwgRNe7fQDgfOfy+a17FEGk/Q0E6NeijuqOu8wTWn9b6b4S7guL3eVibI
 QckCP/sqQpzO33uma5r9ylOj/P+EWUChx5k0xN2WHzQltBg+AY3r7yrDPfKTYvsfvazQ
 sNRKv66gGi/+9itF2zeybq5JVY00Wn/sJt+eE7sOXoeH5fI8/PgLJ3Ur2UJai7GfqWVb
 t9EUr7njAvTRtlEHcUA0y2RStwLCPX9+w20NjwJ9t7hkfW0LsA54jsOzHyNSnV7fl4Xa
 UTqO9teMzROpWJNhRAIL9mTdkiFlmcjG4+5Mj+6co3Oj7lrOlMlF+dPFV9jsCmzJWOG7
 GlYg==
X-Gm-Message-State: ANhLgQ2AdBdhFW3wugJaYzLpWfx5cXcEXwFH2A5oGgYHfixx7cbawzaL
 2DXj2BEh08OfjCsVvCAMB0ZfY1IGAkE=
X-Google-Smtp-Source: ADFU+vvgDWbZ+V+yI4H3g3usPcXvvr47gHCVFOJJ1bBsaWDMjg4jFPYWKCpAiOUhBlSzWgENlN1mZw==
X-Received: by 2002:adf:f751:: with SMTP id z17mr1671078wrp.207.1583188050185; 
 Mon, 02 Mar 2020 14:27:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 40/51] drm/mtk: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:20 +0100
Message-Id: <20200302222631.3861340-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0563c6813333..2eaa9080d250 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -162,7 +162,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 	private->mutex_dev = &pdev->dev;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -179,7 +181,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		goto err_config_cleanup;
+		return ret;
 
 	/*
 	 * We currently support two fixed data streams, each optional,
@@ -255,8 +257,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		dma_dev->dma_parms = NULL;
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
-err_config_cleanup:
-	drm_mode_config_cleanup(drm);
 
 	return ret;
 }
@@ -272,7 +272,6 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 		private->dma_dev->dma_parms = NULL;
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 }
 
 static const struct file_operations mtk_drm_fops = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
