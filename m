Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1467B1FCD1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A516410E2B3;
	Sun, 10 Aug 2025 22:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iFp6fqVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB1B10E2B6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw1cLvgEhua8i3WpG4C9LAPsxagtK2jeoB8fPKEx0SE=;
 b=iFp6fqVyLh3jXZVxthCwW3aHywYWAyBEAgMSRUjXLVaL9l8S2a8v8cfrVngK+TAqWHvp9a
 noabNTutbDJxP/5XBmd9e4HHM6thN2XezgdDLNf3L51S02pTkavq1a+h2t68OGnrC2q/j4
 NPIdp6l+CJWJ6Qm8lavEdp8N6WNbu8Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-zmwwiaOePYC7V8LoD5lIfQ-1; Sun, 10 Aug 2025 18:46:33 -0400
X-MC-Unique: zmwwiaOePYC7V8LoD5lIfQ-1
X-Mimecast-MFC-AGG-ID: zmwwiaOePYC7V8LoD5lIfQ_1754865993
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b06d08d61bso118155281cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865993; x=1755470793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sw1cLvgEhua8i3WpG4C9LAPsxagtK2jeoB8fPKEx0SE=;
 b=KdSOl29gWT3be2j126CJEZDJdQ44pZVMdr2XRtQiLHTpdBgcoMCVt0tTlQSbmDNe3g
 4Au5lWJN+vNMwfaNmw+Cv1DhFvujtkGze7/RHUbYWUKl0iGsJ7Zm40ZmgawaXCiuwP8j
 H7qjYMSHrgUvl7r4SXkKaAyAZlE3MyVn2wb0pS5MzoFrcQBeeqXoEAHRJFgqdnfQPae2
 1dRrlgTtFuXGSIB83E00lnOO1twnixtkfhpcL9y81Su+86jBbfNloPyHvhlZ488jllMx
 IHDdIhkcTqNBkmG8m8aEeajX/N4PKDcjzgyo19YjAOKLIrBwM/iAzIoHc4FFKr30um9C
 R4aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeug9nIUTQpaucDOizOfwOR8ovI0LAu4kLS41SojxHLjyh1DiXTLJCV+7QzJdkn7dEKhFVOg47mjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK9jnSWmItOSrLWrPhN4/sHAfJzZ/OL8ayyl0TR4vuuXOojYV9
 VAYS+pWKopAujGhuHHaj+qOMX5xp87mYu7kc4ILa1UE8ESPBRF86r1maXG9N3Y77pBou8ZHX7uD
 tTdRLaWg9CgQ2FQA0T1UPmbv10WCkuFPWZrGp5AB7Ac5wIprc1hA/xe09JroG7kGtn/aPrA==
X-Gm-Gg: ASbGncsvCJamqTH9UsfHRXTfOt93G+FhJFPN0hfU1OVBTuBNmiw5hGW0rwjLTtparzy
 k11iocoAZxgoCW8CirW2KHnBxpvgQOKvm/CcB5spPPoCO2cD7q7qpPk/GPB3hN5dsBirkgpuePL
 T0wH5iCWna/ZQ2uN9w6hAR82WuFwRMOm4oruXFc27uw5gGKE81EKiysECGrBXVGH9+05/cI1IlO
 qilOuCB9wv3qhcx4kJZWT4Wz2scEekmXiev1DwZDQdveyktB+jzhuwIzy71B2FBTxDARpDE3jD2
 EfnnwyJEWKDagINTNKZYTTQGa5zO0YPPjEnFMcgXCcFqgyeKosCuBc3z5xZYFV41SYopm2Fvu4B
 e0n4m4A==
X-Received: by 2002:a05:622a:2b08:b0:4af:1fb2:339b with SMTP id
 d75a77b69052e-4b0aee5ae32mr145137551cf.59.1754865992936; 
 Sun, 10 Aug 2025 15:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3TxaNlOm6CWR20thRFc4k1fydx3ZMYAWuNcAfSFTfYY5caqw80RA7wi77MbUh3gKnqnfd0A==
X-Received: by 2002:a05:622a:2b08:b0:4af:1fb2:339b with SMTP id
 d75a77b69052e-4b0aee5ae32mr145137151cf.59.1754865992498; 
 Sun, 10 Aug 2025 15:46:32 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:46:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:33 -0400
Subject: [PATCH v2 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-5-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=x3H+bi72Ud0O2ADBCQwtbhpk+18O8IQnZUeD4zYXytc=;
 b=Ko6nm+pXyNo8X1nQDJr+lVHcu4cXjZr/njvgKDiWI9hUw5g4z0iGWyficBfc/rHylfr1bFBC5
 OcjcwnYNCZzC9mq0m1MLk4fjF5rjaP4zt/gCvk1nnxylsB0GMKTpJxJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FdGDUYurT-yh14yhD5MCTU2mk7u00-kklyFI1FmNqbI_1754865993
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
2.50.1

