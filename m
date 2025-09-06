Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4460B46DAE
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061810E376;
	Sat,  6 Sep 2025 13:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="imHACpXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D2610E374
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:17:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55f7039aa1eso3399827e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757164638; x=1757769438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
 b=imHACpXyS9Ubb78E5ZMVsr6dG7uYFC1yhFZ69S+75y+Q9G10V6DsCsAec0t9pP1fb5
 R3uZqKpIgnwOVpyvchbLnLJhXUZDQG5j9gICcvaaC/YwgsDSA26u8fmy98w70bBvJdOx
 Mp72mrko5+5havqCB1lz5SNCYRL8ZAi9tk4NQusDAw8X8+5KSRMcUzhYdOAA4NuiC4Lf
 HK74TgpJvhxho19Ubv+QFJIMeE5HJPwmTgCDJrArz7iZTDcFONIOB71XVvrQWtpZTmYi
 VbPaDH4HTVZ2bL+EW3o6CO2LKqrQhukmwp8iEnGNpBlgDzp9zg6pWFfLwWKHPzfPkxb/
 ylGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757164638; x=1757769438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
 b=siQY+Dy7WXb9B48+9GuBn5kcf/EPSKCVn/WHvxna55I8d7u9XZT39ZXVN7so/q/Miw
 49LDCeSY93fQiNhgqGM+i9zIWmmpzGfr8uXQO3fxIVZYHGzXJZPE2Va/Xbv9Tt/bm1Le
 ojA/o9ti0HeKqtj5jdtcOFn0d6HNSqoswcOK52J+eNVZdAthfJnEy4LHYtIh5IrR6Ay/
 DTYizGFEUkMgE6yY6tVO1oNrqsKDvpU1KniYfPeFQDckX1fsd9Qwq11ItK532q/Kgfrs
 FfluUwTU0jXw6FJQxxpF6sU6g6YAF6ScEYp/oLv3L8gac8xf7ZWdXWPW7a3UcYc9aL7q
 UwSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmW7fsPHoAe8//+nZPFbF/YCoeCMMiPHgHB9fco4O0/PvGjTVbLV1LlzBnZ+GN2bNKjXLsrkJ+w0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjDaOs+MrMKQf7sRFglkzLntdarbXAWOcBi6zgpI6LV5689Lul
 qlM9W2VMGSRmGi5+Hou/q9JepcBImeASAHt/49WEts4voI76V+drd8ok
X-Gm-Gg: ASbGnct5FSRPBgZRGGOZMMcdVQA8wS5JXSZiZDpqqUaRagpRyptf7tJzAo3Zbn/QMCL
 KVqXE0dhewYOHpIJJ6EHbO+PoqXZE0RhaCDo4VWa3biLvXAaLUKRaOKquUoxs1l/Z4nTXFK1SR2
 I9MEyrOupM0omKLO4mDXCB+390gp3p/KN5hiqGGy2hIMESRdtF8BmXI/JZdGOjwka3rK4Fb6kWb
 iAR8BmNmBL4D9LI2sJnxJgKmanInJDOKQXmO34/WFfWNOkZV7rSz6vIFstWLYEANPkqnJvStxB/
 0R+Lkl5sUHrpttUSBp2sPvtwOOI0ozowXnYv+/6tgqbkQ2MoeXrE5H6zZiR1O7RHleYEiASJWzK
 m2WPP/zRH5ISgfQ==
X-Google-Smtp-Source: AGHT+IHuGyverWPNj4Hu1YTQ/zo56Y1If/zSPVQaOxTnkb+VtXRvZTBbgrkuQRhGTZMWyOH4OfOAkw==
X-Received: by 2002:a05:6512:3daa:b0:560:89e3:2a0 with SMTP id
 2adb3069b0e04-5625f536171mr604044e87.11.1757164638112; 
 Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:17:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:54 +0300
Message-ID: <20250906131655.239340-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra20 and Tegra30 are fully compatible with existing tegra DSI driver
apart from clock configuration and PAD calibration which are addressed by
this patch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c |  2 +
 drivers/gpu/drm/tegra/dsi.c | 88 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/dsi.h | 15 +++++++
 3 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..5d64cd57e764 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1x_drm_suspend,
 
 static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-dc", },
+	{ .compatible = "nvidia,tegra20-dsi", },
 	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ .compatible = "nvidia,tegra20-gr2d", },
 	{ .compatible = "nvidia,tegra20-gr3d", },
 	{ .compatible = "nvidia,tegra30-dc", },
+	{ .compatible = "nvidia,tegra30-dsi", },
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra30-gr3d", },
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 8e80c7efe8b4..d079aa7d2a85 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -53,6 +53,10 @@ to_dsi_state(struct drm_connector_state *state)
 	return container_of(state, struct tegra_dsi_state, base);
 }
 
