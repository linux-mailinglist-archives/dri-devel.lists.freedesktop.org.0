Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A7790425
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706110E80D;
	Fri,  1 Sep 2023 23:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9010E7F4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:33 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68a4bcf8a97so1906406b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611752; x=1694216552;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xwlQKSbvtJNXAzlNyEq/ahWjOdZU7CV+KOcQ65YIkM=;
 b=Q8MH49mbnVMgjphqdMU+2GRMS8W05FsTKdC5ab1uYF5SnpEfDk71/rkUMBUfLkpe70
 RXGg/xikiz8TlQLEyFHd3lpdPTASfl+OceSfEqIFVOnRR9F0Qs+ZGPis74qWH/v7oJAO
 XxY4Ow8JPXYc/a7ODHdyKJdVogA4OH508yoqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611752; x=1694216552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xwlQKSbvtJNXAzlNyEq/ahWjOdZU7CV+KOcQ65YIkM=;
 b=U96luXEKBireNqbTIEqvsFJm2LXsWN5OvE2fOeD+rY0+lBP9Mv3Xqi6zqw71i11DXP
 Cko1iuSSXwuYNspB0lccuotasNDbn4OqXkxqu3RdRM/K8lDkSRY0lwGtKi5RAiLbW6Qi
 vjKOBXAdnvzDa8DgMII/Fv6urCV39GqA3x+8m0G35B5dypuXDtT5lAz6LW3cm9nacKQV
 oN4bT31wjTx9Kbcu7gdViukWTGsRCxJbFPQVaOyu3d/B+PhqdGh0Pj89yQinlrrnxvqr
 zcD7+IImRQYWY3fx+Mftmq/yHh/lByLtD3gg3zcFLdGckYFJHYSdZD0ACRhxgXtRUoaq
 vZrg==
X-Gm-Message-State: AOJu0YyooMWyYQ11iU+r231JOoIl/I3CoWG3lwTL0/wv+FO3n/EsWTPJ
 uAWtAXkw5vF0NpSNra1dky2UVvJ67wF8EPaNokkX9snO
X-Google-Smtp-Source: AGHT+IGfL6uqts2F3xQJXwlYG+LNTYjXpiNnutEBct9PU2CYaFs2opMUSGjfnS0VF4YFDV8NxqnnXA==
X-Received: by 2002:a05:6a00:2d99:b0:68c:431e:6490 with SMTP id
 fb25-20020a056a002d9900b0068c431e6490mr4989342pfb.1.1693611751966; 
 Fri, 01 Sep 2023 16:42:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:14 -0700
Message-ID: <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, paul@crapouillou.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Since this driver uses the component model and shutdown happens at the
base driver, we communicate whether we have to call
drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

NOTE: this patch touches a lot more than other similar patches since
the bind() function is long and we want to make sure that we unset the
drvdata if bind() fails.

While making this patch, I noticed that the bind() function of this
driver is using "devm" and thus assumes it doesn't need to do much
explicit error handling. That's actually a bug. As per kernel docs [1]
"the lifetime of the aggregate driver does not align with any of the
underlying struct device instances. Therefore devm cannot be used and
all resources acquired or allocated in this callback must be
explicitly released in the unbind callback". Fixing that is outside
the scope of this commit.

[1] https://docs.kernel.org/driver-api/component.html

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 66 +++++++++++++++--------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 8dbd4847d3a6..51995a0cd568 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1130,7 +1130,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		return ret;
+		goto err_drvdata;
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
@@ -1142,7 +1142,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base)) {
 		dev_err(dev, "Failed to get memory resource\n");
-		return PTR_ERR(base);
+		ret = PTR_ERR(base);
+		goto err_drvdata;
 	}
 
 	regmap_config = ingenic_drm_regmap_config;
@@ -1151,33 +1152,40 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 					  &regmap_config);
 	if (IS_ERR(priv->map)) {
 		dev_err(dev, "Failed to create regmap\n");
-		return PTR_ERR(priv->map);
+		ret = PTR_ERR(priv->map);
+		goto err_drvdata;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_drvdata;
+	}
 
 	if (soc_info->needs_dev_clk) {
 		priv->lcd_clk = devm_clk_get(dev, "lcd");
 		if (IS_ERR(priv->lcd_clk)) {
 			dev_err(dev, "Failed to get lcd clock\n");
-			return PTR_ERR(priv->lcd_clk);
+			ret = PTR_ERR(priv->lcd_clk);
+			goto err_drvdata;
 		}
 	}
 
 	priv->pix_clk = devm_clk_get(dev, "lcd_pclk");
 	if (IS_ERR(priv->pix_clk)) {
 		dev_err(dev, "Failed to get pixel clock\n");
-		return PTR_ERR(priv->pix_clk);
+		ret = PTR_ERR(priv->pix_clk);
+		goto err_drvdata;
 	}
 
 	priv->dma_hwdescs = dmam_alloc_coherent(dev,
 						sizeof(*priv->dma_hwdescs),
 						&priv->dma_hwdescs_phys,
 						GFP_KERNEL);
