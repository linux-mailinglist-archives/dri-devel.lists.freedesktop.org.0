Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA416198FF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFCA10E7E8;
	Fri,  4 Nov 2022 14:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938810E7E6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:14:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n39-20020a05600c3ba700b003cf71011cddso5306111wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WD3SWI1ZQbB56NbLV6ErcIYLgxudB79QnGxHT/OO1/A=;
 b=bTed3Pl4trQLUpxLlWsdBybB/k5hL2muwqS1OJcE7jkRwpfokeL65/UNorJiLXcKxZ
 lM9Iue3B6q0rOf0ISBUuZPzbWxhOeFZ3Sm3zTZleKgGV/HdZ30obg+g9Oh5vdlgcJ5ER
 nTNmyiBiIBKoLtlD2XexxHnW9JCLMR3SMR6LPDIkENHx1+oBnGKI0M2NWtmV/a2erHC5
 uG8X/iIX6/bkHQO82C9gMyY2tFEbfnNaHdbgI6YDKWsXLT74XSDXdp8n+GXQsXRtkvk6
 ydORMgMhg/Rb07Ru7lPf9S3L6dH+ewl/sPBEyWMV9bZ5QULGgMriXac40HqfmiZqKPu7
 TQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WD3SWI1ZQbB56NbLV6ErcIYLgxudB79QnGxHT/OO1/A=;
 b=11ouLRi8IfULaHrF1Qvmvanoy0+oaacbe9G5Lc4QsVSzoVWtkskt+Sna7y1smeiebQ
 Q6SSX2iLN8miPNcyC7MhYYzBGOY7fTCG5jDNsJ6PGcNNfYwjkAYQ7c6xepqY6leSww6a
 x5KRkdUEIVOJxtfa7jX00F0kQqMTF6sBtKaqK3lSBdfy64pqN5NXZg/hbIhB6dBmz9tZ
 rYpWRrMMOqSs5eNr9ziHw4fHJv7ps0OgADou1alrjndqE8n0h2BOMsQfhBHhrwqZrmOL
 n4uU6gfj6hXWMqcoRWBTZOA2z9dl7K0jrfff5MOHht3tPH05eqWIiZBPb6kSFf7Ei8Nm
 p9lQ==
X-Gm-Message-State: ACrzQf0rQLPgPsvyqkJPpdpOlx73K9TolqytsTefobA1E4Q0FDE89+on
 r5PP9N3r4xTlqMitDtZ/KQQPHg==
X-Google-Smtp-Source: AMsMyM7vr/tEk9xUPtDTMq4VZQuzXHqjb43Klio4FW6m6cCPE/+DZH8hvlh38PkQlxZftBsB9ZVg1Q==
X-Received: by 2002:a05:600c:3b21:b0:3c6:172:9c5a with SMTP id
 m33-20020a05600c3b2100b003c601729c5amr24077921wms.129.1667571252638; 
 Fri, 04 Nov 2022 07:14:12 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6440:7fff:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:14:12 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:49 +0100
Subject: [PATCH v3 03/12] drm/mediatek: hdmi: use a regmap instead of iomem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-3-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, 
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@ti.com>
X-Mailer: b4 0.11.0-dev
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
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare support for newer chips that need to share their address
range with a dedicated ddc driver, use a regmap.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 43 +++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 4c80b6896dc3..9b02b30a193a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -171,7 +171,7 @@ struct mtk_hdmi {
 	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
-	void __iomem *regs;
+	struct regmap *regs;
 	enum hdmi_colorspace csp;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
@@ -187,44 +187,29 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
 	return container_of(b, struct mtk_hdmi, bridge);
 }
 
-static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
+static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
 {
-	return readl(hdmi->regs + offset);
+	return regmap_read(hdmi->regs, offset, val);
 }
 
 static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
 {
-	writel(val, hdmi->regs + offset);
+	regmap_write(hdmi->regs, offset, val);
 }
 
 static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp &= ~bits;
-	writel(tmp, reg);
+	regmap_clear_bits(hdmi->regs, offset, bits);
 }
 
 static void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp |= bits;
-	writel(tmp, reg);
+	regmap_set_bits(hdmi->regs, offset, bits);
 }
 
 static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp = (tmp & ~mask) | (val & mask);
-	writel(tmp, reg);
+	regmap_update_bits(hdmi->regs, offset, mask, val);
 }
 
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
@@ -473,7 +458,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG0);
+	mtk_hdmi_read(hdmi, GRL_CFG0, &val);
 	val &= ~(CFG0_W_LENGTH_MASK | CFG0_I2S_MODE_MASK);
 
 	switch (i2s_fmt) {
@@ -565,7 +550,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG1);
+	mtk_hdmi_read(hdmi, GRL_CFG1, &val);
 	if (input_type == HDMI_AUD_INPUT_I2S &&
 	    (val & CFG1_SPDIF) == CFG1_SPDIF) {
 		val &= ~CFG1_SPDIF;
@@ -596,7 +581,7 @@ static void mtk_hdmi_hw_aud_src_reenable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	mtk_hdmi_read(hdmi, GRL_MIX_CTRL, &val);
 	if (val & MIX_CTRL_SRC_EN) {
 		val &= ~MIX_CTRL_SRC_EN;
 		mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
@@ -610,7 +595,7 @@ static void mtk_hdmi_hw_aud_src_disable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	mtk_hdmi_read(hdmi, GRL_MIX_CTRL, &val);
 	val &= ~MIX_CTRL_SRC_EN;
 	mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
 	mtk_hdmi_write(hdmi, GRL_SHIFT_L1, 0x00);
@@ -621,7 +606,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG5);
+	mtk_hdmi_read(hdmi, GRL_CFG5, &val);
 	val &= CFG5_CD_RATIO_MASK;
 
 	switch (mclk) {
@@ -1427,7 +1412,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1473,8 +1457,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;

-- 
b4 0.11.0-dev
