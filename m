Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F3CB75A0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E17F10E8BD;
	Thu, 11 Dec 2025 23:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gwrXM5yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8D110E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
 b=gwrXM5yfZ1I1+JxUpyglj/vhGkULa1TE2o5pE/0cwK8BxQrAHiOOh1xwsVoDgVhoBbFOOr
 Q2ZoNAp3D9HIuzEqWdScCQ7VdrIhYebmiI9xQW1F0Sp1qloK7/+p0R4p5LaHKUV39ZKjs0
 IjyChzogMdkErwTeUTrMcmWxE2AIrIU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-r3OSM7qRPny7rq8G3cZpow-1; Thu, 11 Dec 2025 18:17:11 -0500
X-MC-Unique: r3OSM7qRPny7rq8G3cZpow-1
X-Mimecast-MFC-AGG-ID: r3OSM7qRPny7rq8G3cZpow_1765495031
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b22ab98226so169097785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495031; x=1766099831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
 b=YLcOzV4fk7uAKVtr7ecn53K9GLL9fVMaAqxuGrz4rIY3cbhBdSzbcI86kjPTdUVume
 F2pjvihQ2TM5wRkIwPUxaD+VMWVxYl7tkJyzUQjyGKgpwB/ys63LbJ6rFb+WhnOLnBs+
 r+IvLOzjeh9tTrXCNxSjHuMSjedU5qN0FBLW7mBp0BXm19EJPg4vHdy4Gzi0bWsSdk5B
 miZWLPpy2MmGjB2GJILsjRI1MloFBL19vrMQifGLUCvdrKJOb9MV9a3NRFPtow4QzYF2
 wy2J1OUJ+O7QS1Vc2qFDpKtcM3Xv2hyHE/Ni6Jjy/GAH4pSactTYB/C7xpDcJ1fN2e2N
 h3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWePdd3ljTK1HE7Y1uegIKiWASb7go787iflDvgKcdDHDEbJViNsOLhP/bQpmx4TZJ4srIj+yl82Jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9SXFKbD7xf3ke9KKCdJlwr2Y2h8qzziObv2+t7ordqa4Drb8D
 rk8ARmNmxkECcniAEV3lKcjpXblB1hP/bjRkI5/04vu0SxoE72Qw4x2FmM9wHulyGtqbj74XWyG
 TxjH+UyfYlNGxLivFrIVfv/ffopTtiwfqN+FhZSwDUV0qnsCvLeupuPpoAEqLUH4D9BSr3g==
X-Gm-Gg: AY/fxX5gBnGOM7L705LAnaUmX1aIJlNeZ2Yt7NbFpOoXjepo7MVW3Pg547phd0V4pVY
 y/jBF94/ZqGs42W6OaJTyzayW0l0XthiRQom18qFLA0KJYfIrcC1dYvN7RT38IUs0XucDwBmLIR
 AmJxmyaDAHnaq8+JkkxIGAOWMClfIvadFAp7gOC6O8+4PNDFU4W8PgffdSFOsnk1IFmCkYmWjBS
 QlvjNqrCpmxyBEFH3GtweE5KlMUMy4traIfYwccS2ZothPNy/9HzLdylJ61NmM99GMU9Rwza6I7
 ahnGQf4EFiegHfTsKaPGQ9ZMPB8rTaJcZIfyNkiGeLVwrVwzBbQOX1bI7C3UEOfQBUvSQUv+kmg
 pzhPXoLS6fmqEaGZG4B7HYGdlC4gsDxVL4VmWAkVltyw703NQ+XQulA==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8bb3a39c0d7mr37227585a.82.1765495030824; 
 Thu, 11 Dec 2025 15:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOzc1K0inF9u8pzCleS8AGBiFhiCFwZWvQwaIqfiguX4BE2rhrbkOrS1UeTFCK9BaNhdqc/Q==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8bb3a39c0d7mr37223585a.82.1765495030371; 
 Thu, 11 Dec 2025 15:17:10 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:22 +0900
Subject: [PATCH v3 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-4-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9Rby/gTtrwRqsiL8QVGL8ZbeE5p6/9ylnJs1vpPUAak=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5NFQ+IipFUK78RHpdWFHDi1cVcbxE26yeXHc6Vh
 O+zE1XtKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ+VQz/K3VcuHa+5pQqd10Y
 WTnjKhPnpr8+1w5c0w2UTf/PFv5UheGfooXXh12n7AWuedZrRn37XS3jEh45cYbfFtUtZt8rQzp
 5AQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j8Vl725ZAUt8O3EY-w0ZpBNaYIZ-lVNEGw4I9YK5MYQ_1765495031
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

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0

