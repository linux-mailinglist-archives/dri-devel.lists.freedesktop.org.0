Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCF1CB75A3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31D10E8B7;
	Thu, 11 Dec 2025 23:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NsLenyhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A8710E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
 b=NsLenyhPjQPYghQPtR8V0+LD35LJsS8/8wbaxwO6Fuh267Q0YwIJTEGvgYQMYyzYj8slTJ
 ZNMpEQXG6rvzc2DvmgpDFlBtTYfeH6uX05HLbXLX49rokO3Hth9av5E7uctCS3qIjipvdc
 iQ7d++dlBNIKJDj1lCmTmF8iMRHMx78=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-f-XnqetkPr-68hoFAgkSUA-1; Thu, 11 Dec 2025 18:17:17 -0500
X-MC-Unique: f-XnqetkPr-68hoFAgkSUA-1
X-Mimecast-MFC-AGG-ID: f-XnqetkPr-68hoFAgkSUA_1765495037
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb0ae16a63so81675885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495037; x=1766099837;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
 b=s3fWyes2z7F6UFP82R3fZYGoEwRdAt316qR49k9nvTOYZP+rorJd12V8D5k7fDgjtA
 d/+9+JErHno2IsCEJNdbaHQLQKVshX8hUxZd+hNRw5ENzPiKs+dsPx27nazdav8nuU3E
 w7qMPx72q9Dp6XD6Zou6f/OJ26X71p3cdmj0L1FE3s/NDFgo1MmuOcvuJMGafgKFeTo5
 UfF/DNOE8D0tIeRdyHCnu0LDDCzpTp/967P49iRlkC9fb1H16I5sVo+OMgVbgKyUVWGe
 ZvNLCENWEuy/irMRqhVTP17hhUmuxF0Y18cJgbxtXM6eyyPByIkXT3fJ4w2zIvlG2x9Z
 HJgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPL+XRpk7hF3SdexsSa4+g4+4TnMi/E7F1kKj7jH4O4uw7CohQP3i9DPvy7L57mov3rErNwJ1lkpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSKnSujviQZpV7uVKd5WySEBXf3vH3Df3k/C5WRhrdavpW5NUQ
 MDjalduQJXDJ/oHbOQ7+sl1Fwy/i7jGRAKba5ID1CS8qF6gD65SL3uLSKTHL/Lxq4G1aJNRGltT
 Fsrr4e0pPrMA10zITAiChjIkEjNrpuNqR/pW/viQUs72fD2q8ihFzxI3t1d1Bm4+ZLgm3cA==
X-Gm-Gg: AY/fxX51t7nqV2iRbCI5uTaPr5GpUtOIWjyAjd9p44hGMERn7GORsYNXgO2oyGKmKrh
 ontRPFnqnvKWwq8xoPjn4r6gxqp6UaBpG+TelGJLZcvFWk7tMEgajx2HFwN7sBCrxSBKsCTtH6T
 lXkyYLeeY/nuSZrvL45O+380/eiOJF9OuQD1KJ5Phqqjtzxybje2AP7K1voUQOaHbzfVJFta2oN
 42kJgnbjlhVNehIov8p3z+WlTq8hxf45HzQ1mNDM+atlCBlc/AggSVG+NdhNfNTPCOjhjk9YsaX
 8dS7cMIasQwqyEHZ6UBIb9yATBQZ0DJnA1P0wNAk8Up32Y8LRDJV/VaR6is0ZeXTbykL7gDolyZ
 qBTEXSplOuqmjXDd+5963AGkpWMMYdFYe+CNjSchDLQgu6HLPklpy4A==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id
 af79cd13be357-8bb3a248c9cmr37437985a.52.1765495037271; 
 Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb7AhIjE8zPjDhJfU8aDdJaYDnutBjCMxlmV9mYKDpi24B9muU+pgkYMBUg4HwaDmRYFGfZQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id
 af79cd13be357-8bb3a248c9cmr37431985a.52.1765495036753; 
 Thu, 11 Dec 2025 15:17:16 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:23 +0900
Subject: [PATCH v3 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-5-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vrNhEauHRQ5KoNoMMi9AesnXBPWl/Gp5yOh2A0W6gms=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4JBrssMboevWX54tAvj//eOnz+u+ekf63rRB59E
 46P+ym1raOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ7JRhZHhdsj5E7aTq9jcO
 T97sYPf+/rX4c86W8toYzZ7TW7mNTd4zMqwJ9ZdIXKvRpntlr1TQhxi7aRs/WWw1fXTt7j6W+l6
 mubwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e-CAgf2UlsxOU6OZWgJGpXhEzc6gIC0HGLEpjpXsj7Y_1765495037
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0

