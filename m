Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EADE262E50
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C126E1E9;
	Wed,  9 Sep 2020 12:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011D89EA6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:07:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so2692740wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAYuxh9pbkNECMzudLOzx4+jlA7bFbO6VYs0dcqBaaI=;
 b=lyHO0q9ev/XDXO83TYVqdVfYbu66rlYXZqiW7rtg67aAcYW+fFrjz8RZsJE4KskpCQ
 oL0TC7JKcOg0ODvdjIGGrNjDusNC9BGBTtANpmr1t+W4f10IrqTHFzSgvZnHA72EQ3Hm
 Yucx4YiQ1H1K8XeRrMMQDEw9QTG8J/vjipU8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAYuxh9pbkNECMzudLOzx4+jlA7bFbO6VYs0dcqBaaI=;
 b=rQgQMlKjyNU3dV4lhs14toachk6WvB8yFvswY9fDl9/cCWwGULN+3/ZupZiwhFFqRx
 JeWP4MkuG94aZCjHoiFJy5Uxgr+BmUvWwRpVcqbcHgWGVJqhKJt6V4wzOl5U8NPe7BcE
 M/c6TGbO5Iyv/zV/EQCqBEoNKoYO51K7iom9n8HhijcpmwZsCZ4jA1geZjkerfIXheO+
 jqc+uDEVeT97AiH7rkCemjUmzr8vlRklI25lhMMZ2Wq3j3ZzUulrliipDpakQXiMa+KM
 IL0hOUTSCbEcDCJm3j/qcvjvD1iLHaADU8oammu3vmhAaI+0K8nItJ0QmYTeqMNlanYb
 xnqA==
X-Gm-Message-State: AOAM5300BMsANTpHToB4p0gVX8yJ5o/g/Xy+jUJkl+mmnpCoR8uVsl4s
 uuPPb8tMzwHUfeJkNc4sUtdzlvXOk7EV0jPZ
X-Google-Smtp-Source: ABdhPJzP8BeSDNhywOL62z4gFNc4yd1k7LyoMN5Kk5jiPrST1aDn6+Lm/HAE4KoTbUpj863/TLoVRQ==
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr3482306wrv.404.1599653271608; 
 Wed, 09 Sep 2020 05:07:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm4285764wrn.21.2020.09.09.05.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 05:07:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/vgem: Use devm_drm_dev_alloc
Date: Wed,  9 Sep 2020 14:07:45 +0200
Message-Id: <20200909120745.716178-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-5-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-5-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This means we also need to slightly restructure the exit code, so that
final cleanup of the drm_device is triggered by unregistering the
platform device. Note that devres is both clean up when the driver is
unbound (not the case for vgem, we don't bind), and also when unregistering
the device (very much the case for vgem). Therefore we can rely on devres
even though vgem isn't a proper platform device driver.

This also somewhat untangles the load code, since the drm and platform device
setup are no longer interleaved, but two distinct steps.

v2: use devres_open/release_group so we can use devm without real
hacks in the driver core or having to create an entire fake bus for
testing drivers. Might want to extract this into helpers eventually,
maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.

v3: Fix error code handling (Melissa)

Cc: Melissa Wen <melissa.srw@gmail.com>
Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 55 ++++++++++++++-------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 15dd41e67de3..cb884c890065 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -401,16 +401,8 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
 	return 0;
 }
 
-static void vgem_release(struct drm_device *dev)
-{
-	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
-
-	platform_device_unregister(vgem->platform);
-}
-
 static struct drm_driver vgem_driver = {
 	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
-	.release			= vgem_release,
 	.open				= vgem_open,
 	.postclose			= vgem_postclose,
 	.gem_free_object_unlocked	= vgem_gem_free_object,
@@ -442,48 +434,49 @@ static struct drm_driver vgem_driver = {
 static int __init vgem_init(void)
 {
 	int ret;
+	struct platform_device *pdev;
 
-	vgem_device = kzalloc(sizeof(*vgem_device), GFP_KERNEL);
-	if (!vgem_device)
-		return -ENOMEM;
+	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	vgem_device->platform =
-		platform_device_register_simple("vgem", -1, NULL, 0);
-	if (IS_ERR(vgem_device->platform)) {
-		ret = PTR_ERR(vgem_device->platform);
-		goto out_free;
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&vgem_device->platform->dev,
+	dma_coerce_mask_and_coherent(&pdev->dev,
 				     DMA_BIT_MASK(64));
-	ret = drm_dev_init(&vgem_device->drm, &vgem_driver,
-			   &vgem_device->platform->dev);
-	if (ret)
-		goto out_unregister;
-	drmm_add_final_kfree(&vgem_device->drm, vgem_device);
+
+	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
+					 struct vgem_device, drm);
+	if (IS_ERR(vgem_device)) {
+		ret = PTR_ERR(vgem_device);
+		goto out_devres;
+	}
+	vgem_device->platform = pdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	return 0;
 
-out_put:
-	drm_dev_put(&vgem_device->drm);
-	platform_device_unregister(vgem_device->platform);
-	return ret;
+out_devres:
+	devres_release_group(&pdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(vgem_device->platform);
-out_free:
-	kfree(vgem_device);
+	platform_device_unregister(pdev);
 	return ret;
 }
 
 static void __exit vgem_exit(void)
 {
+	struct platform_device *pdev = vgem_device->platform;
+
 	drm_dev_unregister(&vgem_device->drm);
-	drm_dev_put(&vgem_device->drm);
+	devres_release_group(&pdev->dev, NULL);
+	platform_device_unregister(pdev);
 }
 
 module_init(vgem_init);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
