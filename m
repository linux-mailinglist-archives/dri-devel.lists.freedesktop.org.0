Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AAA5FF113
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7BE10EB0D;
	Fri, 14 Oct 2022 15:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95910EB04
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:20:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so5570388wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WD3SWI1ZQbB56NbLV6ErcIYLgxudB79QnGxHT/OO1/A=;
 b=xvuyHsGSe72rLdUihhIBroS2wQfyS10y9SL3x7bwkMz7yNpMbKWFfQk4EJbX/Zo372
 PwscucOiJJKImb6RHp2IR7put5ZYBb8UBgWTLnZ4JnhUxaO5x/c0uvLkidJ+dPGP+TPm
 iaDvm1ZRslxLAS8nhDnYVmkYjvIjuvrkZPzZXqn4K8bWCGldqzeMX0SNR+uEL06+sPvE
 Q8vIN7a9fiz+fqqONarnApyHicElt5yUzQMXVOtF0ydXRndURCyICzKHciuwELNEDhWE
 l1/+Fsza7f6d+lB92wDKYxEkL4DbyK/62lJf1Z1GtjJW6HF5KCWym+cyOHtkmzmw9Ib9
 BrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WD3SWI1ZQbB56NbLV6ErcIYLgxudB79QnGxHT/OO1/A=;
 b=ZALgzbKl4eRBKLcsxexwLUhHEJqAbCoajzqE9k6Zz5E8kvuq08MXTp/60DLPNuhtKU
 Rxo3U4fNKDqD5tNlb5ROQsF6rONQEdsjOONppAnPwQSF2dx+udVBbMPIvxRdpRwtNKlF
 7TRLFmppHRCSAXKn2TtXN/h1+y8d849g4ebtSJni2y2UuyV9pPE9EHVT2jgJXGESnUS6
 yDMTWebXiDxEU9/cfrco1j3nLIr+VcvzrWBk7VaPyyeJEUrGgqooQFczbnU+Cg9Nw/Q1
 vznuwscV+Bp8ba38nCFHRalrIhinXy5aeYJApFlbXZQirTOtIXScxAgfGHq/C9lVFZbz
 2q9g==
X-Gm-Message-State: ACrzQf1ac0k3vzE1RpYASxLO6Sgu1Ne8B6YYgcCpi9ixaMGv5ukON2Pl
 i0glRyCIi8DXSx2T5CiIaFpvLw==
X-Google-Smtp-Source: AMsMyM7f1Cxdv0i/Y3UH5OsNKg6jf7wGcVPESpSUScbeO0dlFszQv0PQ/gafOm4z2H3jH5fpfnYUnw==
X-Received: by 2002:a05:600c:3d8e:b0:3c6:e58d:354f with SMTP id
 bi14-20020a05600c3d8e00b003c6e58d354fmr3131064wmb.176.1665760807236; 
 Fri, 14 Oct 2022 08:20:07 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net.
 [2a02:8440:6241:7429:3074:96af:9642:4])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:20:06 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:15:56 +0200
Subject: [PATCH v2 03/12] drm/mediatek: hdmi: use a regmap instead of iomem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-3-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
