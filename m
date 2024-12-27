Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511959FD46A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 14:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C727210E3E5;
	Fri, 27 Dec 2024 13:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="k78Klexl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2720A10E3E5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:02:48 +0000 (UTC)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
 by cmsmtp with ESMTPS
 id R46ftHqpTumtXR9zLt0J6k; Fri, 27 Dec 2024 13:02:48 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R9zIt4C33T3CkR9zKtxxVw; Fri, 27 Dec 2024 13:02:47 +0000
X-Authority-Analysis: v=2.4 cv=EYHOQumC c=1 sm=1 tr=0 ts=676ea577
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=8YUH2e0Ys_Mie9xma7wA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrLVykqlMMRYoAZ40Gm5GHLbrDBKpbvHh222+1nl1sg=; b=k78KlexlRsDbSTFOglO7/FlqPv
 EIdyYcPIF+kFRWvudNqD14Q0Q+uwKn38Ym4cE6YPfvW9zb7kGDKYPLr3XWua/r4gRZ9XQBv6G+Sok
 Yu9byCsBqtfqhRZoNDDNQGgilEH+Bx23CgMq0tMcH/opquRWI0HR2ze++61yejBKbpTMWmQjQfi8v
 4ETvxGFWV5ICcedNLEztA6Istuy7tSqqV0y8jSYpSkroNgXcigkPgBF2Uqw6+NAUZh9Q6hVD14RFN
 S+1ndwyHdMQokc8m8dcvLCb0WEHITjXpREf1w+97VX0nIYtbO2SSGAtzjLHSnqTlW4aEz31Nt/aOd
 uUOKa0aA==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR9zD-002EaQ-15;
 Fri, 27 Dec 2024 18:32:39 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:31:04 +0530
Subject: [PATCH RESEND 15/22] clk: sunxi-ng: sun8i-de2: add pll-com clock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-15-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=2447;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=AkiOtlTE4u/lst3b/C31pu+RJ7eNIYaDQvfAJLBj/Lc=;
 b=itsAgQbKjzCgMnc9eppPifulo7E1Tan+NiL1JiyWH64Fa6QHsGiXfPtaB4hMss8iKJkx3BMfy
 dUluYhgUb4rDIjhDJSMEhDl4UJChxd6+MJPobrt3G/gX2Id1J4dmVeY
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9zD-002EaQ-15
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 457
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCfndMBatH/OjhOFGhlOslaxNfGHk2GK9tLUrn5V4fwloUv/TchqTZKvZqmsI3o1UWiGEZ1eCXxlteoJIH4VRHHwnMddlsrinuayEWXBJkDC68E+bhpE
 XUL4J+LQoK+zvO/BX/ehUWcmKEp1dJ3q1nCd6Loj+aLRmvHOGo5BpqKYfjbQoL0y0oMB0gcUjv027lXgRQNGqz+lxvdxpIPI3jsojJFLxSVm0VqdtEO0ST7y
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

add optional pll-com support which is available in some platforms
like A100/A133, which is used by the display clock. There is no
documentation reference or details in DE 2.0 specification.

But these changes are needed to get the display clock to work and
this is inherited from the vendor BSP.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc2..3e28c32050e0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -241,7 +241,7 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
-	struct clk *bus_clk, *mod_clk;
+	struct clk *bus_clk, *mod_clk, *pll_clk;
 	struct reset_control *rstc;
 	void __iomem *reg;
 	const struct sunxi_ccu_desc *ccu_desc;
@@ -265,6 +265,11 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(mod_clk),
 				     "Couldn't get mod clk\n");
 
+	pll_clk = devm_clk_get_optional(&pdev->dev, "pll-com");
+	if (IS_ERR(pll_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pll_clk),
+				     "Couldn't get pll clk\n");
+
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
@@ -283,12 +288,20 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_bus_clk;
 	}
 
+	if (pll_clk) {
+		ret = clk_prepare_enable(pll_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable pll clk: %d\n", ret);
+			goto err_disable_mod_clk;
+		}
+	}
+
 	/* The reset control needs to be asserted for the controls to work */
 	ret = reset_control_deassert(rstc);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Couldn't deassert reset control: %d\n", ret);
-		goto err_disable_mod_clk;
+		goto err_disable_pll_clk;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
@@ -299,6 +312,8 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 
 err_assert_reset:
 	reset_control_assert(rstc);
+err_disable_pll_clk:
+	clk_disable_unprepare(pll_clk);
 err_disable_mod_clk:
 	clk_disable_unprepare(mod_clk);
 err_disable_bus_clk:

-- 
2.39.5