+struct tegra_dsi_config {
+	u32 dsi_version;
+};
+
 struct tegra_dsi {
 	struct host1x_client client;
 	struct tegra_output output;
@@ -82,6 +86,8 @@ struct tegra_dsi {
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
+
+	const struct tegra_dsi_config *config;
 };
 
 static inline struct tegra_dsi *
@@ -663,39 +669,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 {
 	u32 value;
 
-	value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	if (dsi->config->dsi_version == TEGRA_DSI_V1) {
+		/*
+		 * XXX Is this still needed? The module reset is deasserted right
+		 * before this function is called.
+		 */
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
+
+		value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+
+		value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
+			DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
+			DSI_PAD_OUT_CLK(0x0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
+
+		value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
+			DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
+	} else {
+		value = DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_LPDNADJ(0x1) |
+			DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) |
+			DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_PDIO(0) |
+			DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	}
 
 	return 0;
 }
 
 static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 {
-	u32 value;
 	int err;
 
-	/*
-	 * XXX Is this still needed? The module reset is deasserted right
-	 * before this function is called.
-	 */
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
-
 	/* start calibration */
 	tegra_dsi_pad_enable(dsi);
 
-	value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
-		DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
-		DSI_PAD_OUT_CLK(0x0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
-
-	value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
-		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
-
 	err = tegra_mipi_start_calibration(dsi->mipi);
 	if (err < 0)
 		return err;
@@ -1577,6 +1590,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
+	dsi->config = of_device_get_match_data(&pdev->dev);
 	dsi->output.dev = dsi->dev = &pdev->dev;
 	dsi->video_fifo_depth = 1920;
 	dsi->host_fifo_depth = 64;
@@ -1615,7 +1629,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1636,10 +1650,12 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	err = tegra_dsi_setup_clocks(dsi);
-	if (err < 0) {
-		dev_err(&pdev->dev, "cannot setup clocks\n");
-		goto remove;
+	if (dsi->config->dsi_version == TEGRA_DSI_V1) {
+		err = tegra_dsi_setup_clocks(dsi);
+		if (err < 0) {
+			dev_err(&pdev->dev, "cannot setup clocks\n");
+			goto remove;
+		}
 	}
 
 	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1703,11 +1719,21 @@ static void tegra_dsi_remove(struct platform_device *pdev)
 	tegra_mipi_free(dsi->mipi);
 }
 
+static const struct tegra_dsi_config tegra20_dsi_config = {
+	.dsi_version = TEGRA_DSI_V0,
+};
+
+static const struct tegra_dsi_config tegra114_dsi_config = {
+	.dsi_version = TEGRA_DSI_V1,
+};
+
 static const struct of_device_id tegra_dsi_of_match[] = {
-	{ .compatible = "nvidia,tegra210-dsi", },
-	{ .compatible = "nvidia,tegra132-dsi", },
-	{ .compatible = "nvidia,tegra124-dsi", },
-	{ .compatible = "nvidia,tegra114-dsi", },
+	{ .compatible = "nvidia,tegra210-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra132-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra124-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra114-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra30-dsi", .data = &tegra20_dsi_config },
+	{ .compatible = "nvidia,tegra20-dsi", .data = &tegra20_dsi_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
index f39594e65e97..5049ec7813c7 100644
--- a/drivers/gpu/drm/tegra/dsi.h
+++ b/drivers/gpu/drm/tegra/dsi.h
@@ -95,6 +95,16 @@
 #define DSI_TALLY_LRX(x)		(((x) & 0xff) <<  8)
 #define DSI_TALLY_HTX(x)		(((x) & 0xff) <<  0)
 #define DSI_PAD_CONTROL_0		0x4b
+/* DSI V0 */
+#define DSI_PAD_CONTROL_PULLDN_ENAB(x)	(((x) & 0x1) << 28)
+#define DSI_PAD_CONTROL_SLEWUPADJ(x)	(((x) & 0x7) << 24)
+#define DSI_PAD_CONTROL_SLEWDNADJ(x)	(((x) & 0x7) << 20)
+#define DSI_PAD_CONTROL_PREEMP_EN(x)	(((x) & 0x1) << 19)
+#define DSI_PAD_CONTROL_PDIO_CLK(x)	(((x) & 0x1) << 18)
+#define DSI_PAD_CONTROL_PDIO(x)		(((x) & 0x3) << 16)
+#define DSI_PAD_CONTROL_LPUPADJ(x)	(((x) & 0x3) << 14)
+#define DSI_PAD_CONTROL_LPDNADJ(x)	(((x) & 0x3) << 12)
+/* DSI V1 */
 #define DSI_PAD_CONTROL_VS1_PDIO(x)	(((x) & 0xf) <<  0)
 #define DSI_PAD_CONTROL_VS1_PDIO_CLK	(1 <<  8)
 #define DSI_PAD_CONTROL_VS1_PULLDN(x)	(((x) & 0xf) << 16)
@@ -140,4 +150,9 @@ enum tegra_dsi_format {
 	TEGRA_DSI_FORMAT_24P,
 };
 
+enum tegra_dsi_version {
+	TEGRA_DSI_V0,
+	TEGRA_DSI_V1,
+};
+
 #endif
-- 
2.48.1

