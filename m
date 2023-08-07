Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A38771D33
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D6310E1DF;
	Mon,  7 Aug 2023 09:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32EB10E069
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:36:37 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RKB6B5mCjz9sqk;
 Mon,  7 Aug 2023 11:36:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1691400994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EY96Z0dfNbj9D7OtHPj33gJtAy9tbxjlYgYjaDYshMA=;
 b=mmwswZUdz1diNy0S1nyUP/8zTDg54vIiIiDrfeQ4qiVk0f6fOmBpd3MeifzRJbEgngWWFO
 bfH1iSkQ6PMR1Btb1HrXvUysZ+t7oOHSkqrKfdmoKo1BgiTShp7RbPtkb5ijYNjBcpyfpZ
 LwyKsKMw9IJ+bhzMGVR1Nn3N0Zd6Hhb2yrooSOTR8CndcR7NMmfCr1EbrmwearOS1qJy7G
 epA4J/9cJ68Cu2XFfonw1z2OJd1GFD+t35XM1Yl7v7k6YOYSSf/DJukZeMsWGB2SMSo4Cv
 1vldR9xF/OHxNxCxC5jmhgr2MQNu4MB77FKazXAPyeCxYVX3UyRNCjuzv9OH1Q==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 11:36:03 +0200
Subject: [PATCH 2/3] clk: sunxi-ng: a64: keep tcon0 clock rate when
 pll-video0's rate changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=aDg7/CRtrn+6JJ4alLY6y3h7XB0nt+J7IH95OgLMJKw=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk0LsekSh6MoJObKpB32rc7ZrOHnmVWVp95sEC9
 YolCtyfgY2JAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZNC7HgAKCRCaaaIIlErT
 x9KTDACUO0qteQLPbnuHCyz496Sv3+SY+nP4+E+HM2nQhrwvbXJ87x0ynJqbx2r3KxAt7Z1u2p7
 EktHOVso8TRBGoZJXcrc2QpaOMBKDrWGEdihtSUv/tI0QUYiaH33X8pRSVW/LWzWRIZB8gjvjCg
 0ezBTRmZLY76GsTPQZzghplsnJwdV8ex7UYZVWse77AR/MEthVQIPumjChJH4eYotlTvLr/6zoG
 2/8lr3T8d6BMmLjZXoWX1yLGzBMEwuccAKzJ5ekiRRNY1ulr7rKHNL7BLloyhZ9wZn2LTT2HW7i
 /uTkXaSo9AqnaWFvyRne+L4M8GbNPvbtalWmM26gCPKGR4C818DAEN6cH3+gBVcT/rDLeRGmJsj
 K/if6dcJ0xFn8ROSDN8CA/B6Pb0qziOPwnF6NIJ6xbRs1CBhWPWzhWoi69SoWjHLT/dxH4i/ggu
 /STGxQqbwbENkivDNOBTzsBo17rfsbglhQ7edPxyLMRnvL+h4BU2frlsajwG8DaXLi96Q=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RKB6B5mCjz9sqk
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
Cc: dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>,
 linux-sunxi@lists.linux.dev, =?utf-8?q?Ond=C5=99ej_Jirman?= <x@xnux.eu>,
 Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Icenowy Zheng <icenowy@aosc.io>

Notify TCON0 clock (and in consequence PLL-MIPI by CLK_SET_RATE_PARENT)
to reset when PLL-Video0 changes (because of HDMI PHY clk which is a
child of PLL-Video0 and has CLK_SET_RATE_PARENT set). In this way we can
get clock tree to satisfy both pipelines.
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index ef567775fc95..93beedb0428e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -943,6 +943,17 @@ static struct ccu_mux_nb sun50i_a64_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
+/*
+ * Since PLL-Video0 is an ancestor of both tcon0 and HDMI PYH, tcon0 clock will
+ * conflict with HDMI PHY clock which is on another display pipeline.
+ *
+ * Therefore, a notifier is required to restore the rate of TCON0 when the rate
+ * of PLL-Video0 changed.
+ */
+static struct ccu_rate_reset_nb sun50i_a64_pll_video0_reset_tcon0_nb = {
+	.common		= &pll_video0_clk.common,
+};
+
 static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -978,6 +989,10 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_a64_cpu_nb);
 
+	/* Reset the rate of TCON0 clock when PLL-VIDEO0 is changed */
+	sun50i_a64_pll_video0_reset_tcon0_nb.target_clk = tcon0_clk.common.hw.clk;
+	ccu_rate_reset_notifier_register(&sun50i_a64_pll_video0_reset_tcon0_nb);
+
 	return 0;
 }
 

-- 
2.41.0

