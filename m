Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945CB00825
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD110E929;
	Thu, 10 Jul 2025 16:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ewcv21is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6110E927
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
 b=Ewcv21iswEsH3CXmfCsaUmLTrP3ePttN9lngETRqLF3Ef/UskcP7iOvAuq5ydPoOdr/7I2
 8x3lYQQUX7kj8BpTC3cr36pdhPi2aiOGeByMcOQfAWyybpDcbtkbQaYY12nAXa+N7bjRqQ
 jLWI8HsElq617+HiCtVkIeboqkDYvYE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-EV5Wr1-7P0OT_cEMDEuOew-1; Thu, 10 Jul 2025 12:08:21 -0400
X-MC-Unique: EV5Wr1-7P0OT_cEMDEuOew-1
X-Mimecast-MFC-AGG-ID: EV5Wr1-7P0OT_cEMDEuOew_1752163701
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fe182a48acso42942646d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163701; x=1752768501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
 b=rdMN/f661/mFdrgxO1nQEmrcEbBk2H3sbKAjgeCKHX7SVWGk1gieQ2SkhXHvtXnk5T
 H2kChQ1tnap5wC00k8r/tpedeRxXkvGIZ1i892TEVs4dNEeQR4FVbJ3V9JBrfRuqjUrD
 UuVsaDERI7pfPc8KANJFPJWXQB3/haBFZsAJ+lPPMAwguK2C/8FbmgcN19dYouA/4cH7
 88bBRxkUEW7f250M08bUjAP/eCciancZe7S/v2HmmLPlZBFuIZild2AWOvxZU2I7wQ2W
 J/sCzwe0Vcp6fGrSP4QjaJMtJDZekl1u2Szz9C9n1de8G3JUcB6fxNIMMiZJnKC2cENZ
 hiew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OXKuRBz+FMJhUU/dDMNMyTQymky0I2eZCZ33y/ZjzAJO0s7YHaV4Le9dgNa/6zJqS6YstNzwfsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZW7wSUwLTxMI8Y5mcKa1Msa0+DOGn3Ld741hFTRzCqfe2I9p6
 YmEBpptLTGd3L7k2wwXzSurK2Dl3ZPr9bqWvR5R0xSXdFZxO27YuW0Cro3aHgrhl4pwXBjDV6u+
 K33b8vllm0bik+9DczocGyIwp5pTdJFeBmSNUNfo+dimdLPofKlmoXNdjq72cLNgFGHFSTw==
X-Gm-Gg: ASbGncsVwbXA1ZYA0hD7cB/9xAGjDQUkQCX8MoqScR1YdQjAM9IIewrcqD26Nou4LKJ
 Cbfs0PA0nOZ4vtq0+xngwbcE7isPz+61RBrC/NUYLLRa7UmenTY5hlDaMKDZ9A9zNtC5eHu+zI4
 0GexyCzaAn4fH4tNcOEBahpUEyCg4sKoxXZWXNTFdikhEpmCwxjqB2iNp+8Q/kfGUK6XtrcQrnj
 CnCt6fY+nTEYgR5qpeD2+q2Y2LkoDK5MmDPpruGa9nboGmO0kR+LHyVmfEJLoxuv+rhSdREb1ej
 93o0MmSce9GXxwWXevO+zdbl56gY04KBQJtm1e6wbQdrijeno4uJm+D1F1TA
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id
 6a1803df08f44-70495a595bamr70247596d6.7.1752163701090; 
 Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDRrDKWwpckJ37fdbyhC+PMLfUgyhQZCTV67/zNoDsc5Ut1ZyXEkNXO6Agbo3M33HxjAj7/A==
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id
 6a1803df08f44-70495a595bamr70246876d6.7.1752163700571; 
 Thu, 10 Jul 2025 09:08:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:15 -0400
Subject: [PATCH 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-5-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Sp7TBqvADBjUTdYv865HJDuwxPugQD7l6ebJ7mJAKsk=;
 b=QdRXZy3WXcCDAKY+nITPfzBZtQ8RpvdKNlvOltT6ZNVcwHEAkVhWAcnk2UBWK7KubiIjAaW2b
 RaP8yKzs4UnCzedb/XCmTGOR6M6qboXHNuqR38QkPjLse9NBJ4Rx33V
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vvVcL9SE16bYhO70ICtpxd4D2qsHPIY7XN4zws9r7fk_1752163701
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
2.50.0

