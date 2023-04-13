Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA36E0DC0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9521310EAD4;
	Thu, 13 Apr 2023 12:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE410E67A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:51:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id gw13so8404024wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390300; x=1683982300; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pfiB0dyNF5IN+dDnQ49hhgOP3vgf9O+J5xAGBbme+xg=;
 b=jt9lPv4lNrVGnYs0/3pm0ZbWLL22vClDmV9Mi1AjKNPGPhp2Z1qGKvnTZxfZ2IH6Va
 kdWB9Vni+Q2YbR5aVEZCe1q10+kzpEoLsR96keXGahTbBCxs1Gw4Rf4FvtwtSZ7HVKN3
 C81hq4PEchuYqdXF9E0329vVtPniqlkTwnJJ+uxVfTuZcKBHUJIiO6LOLKb21khCxIfq
 KaSXyJEqR4mqIBxAuPCklrrhmsA+bnWVtMAjwFperuNLjMPZ2+tDlEdIBc5Io+l0ofVe
 E9obFN/51kCQ1pDsVpsDL0sTjweGDhw6VzcDBOGCHtbPxDwugox0FApsENkM9nt4vwjQ
 tf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390300; x=1683982300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfiB0dyNF5IN+dDnQ49hhgOP3vgf9O+J5xAGBbme+xg=;
 b=Ic/60VW9COQ+mujpCwjrowfGKnE9qITFBWryEl4z5tPqm5cnnEOOb0bIp9+MgPcUba
 IQP3NnS4Wu4qyQW7Wa+n8/eJnFGi2AT3DenZEMymC5ALON/0//jUKqSg1iCGIEEWsawc
 S8KQZkDzSE1JoXTMnmYigibFQYGFct4PBDAO1gJ4icZC8QhEwqvyVswLR1r3oGLJChG2
 P90g9yn1u2Oi+gfBAloUbnVrys2XWOHQ62eR9skkCCbrd2v6kAKmRj0Kj1eXlVn42dOR
 tFhUm9D9DxbXkaxfBN2Wmo2muJx6lEDGc7hp4sInnnErSg+mmQWz4SlSqUXG4XoRsuFD
 zJNA==
X-Gm-Message-State: AAQBX9coFnsHH6e6gFP6BP5tQwMJXMgxXikDckFZiH8dmYKnHL6nqRJs
 L5Dw1nC9b23IcSRSgxYnDhcNRA==
X-Google-Smtp-Source: AKy350ZhM3KTvTuJ+Clczlm2zRYmzA4Al3yjFIK+ApB//dgCEkIZNS4r1rOYNFbWtYCj5wo3UmI1kQ==
X-Received: by 2002:a7b:ca57:0:b0:3ed:4685:4618 with SMTP id
 m23-20020a7bca57000000b003ed46854618mr1728570wml.34.1681390300370; 
 Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 13 Apr 2023 14:46:25 +0200
Subject: [PATCH 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-1-b8482458df0d@baylibre.com>
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..e10da6c4147e 100644
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
@@ -292,10 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+	if (mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
 			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
-			    txposdiv, digital_div);
-	if (ret)
+			    txposdiv, digital_div))
 		return -EINVAL;
 
 	return 0;

-- 
2.39.2

