Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46618F7A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944AF6E24E;
	Mon, 23 Mar 2020 14:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DA6E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j17so14030606wru.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvUowDIQsZ0sN6lT/fFnADpR935AxpV/5raqf268f0U=;
 b=eGTVHWU2LtrEepTqot10GD6pgAH2lQMq+3EWHSaxaVMFtbllGIduluXStiHQMIX8Og
 qkQBFpsS/8MX0NTvg6GjwPfyqu5QM0K0E+HseKqCPh5qyWt0mba619ve1K5TwP0onW4n
 PI78WKz9iqy9FHDMc7G6mXMrAtb3rA6txUkV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvUowDIQsZ0sN6lT/fFnADpR935AxpV/5raqf268f0U=;
 b=sZhyTY9ekg0TqBs/jXtN5nxIHw7RDBh2nwuh8nLXG9WFWn5Xma4l2OxeP+4kFBlYLp
 xgYT3lTDZiYpL2IEOOHc8PIV6IMr8B+TmWpFEyEiMf1tq+rlSbZG2tEP6ybKMGbD4YUW
 GUC5mnvUFVHKHHZgygtBbJoEdkQuNNblSwUalU0bWyxDnjR/U9ClTCNqMpGgWJk3utiI
 qrWIIjYlSs3hx9AO//qAibLfeEZ4Vd/voP/dmJR47xwJYiNe1On4j0KWIyisrrz7A4Tn
 HoDF4R7y1N7O5g0bpngRLF8mQdBC8+qJTd96mfDMOSoa7biYYkIeJy5t//fbWyNciPy+
 syiw==
X-Gm-Message-State: ANhLgQ2DGaUw0EpLFxRwNmnZD6/+iSkSkWgfiJKcvoQgjZw2avNzMZPr
 hJ22yNziVp1S9jADUcRrz5qxbS4OevZbXQ==
X-Google-Smtp-Source: ADFU+vv3zCOdFseyz4w7EymKr1szu1O6bM7mzqJh+FAOJPzZyekAd+tIafq+PMBBQ5zubBbOGaItPg==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr1348790wrn.14.1584975041152; 
 Mon, 23 Mar 2020 07:50:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/51] drm/mcde: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:31 +0100
Message-Id: <20200323144950.3018436-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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

Allows us to drop the drm_driver.release callback.

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (v2)
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index a543ebf3d541..03d2e1a00810 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -184,13 +184,13 @@ static int mcde_modeset_init(struct drm_device *drm)
 	ret = drm_vblank_init(drm, 1);
 	if (ret) {
 		dev_err(drm->dev, "failed to init vblank\n");
-		goto out_config;
+		return ret;
 	}
 
 	ret = mcde_display_init(drm);
 	if (ret) {
 		dev_err(drm->dev, "failed to init display\n");
-		goto out_config;
+		return ret;
 	}
 
 	/*
@@ -204,7 +204,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 						    mcde->bridge);
 	if (ret) {
 		dev_err(drm->dev, "failed to attach display output bridge\n");
-		goto out_config;
+		return ret;
 	}
 
 	drm_mode_config_reset(drm);
@@ -212,17 +212,6 @@ static int mcde_modeset_init(struct drm_device *drm)
 	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
-
-out_config:
-	drm_mode_config_cleanup(drm);
-	return ret;
-}
-
-static void mcde_release(struct drm_device *drm)
-{
-	struct mcde *mcde = drm->dev_private;
-
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
@@ -230,7 +219,6 @@ DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
 static struct drm_driver mcde_drm_driver = {
 	.driver_features =
 		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	.release = mcde_release,
 	.lastclose = drm_fb_helper_lastclose,
 	.ioctls = NULL,
 	.fops = &drm_fops,
@@ -258,7 +246,9 @@ static int mcde_drm_bind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	int ret;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
