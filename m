Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F19FD466
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 14:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3110E3E1;
	Fri, 27 Dec 2024 13:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="Por5VnV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F057010E3E5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:02:39 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
 by cmsmtp with ESMTPS
 id R5GOtbIGcnNFGR9zDtXmFJ; Fri, 27 Dec 2024 13:02:39 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R9zAtf2Zk8PtxR9zCtmK5Z; Fri, 27 Dec 2024 13:02:38 +0000
X-Authority-Analysis: v=2.4 cv=Fegxxo+6 c=1 sm=1 tr=0 ts=676ea56e
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=U3DMF0o1PY4y7HjVE7sA:9 a=QEXdDO2ut3YA:10 a=lcdGsAA1t286La22BbtU:22
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbYyqDxlPnUOcenlEsyd1+KMbnZL6BSy8ly64QBKbVQ=; b=Por5VnV35tosi3+JJ7NTnryKFJ
 UZ3i/aCSsN8ASDSsooEu1dnjn6lqUjDe42kZCTnJmK9Iday3mVbCRQ00+zD6WtmdW1rUy2G8tydQ2
 tduvd+W7th/UfYa3I5TJGh8z/879dsE6lMQ3siODjZpE73PPlyLPx1qd2rfRN2/djaz/Y26+Ka4X/
 kzDiJeSLlRd4JzbQvAMbGC3Dw+ijajl8gXgSz8wLUyKtzmIgJmB9fQy6ySu6fL09qQ4mh2r4UrpIl
 9rnVZzDxOiC4V0g1uSZy6KFE368UBTyys54uzzz6IihbYUxS5xjXFoJzF0u3JrCFw13axwFBks9YX
 5TC9frQQ==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR9z3-002EaQ-2x;
 Fri, 27 Dec 2024 18:32:29 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:31:02 +0530
Subject: [PATCH RESEND 13/22] drm/sun4i: make tcon top tv0 optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-13-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=2767;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=Z1yBsrhc1T8q3fTFow1RSmWl9UXwRZd8FWpkoLs2A1A=;
 b=d9QdVen3zcO2vxcUSjbW8STNjFQd/Fya6B9N47bAWh3SbRj3wHmlor7MKAsKcq+kliww2MjaD
 8hgcJHZVT3SCJjubJ72pmYS56EWz8ZMwjPeWk9Ap8R4VpZW+hN7PVi3
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
X-Exim-ID: 1tR9z3-002EaQ-2x
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 401
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFQISGcItRmBurZY5TgGHD7ZRyyx1fdzC0Kn6q9IIYCpxHh60tiDysUXG9EdtRVUhYZ+GyhCSCfGeD1B/H0zncYnzhZ3bHm0C2jodeBa+NLnNjDEqAAg
 r20xcx5GWsNBXDSrNlXKok8G2IJQPgRjg/eCjxNz0FUG2bpbReIjL+gpie7YyowsWxAhrYGUSq94umrZkdw1WN9t/zBzqDxS1+Ai47uEKdQ2INXxr88FPnoJ
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

current implementation of tcon top assumes tv0 is always present, which
isn't case in A100/A133 SoC's. Make tv0 optional by introducing another
control similar to tv1 and make existing users with true/present.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 8adda578c51b..bd9d0840ead7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -16,6 +16,7 @@
 #include "sun8i_tcon_top.h"
 
 struct sun8i_tcon_top_quirks {
+	bool has_tcon_tv0;
 	bool has_tcon_tv1;
 	bool has_dsi;
 };
@@ -191,10 +192,11 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * to TVE clock parent.
 	 */
 	i = 0;
-	clk_data->hws[CLK_TCON_TOP_TV0] =
-		sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
-					     &tcon_top->reg_lock,
-					     TCON_TOP_TCON_TV0_GATE, i++);
+	if (quirks->has_tcon_tv0)
+		clk_data->hws[CLK_TCON_TOP_TV0] =
+			sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
+						     &tcon_top->reg_lock,
+						     TCON_TOP_TCON_TV0_GATE, i++);
 
 	if (quirks->has_tcon_tv1)
 		clk_data->hws[CLK_TCON_TOP_TV1] =
@@ -208,16 +210,18 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 						     &tcon_top->reg_lock,
 						     TCON_TOP_TCON_DSI_GATE, i++);
 
-	for (i = 0; i < CLK_NUM; i++)
-		if (IS_ERR(clk_data->hws[i])) {
-			ret = PTR_ERR(clk_data->hws[i]);
-			goto err_unregister_gates;
-		}
+	if (i) {
+		for (i = 0; i < CLK_NUM; i++)
+			if (IS_ERR(clk_data->hws[i])) {
+				ret = PTR_ERR(clk_data->hws[i]);
+				goto err_unregister_gates;
+			}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     clk_data);
-	if (ret)
-		goto err_unregister_gates;
+		ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				clk_data);
+		if (ret)
+			goto err_unregister_gates;
+	}
 
 	dev_set_drvdata(dev, tcon_top);
 
@@ -266,16 +270,18 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 }
 
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
+	.has_tcon_tv0	= true,
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
+	.has_tcon_tv0	= true,
 	.has_dsi	= true,
 };
 
 static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
-	/* Nothing special */
+	.has_tcon_tv0	= true,
 };
 
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */

-- 
2.39.5

