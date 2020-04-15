Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA771A948A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69106E895;
	Wed, 15 Apr 2020 07:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933FC6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c195so14279362wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KgK3G2A1STC7flhBaGiCXJKQEoHrUb4s+30Xdgv1uqQ=;
 b=lTcj+h5t2CqxfLJxf0bB4D4i4UDznI9GJV0h5edSX5tgEJMWEu+5pTEMgEY3+h5IPG
 cMWVC8xSo/9rZWfREShCC1w+f5CDw+v9rnlfNkdFhbsDuuluGiq5A57GAJONAoq5Fbc/
 fi+NxN8CGCy5VhFkgxJqaOcVb9zFNiGZv54UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KgK3G2A1STC7flhBaGiCXJKQEoHrUb4s+30Xdgv1uqQ=;
 b=UNKBp1vkubeEM0df81X/rkGCle7HUK7RCO8DHtyFEB8kJmGvci8kzDPLLj2V/Vm1xN
 WogvEd4TnxyZMctRGnN3MxhXR+4rucCm7cziURERSmm//l6OWeiMs7PZh6LaGx1xVoDM
 ji0hz4Ur5s6lWTT7ttaUZxms3k0vx4Dfhze2Yz3FPJWpvBWUp8pfeZBIHlTxXQZlReOb
 wgbO5pQBggAGRBNjy0RFn4eGFjziy7PrtAHtPeYfhkLyiS8q5De8PFYGfip7OZwoilrL
 QdVCUr2mZFLYYMALo3Oe67BT5nYGYhfRy67yLqXa/03ZMNQtqw2tr15HuhZuGqgNq/ti
 oxaQ==
X-Gm-Message-State: AGi0PuYWiXi473aTYIdqKcax9Te7TGoSzDBrVfJosU05SEstm0LiZieF
 CyS/72xq8QP5nV0agJhsmZl15g==
X-Google-Smtp-Source: APiQypI//pOtyMwKjVsVow+4np140pwXpH1ebyPslWByrMVyzbIVabB98l2YWR70QpAl50DQ6nvCTg==
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr3811166wmm.104.1586936454521; 
 Wed, 15 Apr 2020 00:40:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 13/59] drm/st7735r: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:48 +0200
Message-Id: <20200415074034.175360-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 David Lechner <david@lechnology.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Aside: There was an oddity in the old code, we allocated priv but in
the error path we've freed priv->dbidev ...

Acked-by: David Lechner <david@lechnology.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/tiny/st7735r.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 631801c36f46..ccbf49a53202 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -195,21 +195,16 @@ static int st7735r_probe(struct spi_device *spi)
 	if (!cfg)
 		cfg = (void *)spi_get_device_id(spi)->driver_data;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_dev_alloc(dev, &st7735r_driver,
+				  struct st7735r_priv, dbidev.drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	dbidev = &priv->dbidev;
 	priv->cfg = cfg;
 
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
-	ret = devm_drm_dev_init(dev, drm, &st7735r_driver);
-	if (ret) {
-		kfree(dbidev);
-		return ret;
-	}
-	drmm_add_final_kfree(drm, dbidev);
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
