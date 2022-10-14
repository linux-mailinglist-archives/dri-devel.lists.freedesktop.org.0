Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBD5FF10F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0523710EB08;
	Fri, 14 Oct 2022 15:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E105F10EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:20:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk15so8036315wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
 b=vyYoDAHlbaol64KHta05nB/feVbxAif5WWgpsifdznUOiy0di03Ab/Co8SnivrMsJs
 TwcHLdlOhXHiuwhAm5ola2rnegGShmaT4jbbjQ93+WA3p1XCn5a9Ruyj+sz68Tfe+iRH
 MooqlXsU+aozyTmQ3Z4B6Ufgu/0EhNKBypN88exKPsOTRLTzqMjEiZ+I64/zDYzS2ZFv
 glMduOTKNrBE1uMiSknPb47QKvQ1Fslp3lVWBD5eaY7Xh9sEgdiMpgnqf+1LMMxWDfXx
 DjkIHq6i/wFHokwDziPOcQ1XKYJtfqe1Q56wbHlY9yLMkutYHgzh5J0cgVlrC5zcqe/j
 DqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
 b=pnjVx09Jpt5JA6QMKnhFjEVYNcr/Jb/TkGlGmtdd0A9mDPeRX86dU5BA9KjkQ+oWwE
 Cl6MSoFZ2HTlWjsyiIJvtTkllASmAuiGF3q5jOchveDhXhhgqnKoK3SZy8NtU4LHKxAr
 qvg9NkufbFhXI3gAUWDrZFAeId44Iw51qtn/qfzoZzDy8xXL9NIfGrD64nMBaazMW7vV
 CKoWr0QKE79Dji6uAfjHodlBhSKhtVOZzbMvjGSJctLnNEwcvut+XB1Kyji6tYXghfiB
 B8T1NPDDzhQnAQx2PAZJJSg3PMaX4nNUoWoDG8GuDmTYTm5ExPYngkZW1dWSinzqgetb
 hs5w==
X-Gm-Message-State: ACrzQf3dOzk2G09wT2+y/57LaL7ixsV6GKo/DdfY2dNl5QL3TWySeGPf
 Nyn+aqe2MQDgYiMaJmhQJy7M+Q==
X-Google-Smtp-Source: AMsMyM6fsEM7Zok+4dA1E8vJbMNpo8X1aKWBTLgOrRBTYmZAFS6rLY4/4rxttdckY90lLewdsLeanQ==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr3687815wre.237.1665760818451; 
 Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net.
 [2a02:8440:6241:7429:3074:96af:9642:4])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:02 +0200
Subject: [PATCH v2 09/12] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-9-8419dcf4f09d@baylibre.com>
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

Some phys, such as mt8195, needs to have a configure callback defined.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b16d437d6721..32f713301768 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -8,10 +8,12 @@
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
 
 static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.power_on = mtk_hdmi_phy_power_on,
 	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
 	.owner = THIS_MODULE,
 };
 
@@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	if (hdmi_phy->conf->hdmi_phy_configure)
+		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index c7fa65cff989..f5aac9d352d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.11.0-dev
