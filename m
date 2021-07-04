Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE23BAC45
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A4089D57;
	Sun,  4 Jul 2021 09:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7AC89D57
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:46 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id w22so10024180pff.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOxt2XSdF8Vu9MaPp0d88r9EWjzv+GLUOgY6jPHdXls=;
 b=gASCchYTm9VBICj74vs9VBQI8rMz+f/n/TQVW6L/6kwO9JUnY2YXoDngVV9QIzxKX4
 Nkgkqe+InQOuPAAof4mlU9NyDNGUjisRh5cOFsLIdKm3CkFLy0O4YZ6mQ2EpuKFCRT07
 +DEQQ+DUPDwa1uCkDVoZ3zpOoj3Sr4VciRcJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOxt2XSdF8Vu9MaPp0d88r9EWjzv+GLUOgY6jPHdXls=;
 b=OPFlU/6tUcv1/xrKLyHZ54DAlsXh4tsnu3F8ZHJ84IwrM4JIdaNqN7u3RT7i/Ucso8
 JLiHNlDV10ZcAvD/pngznHYFMqUstVm/n+yvwXt+QrxT3zBBRYNp/HoXq6lZzIayXlQS
 Rjt1GHvgGiLWKnAfLEpqqptyIojbk8XnOteePF2cFktpVFigel8f9yy7SUcFgle55oR4
 j63SSog8ufGeRQvCavD4PAltKPe9Ucj5bfJm2e0zFfEZNGttSK7aH1ItaU8LD3XYJB9w
 OiCE+vMrfG8hxWLtjPWkZvSqKdOZpLZdtHZobbVOZkosh+aijRWGBJe/vMZojOsrvqEI
 n+JA==
X-Gm-Message-State: AOAM53050cEQykJ3/qXmkRTkkGIPKuVjmLsD3UO5d8FhrXRdXyro/eWt
 rm1FyYytwFxtY/uP7KJ/7iCjmg==
X-Google-Smtp-Source: ABdhPJyejiV8eNBAe9gSXGQ1me1rC7FcvMTscyW/u8Fa2uxpQGpmABNE1xRuSiKNABzT72gTKnRe4Q==
X-Received: by 2002:a65:450d:: with SMTP id n13mr9498245pgq.13.1625389486591; 
 Sun, 04 Jul 2021 02:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:46 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
Date: Sun,  4 Jul 2021 14:32:19 +0530
Message-Id: <20210704090230.26489-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exynos DSI driver is actually a Samsung MIPI DSIM bridge
IP which is also used in i.MX8MM platforms.

Right now the existing driver has some exynos drm specific
code bases like te_irq, crtc and component_ops.

In order to switch this driver into a common bridge driver
We can see 2 options to handle the exynos specific code.

A. Drop the component_ops, and rework other specifics.
   This may lead to more foundation work as it requires
   more changes in exynos drm drivers stack.

B. Handle the exynos specifics via driver data, and make
   the common bridge work in different platforms and plan
   for option A in future.

So, this patch is trying to add option B) changes to handle
exynos specifics via driver_data.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 99a1b8c22313..53d878d4d2d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	bool exynos_specific;
 };
 
 struct exynos_dsi {
@@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
@@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
@@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
@@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
@@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.exynos_specific = true,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
@@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	 * If attached panel device is for command mode one, dsi should register
 	 * TE interrupt handler.
 	 */
-	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+	if (dsi->driver_data->exynos_specific &&
+	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
 		if (ret)
 			return ret;
@@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
+	if (dsi->driver_data->exynos_specific)
+		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
+					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
 
 	mutex_unlock(&drm->mode_config.mutex);
 
@@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-	exynos_dsi_unregister_te_irq(dsi);
+	if (dsi->driver_data->exynos_specific)
+		exynos_dsi_unregister_te_irq(dsi);
 
 	return 0;
 }
@@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (!dsi->driver_data->exynos_specific) {
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
+		if (ret) {
+			dev_err(dev, "failed to register mipi dsi host: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, dsi);
 
 	pm_runtime_enable(dev);
@@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	drm_bridge_add(&dsi->bridge);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
-	if (ret)
-		goto err_disable_runtime;
+	if (dsi->driver_data->exynos_specific) {
+		ret = component_add(dev, &exynos_dsi_component_ops);
+		if (ret)
+			goto err_disable_runtime;
+	}
 
 	return 0;
 
@@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	if (dsi->driver_data->exynos_specific)
+		component_del(&pdev->dev, &exynos_dsi_component_ops);
 
 	return 0;
 }
-- 
2.25.1

