Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B233C3DD58
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ABD10EA0F;
	Thu,  6 Nov 2025 23:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A/nAHLuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C41A10EA0F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9L/sBg5p+zCSkuU8Rgk43t0p2SpxKRb70QYldBV7fzA=;
 b=A/nAHLuGnTk7MMKU2uuRorRdhVzrS4fnjaLEPDN9UfFq52EbPP1hWB39HwkVnjxzWszOSF
 HePVW5AfOWj5usXaQQ1mxg38rUJVMtp/jOIsVcbmDjp/1bn9zapSRofRM/eTMmer+8ZBon
 bLHvzo9lccZxz7JFlXno37tW2KfftDM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-rfpXDxJ9NbCql921p8P6jA-1; Thu, 06 Nov 2025 18:27:17 -0500
X-MC-Unique: rfpXDxJ9NbCql921p8P6jA-1
X-Mimecast-MFC-AGG-ID: rfpXDxJ9NbCql921p8P6jA_1762471637
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8804b991a54so6426156d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471637; x=1763076437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9L/sBg5p+zCSkuU8Rgk43t0p2SpxKRb70QYldBV7fzA=;
 b=u0QTNfFQuRNujmcqie41N0D+2cdN/85Dg0tg+5891jvjnrzdgDkfQrttKJr7egjclJ
 6v08T0n8HlPfATFLsbXeWVfqqbVF0NQMWY3nS2Exqj+F0N5yEhn7YO5H67KH2U6hjsu1
 RjyYAQvVQPfsi+9ZYI63x2k/x2zHOWeoxRlorFJBHEG1YhKzXXwB0HqxicfPnTqGU4B/
 vANdfI4vAmcXubjqu7HmHj8rnrejH421abqyJNiyerMzFTe7ibRMMkjhRU8PdnIz4fX8
 /xanBgMR7ExqQcO9FzjhQfF6wBGr/Q1H9dknALoYKzJwtVs97LNHFJRFlqHGGCSN25G+
 QtWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn/fpsV2N6e/MNn70Ck682lZC55LIuNrRfFfgTw89y2UnDbikYEwWAoegvM3NTYMkqzXqRaMeFSdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr0C/6so+/z6g5bCqeAHbgHwMFdPTm/6EmPCl+KTmqNkCqu7du
 0cV2ZCSYPSHq0hXQyrf51ELYzz/HqtZZnGXzIE592Tw0nHFq3hrdDpcr+mGMuTAxx3tZz9HaZ34
 wsfZ7wES1d0fTa1IaYOeIe+RA7uAswSnKjC09Kok9Hui8z6xhCGqH/jwlGswAd6lG0qbZxg==
X-Gm-Gg: ASbGnctIk88bzPEHxpQTqccJ5zV95ZdisVUwfdxUvx/qJV56VmgBdc6QHnk9LWsbgwD
 cKc3wjBXRwLkmz0pXxMhChZIHNOsauUITsACwfI91N8ixE0HbMmtWA5ESmX6X0pwTpf8RoE7ZfJ
 d+6jmOWINZO2a6YWDBXuyYAzZS9QvLZIk/C6Fd25H/8ADkuULlkjxPzVIF8o0EOTClra4i7S3el
 NbbOLwh7E8le8ShfgM4m7czPs2l8HYn03oW5mIaEfxWzAOCD+4TR7fdbTvbJzRakBA1ORghntdR
 CmnS/Gzr3i9P577tYfySTTWgmOCb1G6xsocTFod82ZVz+ocgTt9eTodSL4pKIVeI/QOeJQdvSxF
 IGWykqxdMSiYPFITJb2WxH9NZ45t0E+DGXbL0roOQhg==
X-Received: by 2002:a05:6214:810f:b0:882:2b58:af05 with SMTP id
 6a1803df08f44-8822b58af3fmr5877146d6.48.1762471637087; 
 Thu, 06 Nov 2025 15:27:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1XCrROxUSSUDeHa7EYXOjY7BlUSEU+1KN5k26BLJ97420LzOY9XBUmBbdolqjriVUn6gaKw==
X-Received: by 2002:a05:6214:810f:b0:882:2b58:af05 with SMTP id
 6a1803df08f44-8822b58af3fmr5876876d6.48.1762471636685; 
 Thu, 06 Nov 2025 15:27:16 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:27:15 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:55 -0500
Subject: [PATCH v2 RESEND 9/9] phy: ti: phy-j721e-wiz: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-9-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9iXptdlJzmQYbdsB4jJh8DRjbxMfRMBdZBM5EQuFpPo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RbO/3Cz6ImvwxqVjjs9Zh9cXkt4xi/3tFVrrZvCq
 FzoYa7RUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETctzMyrN97Xj/FqOTyx8Oe
 BVe/fe0KOWr9ZnGj8AlvNc/C2uUJqxn+p125kiPwTLJszq/Ph01tT7ZsTxc15DEN4BHV5fj7Yrc
 TLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sk6mhpxc_8nUVwhVLdpd-ZH1ANfmRJOR5RNahUbaiFk_1762471637
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
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index a8b440c6c46bb0c754845655f9c2c0ba6b435b8d..cbc98d4dec74560e6403fb899ebe2bb916440f45 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.51.0

