Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930081641B5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8DF6EB85;
	Wed, 19 Feb 2020 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD206EB65
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so27494101wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7HjXZEBRU6XGq7kGBxftAEqp4bujYuOz9mLf+rmO1mo=;
 b=VZWB+bSn4iwnh0MrdpoDqQaS47QPzZv23uh8hR9fhKe9J+S1EIYF6ap1okuDoQthkm
 MnlT5O4opuOIT1WkoytGQjDGcFR2CtgZ7XCXS1gCJdEvgwPvkQvAo2Z5vgsHv10gmwVA
 hOHPoNfjvfrZzngiQxdHsfH7a9rJM1NCsoc5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7HjXZEBRU6XGq7kGBxftAEqp4bujYuOz9mLf+rmO1mo=;
 b=gMRsI0caYPpaT3XUIxm+P+2ddB4bqKMN974SRvOjayk1zShcvKjNxuDkQWvVo7PrCU
 qGaZGq4rBwIIt6jUhTj5TNgiEb37TQfQFa4FnO1oJl23sT/01IzDMRYeyKWkyAkyLqS+
 LqiTHrHFKME5CPVwax2oAmNtS76osmZ1oExJ5M4ka0nj2iIcDqhfBuG3q+SXesvcS7f9
 qH30Em7qZ095xgQspdqwrsFRmTpRF31py8ImdRmUkG4xF1Xk6vatyfibSxypScCvUfyh
 HH6Fp8AG/NhgsMojezW/JqIwYjPQYJfYgTqDmlyI9H+QKC0psXiD3MNsWyPqIPw1bSkK
 re4A==
X-Gm-Message-State: APjAAAVSDZwj6KmnOteJWTwbh2dw9veyr9V8Q9ELvfmjH6Z/hPcLUuqx
 hPfLuSz6ts+OaueUKJQEIPUITpPSXW8=
X-Google-Smtp-Source: APXvYqxqejOV92+TGgX8subSuFcRJLKXoKqlh1UaXQZYhfjj288rPnzBZTAa72mcKHAodXqe2wqJcw==
X-Received: by 2002:adf:e50f:: with SMTP id j15mr35337557wrm.356.1582107730618; 
 Wed, 19 Feb 2020 02:22:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:10 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/52] drm/mcde: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:03 +0100
Message-Id: <20200219102122.1607365-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows us to drop the drm_driver.release callback.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index a543ebf3d541..b8ca99995e51 100644
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
+	ret = drm_mode_config_init(drm);
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
