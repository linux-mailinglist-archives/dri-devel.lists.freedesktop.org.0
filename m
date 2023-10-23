Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EF7D39BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3303810E1F9;
	Mon, 23 Oct 2023 14:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010110E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:41:08 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7aae07e7ba4so978470241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072067; x=1698676867;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lrjsDP60ERtc9IKYDTr7nIZNfIMcm83JakwGPMNEVVw=;
 b=NGV7huApZt75D0yTEQ87gj07Fi11dTwg8q7/dPbY8bEoofNAaMCTBKDvIUCZRNjMN3
 ji7bUHqZbMhIRBOSQFW69gW3FvBfVKCjUcDXKSolnO1mBiiRWZw7BB3154E3V4iqM2FT
 ObqlSEu3MNn9OsFigD60Flr5BKfr6ngXZrsGKdbCofNAivRTU8iR/4/K0AHH1JrjDCs9
 cTT7DJmfFZ2LGqkdoA3FMHmi4yg7vgiPLmdvomjuMoIdKZW0E3EzPxM9rpt7TNirmqwG
 9D3dyncCTKXBG6W2SnLGcJnNG3ZO+1opPx6/yMwsUsfVt16QDgAEBr9WY0MaeanjnCyS
 Xreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072067; x=1698676867;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lrjsDP60ERtc9IKYDTr7nIZNfIMcm83JakwGPMNEVVw=;
 b=J/puLI4W7ExbBvZ1NHbLvNZF3kAI3dXzhnio6KQLz55N020/U+6dHNP0A1i6Ad4kzv
 xrN64nM7JbF3+/u9HqTEY6zldUnDJlfDyNZB/mxK7CYV4gGgWBVs9RBIpT/KPrGGhKVF
 Kwqe5C/9eU2YYgfFtN2gYZGkhGhGkVaYJIaMgih6MgUXQdEoZZJWt688K3VFakuxq8xo
 eO2cew9+/vJTYAoIr/l3hphSMXUJfeweUiNrskwqkDi6YqEYRcRV8Zj1w0mhPeciB4AD
 Uhq5K+Tr9edC/CwDLbdPLpAa8ZHQAeQXXnPHaGZ4HDcVbnjRf8rgG3zJxMYhumutqtsT
 /uTw==
X-Gm-Message-State: AOJu0YyxQ5gSn8QkOT0n34B3AlRo+KMHHZmqSorMd0jTJP7nxEaBjbVi
 9gkRQ/KGdRmlQrrNQoweloWYDg==
X-Google-Smtp-Source: AGHT+IFCZPHLErko3PXnNt9gQ8dzsRqAd72bTaozBkI3aLRX3aVqekVz0T9UEND3nPPNVWsw1x/D5g==
X-Received: by 2002:a05:6102:2089:b0:458:32f7:30ad with SMTP id
 h9-20020a056102208900b0045832f730admr8598946vsr.24.1698072067569; 
 Mon, 23 Oct 2023 07:41:07 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:41:07 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:14 +0200
Subject: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5504; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=gNNMmG/tic5FCAz01Mxk94pBODEehb9j1DvbosxWwjM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPtvxxoh6jBrTsWy5g9sqziSKeYRBQSeK2X9qj
 pLF6+oGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURTkGD/
 9aHtaIPalJ9hCBJVp5Cm+eMJS63WzvlzUNGpmZTUXItS7gLNhiSr5M9Ygkx2cEbtyjitdJsef3ebnI
 CbVf/pWb3thpVnIj2emA0T4Ft/AvZDt5A69fkPmF0PrrVI1d7IPf336AX5AIsJKIlB+cchIXGi4oOh
 VcSTryoyVCGkKCmID4fVfNyVHV1Fxw1dTipJbS12OvX9fwfCclZHjoikr/B8G6xSopAC66omgAJTbD
 GJ/nV8ATBffGjCldK8zWsdXhnhMdOVG4nJgjN18FH8IgkPRd8e4/U6SX0Qj/NdTphyWitHWxmt8a3J
 2LyqB+lcQ49WBFaLOs7qxG1u1ZCZyElHol4PLbjye0nJdWyNlnMW7yTbODQgwaMpJ4s0/SHlV2+c6o
 4Z0L64Ie/RWZdHX3gXB2q+MZJKcx7lpbST/D3q4GumpmPewlHH95Z8ewyluHzWINNM4FSfWCszIE/a
 I9xFyVeZB1Qo1hzvaVrEj+u9Wtko52r9LNrmvJi+Yds9DdVxwMkDwuPGCF3SdSeEv/sHVvPbrGkXTw
 Ni1R85QW/UwDwmlAqvlu6ntr0MwqOwZ6Qy6BTGrKnXRTfxP9iAlV3E1beT/pOqKF0gY69zplnECvOy
 j9CUjsKAn7VaC/s6pr6m0Yx1QK6UQhrO3tl4u84dpMgDExKgpTM/DcDiEkCQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

MT8365 requires an additional clock for DPI. Add support for that
additional clock.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 50 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2f931e4e2b60..ddd7c54febe6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -70,6 +70,7 @@ struct mtk_dpi {
 	struct device *mmsys_dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -137,6 +138,7 @@ struct mtk_dpi_yc_limit {
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
+ * @is_dpi_clk_req: Support the additionnal DPI clock.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -156,6 +158,7 @@ struct mtk_dpi_conf {
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
+	bool is_dpi_clk_req;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -472,6 +475,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -481,10 +485,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->dpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi clock: %d\n", ret);
+		goto err_refcount;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
-		goto err_refcount;
+		goto err_engine;
 	}
 
 	ret = clk_prepare_enable(dpi->pixel_clk);
@@ -497,6 +507,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -902,6 +914,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -920,6 +933,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -937,6 +951,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8186_conf = {
@@ -969,6 +984,7 @@ static const struct mtk_dpi_conf mt8188_dpintf_conf = {
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -986,6 +1002,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
@@ -1000,6 +1017,25 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.is_dpi_clk_req = false,
+};
+
+static const struct mtk_dpi_conf mt8365_conf = {
+	.cal_factor = mt8183_calculate_factor,
+	.channel_swap_shift = CH_SWAP,
+	.csc_enable_bit = CSC_ENABLE,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.is_ck_de_pol = true,
+	.is_dpi_clk_req = true,
+	.max_clock_khz = 150000,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.output_fmts = mt8183_output_fmts,
+	.pixels_per_iter = 1,
+	.reg_h_fre_con = 0xe0,
+	.support_direct_pin = true,
+	.swap_input_support = true,
+	.yuv422_en_bit = YUV422_EN,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
@@ -1056,6 +1092,17 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(dpi->tvd_clk),
 				     "Failed to get tvdpll clock\n");
 
+	if (dpi->conf->is_dpi_clk_req) {
+		dpi->dpi_clk = devm_clk_get(dev, "dpi");
+		if (IS_ERR(dpi->dpi_clk)) {
+			ret = PTR_ERR(dpi->dpi_clk);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get dpi clock: %d\n", ret);
+
+			return ret;
+		}
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq < 0)
 		return dpi->irq;
@@ -1097,6 +1144,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8188_dpintf_conf },
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ .compatible = "mediatek,mt8365-dpi", .data = &mt8365_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);

-- 
2.25.1

