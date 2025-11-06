Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DDBC3DD43
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628BA10EA08;
	Thu,  6 Nov 2025 23:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U3XXE7MD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3F510EA08
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
 b=U3XXE7MDZx9CDExms5RAyWGklKo8mxtTrXfDxvaafsFxeYV6PrIBBrcmyry0lKukphXGpZ
 NPLJZgP4AW3mtkCmPJZ6HXk7kdd4mOaRmCa7hwSi80OUn4D8pMunw1ja2Pth1dAQubTdD4
 YnXgqWR6UcPJtBKhZmXLirkePVRC8ok=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-aDXxzHQDOmudzAutTwnHDw-1; Thu, 06 Nov 2025 18:26:56 -0500
X-MC-Unique: aDXxzHQDOmudzAutTwnHDw-1
X-Mimecast-MFC-AGG-ID: aDXxzHQDOmudzAutTwnHDw_1762471616
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8804b991a54so6419076d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471616; x=1763076416;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
 b=XBMhTFkV/vpHUtbfwOcu0P4oSFhHVoc2rLK4PVX86PFnEGZWIx1X/Pig1ZzN013hmp
 OsAe/4UM/s9KVJw+5EemCWlpaiXXwN+EuA/U2fTh5pdMUBT0dpOnVwmnnjYCeNn0LqUm
 hBJAp2uVvmWLM3o8rxOcMv8nryAEyBhDv9hPdbDt/iu8C+LNHWHbRoiPfUA5bXkmpey+
 2aWgcCPty0HQfgCMtJicsyYAw1QZ91yfvdNVePD1nBQDljMq3GMHwMiR7o2k+pdb/vOV
 le/zYB53asK50UNmHF8K9EAARxhvEtp3lYT/PF068rmsQij9gmH3IlE72LmlDOS0cGdp
 t9KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKdYWETpYo0LycrRor8l05zFzkXX5+63r/bVWys76P1sZE5w7Nif5edDGUUJ8Sn1riFyHUASNwhUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1etbci+G+k3ORnEYJcat+gCGj9vuEQaga81ev7k8NMG30wIAa
 RUQhige40dEd4ppYDAmAtqdJJg6opOEzuu+Yo7OCpcucXKjGcK9lSD/x5bGgoHzHscfjyQfDnFp
 BkIfh+kl4aIk8Z0ECeSVltJTYvWrh6KtUUi0LvojtDu/AqNcbsgeo6p9KtfRjt21sw0Teeg==
X-Gm-Gg: ASbGnctAv7ZHsX1mTev/mGUQiuEOBDjxrWr7z4B2yK6hcJpTgqpIgMc7v0y2zTAAGMF
 tqOuIjlR2swo7Jr3R3usvQSGdRAJ0EboL33gCQHAZnyjqEJiGM7CIb8qM8Fl3v8irHv0HDLae1G
 e3c8IDPb8W6fO9gGEBLIho162sPSxaLRfUVohlZSHFA26sYMMdukKcN13nd7gQsofzHbPgW/D4T
 F0VFFl3eTrxXhb/5mY2BL2K7bVcg9uh58rgzhHVT2Dg5pffT0SCP9Mft9ua6U59wiHBm/Apz334
 NVlj483LXphNJs1W8bUfIlNlLUTs4Lf22lAIkdwe8W+QEi3sHQLugRW9tIo2Bzam3I1z4T/7v11
 ax1cpnI6XY9pS6MloGO8Dy4nXTi1SatrrMJ9xvLhWOA==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id
 6a1803df08f44-88167afd114mr17958176d6.13.1762471616009; 
 Thu, 06 Nov 2025 15:26:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5Z5NCJiDJsbMHVlrtUlpGjakDqi2/fs01RriUHfEFSw/5HUZvbsIZYCzQ2U5thVfZ2fi0FQ==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id
 6a1803df08f44-88167afd114mr17957826d6.13.1762471615658; 
 Thu, 06 Nov 2025 15:26:55 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:51 -0500
Subject: [PATCH v2 RESEND 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-5-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0ONTyRyj5ognfzdcLi6VRYwQ6d+KVHGkkiYfjM3qIvg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Rbkf3oWx/vTtHDr4ZNVHnvrgjPm/1vnKvxMrOSmb
 750m5RhRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZ+pWRYV4nm13uT+GVUvvf
 X+i7YP3Pldvp2mr/m16xsrMLpB9/nsjIMFm0TLfkQZN196ctK6/pBDG+ze6XNL4ZuiJg7iIPl1U
 XuAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m6OBxfO-Wr1L1DIlOLqDnjzm3A1NcvHQyo6QcCLiG1o_1762471616
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
2.51.0

