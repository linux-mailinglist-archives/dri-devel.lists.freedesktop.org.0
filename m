Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548EB00821
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF52A10E924;
	Thu, 10 Jul 2025 16:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mz7duTc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B48610E924
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
 b=Mz7duTc/s2VgEY5xR95Ic+GAlYvyBxKyfOh7VEzaKGULzP/SbIePxexbqQWI+NyAz5iqSP
 +ERRBjif4hiKoWlDfa1QQDP6gIxDXryhLnWcxJ49PqbWtt/LfGLXgvKbf1qoIRXJYsf1tD
 LDxiGacK1csstZkG4lmVG2ks1HB2tm4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-qzllMTcOMMaP3aA7ZvYsYA-1; Thu, 10 Jul 2025 12:08:23 -0400
X-MC-Unique: qzllMTcOMMaP3aA7ZvYsYA-1
X-Mimecast-MFC-AGG-ID: qzllMTcOMMaP3aA7ZvYsYA_1752163703
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a585dc5f6aso23881611cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163703; x=1752768503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
 b=HzY/LIHRIY84hvbju2g8F+Rjnom5vpUHKprAg10VKiF8cViU6O0yNr6vQyvRGJd/7U
 tfvWkt23j9dJUM6rLtELcLG26ftLeVmjCPWm5ofpk5tGH35d3rlM0tBSsPlsLn5qWl98
 jPunlybp0fhYBLbLwfmR551zRu/q0Dg4PC6IrXalWpdsJE7/LPFG0KMpLtwiOrVgMGAz
 LkpKed8BsC3cggER3TOuhdE2QVmn3C2eBBr0UtFlHJkHDB4RAS8uGn/sF0MrJUl5g/Lw
 e3xZ/HGocnwTv4tCjumKy31r/iYCOhEBUAPTUJNEsC3hnPDTs5O6uGeyXDUE1srd6wLI
 jlAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhU2moplHjewPUPThc8Cl7c4qaRhFbpe3tJzDfOfhcfPGxTN4wAIfZS9bhuJt2GNSr+7PvRc5fduA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgfobKcogC0Rgzw3RH4D6J/wu9r9d7qwYjdBSaR/iY9RIlwiJ6
 GAYIi2W+XDnjc8K6wKXNienoPFWuYmGM3mIiZzd1XYXmuzqfImnv2P7FkmOjzR7BPevCKCF2WOq
 ND07yEaw0PvAdSxY/q623ogwp02xh1CnhVFZgng5gSPIRg4nFP1eAZeuRPCUuqTJti5onTA==
X-Gm-Gg: ASbGncuqp3xK/bkPWPHpvzXMwb2OiYeGmiHSgXsVliXl6/aNfqYzBsbJMAg4BShyeQ1
 0TGQ8zQFkLnY4147yJQ774QewZupVtozya1ciBgmbtdCZt7aJfiTEYEcrMp8GOUjz7848uLenI6
 eHQ9Zkr8UrZHOEckWINs7h3C0RFBstQHwGoaEn43CylSXPtEP6TZNNGRiKYJbvYLp/g4BMHNUSn
 F2Y93r9/O8TK3WlrNrow7upFutrnXleUOVRW5ToKorsm/5/mkJjCyJVI2lPUm8GkxCZ2jwcdGTS
 l+qzj+eZnxKV4nZc1IyN4ZAO5eAe9bgUFIevQNlqHKwyd25uG8FpZj0ZHeO5
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id
 6a1803df08f44-704980653a9mr39030346d6.12.1752163703095; 
 Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCZQ7W3y8kThWl4w+CnUCECNX6Cyj79KFh3PeC/HpUcHl6P8QBnf3iscE4pNrdpapav2INA==
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id
 6a1803df08f44-704980653a9mr39029866d6.12.1752163702588; 
 Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:16 -0400
Subject: [PATCH 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-6-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZKlsIvlM5HHyda796a+VTO47/qeucu/BCMXwHXG/S40=;
 b=+r3EuMe/pzh9qF2oPdX67HS2VmnZ350abewNM1edJtWvBPtHINXt26quhidSdRFg7SeVLEzsu
 YVJmnDogbgKAaAbXcN1nbXJrSBi27Fk+BJ7qXWfiPpZHj+x2CtpRepu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LR4ZpC312VPrRa3XEnGwJU33vVTCDWX94slp9fbHkWU_1752163703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.50.0

