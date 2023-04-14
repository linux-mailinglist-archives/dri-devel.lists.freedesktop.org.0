Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11C36E2820
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DC910EDF9;
	Fri, 14 Apr 2023 16:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3959D10E1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:13:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94cfe3db2aaso289710766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681488782; x=1684080782; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zYQcygXwpJtgvQS6PifePVs7bdptrcY70QQxe9GzfcI=;
 b=rQKGZqU143eN5We3KUXtGaJ9yIwyR38GoLyQ3zVVsNqkRfSQCVYSKrETwwWmrnjCTD
 /HL34ojcvfMZJbZ0Sl4svlgeAwoPZ3WUMJnQ3v6WfZkUsNd/EQIxX5eqKIPnCQwgNh6C
 vanXFx1ea4YdiPmkcDLjAg4k7fhKXybGahBHX3QAKqJw5d2OFaWJB9c8hx/mHdDgEnpR
 DgKJ4i9oZ7gMXUfue3BL2X4MHalODcpeL40PUcrwQ2GTaM7IpJ3vsgaJpVbqbusNGx99
 77enZYwgNFesCZGInlKblO0YU/FzpVHd0nkJ/h1X+lg1lnlLycaYycrPuHlZ3rrlON6W
 yH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488782; x=1684080782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYQcygXwpJtgvQS6PifePVs7bdptrcY70QQxe9GzfcI=;
 b=bAYYeLAH4HxkDB4K0AnRgJrqK+tHl7l3tv+uJu+ZiH+TpIfiHKV2BIINp9yV0amE1O
 hvjAtom6tuHMZqC5oU/gqRI7rJtbSei53ZxHhVhUcWVa5Fowx4zrByFiWl1GwFNpDCKI
 3CgLSpYd640daqmY94TLpeAejTw9gxKzjufvCHEAZ2u8Yx/BEHNzRVpjWC7KXohAGGWy
 hj9gCXjIDN+l1FFSAOp52/RNSz913DeozhMt3MvZ/vjjU4hq+5o/p9gVIiIeusWYBxC4
 mz8vs4/dXOmoCFOHFZdobymWB4yr3su4zoetK5AKjydfNh8+p4DIXt60Q5M8JOQ7rX0m
 xNrw==
X-Gm-Message-State: AAQBX9edsKFV6kzE1adW3T6rtJKvr5VdO8EOJ+sFlAAx/kddbMqcvSl+
 iU7XGQj3R9+X70tY/hJfTr0zc38oLkKqSlBmUFw=
X-Google-Smtp-Source: AKy350ZwPnR35MbzJwWg/cyopvybTKJ6He8maInl0W5V/A8A8m41PdLFb40JKrxf0JIz/8Mq7iEGrw==
X-Received: by 2002:a05:6402:100d:b0:504:80a4:d019 with SMTP id
 c13-20020a056402100d00b0050480a4d019mr7138523edu.12.1681488781860; 
 Fri, 14 Apr 2023 09:13:01 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-d20f-2c76-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:d20f:2c76:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b005066ca60b2csm2242687edt.63.2023.04.14.09.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:13:01 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Apr 2023 18:07:46 +0200
Subject: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
by the kernel test robot.

Fix the issue by removing the variable altogether and testing out the
return value of mtk_hdmi_pll_set_hw()

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..054b73cb31ee 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
 	u8 txpredivs[4] = { 2, 4, 6, 12 };
 	u32 fbkdiv_low;
-	int i, ret;
+	int i;
 
 	pixel_clk = rate;
 	tmds_clk = pixel_clk;
@@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+	return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
 			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
 			    txposdiv, digital_div);
-	if (ret)
-		return -EINVAL;
-
-	return 0;
 }
 
 static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)

-- 
2.40.0

