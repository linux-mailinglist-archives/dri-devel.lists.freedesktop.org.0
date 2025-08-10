Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5125B1FCCB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35F310E2AA;
	Sun, 10 Aug 2025 22:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YLCOyhnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223A10E2AA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnGrlNLU39XteVbV9vgE2Sk+xvdwKQpHrkhTkr/Vktc=;
 b=YLCOyhnNu8Lo2cheCKTiEY7w5DLJoJtVg5qqFckzh1v7FkwX/feV69fZiqP4KBKJKkqRNr
 DDak+J/bfcW4LysrGrSfhVHoHehzGaShW0X3cvmExmxn4UpIGXkcGUfpTzH42vHca2zgPX
 i4mqEQ7d7KZ/Igpmgc3EofTSNUGuPTI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-0ZXqcUYCNICwyHb71Oi8-Q-1; Sun, 10 Aug 2025 18:46:03 -0400
X-MC-Unique: 0ZXqcUYCNICwyHb71Oi8-Q-1
X-Mimecast-MFC-AGG-ID: 0ZXqcUYCNICwyHb71Oi8-Q_1754865962
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b085852fb8so157974481cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865962; x=1755470762;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnGrlNLU39XteVbV9vgE2Sk+xvdwKQpHrkhTkr/Vktc=;
 b=RTKiXL4wTNZjMHMxQbnWn4xBe7ySN9HagGJALwcmj/sxt2sJSlVF5zPHoeoLklsfoc
 JBAEuRJs8lQ0ZM8Cf2NyNdnTKGbsBu2Rka1eWm6umHpumwU/eqoShUAZk/2DeojZKkdK
 TtEoH1pOAdg5Uscj1kEls+oWTkInM15bBcgUHnpZodnNhFMJ4OulhLJ8kBr+JTRE5ykD
 7F04Xc+O3N+l/ccUscXfQw4iYycEOwnyDDO1Kac3rwVQPjzXYWi4rXgslWNbs/m5+8k8
 4JlchR2m892KzBkQvxVQ2h0HSkYPlMz4YMV8EARm2bqfZWemxGvVf5auBX23Y1cPPsxa
 6NxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Y/lpnFUqnc+elNQr5NppnkKxed/bStmHZAJ0xkreYHZR97PdikMRzm28U9fhP6PgIZMPcHPM1jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvIB+t0BwSOosdk1VsOJjgJms8Ph42JnhCJAmzUXpE/CrKvPDj
 6jl/QyULA/AU3wD4uQNqLwgZuuC/bNtrqGvv2Uld9k9ro2WQJniGNwDhpTUBMXmV2QfVgqIV05C
 zK/Gf5LxDU1rRKba0CTxGfoKBp7ZSSm5QtqrbxKN4cuzX6bYtYoTtVU09rZHjGnRMaoCEKw==
X-Gm-Gg: ASbGncvfREYDT3um7VKPvEgSrRRYEsBjj4bNf67QGzTh9BAyyECIuMB1xbu0KCs5Hdm
 cTcIyp1dO+cTpllSrXaKEDir30upDItdGcNyPeVGvekAEGvgjAh1VOJn+/T5+uSsLaW+a4TShxP
 OqRus7r1DQVqwk3j/tLjZs4NH2AoNlNh5o36HkMOw5iOpdfxnCyJ1LYKSD5LKi8p3K95xDnfITT
 mHzOPn93ENgEEQzWoIIp+BQ458YxUn2rHyRiHpg86DZNTaZRmPjOYVDvyV/uBvF0g5a91t/+Q1e
 CQuFHtdBw3TSxuYMihe7c0Bwi4EvSv9KtcuqWb/+KVxJWeZIuDIVFX48ZLfZ6XwAFJAk00+0GwG
 OL7d56w==
X-Received: by 2002:a05:622a:1910:b0:4b0:77ae:17bb with SMTP id
 d75a77b69052e-4b0aed3134dmr164413291cf.14.1754865962222; 
 Sun, 10 Aug 2025 15:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUie+6kdU1EHKp7zY7Gli2dqcxw3eGLN8zRdb828DF1xFrgrp8MAMR0KX4wPSSD6n4ZYgkPA==
X-Received: by 2002:a05:622a:1910:b0:4b0:77ae:17bb with SMTP id
 d75a77b69052e-4b0aed3134dmr164412901cf.14.1754865961731; 
 Sun, 10 Aug 2025 15:46:01 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:46:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:29 -0400
Subject: [PATCH v2 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-1-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1978;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=a0rSL2H1S/HUaruR4lcZ7Ks+0rkYUs1GnZzD7mNCe3M=;
 b=/U1k55v3iKOX6MHHG4y2eGAMFrca8JkeVtSpJcoc1Z54FeYml6kJU2G+QOt1KduqEhi06mYeN
 FwMvRbQ0c3QASmeUiY3XU6Pm6Wwj0gFLroBs3uKkqqGAWHVZhKteVKw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m7tQkuISXBxapjZdQugm-GW9GYb2taHjYrMhPGL3Ldw_1754865962
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
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.50.1

