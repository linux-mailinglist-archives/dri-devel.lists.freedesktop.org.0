Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BAACB75A6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54FD10E7FC;
	Thu, 11 Dec 2025 23:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d3LBO20b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E40110E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
 b=d3LBO20b+JzSZ9I236koWicDRr/uF7s7qh7gI6p6wgkDZH3SXtj/ndOvZQkOMV/ogqjM7a
 OVghBadRV0w7PfuxGpGvEatrbYoX0RxphfPpKOSZtkh9mtiiWsf80d8TNwMXc2FKjNofKe
 X3zhnz3wO4A/aFOBDObiZxJosfl7cTY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-m4YptcK2PfGZqgjZDPycgQ-1; Thu, 11 Dec 2025 18:17:24 -0500
X-MC-Unique: m4YptcK2PfGZqgjZDPycgQ-1
X-Mimecast-MFC-AGG-ID: m4YptcK2PfGZqgjZDPycgQ_1765495044
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e2342803so157320885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495044; x=1766099844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
 b=lB5lEtb1mG01H6JQNBs3U/YgcuhEnsJoWJ3U2QQXsw+tTMxQzs0uDiQ6D/WaQwyNGE
 NYkj3Md/4DOxvqgq7e7tJtcC/9tZuYP+YZlwwQ1OsgMJbPCNvPN2wE6jEf4CGY8D36pj
 kx4Z8fUzzmETKEduph07gcsOlagITpNS19Wo7HSQkzI1TuxsLwKXdnmNjNgFlXl/V/fE
 sv6YXcDMS+i46VUyl02UB2ryA/I46zVDfQOPo5Cmn/Lcmr5ZWp237rX7he22aGR9011h
 pGomiKY1alZlp480uMz+UJYoRiC60lCNDP8p1xZIrj2Rba4TqRvuTdAux0CN4msTy68A
 HP5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYp/2QmCWNrYcRi10ZbWc0Bwp1qIxM6QyN1ZAcQpK0n+0yWfrtmgYW+ElWvI/s/9xPpJi8XFjCkOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5gvXbfBqoI8ORltfIJeYEBeHknUx0ofXxkruh1nHEUFS+uDCi
 FbrP7SS8pJxExIQrNlsQuvtKyivbTXy1GIcgdObDPIAPtJ7ZW2udCNvA4vLg9BSa0nxUNpQmfXK
 uDRTJraiBvQyzMmRcMfbb8K13+ncr9wghFEAiEHHI9cbeH+uNjIOSs8Ah47W2X7FNV9WTPg==
X-Gm-Gg: AY/fxX4JNP3tGcVDkUFHUZcEwjEbumSdP3O6uyOxS4VGJ1mbGl+0o8G8SyaCx3vBy1B
 ndcdrciqp0/CE5vUsPGQi5QYspgeWmxeGj3uKvohlAJR1pI49jiXAoIzB0OHiOFXD7MFkHpX5lB
 v0qNFM7N7WkNjHx0OWYA/YcF9pFFhm47k8lnyOPF8jer28VSqfqzIcRhWCVvw5iBLHhrK8204oQ
 HCsmiYTYvCJ5TXFYFScim/0OXvHqLo7L2Jx0iIU36rOx/fkP3saSO2Pcq+nC2w54OMZH5hi9ZTE
 ebG64cNo2domz1/uyEUW9t/UDFYUEtz2YQC3tDt36THLSU4Q5BIg+tjWUT0z4iWggXEfBKytVDi
 9Ijl2w2OWTHSww4KotJF79Wm0W+S6HnPsaBmj9UA08i2uDb4HyQtHow==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id
 af79cd13be357-8bb3a39ef0amr29576185a.87.1765495043611; 
 Thu, 11 Dec 2025 15:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEKudoWCpFXTWryHiRn7BIWdpxq1jIr+pxWiYKNOGd1R/M6vLU3ldrF09g/tRZdBf2bnSeqw==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id
 af79cd13be357-8bb3a39ef0amr29572785a.87.1765495043242; 
 Thu, 11 Dec 2025 15:17:23 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:24 +0900
Subject: [PATCH v3 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-6-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nor1PtsS8pW+dX0xsLXLZpeucCjaBZDzA44P1ujZuN4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5JPn9olfEuTvvj3tw1GWwBGU+VG8TbX8XtsrQ1s
 d435bd/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNxyWdkaGhpmnjR5MTRYrET
 y9b6nJrZlTA1uHYXU6Dd9BPilnsqrjAyzK5fnHRCReH6NOn5sVMKMza551xlcVQ5G3RQ+MnShfx
 2DAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: unNW887FqmMwF561y7_guXqFZrjA6JadoxB1fFHo5Zw_1765495044
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
2.52.0

