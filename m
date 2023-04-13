Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572466E0DC1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BECA10EA53;
	Thu, 13 Apr 2023 12:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992910EA53
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:51:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso18933449wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390301; x=1683982301; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NCSyvdX0SmPc9ExxsTpFJ2greUOcRi/vLBExtrGuM4=;
 b=VRVY6mW4C2eeH9XEL2rXf4kib+8LepoYm141EhEj4bMvddMWMZfWEbDgkVd2Fj86U+
 8XY43D+8ZnAkl+qpBUZPKykNENQ5Z2zTtvwwxjqsxoLGyN15QkzR6S/slTv51nhS+vNl
 5N3LR05EDvlN7cCZXDgERRZt6CthgOTM29OhPCTT9PWnp1NrXTcfWWrHxW1KAqIMjTR4
 QTTV9BH7BbOjgf1NeAgQSVmxdmGAnc8+GnrYry1RvKBlEC4Y5TjIV8VspCoEIef/ZZQk
 1JjNRHshJN85qXDV3vS/7/8E/HuDtNGgLzT1FUNEo0/qZmBLSorW4icPeTmIb4cHsuYq
 tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390301; x=1683982301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NCSyvdX0SmPc9ExxsTpFJ2greUOcRi/vLBExtrGuM4=;
 b=B7GAeht04uWPDF3hv8zqQrZRC6YFuH2uwiXYNmTT7164pyRru0qU2jUPXvr8mtbXRK
 2z8bMPefWwfN+7ZYRcNS3ewmeHESnLI9cyaIymwGiX+mZDHMHHqGIJVbaV7jOReyrv7s
 A4qp0tonzO2mGGMfxQekiMY5H4EPHCfunq3EshKiCHgBPSG72vEgSSuL8XOUg5kpRzBb
 H5zuAxwIQQY5gkn+nreE3T/hYlIaqd6Viz1uo33BjbpUW72rbv1DzGh0z1iOJo7OFuvZ
 9UEZI1sE3DSgDIwAeOSpYy3O/Sv5Xx2xzKKDHR67UoFickDzWjEAwgLeU+mc94VjNBfb
 9vjA==
X-Gm-Message-State: AAQBX9fHv6EY3h54tU+TBVWo/yPu1SLmfcwMRabwiDOTFdb9aN/+u9Jz
 U0fLaMwYxA7Z1vbsFTitAat2PA==
X-Google-Smtp-Source: AKy350aa1i5mgrVePFwrBlQob6A/5LRh1D6/2011CW+4P/unl+t6yKRaDKzFUe2AB+mGY/qtrWZ6aA==
X-Received: by 2002:a1c:4b0b:0:b0:3ef:4138:9eef with SMTP id
 y11-20020a1c4b0b000000b003ef41389eefmr1450843wma.36.1681390301230; 
 Thu, 13 Apr 2023 05:51:41 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 13 Apr 2023 14:46:26 +0200
Subject: [PATCH 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clock rate calculus in mtk_hdmi_pll_calc() was wrong when it has
been replaced by 'div_u64'.

Fix the issue by multiplying the values in the denominator instead of
dividing them.

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index e10da6c4147e..5e84b294a43e 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -271,7 +271,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	 * [32,24] 9bit integer, [23,0]:24bit fraction
 	 */
 	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
-		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
+		      da_hdmitx21_ref_ck * PLL_FBKDIV_HS3);
 
 	if (pcw > GENMASK_ULL(32, 0))
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	posdiv2 = 1;
 
 	/* Digital clk divider, max /32 */
-	digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
+	digital_div = div_u64(ns_hdmipll_ck, posdiv1 * posdiv2 * pixel_clk);
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 

-- 
2.39.2

