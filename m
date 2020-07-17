Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440222379C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C406ED65;
	Fri, 17 Jul 2020 09:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116136ED65
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w3so16057223wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wn9T+/DnSY96ofYSkqKamlWlLzsjFow5D1KfqhsmZIs=;
 b=EDmiEu0rfSiMa4kCMIRp5tZMVbFCb6gtbfgWhw+78mzIDjlBNe0JoJ3dHR89Kun2GV
 tkjVhvGumLvxj3BmlaVFwn00wJFLOtpZICORw3GpUDnMmKybpyKDND/d9hCtkg05L9Ub
 O0kTgbdV5adwmUDXLx+/U4XxgKlPU31TnQMXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wn9T+/DnSY96ofYSkqKamlWlLzsjFow5D1KfqhsmZIs=;
 b=r7sSr64fcWYRGfm48r4JF8yKzfFalHB5DkUH3tmVo9ypwy9FeqPeTqC8khjrbAPVmw
 H8Vtlq6v7LZGgx9JBns5pqvinzfFnxOZRQybdcMTvL88wxdHGLiYw8RhfXEYTlMMIxRg
 sbTYeC7KOsUOxyW5lNAASukMc80rJnmxjnkyIBMwdylH4dwcHBq2ZP7nnQSwOWX3Ybx/
 ji3iGRVbvs4+uAXp4UENAF3q2lKkcxVGDgR7ta0CsKf3NjugNK1gboAyd6BHtCAzGnva
 KNPL7LXsuFdUL8Gnvy4GZribeZYxNSBvwpO/mkDmd3rU03/mO0xre1vxHSmEvSrfnU+Q
 Qfwg==
X-Gm-Message-State: AOAM533kVLaxcEN4aRIZT/oHs4HdQFrd2iH+ySJvlx+rM5x5dzav/GE9
 yUVaQ6REQzsvGPcsMN2FsiM+YbyqEKA=
X-Google-Smtp-Source: ABdhPJx5ISrNtl5FTFfZyjdxKhbhN8+HsGfuap6rebBTzFUicTozdhcP00P25Q7XNhUNPZDs+kEtdw==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr7769745wmc.146.1594976678411; 
 Fri, 17 Jul 2020 02:04:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/18] drm/arc: Switch to devm_drm_dev_alloc
Date: Fri, 17 Jul 2020 11:04:15 +0200
Message-Id: <20200717090430.1146256-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Need to embedded the drm_device, but for now we keep the usual
  pointer chasing.
- No more devm_kzalloc, which fixes a lifetime issues on driver
  remove.
- No more drm_dev_put, that's done by devm_ now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h     |  1 +
 drivers/gpu/drm/arc/arcpgu_drv.c | 33 +++++++++++++-------------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 6aac44b953ad..cd9e932f501e 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -9,6 +9,7 @@
 #define _ARCPGU_H_
 
 struct arcpgu_drm_private {
+	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct drm_framebuffer	*fb;
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index f164818ec477..68eb4a31c54b 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -42,18 +42,14 @@ static void arcpgu_setup_mode_config(struct drm_device *drm)
 
 DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
 
-static int arcpgu_load(struct drm_device *drm)
+static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
-	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct arcpgu_drm_private *arcpgu;
+	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
 	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
+	struct drm_device *drm = &arcpgu->drm;
 	struct resource *res;
 	int ret;
 
-	arcpgu = devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
-	if (arcpgu == NULL)
-		return -ENOMEM;
-
 	drm->dev_private = arcpgu;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -162,30 +158,28 @@ static struct drm_driver arcpgu_drm_driver = {
 
 static int arcpgu_probe(struct platform_device *pdev)
 {
-	struct drm_device *drm;
+	struct arcpgu_drm_private *arcpgu;
 	int ret;
 
-	drm = drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	arcpgu = devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
+				    struct arcpgu_drm_private, drm);
+	if (IS_ERR(arcpgu))
+		return PTR_ERR(arcpgu);
 
-	ret = arcpgu_load(drm);
+	ret = arcpgu_load(arcpgu);
 	if (ret)
-		goto err_unref;
+		return ret;
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&arcpgu->drm, 0);
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_generic_setup(&arcpgu->drm, 16);
 
 	return 0;
 
 err_unload:
-	arcpgu_unload(drm);
-
-err_unref:
-	drm_dev_put(drm);
+	arcpgu_unload(&arcpgu->drm);
 
 	return ret;
 }
@@ -196,7 +190,6 @@ static int arcpgu_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 	arcpgu_unload(drm);
-	drm_dev_put(drm);
 
 	return 0;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
