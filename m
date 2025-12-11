Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41846CB7598
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A3510E378;
	Thu, 11 Dec 2025 23:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J81Qapgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BBF10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
 b=J81QapgwbYH44uKbWJ6ROx8uMLQ/Shcg8r4Apek//Q5R8unlgrtzIWOgh3qXVEeVBvYAyT
 1fKHv1EHDA9FjJDMAmORhFxcEeqJC2Ld6yobyjPdxuJQN89CrB7nsHtsiAUmbR5xb1YAMB
 vs00BQHtkMFHBkrBZFTRrB3lPoylZCU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-EaspwJHGNeq5zmt8IeSrsQ-1; Thu, 11 Dec 2025 18:17:03 -0500
X-MC-Unique: EaspwJHGNeq5zmt8IeSrsQ-1
X-Mimecast-MFC-AGG-ID: EaspwJHGNeq5zmt8IeSrsQ_1765495023
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8824d5b11easo12038646d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495023; x=1766099823;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
 b=dbZoqRHdtejX19yefFzct2BmQj+35FRkLoegsyM9dFWQ5YkpgA8FGNx1MabFAAJ/x5
 AdIWDGyphhGBevHYqbaRxOo5bOsBJlh0N1TNUITeJyZHDnHSwD7X7scmX86GT+8LrioC
 Ke63lRcrihrHJLnUR38dfSMeO3bYtZlLQK6LV1hwqw4QHLow1YLoRYfB1PI2qgCwgXxK
 9FExxDJ1V9WEBR7UlrvkJpBhakgZVxgFLnLiJ6xbOe8JwD9qh5qzKt9xIHzhMuMjCtL3
 ZBIvevUyy3JAdKED/vH9d44FDwxewOp/+3CKPSzouwHRO2i0UVvztn8kmkpjPilbUMSI
 qKaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTCO0IwOQYJdRTguiCWPC6Wa71ovMGzAnqnj6APmq63lginYOGIbJkQ150g2fKe89pf/qBBTii/WY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDksGm4bYyEwS+t+ByTLzpCI+YoD1DkqSydefT+G3lZ+H72dr9
 Ym5SW99fsxZ1GK9nlw6Jv5uo7AlMczuesLQ+Bh+rmhII8Zmy0RqFujnqD4rIp+CeU7YJkjSXLu2
 wjvNvxx61gq/32UtxnWXxj8rjDYmHxe7+JYwE3G+iAP9Ft+Sifsx6rD/1sEhlFoRbID/tpQ==
X-Gm-Gg: AY/fxX7mLvgTJqGQ7BAFmCCSrXr5+eamMq69cUyLoK/XXltS45yHWGw/E0uei956ewr
 L33i0mV9jljzwveqEv/aNxaSDn/hm1TPABKZbpR5srkxqcrPvoZ4URbiOX/TCXcwakorp+yovSO
 oY+en9rrl32mXUk++E5HsN9T1amVvcMu6mWbLaWq9D4LsWa2OahUI0+6D8pNYFQ7XHaO+yCgDdf
 46pnFrr1meRQFPmmnsbKYW8E0ZjrJvoNGPYdtBNySCUvsFtrBnIYVYI6TD9/DMAIoI7TOwdk0Nm
 aMyyuwGJYf8fpba/eBmMmtjirTSjo/DQkwXrC9MroKmsrrK/lOw66q+mkSnh0hSfCbZMPjIT93s
 4pbRtfgRcS1KvcV8KgUVC3TSiOKvARrAKF/jsLjTII0ciHb1+NWozdA==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id
 6a1803df08f44-8887e1b44f3mr5869466d6.29.1765495023038; 
 Thu, 11 Dec 2025 15:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmZS1L2hV5aQ7zoKqGzhOlVyBusG0wgauo3NmQeNT0uE4Z7Yi8ZXh/Hs5OUyLkYfq61AO84Q==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id
 6a1803df08f44-8887e1b44f3mr5869096d6.29.1765495022716; 
 Thu, 11 Dec 2025 15:17:02 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:21 +0900
Subject: [PATCH v3 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-3-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dOjKoMKrjNLxDaFcShGY+TJnvlU5rN6Rp3COkTM41N0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tW+pYkrBzwUUlxS0J0x7VsluaTZ6+7OiGG/29C
 o0TxA+mdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR1qmMDNvD7Qu+nZTe//Nz
 zwtxS0fpvY6eBWGv0n+W8BRfjc2fqcTwv2ByUtGe3QVXa0ztl0SYGceaG7w8xMv6I5Zpvld6Td8
 bDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QY0bbykbnW8x4FHS1Y5N7eBzR4YvK1moFYWYrwvoC5w_1765495023
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0

