Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5341688F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E706F571;
	Fri, 21 Feb 2020 21:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7396F53E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so3529400wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nKgREY4pHUx8oiRsBupo7/g9tv+YIJYqnJ/ICqaTug=;
 b=J/mROcaaNhGRdxm/mNWe5qKrMp0QrE0QZ3MJGXzZcPJp34WnQ6cyh35S9sBPkTbE60
 BR9NzbBPYxcRIbEo6zVFP+AH9A72ubSJvtv5PNm/pQFUMshxnXe8WE32P/373yjWOABv
 eJfuFJ33Fzc4rjWJPfM8PcYvhZCAdAHKcmTYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nKgREY4pHUx8oiRsBupo7/g9tv+YIJYqnJ/ICqaTug=;
 b=i1UbYlFEMJD5LwJmk94Gl0A62dNfhBU3aVo59lNf8gdnNWaAq0qZtOS/r9FdvW4O3S
 1cgYaZfUVVm5GdeJXyn6wFHd1WKSnVqzSspBQIajQksIXT3ARu9bxPSgc8Ieuw4AoA/I
 AT+fVcBJHwGET6qTWYgBw4ocm/Zqr7ShDrc29wplHmsJ0kAYnbF59+Es6VR3clv0Cvqo
 KbWhF4ZRydcD9VaKUL+H5l6KyKpgJts4dRiW/qhm+9dlZldm8XmM1p5uTRUNmKSWeO5U
 wZ2FYOixap820JjJf7+2OQHFoZK7acIv1jZ6YoHk/i3Lg9pUMC2SIH3x/049epozG9XJ
 2i4A==
X-Gm-Message-State: APjAAAXy6iEe8kjepl5XvQolfA8isIxuWEGuezXvFTYsnnAM0e5uwrL5
 qpaVVN1R/dwjAsJZU9G8m1/J1FpvbmM=
X-Google-Smtp-Source: APXvYqyXSvzUuN6pSVKUOLWtY0S4Lldf+hZ2+65alY0/SkNpYI8mDJCQyuOFb/TFM+hbqaK2DubCog==
X-Received: by 2002:adf:e382:: with SMTP id e2mr52909973wrm.128.1582319055011; 
 Fri, 21 Feb 2020 13:04:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:14 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/51] drm/pl111: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:03:03 +0100
Message-Id: <20200221210319.2245170-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
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

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index aa8aa8d9e405..87b9b32c90a8 100644
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
+	ret = drm_mode_config_init(dev);
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
