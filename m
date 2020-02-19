Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D181641D8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EEC6EBA5;
	Wed, 19 Feb 2020 10:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E876EB63
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so5871749wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=38Blbfc4kB8T8l7OCqbZglHsB4iJ9JWjkG+yj6B0Qss=;
 b=Xu3nNg15XkOilo3dt5CyNg3+977nZIP1w4Jaz/WfxgGvVXHnd0k90r7hamLe1yYVE3
 ijq8oeSq7bF7pahssFqjqAgXNVFrVMwY0egkHdE2D1hGrrKg+Q/N/bwx/tuKSaEon5u6
 pxViTsiGSqVQeFZeu4ceGarxsSjCvhJYeDjdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=38Blbfc4kB8T8l7OCqbZglHsB4iJ9JWjkG+yj6B0Qss=;
 b=SNO1oUUa02dA0mKt54MG2ZnudWcYXJjr8U9An4wCgis6N2i8yyTXo186yp/bya40bK
 K68FlY8KxCOmTI2ItWsFgnU1pZM+pfxL1+kNNbiSGPBI7Tee92vM0b9ncNBZi/800aYN
 DVo1XAYZC5v/HNw2kr/6nA40DCILI8T8zm8awCiLR4xS15x0VinFbVVt+KmzJxFeDu0Z
 UZ5giPLyAEklxQWcpCzMe4wPBAiDig7+XWGN3zhiVhtDx+0PotKT/5oebDafGYSUFGoW
 mFa1vG+pjbxhjCskkhzx2TAiAplGqSb83F9BucbrWhL0IL0Oon98NHh3pWw3n1T/628Y
 iK7Q==
X-Gm-Message-State: APjAAAUCoNiNxvj/Al6HtqNHWNyYjx6tvdtO0Q3penou8CFn/XM1NjcU
 E0kXrCofogIyDWmJJsFbcFKhs11xHDM=
X-Google-Smtp-Source: APXvYqxAPlJT1DmcMESZqUXbzXBT1FCIxjztmcFvS5Csf4oUkO02P88WzNkqkLPZfzwnYZKzD8h6tA==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr1664783wmm.179.1582107734285; 
 Wed, 19 Feb 2020 02:22:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:13 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 36/52] drm/pl111: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:06 +0100
Message-Id: <20200219102122.1607365-37-daniel.vetter@ffwll.ch>
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

It's right above the drm_dev_put().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

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
