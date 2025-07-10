Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E2B00822
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033C10E926;
	Thu, 10 Jul 2025 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="au7AW1rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ACB10E920
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
 b=au7AW1rkUNG7VYbBZzDv+/zHuPheSmsvojPwptr2bBl7uclV4AQDIIZz1yPD3BlYlhHaae
 d8Jwi5fxW89u1mmji7JiCxK/8fTN7/P3HUkptJg/bp1Nk0y2O0tC4Qq7HygycatkBxAo75
 cim/DZ1Z7agyUQvbAb3qcqKzgRFf/2s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-dw2R-ER9MH-BdCSgrdgrgA-1; Thu, 10 Jul 2025 12:08:19 -0400
X-MC-Unique: dw2R-ER9MH-BdCSgrdgrgA-1
X-Mimecast-MFC-AGG-ID: dw2R-ER9MH-BdCSgrdgrgA_1752163699
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb1f84a448so11757486d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163699; x=1752768499;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
 b=aB6FFJa3l3UzFUHLqwxS2hGemVs3U6Xar6BzB345m44yUI07w1pqMP3aaqJC+oKOAT
 Q8QB10pkdSmxo+/phgrkx78bGBVC/Da/T/1JHTuDo4MQpzPnN/M0pl0lDQCoeIG/BHE7
 4mqtZsl1uLll1u2AV8QwyMm2WMOSg4klDjy2EZqNpPDsHCDRRvREgt7/NGadLhgum+sX
 L7FJ+jtXb2ZSrfMKudHZ60XyjORu6rFfFNi3gdRhy9suGga7swNKCfBAq+BxEOiQ83vs
 7XtTr6jycmp607sfQCyuqbjeXR2B0zuXxqR1fI+Kmk7kTzrjntjh9cVveeqn1deynuyD
 nqZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmISuU94SWV9d7VTEgQxVR/XZfaO5NNvxR6/p6BwJbEfm0vrAHP/StMvbXcQylqR1CM1+GtdYNCN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuJQ31TTKgYF+puaJZNX4ZnPWnu3gxRweAsguFOTCRdVMY8RnL
 Gq0geTwehKxqogpQ+qZqxzUswZUToxrLt50pXgO5uB7y6yADufRMjKu1Hihd3zOJHvv0LUNHLX9
 WgYP+LZYhYfsp9mg/gP3068EMxaoMDAxgevszqrAa9oI2aJIBy4kigcVBT2lTmB3QFfMttw==
X-Gm-Gg: ASbGncsGZunTZ/ICr9w6Df79sjniT679KTc9JDCjtlu0CU62qBzfVMwmdAAUuakg0Em
 vSds1wnlT0OiE6PzAE67eLqovlxrBDfNX8bAedJN7xtMJfvest86/AXHF3wHLAMIFasdnaEml/B
 Zi8GqiKcVRZ0Np3DWxSdkqZP4C8R3v2VEQCKGIqAiHDV7DTENPUxxm/9Nqr4eADgjXCFfOApyOf
 Y+8wB8gE2rBCV27NonCLiyt73ILZlRSpg9plvFkaDSfqBcWD5s8IKWHa5xnuKrKTBPgfEP4J2kk
 rpXxdqfzWj0qwPGa+L3hCtCGGcixnu0wMS7JTMG/mAhcdoJCNuOqR2B6L+Uk
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id
 6a1803df08f44-70497fab6f5mr54886746d6.7.1752163698889; 
 Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPjEiUWwXCCHctPequGjvxsmcP2oTYR8PP+05MEZihcEYQLxAz0y6yXBwiYJgaIGBkfIQAEQ==
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id
 6a1803df08f44-70497fab6f5mr54885916d6.7.1752163698330; 
 Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:14 -0400
Subject: [PATCH 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-4-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DwS1eyPB/neaQufQvNJoTsoU5XhXKJIB7F14A2pZwIo=;
 b=4cPcXNvbK3LJUngty9/hS4Cci5iNskdrVCzBboRgMF/vVZq4JO3qCRcMs3ZcshnLpFzqFvn2A
 ZJ4lm2QjCh4CBdhbHz6OimHjO2IugpTJTJVBSFGBISv7EeMJ0RGydsb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oqUZ0ePQQop59pCKfWsgXEzTmOoN_e8E4Aa4ijtDpQI_1752163699
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
2.50.0

