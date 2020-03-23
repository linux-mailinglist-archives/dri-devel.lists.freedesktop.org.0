Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588918F787
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6546E13B;
	Mon, 23 Mar 2020 14:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D826E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so12076536wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhigyKX9leg2iRyigV9HwacIFKw6VhyeDGQ4LS+tHAw=;
 b=EI4qcfvH7/wIMCwpH2bHw4s/F6TLnfnqHk26+1BrynGKKNv8NCVt0DRPWTxEYaC1a6
 upwkf8ZUmOEpBDVxli5EpISJxLavDb5Z4a7KcLQPNz0ufRfVoBLzYHr3feeNmTDBrXaz
 noR4906a0EtNsTPfoKMRQWLg20pBH1ps2Yay0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhigyKX9leg2iRyigV9HwacIFKw6VhyeDGQ4LS+tHAw=;
 b=KH6km/7aBM9mpDGjZNVJAVWU34VSeALqCuwNAC9UJds/qLcgvleP0UxHv2YQTum9pm
 UTa7SBvwlQnshIfIMWoeo5PCCBsAKRj820bUZZWBnWES7Ap4kz6ZWeVGdjhKcs74Rxod
 WFH1VgStf1vTeaEOILYKk/pQcFVEgreYZXzkGPfcKu/5frH/KqZxL3wbWBvDQOKa8S6l
 +40C9H6D2/6QTTUPVgfKH6Q3Kzy8vIUiqnAKNc2znELoaTsV3g3UDoZnPRKkVdzsm6Fs
 xaU2gPMHg3+EX8p7L+Ulg7kQoCTtKcc41QatLo31hhoC1Me4ECLGya0m3rKFpOoBSulH
 5niA==
X-Gm-Message-State: ANhLgQ0nyznnaFaGlijU4VFJ/ZchyVgafErUvLLLaSmNS2xfl94qamg5
 cGu1smsu2XqRX43rDPB+QL0PYE+Kl8xlDA==
X-Google-Smtp-Source: ADFU+vuJ0JzogfCzm96Rw/0szJ5Z6Xz0J5IARsp8LYKAfoomhQPSs6N6E7zRQjqgergX0znTi9xNOA==
X-Received: by 2002:a05:600c:2943:: with SMTP id
 n3mr6730987wmd.119.1584975046660; 
 Mon, 23 Mar 2020 07:50:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/51] drm/pl111: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:34 +0100
Message-Id: <20200323144950.3018436-36-daniel.vetter@ffwll.ch>
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

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index aa8aa8d9e405..f9ca0f3edbbb 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -90,10 +90,13 @@ static int pl111_modeset_init(struct drm_device *dev)
 	struct drm_panel *panel = NULL;
 	struct drm_bridge *bridge = NULL;
 	bool defer = false;
-	int ret = 0;
+	int ret;
 	int i;
 
-	drm_mode_config_init(dev);
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
 	mode_config = &dev->mode_config;
 	mode_config->funcs = &mode_config_funcs;
 	mode_config->min_width = 1;
@@ -154,7 +157,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 						    DRM_MODE_CONNECTOR_Unknown);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
-			goto out_config;
+			goto finish;
 		}
 	} else if (bridge) {
 		dev_info(dev->dev, "Using non-panel bridge\n");
@@ -197,8 +200,6 @@ static int pl111_modeset_init(struct drm_device *dev)
 out_bridge:
 	if (panel)
 		drm_panel_bridge_remove(bridge);
-out_config:
-	drm_mode_config_cleanup(dev);
 finish:
 	return ret;
 }
@@ -343,7 +344,6 @@ static int pl111_amba_remove(struct amba_device *amba_dev)
 	drm_dev_unregister(drm);
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 	of_reserved_mem_device_release(dev);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
