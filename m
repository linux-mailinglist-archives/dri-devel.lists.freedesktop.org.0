Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36404CB7593
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66510E561;
	Thu, 11 Dec 2025 23:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hx3VIWw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419210E378
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
 b=hx3VIWw1g/dpeYylkTZtdcxpBB0T9t2KJkyKB3m7w4UFYFIno0bS9r+LoicOIpA1FVnPtT
 XsLPCEX5WmxnijRdh1LHTLdnODoXnGKRFz1TMmUQSS+movyuQRiU6TZ1uqF/cC/P/idIvz
 bWjojXkEhYgKGEl+mRAfGvo+N/6paPI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Uj0EresiPXiohKf2Hseinw-1; Thu, 11 Dec 2025 18:16:56 -0500
X-MC-Unique: Uj0EresiPXiohKf2Hseinw-1
X-Mimecast-MFC-AGG-ID: Uj0EresiPXiohKf2Hseinw_1765495016
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b51396f3efso113118285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495016; x=1766099816;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
 b=gxU5g1r8LkW4YhVr7BE3jonRxHCSZQaCib6gYjDfWMMaxR1dM3oK/H/ZGW3RnMBpi9
 j+sZOsI/fWVuFOxrnLiQ9GLsmN4E7dv1clyNKyrB9PHm5zOvwv7EKQTH2RsfearDwmQq
 Uf6oFeFfs2qMRsqaOGsOCvnQ24qhkCq5LOLpoQVH7jCsCuFXX8qP2OE0y4m2LZbzhUhz
 oZn+DKpNLjfS95XoYCOnyzcxEttBbg8TJXO1PVDeu09DRCTykxg1E6W1aMonot0qPNPH
 bU7S9Y90gARxorVECHqC9cNn7/UKWQP/UFZRrRueiP9DO0PZg/KH/mLuQWh4PbcRXacr
 P9Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxjfVefWicACBNwAaAoNgT74PKE+nwKJtpOPytDH+/3s4wMmxhCJgjwaOGXR2PZAuUOJEpmooRNxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDDBDNWZFo9VnCJuFnX2jpJ1v7Yfee2U7tIWQqah5xdbVfft1i
 c9K10EkJZ+kyTg8Gy6zXs2R03FgjfcnZe+wx5iW3+pwIjDJsJSl/gBwjK1ZSPGVVuctMVsg1A53
 D/NBrFLWvYFHyXOiXMhjr8NH0UQbQEixkiXlxaX+V3cOr0UH6wupo16sMSkkCmKEjtdfMkw==
X-Gm-Gg: AY/fxX7pQmaaikBpTTIxWWG9My5Zn3C8DpYfpqqEoMPZMA+xV+gdTFxeY64AVBGHKlk
 2s+yYxRQKwpFD3KHL5N8iT/tJRPeNrrRH43OX714ccbVNUerkrOAT0n6fvRmoL0JNsKrWB0vL/m
 7jswxDKWO6XlDOH+tCabBix34T0xgWYM/wJZdey+I7J3D60r3/IsYa9/9+Y+ZARIxRE+Hbv3rMF
 1LsEvbB2lwRCVd5GdjYSAWVfbPii0zkRCu8vfgfWjlOsRkc3VgY0E9KnxlUqVv7JsknpwOLMRSj
 2dc0SMWGm+vlkcx0wmimL/alDG6DhmKXNRdIyz7hBFs5xmMmwak6UciwpOclGaJ5Ps0DhXtoyr4
 6IXnTx4tP+yFsw6gF5xpLFvh3/XZ2UV1rHjj9nFCPn59eyjVqiEgdTA==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id
 af79cd13be357-8bb399d90bamr39281785a.11.1765495015851; 
 Thu, 11 Dec 2025 15:16:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2s8wwcOmxwXaF7bKZgVpwocL48364JqbwVZMFBYNgdRIsZcitJ0mH0HHmDGJg8J0urTG96Q==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id
 af79cd13be357-8bb399d90bamr39277685a.11.1765495015467; 
 Thu, 11 Dec 2025 15:16:55 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:16:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:20 +0900
Subject: [PATCH v3 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-2-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=b7GdsrXKjZPd7UPmB5Kvn1MxBtjV4+5gYAk+zH2wXY4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4eruXZckDLUdGk4NCf1DMH3S23NTlWqza05L27d
 j9Mk3l3RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5vo3hv/s5eRZ5xg+sCw0l
 u954X731i2Wfsyj7rWvTHExexWhducDwP2M694nJjgtaZ3hrX35Y2b7FPuB4oXXsynttk8VNEja
 v4wYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Q0lRgrcWrDFgJxxdcK0UHjRLJGG1ZSIWA5x58Q1BPg_1765495016
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0

