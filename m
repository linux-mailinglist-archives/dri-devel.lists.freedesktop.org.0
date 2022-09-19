Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DC5BD2FB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1306B10E0A9;
	Mon, 19 Sep 2022 17:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6910E071
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a26so143586ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=HLkgjmfUQZXrBufYXmW5V+FjpCBTnrnJRl8bPfgjGi0=;
 b=iCp4PRqRut8ldEn6iFDY5780nxcwQxypuEqbmfTvfX+LeaUV0TBlilns6GCWIlnwrq
 CiunYZfYC1IndkJR3gnSQ4FcJF4TiUnJYlWWbk6h+p035qcTxa1oHPK+O+pAuXcCXMw1
 LMpjCRzZR/vSqVIB7Ng/g+wzpRJhyDQ1tAyyRG6ag7jXkiGaWcAQBDPrZHK6tIPuir3i
 FJelQbDn/dhuzkO0e0r6jNWMX2zLGGvK8DS59YGysg/RVD7XXX6JNM7WRoaEE5ppbj+r
 FD+ecJG4zoLcLkbU/ZVidIhIdeppq99UGS7J0oDwTXyZQkt5err89RZjpn5BCdJ5atTZ
 F5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HLkgjmfUQZXrBufYXmW5V+FjpCBTnrnJRl8bPfgjGi0=;
 b=7spPw7L0u0xynh4Koybi0CMvSguCnsHQMd9wQPs3e8lMe+Z+RdoQkOVPh/qYt4fnjo
 nGB8y9wVZHicUaBasyNcl6747+oA5xQ5CTBgYhETu9zaMuOeJ0rYbowCQF1K0dlW3d3u
 gLaquxhEnty7ggDjpIUOtuUicTZBIvptiFnezHi55GAriZOLvJxenZ4RB4w7fh6ycnDE
 KYrQx7eE1/M1N/S5N/xULuyZrbyfWIyX6D5nuxZi53Vk8cX5I9N04eH0gF+hBynXlP2D
 qRHHpQQXQIc+w7F0Wq2y5VAeYcUlH7q+XGIHnu3VJgBGOar6EOjVq4GmcWb9eLBbtZZH
 LQeg==
X-Gm-Message-State: ACrzQf0ovAIVxKUt+esJV65LWg8alCcg85FTwtdJYNYbn5+TCAcS7crc
 wlJSkcl2aB1LYwW58qV4vyrhdA==
X-Google-Smtp-Source: AMsMyM68qjQqULpZ/BI4lE6+kDmd0BZAyqrmHiJF5y5T8zzA2DF8Y6DbzBptf6WxEg9nnyn2opsPwQ==
X-Received: by 2002:a17:907:7b93:b0:770:1d4f:4de9 with SMTP id
 ne19-20020a1709077b9300b007701d4f4de9mr13596890ejc.201.1663606799750; 
 Mon, 19 Sep 2022 09:59:59 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:59 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:06 +0200
Subject: [PATCH v1 08/17] drm/mediatek: hdmi: add cec flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-8-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a flag to indicate support for cec.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index bfcca6f8b839..86653ebaacfd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -154,35 +154,38 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 		return ret;
 	}
 
-	/* The CEC module handles HDMI hotplug detection */
-	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (hdmi->conf->has_cec) {
+		/* The CEC module handles HDMI hotplug detection */
+		cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
+		if (!cec_np) {
+			dev_err(dev, "Failed to find CEC node\n");
+			return -EINVAL;
+		}
 
-	cec_pdev = of_find_device_by_node(cec_np);
-	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
+		cec_pdev = of_find_device_by_node(cec_np);
+		if (!cec_pdev) {
+			dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
+			of_node_put(cec_np);
+			return -EPROBE_DEFER;
+		}
 		of_node_put(cec_np);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
-	/*
-	 * The mediatek,syscon-hdmi property contains a phandle link to the
-	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
-	 * registers it contains.
-	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev, "Failed to get system configuration registers: %d\n", ret);
-		goto put_device;
+		hdmi->cec_dev = &cec_pdev->dev;
+		/*
+		 * The mediatek,syscon-hdmi property contains a phandle link to the
+		 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
+		 * registers it contains.
+		 */
+		regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
+		ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
+		if (IS_ERR(regmap))
+			ret = PTR_ERR(regmap);
+		if (ret) {
+			dev_err(dev,
+				"Failed to get system configuration registers: %d\n", ret);
+			goto put_device;
+		}
+		hdmi->sys_regmap = regmap;
 	}
-	hdmi->sys_regmap = regmap;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
@@ -230,7 +233,8 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 
 	return 0;
 put_device:
-	put_device(hdmi->cec_dev);
+	if (hdmi->conf->has_cec)
+		put_device(hdmi->cec_dev);
 	return ret;
 }
 
@@ -320,6 +324,7 @@ int mtk_drm_hdmi_remove(struct platform_device *pdev)
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
+	.has_cec = true,
 	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
@@ -332,6 +337,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 	.max_mode_clock = 148500,
 	.cea_modes_only = true,
+	.has_cec = true,
 	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 7452bea91f9e..921bde150e11 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -31,6 +31,7 @@
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	bool has_cec;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.10.0-dev
