Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB6176733
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C786E8BF;
	Mon,  2 Mar 2020 22:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424FC6E8B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v4so1846828wrs.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvd0bMuzoP11S6EYU5HQGcu0X4ryfdSitbhjVsBc35Q=;
 b=VJzD1mWa8VBusughvTfKq8kDkNkaMBwmfcGXjUHq89Txm25vyZcf9NYeSCGg+Nn9pT
 qBFMGh85ogmRSnhjin472MG+PdV4Cy5jkUMpYNOX0HKjpXC2podkghGzo2UU90XxMPTJ
 /WeyuxoQ6oyUTpUkUMwn2fCCFfWi6GQSMKeas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvd0bMuzoP11S6EYU5HQGcu0X4ryfdSitbhjVsBc35Q=;
 b=mZPQCU5RIiLQ07v9s7m+GfXzl97sHq6dx82vMWBylAahjl4wjt0HvYFx1BuBJBXIzk
 TW8q05VKpz5I9DK94HCd2qhg4YzsKY9RMoIceWOYtRXbVZnuTjmKV7heIEj1HMJCwSMS
 zITAbIOk8NmM5CvOVluyJX2MVv4b30yq3CkcHeeP/lniQW7iFiuj1Zo55zLmpX+1zoib
 6e93NxGexEkZ2ckErcmk4t7GE/+9UzD68bjzshc1K7YX2SlBIS+ebHnNSqsGp2F8oXWv
 YPv1XHLR8Rw59MsTpg2Us8SQMXqyRrtbqJPu1K/boSIkrus8hphO2ek0L2ZVKDs5TuLs
 bM/Q==
X-Gm-Message-State: ANhLgQ0rpyZ08zgc/fmWBuRuR/zr1vGVK9sdNP0GZF1yAM7Vc9Ln47oc
 4ifkfqwV9K2Ttwqew6EafsQ9cmWlXVM=
X-Google-Smtp-Source: ADFU+vuGwhiaCoXq4qTlzpGVCPrTjoPGYxtkJgJkAGuOYFga14zzXJxyMQVTzZG+T4hrk6YUKrk8dQ==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr1803889wrb.60.1583188040657; 
 Mon, 02 Mar 2020 14:27:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/51] drm/mcde: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:12 +0100
Message-Id: <20200302222631.3861340-33-daniel.vetter@ffwll.ch>
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

Allows us to drop the drm_driver.release callback.

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
