Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B764849E39
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06AA10ED13;
	Mon,  5 Feb 2024 15:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="K+kMj2W+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDD410ED13
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 15:33:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4TT9B539gnz9t42;
 Mon,  5 Feb 2024 16:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707146589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBDoGEw5H7zjvt4Tn4WN7vmGiia6CbPYmP+MFo66pMQ=;
 b=K+kMj2W+vma/KQ9lAWxsYbj+TWWA3C2lkGsfIe6441w1ujtQ2uNtMn6ZUO7h5vb4SIHRBr
 Jzmb5bqn+dwiDBPrnXeU5V6iOsR8gkYsw9lxyBowwqW31AbcbuSEyn/IGt9kRlM3eH5y56
 4eqitwpRFKd3OKpGpg3za4bMpBgjeGhA+CczJZ3AGol9ULQUmB3sfV63QZr2Wt1XRsUfXp
 4+FeUMH7ElT+IL0RtfEKiiFqjHYx2ilENgx+8F5Oj1b5VQkdXqni9KShvH9lK07JVJYD9D
 DqnQk5K7D7expRK/BSqA9G74tW7ywW3qfBdg8pSAzrGrLTuLobnHCzuRwcweLw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 05 Feb 2024 16:22:27 +0100
Subject: [PATCH v2 4/6] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pinephone-pll-fixes-v2-4-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=IJ2XTYWEqbQDEDOuM1uZXEh/F0ICX+aNVO21sCOdmPI=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlwP0/l0UwLaujQoqVqlgAplWnj9SkVd43u27AR
 hJ8ppQSdNeJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZcD9PwAKCRCaaaIIlErT
 x7FXC/90qKkh7DIYRrFjWYgNWY0/pU4JrxhWDBtAHt5wJpTbydki4DTNL+Q1Fn3RK90LKDg1II8
 lByqgCm7+mE5XoGJaawBugzun8o0ScmhgkL08Jh+qfmb6nW/TKHXK7Fnt930z/k8dEbA229cxcE
 ASuS6FKwzV5bMoLe9PLDgbCuN+qbLvaPFq0XI7CV3pbKlasuOZ7IeC31au5eqAyLFJLO3Z6N5yI
 Ze35tLjN4dvaESV5GOJIBFsVxeai4Gl0gjkPLU+ls+W9BHJWVGtvuLiQLnF3xzvuJXZ26rOf3Xa
 4AXWLf6S6J49g1SIO58p7ZOEdMy8nrgMgNZJcLgFcJcihRtO+unPygRjBxaeGD4q8HL7KLr4fwS
 TX4zIQFIbeDigF8Nuzgh/J54TwigFxXduAEif32q3xH1wLbMeioZ8SW/SUC60jQAvpXADOrf4YA
 qg7rZVpM5e/yaZmTs9o85fHF8F/k2HyRF2Xe52/BI+Bl5TlplgEJ8G82yD4oMsFclQiW0=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4TT9B539gnz9t42
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

Set the minimum and maximum rate of Allwinner A64's PLL-MIPI according
to the Allwinner User Manual.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index df679dada792..99c2ce11da74 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -178,6 +178,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.m			= _SUNXI_CCU_DIV(0, 4),
 	.max_m_n_ratio		= 3,
 	.min_parent_m_ratio	= 24000000,
+	.min_rate		= 500000000,
+	.max_rate		= 1400000000,
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",

-- 
2.43.0

