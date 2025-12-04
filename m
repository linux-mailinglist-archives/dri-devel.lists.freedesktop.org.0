Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37ECA27DA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32C510E84F;
	Thu,  4 Dec 2025 06:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBNSwnQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0333910E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:17:17 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b735e278fa1so97969566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764829035; x=1765433835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
 b=IBNSwnQg6z4v50r9YMjUs1JjkRw1oolDKK53C/ZKglngtGwKM6gCUCDmi1lpW2DldL
 yOZPEOgNWLzmWu0zkfQpwfcAYntTH5hIu5KLsgO3FMxscd0Phoq05XEdeCC2VP5IUksG
 a0t6iFwB0lL9wq4L/HuDnOiwBBX0zE0aUnqozg6VgusXd7rpAaWHWgSvODjKnn3n4Njd
 6zfNxYLqIhHKnH7SoiIOQpylFp4heq16G7TdqQQfFmem6dLDaqYF4S6xl8zJ5w5pziWX
 TcOw0E45TemmnbWFwZd2aU6Yu9j0NiQEjTPIhcaCyPxkDrPL/oDzoaYRWoEYvvqw1Y74
 DXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764829035; x=1765433835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
 b=EpYn9k5mtLFUwquXk0XhMDqU42Wn0hlrA8SKcH1t56HYGFjunl5SHr9tgjh9PTbVgM
 97sJ732naCcGvKxLn4cc0DcBRFxkOB4189XgomXoVvAzXkvTOLTuODMtCWUrQEvIvsKY
 Q+RIJCBCeE1B0/ppUIR8tjIJRw/Sq3YAEPBLdOHWFfr2lDopJk+jm9ASVP2lRwDI+weC
 3xul6zin/pfLa/cFoHxajKbGo9e+nom5uB7tozSDq5voA4YNH6XQm09j8R4TiGXKvmfW
 Zp5ddcYhE7+LkIbkacgx/dJbNkAQg2VqEfNy4MX9Pp5chZTodmf0dwdaWZJwosnRduCT
 bv2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVokHClBbfWb6TyW9Q5W6aw9gDBW1kh6hoYPWsBANYY+kSJoP44jhoWLFoJy/B3Vr0QtqshPyZcPJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGK1rVZ4F+beovobJCkI06c4XfDOdV8n29dn66rYZxLEhE4R4Q
 3X/3pA4u9tN5OKWklNwAa3eDhq7LDasK09AwQKXfTJ3fF9W1BYhU4Udh
X-Gm-Gg: ASbGncsVc8QbZlI8VTEiYZjb/OmquYz8e0XPsx9kVonsgjh3MEy5J+PPMHoSt7c/jBn
 R3LFbgqs9gdSWwBU2KOv+X333wWbmop63ZONWo77AVN2kd1uta5hPIUqDKhCTxJVCVB4pZqX98n
 0iYuZdQpj8H5tWT9cf6zKKw3OxxhWH8RBpLsma9MpbtRgRL7hTUpJPeijx0ER3Nn6/BaKYrcn7q
 B+YWpuSVV5Zmb9L290wDLqmJWm+zSwL23ns+fKq+aC8+jDmpY5O9xigWxKfDu4Xclzj3rtXX/mM
 PUy5l2EabPPmTWFr/k4eTG1hCIq94OdJKIrP2yIjJoVyJy6ehKdEVqF3LhhGu6GpdI7rJanxClz
 CpKcgIEAYzRksqBm/ebao1kRJJCbKn+Ws9CXqHXONqoisFnMoZex80LiiBLiWXDebdBOWz9Ljxl
 5K7CkqfnWgxw==
X-Google-Smtp-Source: AGHT+IGGRcCBn7dDmnJ9YtWI4tOlSL4ai8HDBzVnkC7QNxtJAImhu/v/dhsGR+njm+E47PKBNIF3OQ==
X-Received: by 2002:a17:906:794a:b0:b72:af1f:af7d with SMTP id
 a640c23a62f3a-b79ec674170mr204057766b.29.1764829035144; 
 Wed, 03 Dec 2025 22:17:15 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:17:14 -0800 (PST)
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
Subject: [PATCH v2 3/4 RESEND] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:17:02 +0200
Message-ID: <20251204061703.5579-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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

