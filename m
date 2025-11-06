Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A68C3DD46
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B310610EA0C;
	Thu,  6 Nov 2025 23:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EqTM/YYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132DB10EA0C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
 b=EqTM/YYhjhCONY8iuSR54NmnEKSSV3lXpSyLls28EdlWSmCKZcrVUEsuOvyW4AfIznPC04
 eByIxNNgZRMocwOOQ1Qf19sMfKZeyDK/df+SePPEhpPud0gL0f5uD4wdMFMsqj/Ct0iiKg
 y82Oy8yQfkyPizwevnxnUILD/Ni+mq4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-SiOr1RMZOK-lxXK1WuUUuw-1; Thu, 06 Nov 2025 18:27:01 -0500
X-MC-Unique: SiOr1RMZOK-lxXK1WuUUuw-1
X-Mimecast-MFC-AGG-ID: SiOr1RMZOK-lxXK1WuUUuw_1762471621
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88025a7fc9aso5650046d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471620; x=1763076420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
 b=JJgbgGwkF0ZqqkqnjSqxuHZ7gcn+lwKSPBEOdZD8zS1x3ktYmEJuHWRK5TzhtSe8u4
 oGWmx980Hgp2XTToeHF5nJSZapWJj7pgnHGlnPx2R/Sj89jf2YMajJqFWbuAH9ZMpbsM
 RYw42Qg7byOP96OQCsSbQliEnHVjmBSJRuSAllmDJq1LHpJcVk1obL1RsO9h1Jt/3O2y
 h5IXaDIbSG2fA8t+0IWltpOO4lDuFc7n44XtZuFcQLspWHdDuzRj6O2KQ34kCIPUyvDU
 WL7V15BHQLj7fiftBLDzXHB8JDyqiG2AZpHI+qs/3+xQKfXlENZ7FdX7I3jdkgyJTTU+
 jzpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvYy0MO5ykNZBUa7/4qlYf7DEUTEf3ilfMb7IlbaXMuQ9kh/lnUBj0vOKP5qPJumgKqo9JAkCKvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyGxG1jlNw+ze61yiTdsmvP1qY7iSOl+bWeClGKVBmVari5SA7
 3hOHkuI1KvX64fdeKWv9P3qn2Sjhxo1/Im/uhq2aRXG2ubfRw0TIjbtRBfviMEwDQRleUtv9ov0
 pEOU26xZTDKF8OYTAqV6vZAKtd9yGBAB8x33bOPFgW5mGwoIbdda5qKUBMflwugKWjF2I/A==
X-Gm-Gg: ASbGnctFF97WQBevK2P2MA8XEoDNWLadpzNuqQX1vkHBWIQ/9bIpRskOr7iWqQsYXcK
 uPljodu8DaptYdAMLmNHfZGf0Z/rFJXU46Y/KIpXqac4D9nSUuiFrY+Os/9uEkhw9gIYU7cSFS7
 QUgTvDSnfSL67bMyHN9gjfrXd4Jl7l5R0AUFGS47NC4sKCf6X57OUCDkn0f6quhMCrbXq5Y/c0v
 F9fPVxlbhy1G6Qw9XeW0Hg6U1pnhOej1v8KUhTPW6PSnICX8xZKcRpZi7D1hm/ONG85p2cFoFjL
 l0Z1mX9QPwB8ZWp75fI78g/8EypuC3MqYr+U5PDsISlw85eCMLcf76TEH2/SvJR5LEIR4+oSSmH
 jo9Go0wGKxhLZEL5U0kjYlJAVt3vf3F6a/FgXeMIyqw==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id
 6a1803df08f44-88151e4bc49mr17960436d6.2.1762471620711; 
 Thu, 06 Nov 2025 15:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtHpA4COaBy2TQDBCCELqXAf0sfk+lQ3jKjHR4cm3lLWRVAj13ngGgT8ax+bpg/JoDlCOeww==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id
 6a1803df08f44-88151e4bc49mr17960216d6.2.1762471620343; 
 Thu, 06 Nov 2025 15:27:00 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:52 -0500
Subject: [PATCH v2 RESEND 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-6-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pGum4msvOB3xDDFVObf0RbWafZEF5jMmYiXTVfgLr2I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RaqnVC7xubvIvpuN3fZv7sHddmfyK78rtPpal0bY
 a34zmpPRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM55MfwTzdcOk1ownJ5dj3F
 lEqP2+cWf1utHLvJU8rLrrGyvaomjeGfmciaJ0/c/+l5/550WeiIRfKndL0k6eYkX0bZkg35Iam
 MAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5WWfYc_5jivJs7gQqGhQPokO20rhsk-UnGkY55e_XgM_1762471621
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
2.51.0

