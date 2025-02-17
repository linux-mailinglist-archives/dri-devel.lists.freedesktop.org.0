Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB1A38834
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517010E530;
	Mon, 17 Feb 2025 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ap2KaAjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD0110E528
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739807409;
 bh=9/UvUugjaIhzOoRjRkTipA0ffDunnaqfiEIVZnDjdaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ap2KaAjZuyXnTKvrBDJoN16h+ZWd7KPnqBrr95w5tDQR7zOmOWte0tgR0NtnjBAje
 32gz8kzOPIE8Ln5BIBFAXf2uOWCvsgmB0xFmvF8Qov6p4fy7Iw7u2E3m68Hto4I2jq
 9wgXzab+pdBTCYoRJYwGiQudS9TEaC3qz8FjC/e1vn31xibUQWp++FKT1tntswyEFn
 B7wpQVDjPWcWujm66KC74dnolvgiV0667EZWKI4v7cu7hX6eTfnFUKVmvOiPhOXFqh
 JFqd2ocdqoq/7Y1xnO2FdS8Xo3yBE8F9NN4WVT2oyw9t+QVugp8/jnlpb8/hZACZIq
 VXp1eEiTT8eWQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4631217E156B;
 Mon, 17 Feb 2025 16:50:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v7 35/43] drm/mediatek: mtk_hdmi: Add HDMI IP version
 configuration to pdata
Date: Mon, 17 Feb 2025 16:48:28 +0100
Message-ID: <20250217154836.108895-36-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
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

In preparation for adding a driver for the HDMIv2 IP and before
moving the common bits out of this driver, add a new structure
`mtk_hdmi_ver_conf`, holding pointers to HDMI IP version specific
drm_bridge_funcs, hdmi_codec_ops and clock array used for probe,
and nest it into the mtk_hdmi_conf platform data structure.

While at it, also convert all of the direct users of
mtk_hdmi_bridge_funcs, mtk_hdmi_audio_codec_ops, mtk_hdmi_clk_names
to use pointers from the ver_conf platform data.

In order to do so, it was also necessary to fill a new version 1
specific const `mtk_hdmi_v1_ver_conf` and assign it to all of the
currently supported compatibles for this driver.

This commit brings no functional change.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 36 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 66a08eedef44..aaed901ef053 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -144,7 +144,15 @@ struct hdmi_audio_param {
 	struct hdmi_codec_params codec_params;
 };
 
+struct mtk_hdmi_ver_conf {
+	const struct drm_bridge_funcs *bridge_funcs;
+	const struct hdmi_codec_ops *codec_ops;
+	const char * const *mtk_hdmi_clock_names;
+	int num_clocks;
+};
+
 struct mtk_hdmi_conf {
+	const struct mtk_hdmi_ver_conf *ver_conf;
 	bool tz_disabled;
 	bool cea_modes_only;
 	unsigned long max_mode_clock;
@@ -1605,7 +1613,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
-		.ops = &mtk_hdmi_audio_codec_ops,
+		.ops = hdmi->conf->ver_conf->codec_ops,
 		.max_i2s_channels = 2,
 		.i2s = 1,
 		.data = hdmi,
@@ -1638,6 +1646,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 
 static int mtk_hdmi_probe(struct platform_device *pdev)
 {
+	const struct mtk_hdmi_ver_conf *ver_conf;
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
 	const int num_clocks = MTK_HDMI_CLK_COUNT;
@@ -1649,12 +1658,14 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->dev = dev;
 	hdmi->conf = of_device_get_match_data(dev);
+	ver_conf = hdmi->conf->ver_conf;
 
-	hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	hdmi->clk = devm_kcalloc(dev, ver_conf->num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
 	if (!hdmi->clk)
 		return -ENOMEM;
 
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, ver_conf->mtk_hdmi_clock_names,
+				      ver_conf->num_clocks);
 	if (ret)
 		return ret;
 
@@ -1671,7 +1682,7 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to register audio driver\n");
 
-	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
+	hdmi->bridge.funcs = ver_conf->bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
@@ -1716,19 +1727,32 @@ static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
+static const struct mtk_hdmi_ver_conf mtk_hdmi_v1_ver_conf = {
+	.bridge_funcs = &mtk_hdmi_bridge_funcs,
+	.codec_ops = &mtk_hdmi_audio_codec_ops,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names,
+	.num_clocks = ARRAY_SIZE(mtk_hdmi_clk_names)
+};
+
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
-	.max_mode_clock = 148500,
 	.cea_modes_only = true,
+	.max_mode_clock = 148500,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct of_device_id mtk_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi", .data = &mtk_hdmi_conf_mt2701 },
 	{ .compatible = "mediatek,mt8167-hdmi", .data = &mtk_hdmi_conf_mt8167 },
-	{ .compatible = "mediatek,mt8173-hdmi" },
+	{ .compatible = "mediatek,mt8173-hdmi", .data = &mtk_hdmi_conf_mt8173 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
-- 
2.48.1