-	if (!priv->dma_hwdescs)
-		return -ENOMEM;
+	if (!priv->dma_hwdescs) {
+		ret = -ENOMEM;
+		goto err_drvdata;
+	}
 
 	/* Configure DMA hwdesc for foreground0 plane */
 	ingenic_drm_configure_hwdesc_plane(priv, 0);
@@ -1199,7 +1207,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to register plane: %i\n", ret);
-		return ret;
+		goto err_drvdata;
 	}
 
 	if (soc_info->map_noncoherent)
@@ -1211,7 +1219,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 					NULL, &ingenic_drm_crtc_funcs, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to init CRTC: %i\n", ret);
-		return ret;
+		goto err_drvdata;
 	}
 
 	drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
@@ -1230,7 +1238,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		if (ret) {
 			dev_err(dev, "Failed to register overlay plane: %i\n",
 				ret);
-			return ret;
+			goto err_drvdata;
 		}
 
 		if (soc_info->map_noncoherent)
@@ -1241,17 +1249,18 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			if (ret) {
 				if (ret != -EPROBE_DEFER)
 					dev_err(dev, "Failed to bind components: %i\n", ret);
-				return ret;
+				goto err_drvdata;
 			}
 
 			ret = devm_add_action_or_reset(dev, ingenic_drm_unbind_all, priv);
 			if (ret)
-				return ret;
+				goto err_drvdata;
 
 			priv->ipu_plane = drm_plane_from_index(drm, 2);
 			if (!priv->ipu_plane) {
 				dev_err(dev, "Failed to retrieve IPU plane\n");
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_drvdata;
 			}
 		}
 	}
@@ -1263,7 +1272,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 				break; /* we're done */
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get bridge handle\n");
-			return ret;
+			goto err_drvdata;
 		}
 
 		if (panel)
@@ -1275,7 +1284,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		if (IS_ERR(ib)) {
 			ret = PTR_ERR(ib);
 			dev_err(dev, "Failed to init encoder: %d\n", ret);
-			return ret;
+			goto err_drvdata;
 		}
 
 		encoder = &ib->encoder;
@@ -1290,13 +1299,14 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			dev_err(dev, "Unable to attach bridge\n");
-			return ret;
+			goto err_drvdata;
 		}
 
 		connector = drm_bridge_connector_init(drm, encoder);
 		if (IS_ERR(connector)) {
 			dev_err(dev, "Unable to init connector\n");
-			return PTR_ERR(connector);
+			ret = PTR_ERR(connector);
+			goto err_drvdata;
 		}
 
 		drm_connector_attach_encoder(connector, encoder);
@@ -1313,13 +1323,13 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	ret = devm_request_irq(dev, irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
 	if (ret) {
 		dev_err(dev, "Unable to install IRQ handler\n");
-		return ret;
+		goto err_drvdata;
 	}
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret) {
 		dev_err(dev, "Failed calling drm_vblank_init()\n");
-		return ret;
+		goto err_drvdata;
 	}
 
 	drm_mode_config_reset(drm);
@@ -1327,7 +1337,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	ret = clk_prepare_enable(priv->pix_clk);
 	if (ret) {
 		dev_err(dev, "Unable to start pixel clock\n");
-		return ret;
+		goto err_drvdata;
 	}
 
 	if (priv->lcd_clk) {
@@ -1402,6 +1412,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		clk_disable_unprepare(priv->lcd_clk);
 err_pixclk_disable:
 	clk_disable_unprepare(priv->pix_clk);
+err_drvdata:
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -1422,6 +1434,7 @@ static void ingenic_drm_unbind(struct device *dev)
 
 	drm_dev_unregister(&priv->drm);
 	drm_atomic_helper_shutdown(&priv->drm);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops ingenic_master_ops = {
@@ -1461,6 +1474,14 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void ingenic_drm_shutdown(struct platform_device *pdev)
+{
+	struct ingenic_drm *priv = platform_get_drvdata(pdev);
+
+	if (priv)
+		drm_atomic_helper_shutdown(&priv->drm);
+}
+
 static int ingenic_drm_suspend(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
@@ -1612,6 +1633,7 @@ static struct platform_driver ingenic_drm_driver = {
 	},
 	.probe = ingenic_drm_probe,
 	.remove = ingenic_drm_remove,
+	.shutdown = ingenic_drm_shutdown,
 };
 
 static int ingenic_drm_init(void)
-- 
2.42.0.283.g2d96d420d3-goog

