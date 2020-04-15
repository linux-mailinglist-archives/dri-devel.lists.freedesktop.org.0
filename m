Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165991A94CD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5446E8CB;
	Wed, 15 Apr 2020 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6D66E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t14so4648564wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/tGVA9+iA6j1FaLA5UzvSFyGahWhU9fG6IuWtfziBc=;
 b=TY7w7IMpK5f6wYj/w5auhramrfXStB1M61CKe5hFl6nB/aLWBEQfUaDIfiCQc9e6Xx
 OZ2IfguL2F1sOdn/1GS3Efh5fwkBv3gPCcTvHDtj/9Z7rOwLtVdNeCDjdKEspiHpI1rd
 ul8t5r+lrAx2+6ejecedxZ8zdnwmT0WPHGfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/tGVA9+iA6j1FaLA5UzvSFyGahWhU9fG6IuWtfziBc=;
 b=XNX8q0iFseWjLR4R9IS64C7IUPS2O68rGdLdvh7SkcGkggcaxzqVH6j8Bq8ITiA0Au
 ZkVum7dUpa+OdbV+X57n+/UV0E3ZY6pFkpImrE+3W8GlCQAcoomnjr+fCCJ/lCRfteiG
 CFDY5ZNVprj8i5D7QYs0bXDxfIRv1IH7361JuLtgpMmWDC/oB9BnUvEfPPu4hWKdwuCx
 i5zasDG/VFIjmV/I1lt14/vEN57aRGowbHrMZmHdYKZdZhcJHHNFi8GlTQjJY/UisugE
 tlFqN1nYnR3RMcfpZ4OkCBi6H7d7OgMJa47nqA5X42a38nAhrfZx2YUwbFzfv6pX9E1q
 3yLg==
X-Gm-Message-State: AGi0PuYvGdikv72H6bjerH3aKxncbKHMSYGanV7QOMNBrruXR/iHiKsi
 XpdfCxU058wn7B5mSbNW6cJ/rA==
X-Google-Smtp-Source: APiQypJscuC3QnUxEwMpyTHx0j2pfWxXeJjR06jBmsDJLOKV4PYhpdJOrs/DpUJEWwIO1azgSDlsBA==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr13446534wrj.320.1586936475586; 
 Wed, 15 Apr 2020 00:41:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 33/59] drm/armada: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:08 +0200
Message-Id: <20200415074034.175360-34-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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
index dd9ed71ed942..2546ff9d1c92 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
