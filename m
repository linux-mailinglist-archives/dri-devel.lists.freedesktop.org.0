Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A722379B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D066ED63;
	Fri, 17 Jul 2020 09:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242AB6ED63
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g75so13872023wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgzrsfFvUoedrrID9NxEXb6kwKd/nE4GpLl68MV7d2Y=;
 b=ieC1FUwDPTlp07j7WO655O98SifDjBbC8SRiRqcP5pZqh2AgC/JYK1uIYgM9dh3eRH
 vy/ChZhOl7ek1o/hgsskxKycdt0SMW0N5OTyTsotmfBL25GHLyh5FskqKCRisfoywOFH
 wdWOgrzeKTPqFSflbUrCCCEnwei9rSZsFKUao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgzrsfFvUoedrrID9NxEXb6kwKd/nE4GpLl68MV7d2Y=;
 b=twWR2N76gpCiMzs9i3LBLts8lzcSBPdNuYOAmsVRdIzt0O3pcYEz2ftXZTZsnkrJTz
 o7geO4pcdHR+om0EsTRN9RmKjK64WGUaYh21dd7kXBm2/XAwmZKkkJgTcq+SLtC0K1J6
 OLZ/UnbMq4Dk9n7pSW0ASAKVhHPk6gZ3G3oa1WBWivfLdT2b/3BsuCyZwDHfnjejcoO4
 ldByBrR1NLr7722tHx6rdD7PEamXzSdSrSz99QRATssDsPnsPiE1T94j8E3Lr26O3KOK
 8SP7eGsiJp3H2oDP1kClE4zq6em1qJ4D+44RsViyH3mRcvY+dVmYor6nzmME4jYAMv/n
 8FYg==
X-Gm-Message-State: AOAM531t/bpLB+yZ8IRchNJeZITbkUr066CbHYZq9+TKqKAH0tMLGocw
 jmNCkMhvcuXRmDg3kMQJEURbQ+gHgpU=
X-Google-Smtp-Source: ABdhPJyo4o1hXp3kz2XEAjJnFRCJ+eCHbR/ki25GAj3KGHhaoIfRPV1kwLcSZS2Wt6/ZoRICwHovhQ==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr8785078wmb.105.1594976676442; 
 Fri, 17 Jul 2020 02:04:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/18] drm/armada: Use devm_drm_dev_alloc
Date: Fri, 17 Jul 2020 11:04:13 +0200
Message-Id: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
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
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also remove the now no longer needed build bug on since that's already
not needed anymore with drmm_add_final_kfree. Conversion to managed
drm_device cleanup is easy, the final drm_dev_put() is already the
last thing in both the bind unbind as in the unbind flow.

Also, this relies on component.c correctly wrapping bind&unbind in
separate devres groups, which it does.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_drv.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 5fc25c3f445c..a8d5908b3922 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -87,24 +87,13 @@ static int armada_drm_bind(struct device *dev)
 				     "armada-drm"))
 		return -EBUSY;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	/*
-	 * The drm_device structure must be at the start of
-	 * armada_private for drm_dev_put() to work correctly.
-	 */
-	BUILD_BUG_ON(offsetof(struct armada_private, drm) != 0);
-
-	ret = drm_dev_init(&priv->drm, &armada_drm_driver, dev);
-	if (ret) {
-		dev_err(dev, "[" DRM_NAME ":%s] drm_dev_init failed: %d\n",
-			__func__, ret);
-		kfree(priv);
-		return ret;
+	priv = devm_drm_dev_alloc(dev, &armada_drm_driver,
+				  struct armada_private, drm);
+	if (IS_ERR(priv)) {
+		dev_err(dev, "[" DRM_NAME ":%s] devm_drm_dev_alloc failed: %li\n",
+			__func__, PTR_ERR(priv));
+		return PTR_ERR(priv);
 	}
-	drmm_add_final_kfree(&priv->drm, priv);
 
 	/* Remove early framebuffers */
 	ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
@@ -174,7 +163,6 @@ static int armada_drm_bind(struct device *dev)
  err_kms:
 	drm_mode_config_cleanup(&priv->drm);
 	drm_mm_takedown(&priv->linear);
-	drm_dev_put(&priv->drm);
 	return ret;
 }
 
@@ -194,8 +182,6 @@ static void armada_drm_unbind(struct device *dev)
 
 	drm_mode_config_cleanup(&priv->drm);
 	drm_mm_takedown(&priv->linear);
-
-	drm_dev_put(&priv->drm);
 }
 
 static int compare_of(struct device *dev, void *data)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
