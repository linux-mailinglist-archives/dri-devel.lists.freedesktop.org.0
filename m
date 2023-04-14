Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD36E2823
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8510EE0A;
	Fri, 14 Apr 2023 16:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7010EDF9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:13:05 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso22147966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681488783; x=1684080783; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=flkZrEmQ4lhBir76YpEsiit3KQbCll7hap6g9ky4XjY=;
 b=zaTmkBAJWvJky4Aq1jB49C5WY+IgRDVMOCslR69Vl6Fgr4/MRocM/kLTVgfUS8Vc9t
 Q5XzQKszCuzICokhmRt1Go9VJJvcH1uT6f+5rfYnMRm/VGeYBqxiP4x2NmQ1MevYDkjN
 Lxk0CUgrBgJbq5FMC8z4GlSzvTMMDwmIo9sndS4eHwEvB5es271P2gctIkx59RCxGrjD
 qQOHmZ/zRLOW555qQAT+JAPtnfGECgKfLCX77sAM0b2vkpi1jeX85CPnkPEabfcUueWU
 o/6fqwlu5lZhedeQOhwirSYVKUm8EFzTq31Ybde4rBY1SDN7cNyHo866FrH2kGX024ZB
 3Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488783; x=1684080783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flkZrEmQ4lhBir76YpEsiit3KQbCll7hap6g9ky4XjY=;
 b=EzgI5JpHqq7gcTag07baP0JBA35ki6N+yW/gFvNT2VEe6G4Qg25eWXzu6XqlfzHIfo
 bV37TfJIU6YSNyAKUJHzGcM0sQ9V+gK0K63cPFUMppZ8JvtvvEilR5pGD6ixTVwLMvaD
 iYmnPsk4xSehNSZKPx2esxBdLBWerZO5F0fptez7SVeQLcWry0aXY4ZaOWX/fscf8DgH
 YUdlfW3VtZnxN13mPsHzHyM3lDeM8L2XlrzD8pxy7Q168Bqa8EbtvqtXEt/TEpxDr7op
 ifeke4ev64cEov1fFaeRJbTuNTN+xQH9C8Etqn9qJ6HJ7JCugLLh1jFv+dXqz+OhlHnB
 PGcQ==
X-Gm-Message-State: AAQBX9f2zKy0SpCfjd+H+OJ+Djunef+fgILXeR64QtGaAEQoAaMv35dy
 0QSdVoD4zGrgUOUwBgYFYehDvl2uuRvQj3B3W4s=
X-Google-Smtp-Source: AKy350b2JE8Qx2Y+iWCoW/RhZBJ5V4rhMWPwFiGL7k5VHEtk/DsRY4ZLJHBMfiz8yCcBW8ZuvdtkfQ==
X-Received: by 2002:aa7:d85a:0:b0:506:8e06:8b4b with SMTP id
 f26-20020aa7d85a000000b005068e068b4bmr290176eds.8.1681488783366; 
 Fri, 14 Apr 2023 09:13:03 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-d20f-2c76-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:d20f:2c76:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b005066ca60b2csm2242687edt.63.2023.04.14.09.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:13:03 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Apr 2023 18:07:47 +0200
Subject: [PATCH v2 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v2-2-bbad62e64321@baylibre.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 054b73cb31ee..caa953780bee 100644
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
2.40.0

