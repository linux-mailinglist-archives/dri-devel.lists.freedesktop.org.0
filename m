Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC4B0081F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CB910E921;
	Thu, 10 Jul 2025 16:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YKctWFA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3CB10E240
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
 b=YKctWFA1oODu5ckp64+DR5I+OEvHsv9fhZn/ZQndyaMzW/Gx3FGdbmG8p6ddWVp6YW3uBI
 J9lBlyYItv2bWYB9SHi1Ep/uxiJ4vutKVApwMQcQ4gd4f3PNfHS3F2j8GXnzKb6BFEET8o
 GyXK16EIjpWLQchdrh+OIh4lVQGwDLk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-Lc-rYTwOOcSEZyD6wVP6Tg-1; Thu, 10 Jul 2025 12:08:17 -0400
X-MC-Unique: Lc-rYTwOOcSEZyD6wVP6Tg-1
X-Mimecast-MFC-AGG-ID: Lc-rYTwOOcSEZyD6wVP6Tg_1752163696
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb5720eb48so37319286d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163696; x=1752768496;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
 b=YEqmxxuI+anskL/Km79c/3kyeOU4/50G9XQLSNVDt0uMNP9EzwXMiXNdh3wt6/0W1z
 VnkzWUYbW4oQ7nqf07jUKpp9Sha9HXT7aUXnfvyyw/9hbjXiw5XsZdd+c3KORS9mSEB3
 uocMtL6Dxk5o6cAPTmzbZcsJj3EEJm9M7UHiZfdrOmavViaqRUkAGp1XttgExrVYBfNs
 PN2+c+5QobZ5cRsLzqZ2KxY0e3+kToPJr1Dzuy0Yh+qlHVIJTHZ4aicix9M037YF6nWZ
 zQdnlhCU78fQdtZgpPu1OfGK2UzYiV19FnTlC4teOJWx36sVXo1ryfQNLwyNjZsedTOj
 XqRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfpzHYBwf/iaCpamScPE1aNqVPCv+pw28aawwM73U14M3QqK+KvdlXnsGH15DMJCxIY0stZ2cVJSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIKFTivqHQKdDUdYCTr8zH0yMJlazDfT28APVLsbIuMksZ0tu5
 FfsoZiYg58mM0pEy9Ddb3xMf0vRBqgmX7UsNkAdq5Zx/ym69DN4HV5rseKx+p00EJ2pFVpE0dDX
 QhHvAhVkKn3KV8qCulB/WU07Qk3Jr50oWlO1dETvTWxI94KXXjA1qnFnUvlk/hmrkMlN+GQ==
X-Gm-Gg: ASbGncvSSsPHvp5NNrR9eP2fSMRk0rZeS9yc1SVdsnYVii4LHAqxzezyo2Ktb497vFQ
 4cCKiUJPzju8O8vNLpQmGHw/cxxnWsFXg14O7x33AO+0ZgqYq862FDYQ5EBCGf4XFl3YqFArqdL
 1ipx34qR1NedILOnMt1/BeneVzPzbdkpw2ZtP/AGVt2cPwsWOkN0mCGxc8w6OUk+DnS8PAMq/yN
 FoGi5bi493bNtTOoV0udq9LnZwMCKjyPn785jnP8EQfOrriQABHG21hNZ+PJ4OTIwGVJ73IPpVR
 jYuCWNYQxu9Z+t7sK6kupo06scYxpx4GcqT5I2dE9fzRlnXBQLnONUMhmzz9
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id
 6a1803df08f44-70495b03340mr56700676d6.22.1752163696334; 
 Thu, 10 Jul 2025 09:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLcSXwBvzMgHcxvaGx+jxenoScUgyuQu1/XLMH/JsUnJsRg9oDtwMu2U2WZdTeBYZEBbFhcQ==
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id
 6a1803df08f44-70495b03340mr56699946d6.22.1752163695850; 
 Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:13 -0400
Subject: [PATCH 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-3-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4qM0ky7zv1CT6MbG0sETVffzH28Znb5sgT9aMpTi5PM=;
 b=OlOFj1qtOHlC4RTSWWBUoK0UK6p8kJw7bEiAXyh697CDgkPWtlCgHYWxO4MvlcT4VtmGy896s
 MhkQvLZz992BJ4ENElsvaaczY9Qr1s/zBYA7f5mWOE8/m/uo3t62K5q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l_kQ43yHyz8O-hFenPkHAPuNTiz3dKHxFty6paNq2tM_1752163696
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
2.50.0

