Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8B9FD46B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 14:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1F10E3E4;
	Fri, 27 Dec 2024 13:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="pmGPcSZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC8B10E3E4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:02:50 +0000 (UTC)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
 by cmsmtp with ESMTPS
 id R0iat0BTHrKrbR9zOtXKrI; Fri, 27 Dec 2024 13:02:50 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R9zLtNrFQ827nR9zNtde95; Fri, 27 Dec 2024 13:02:50 +0000
X-Authority-Analysis: v=2.4 cv=GeTcnhXL c=1 sm=1 tr=0 ts=676ea57a
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=iM3t8g1HjrKnZeAfta4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGwPFK3xv/ptVPYpkqFPS9qGRy0Y0xu/iUwb0C9nXWg=; b=pmGPcSZuC3UtraOQMwrzbKHax3
 E8Nx/yeWSADCPcGNPYpaw+P6NGfeuhFIAf6v7J7zK+42jOhbMRYStW8lyU3XTnwyiWVzsIuIIbsTy
 JyBAPJXvwrYPB3r+uRiFuIXw2fpy1SiT9C/VXwh7vbjFJEuucSnINdwK7twWDD3iJLLae+VF98uOk
 UBs/3PFkJxcc6y1CFoSvR8N76wccSl3ybTRt6xPuNSSv5eY/0WASUvcTZJTNzyPLFQLpt1W5jh3Fu
 P6UgOWk7yHx6MscgHfJGuTTNBl0hBqREJbOt7W5Reve5AOFvX+96ME99u7KwN30sDBENeZLjH3ZAg
 /oTFc5KQ==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR9zI-002EaQ-0q;
 Fri, 27 Dec 2024 18:32:44 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:31:05 +0530
Subject: [PATCH RESEND 16/22] clk: sunxi-ng: sun8i-de2: Add support for
 a100/a133
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=1043;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=qvS7+D/RTyyMg86CwtqbsAA+5EMqHdzQTTB53paC81Y=;
 b=N9ntmarJ67ley2VGgxeWuYQv0E9we4Y5wGr7kNlCaHes/RdK6lBLAb/IJ/xnUt4Jwp/7Aojjc
 68eY+zXN/6aCOjj9GymE4BDMsmJOX/2SaiU5O19gF+/5oHT5+b5fDmn
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
X-Exim-ID: 1tR9zI-002EaQ-0q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 486
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKVEZw5MYg5qbLHI2QRwJQIiA0HreYp9PwkD6VSJIsOmmvkyjDD6h5ndNJcDMUEmUCrocer/XmEnSQsE7+pBkPulZF78ogu4vCr2Mjrj5CyfBFS+5YXl
 uab0v24Mb0uGo3pH1Sg63N09WwUMNMtwcx8tVXETa1228gsW+Io1Xi4uuYwpo6jf7dFEGS3ZTzxKcTmuII4MwDIKFR96OI3GgdGeeC0Hvt2+IWOkVfhinr2e
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

Display clock uses 1 mixer without rotation support is same
as v3s. There is also a hidden independent display engine
with independent tcon_top available in A100/A133 bin (based
on vendor BSP).

Add new compatible for A100/A133 to accommodate the future changes
for the independent DE.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 3e28c32050e0..067820ab704d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -342,6 +342,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-a64-de2-clk",
 		.data = &sun50i_a64_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-a100-de2-clk",
+		.data = &sun8i_v3s_de2_clk_desc,
+	},
 	{
 		.compatible = "allwinner,sun50i-h5-de2-clk",
 		.data = &sun50i_h5_de2_clk_desc,

-- 
2.39.5

