Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C36249C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666A10E7BD;
	Thu, 10 Nov 2022 18:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA48410E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:41:54 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v17so2220336plo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqU3x9vkbLtjNU1FJh6JVuSWjs+oEr1jyIRFKgRduT4=;
 b=bNT71HdgYJ2TqXy2S3GLLChXs9n4ZgPpLQoEf8E68Ec/wDYI0elP564wPg5ThaoUg1
 n7asMTYqabuRKf3izCMR28b5cb0PzHAX/JzfJrojP5jJgOJ+CzrPZ6NJ6gBmzcAkqu2b
 cWjTeaVRbDHKN3jWtgzlVk0u5iqehYelhhKc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqU3x9vkbLtjNU1FJh6JVuSWjs+oEr1jyIRFKgRduT4=;
 b=AAJRRvDqu7BzSjYiIUTIwtsvFMeC0px5ngMwI3ENSuPuPyyj9lqRRZCQxgDihLW6b2
 Ba/cwY3llp5W6qOlvx+vIRJYLE7Xb7F63a5S/+NWCemDb3Di3pBKW8QQ7ZXg66FSuYLC
 66eHMLSuJcv8pf120mc1JeRSpVE7FlSXzPFqpqWT1nc0+QXLDc/OlMCGC/ycOuTkBB20
 xbQ87DxGfRTFSuY4/T3tjS1rV/rFyl0MT1wPJmXxVHK0v55UPnIjStH/dy5dAF3l7vnh
 GNtAeoXw19hubHpIxEl5XMCPv/MXHuH3T5/v3iWlbwmpB6YMp5PiImdcbTsPX87a1vgK
 keLg==
X-Gm-Message-State: ANoB5pkTI9S21d0zy0f3tkT7ZJw7Ugqc8m63FXnu1vWybTEy0Qdicz3p
 5RQzymOjMItn8WCCDiWlddJvKA==
X-Google-Smtp-Source: AA0mqf5/02XbF54hY7RxiM+Rm+XhHMwHVdF0HFQm0BynH/XxCifCy+W7ni+QA/+HOnPnqu5GV0Pc2g==
X-Received: by 2002:a17:902:c3d1:b0:188:758f:f473 with SMTP id
 j17-20020a170902c3d100b00188758ff473mr25676803plj.113.1668105714235; 
 Thu, 10 Nov 2022 10:41:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:41:53 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v8 14/14] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date: Fri, 11 Nov 2022 00:08:53 +0530
Message-Id: <20221110183853.3678209-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

Add extras to support i.MX8M Plus. The main change is the removal of
HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
the implementation of this IP in i.MX8M Plus is very much compatible
with the i.MX8M Mini/Nano one.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 +++++++++++++++++++++++++-
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 41aa998f5bc4..b31a344ab3bf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -463,6 +463,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1425,10 +1426,17 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 	 * 13.6.2.7.2 RGB interface
 	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
 	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 *
+	 * The i.MX8M Plus glue logic between LCDIFv3 and DSIM does not
+	 * implement the same behavior, therefore LCDIFv3 must generate
+	 * HS/VS/DE signals active HIGH.
 	 */
 	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
 		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	} else if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MP) {
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
 	return 0;
@@ -1461,7 +1469,8 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 	 * Passing NULL to the previous bridge makes Exynos DSI drivers
 	 * work which is exactly done before.
 	 */
-	if (!(dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM))
+	if (dsi->plat_data->hw_type != SAMSUNG_DSIM_TYPE_IMX8MM &&
+	    dsi->plat_data->hw_type != SAMSUNG_DSIM_TYPE_IMX8MP)
 		previous = NULL;
 
 	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, previous,
@@ -1662,6 +1671,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1751,6 +1764,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
@@ -1857,11 +1872,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
 	.host_ops = &samsung_dsim_generic_host_ops,
 };
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mp_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MP,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "fsl,imx8mm-mipi-dsim",
 		.data = &samsung_dsim_imx8mm_pdata,
 	},
+	{
+		.compatible = "fsl,imx8mp-mipi-dsim",
+		.data = &samsung_dsim_imx8mp_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index df3d030daec6..3789f9dbb238 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -28,6 +28,7 @@ enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS5422,
 	SAMSUNG_DSIM_TYPE_EXYNOS5433,
 	SAMSUNG_DSIM_TYPE_IMX8MM,
+	SAMSUNG_DSIM_TYPE_IMX8MP,
 	SAMSUNG_DSIM_TYPE_COUNT,
 };
 
-- 
2.25.1

