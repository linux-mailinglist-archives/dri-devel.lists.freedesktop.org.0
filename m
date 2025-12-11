Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4ECB75A9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322D10E8AD;
	Thu, 11 Dec 2025 23:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AW3yD3yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD310E8CA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
 b=AW3yD3yg0Ge5x/RKsL2hSUc3p8mCW2wkr1wRXbtBlzxbHBy2Rcmu8pd/hd2yDw21XD6fdt
 521XjkBRVd495w/TBAotswP4wDzdxS2x+yU+fiKsXuQNTzTeCls3H3WLJjoz5RkGBAKM9W
 c3Ri49jH5SDQIbu5Eyi+1O6pykQDMB0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-WF7yspbRP3qDfjJS2BCnJQ-1; Thu, 11 Dec 2025 18:17:31 -0500
X-MC-Unique: WF7yspbRP3qDfjJS2BCnJQ-1
X-Mimecast-MFC-AGG-ID: WF7yspbRP3qDfjJS2BCnJQ_1765495051
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09693109so11293831cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495051; x=1766099851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
 b=eL9LHl48+Gjw39MuVzFVMCNkOEBbulzwSaKLC2CIonFI6AZig78d+OKBCmLAkhVcAS
 SxZMAoUunPjWe6fJCMC/Y9s3UCv3+DlUf6WVQlUaZdNvw8IKN/zuuSKJXV9Mbfwk/Gi3
 RKv/m2MMUSAyTpQnuX4L9Fhndi03swQJMzP6LB3XGXUGwhDpcKGZzGU87jTkRjaOrWsp
 TkUP0dzbsojg33zWu0DOs2oJKkr+mkgbvvq4dSkDnwlIalENgRWL1jKaSsXyBKkpU9Lk
 cLspPkt7WQSMqXZG3vYXR1ZrqynTj+K3gLTFBmfj1gBOZ+Ua3l4msSDtiwDV0vXIySq5
 Vazw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIBe+YBVD+hc28tckm7S66XETKr2gJezej723sJkS1KF3PmyOuq1BPm7nuwtJ2hVvnKWTkRjVz0v8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV3q55JN/Iu56RgJFqUHcCvx3mu6ZXQEGxSRlGPpfEJCSW6eCY
 gcxW3V7grAYUiNflgUtuZM4AufSoQeo+57cndb05a9Wu0uYz7VQDTkHkzCqWoztWO26bAKulesI
 WzVRlm1povarqa+5yP5fCARjFUM+ZDhj/p366Q53YD9mnVJVPE0gRboFHwNhdH1IDQKbOWQ==
X-Gm-Gg: AY/fxX72jzWRDGILH+5+8ES3F3n+GMR0xcznChKExXBtV2zGTACpbCLsatqZmSUcOgR
 ED7rRyPV40LU9liWxQF5ldKV0Lq0E6+FsmzdL82MkoFYMxn2If6lS4qAn+0j8i5QDilFXnG6w07
 jvpGqyhL7Z/MkVmXjBNyq/+bH+7AJcC0B7oe1jmT15zRzzcdXfDXU41IRvbfe36EHmKVphEDAbx
 dSJR9jSQ2DuCNwbzBApJKo6gRCrw2ZupirH/R0LePzsZ8Vz6Y0ADgkPfmxgV3tupncCskxZKefb
 +alzqdzTwNXuaqR21IBaiwoq6/SBM0D8aTxaWtvZyEY/wX4GNh4KI9QToVb+cWKJqXApwHQnqYO
 8x2Mn6SBvF6leeOzmXmTDb9fjVJLzup1z3uHwaiax/vZKEBaIjiPdTA==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr776181cf.70.1765495050790; 
 Thu, 11 Dec 2025 15:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ2mASGrb1uGzvUHEFvIvmoh74d2qrejs22ELk7Vj6VjgPY8UzKXQvMrAzIodArePD3T0o0g==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id
 d75a77b69052e-4f1d06121ccmr775831cf.70.1765495050403; 
 Thu, 11 Dec 2025 15:17:30 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:25 +0900
Subject: [PATCH v3 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-7-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An56TAX1cqo7N9lFvO25vdxikpcfbBNUoQ6JxN8UiKo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5922P1Zs7hiGnB+9TFs04zdHhsnafw74/pp2aRZ
 xsa/1Ud6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiL8IZ/tcuZ/74xmunwK8+
 K0b12kU3f76araLG+bUwwmBtXFmp8SOGn4xTJlnuvLvryMOzu/sCg/+572ItvCozoev822K9vIh
 jf3kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zSd0zj-cPWqS_fci0x9wZFPaDpceVtGCa2-V710_Ch0_1765495051
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.52.0

