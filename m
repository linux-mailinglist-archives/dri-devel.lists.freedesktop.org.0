Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AA1A94E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CF46E8E3;
	Wed, 15 Apr 2020 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93D56E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t14so4649975wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRatY+F67aXqhaX4hT+qBcw2kGGTk2t0/Bm3puPQZCA=;
 b=kOJrWw/4js1cp1aXjXSVPq3jgc+DbH4EXbhaff5AgL+jJGpOa0STmRLuvLn2TK6H0u
 tsw6nsBDQxqgGIki/S29PP83YlrJ8FluNeFuVCIXb8Lmc5Y02dh312JTxILtNkuHTjEa
 XJ9oxyUQ2oMRFO0TxvdZVWizykYiSOhcF8jbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRatY+F67aXqhaX4hT+qBcw2kGGTk2t0/Bm3puPQZCA=;
 b=QBpP8aICejMZtfwY+WXvs+pkMAH0jw+eTpbQ/P6TA9nxWSVqdfCC9FylnFtb7PUtk4
 vQCnt6BEjP59kJyB3ZzR25Xp+kpFs39CrKqUXHO1ukTjNrOIr9SVrxrxxO+92yHi+6TV
 JZA0u81+KoGfSY3NT+l+GjU3NSBsPzQTUdcvglmUIM3pWCo9v/+Or+5f3BYf4tYhXwIm
 zZs6n4o5Zk9NW1A5tyl6IPD4Qdr4+0vwXekDyNWB6DgFnXRXpMWQR/X5f5XVVcuMFrPC
 IcoTG5Gzk3yqiqRXkUMwgScd6KIe8RDtc6T+bfvlOKTmqa9YsAiBLXXgQX8YMzBwc8aE
 Q6Cw==
X-Gm-Message-State: AGi0PuYAKD5HFejd+hhksFw5kXi01f/STFTYpdYftrznlKAM0iKFoIe8
 wUlhxD1FA4rNWEoOO6ab0GcMcA==
X-Google-Smtp-Source: APiQypKbcmyrepnoF8CDc2wkeZUMxmBWJgmUdz65RQKSdQwaEZ9GASFGOe6TNrSvJnxSk/VexO+Zgw==
X-Received: by 2002:adf:b344:: with SMTP id k4mr17735067wrd.76.1586936496578; 
 Wed, 15 Apr 2020 00:41:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 55/59] drm/aspeed: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:30 +0200
Message-Id: <20200415074034.175360-56-daniel.vetter@ffwll.ch>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As usual, we can drop the drm_dev_put() and need to embed the
drm_device. Since it's so few, also go right ahead and leave
drm_device->dev_private set to NULL, so that we always use the
container_of() upcast, which is faster anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  2 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 31 +++++++++---------------
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c  |  2 +-
 4 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index adc02940de6f..e7ca95827ae8 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -5,6 +5,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
+	struct drm_device		drm;
 	void __iomem			*base;
 	struct clk			*clk;
 	struct reset_control		*rst;
@@ -13,6 +14,7 @@ struct aspeed_gfx {
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
 };
+#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 2184b8be6fd4..e54686c31a90 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -231,7 +231,7 @@ static const uint32_t aspeed_gfx_formats[] = {
 
 int aspeed_gfx_create_pipe(struct drm_device *drm)
 {
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 
 	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
 					    aspeed_gfx_formats,
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index ada2f6aca906..6b27242b9ee3 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -77,7 +77,7 @@ static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 {
 	struct drm_device *drm = data;
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	u32 reg;
 
 	reg = readl(priv->base + CRT_CTRL1);
@@ -96,15 +96,10 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct aspeed_gfx *priv;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct resource *res;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-	drm->dev_private = priv;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->base = devm_ioremap_resource(drm->dev, res);
 	if (IS_ERR(priv->base))
@@ -187,8 +182,6 @@ static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
-
-	drm->dev_private = NULL;
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
@@ -216,27 +209,26 @@ static const struct of_device_id aspeed_gfx_match[] = {
 
 static int aspeed_gfx_probe(struct platform_device *pdev)
 {
-	struct drm_device *drm;
+	struct aspeed_gfx *priv;
 	int ret;
 
-	drm = drm_dev_alloc(&aspeed_gfx_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	priv = devm_drm_dev_alloc(&pdev->dev, &aspeed_gfx_driver,
+				  struct aspeed_gfx, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
-	ret = aspeed_gfx_load(drm);
+	ret = aspeed_gfx_load(&priv->drm);
 	if (ret)
-		goto err_free;
+		return ret;
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&priv->drm, 0);
 	if (ret)
 		goto err_unload;
 
 	return 0;
 
 err_unload:
-	aspeed_gfx_unload(drm);
-err_free:
-	drm_dev_put(drm);
+	aspeed_gfx_unload(&priv->drm);
 
 	return ret;
 }
@@ -247,7 +239,6 @@ static int aspeed_gfx_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
-	drm_dev_put(drm);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
index 67ee5fa10055..6759cb88415a 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
@@ -28,7 +28,7 @@ static const struct drm_connector_funcs aspeed_gfx_connector_funcs = {
 
 int aspeed_gfx_create_output(struct drm_device *drm)
 {
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	int ret;
 
 	priv->connector.dpms = DRM_MODE_DPMS_OFF;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
