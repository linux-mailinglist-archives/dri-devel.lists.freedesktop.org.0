Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C05714C27
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0AC10E217;
	Mon, 29 May 2023 14:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637710E217
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:36:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso6080075a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685371003; x=1687963003; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=;
 b=hiSqot5Z0TVVzkwYkmdjRaFYGpVkqZ/2l7Z8d2ugq5qKwMiONQBL1+GBaWbf/yIP7z
 CUE1CBJ5ZqXFY9WXRrUezsKC9Wwr8XoT2GKDadeS36vWTMSqxPY4v4SEjYGwJry/LaVq
 /o/qOzl/CNrpF9Or/4l+K6JF4xQQu/hUD3RvCC9UB/2uJ9LOCiZf6xO7Gn4v1hweuYrb
 kRI31ThOkvK8k/B7vfN1rk58gZ+tR0XvafgFGcBCa6m61qLXsXYrYOPFkxnxOZ7IiIE8
 tzUUttynUa0Iqjps+GkZo9CoNZ1Y6KAVVMmAkQ9oB5EyCrBJgYl0n/WOL3A0GatmdRxm
 zVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685371003; x=1687963003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=;
 b=AVO2GeeBHYQHWJyHp4xFf6UT+2oTmj6MzTYtFxIqGsg6HKKXxp3U3RnW7OQIu3UJIf
 0DkwBa47GQm3VcwSt4a6x1x6KY3pPFVc+obBKp7Zo9O8veLIXMBHmMFW/o1ckddJ0GU5
 ZwNRo9SBsHI9wX8J+B17U0BGipPgyPG4/Z4XTlrSGKh8SzpDki5Hl66XyFUSq3ZwbCVE
 jmvCGH8fDiY52hTnCdVmVtNNPd6MVz9CjVkwZW15rfuO9B01ttQ06KD0kBa7eEC2YIQm
 mvs/Bq3A+OYjNoJU9LLn6cGIVgpr2SmT/JeJQ8Ly3O26xHe8LPUEUC1D92ELSbMGkK9b
 ictw==
X-Gm-Message-State: AC+VfDxii5hPRZ6xNWS6v8AymD+0va4WlAUYgXeDMBeZt6wXd1Ca234N
 4f9zdqxKmNqqxKQ7CMW/j97dNg==
X-Google-Smtp-Source: ACHHUZ5waXscvjoYNWcuy+rA2rbzsNFah4xpic6XPGtTh3EC757yb2ISi5VAAB9m/SKenAeW2NEWag==
X-Received: by 2002:a17:907:c1a:b0:973:84af:66e5 with SMTP id
 ga26-20020a1709070c1a00b0097384af66e5mr11058579ejc.40.1685371003383; 
 Mon, 29 May 2023 07:36:43 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 07:36:42 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:31:01 +0200
Subject: [PATCH v4 4/8] drm/mediatek: hdmi: make the cec dev optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-4-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make cec device optional in order to support newer versions of the
hdmi IP which doesn't require it

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c        |  8 +++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 52 +++++++++++++++++++-----------
 2 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 41a7593887fb..4c382aeb94c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -925,10 +925,11 @@ void mtk_hdmi_clk_disable_audio_mt8183(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected;
+	bool connected = true;
 
 	mutex_lock(&hdmi->update_plugged_status_lock);
-	connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	if (hdmi->cec_dev)
+		connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
 	mutex_unlock(&hdmi->update_plugged_status_lock);
@@ -1024,7 +1025,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
+	if (hdmi->cec_dev)
+		mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index ead0c30f55b7..d7f3d29138d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -110,28 +110,18 @@ void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz
 	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
 }
 
-int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
-			    const char *const *clk_names, size_t num_clocks)
+static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
+	int ret;
+	struct device_node *cec_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
-	if (ret) {
-		dev_err(dev, "Failed to get all clks\n");
-		return ret;
-	}
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np) {
 		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
+		return -ENOTSUPP;
 	}
 
 	cec_pdev = of_find_device_by_node(cec_np);
@@ -141,7 +131,6 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
@@ -150,12 +139,39 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
 	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
 	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
+		return PTR_ERR(regmap);
 	if (ret) {
-		dev_err(dev, "Failed to get system configuration registers: %d\n", ret);
-		goto put_device;
+		dev_err(dev,
+				"Failed to get system configuration registers: %d\n", ret);
+		return ret;
 	}
+
 	hdmi->sys_regmap = regmap;
+	hdmi->cec_dev = &cec_pdev->dev;
+
+	return 0;
+}
+
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+			    const char *const *clk_names, size_t num_clocks)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote, *i2c_np;
+	struct resource *mem;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get all clks\n");
+		return ret;
+	}
+
+	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "No CEC node found, continuing without");
+	else if(ret)
+		goto put_device;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {

-- 
2.40.0

