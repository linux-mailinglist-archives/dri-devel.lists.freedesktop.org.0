Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB739D51F4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 18:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF4A10EA13;
	Thu, 21 Nov 2024 17:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RWoZGU5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277F110EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:41:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D004620010;
 Thu, 21 Nov 2024 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732210898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKTy8XWO2qgziAQ1aV4BgRlmD2JBLSeCDp8Nwyzn3qA=;
 b=RWoZGU5fJqpTbXKi5tH+r+d1vmD3mjfhf6zksxyRpNa2uNYJqMxwWp/aivD8zuRYvbeVR6
 HaBQw6HXteslHcYc5HeiakgI80i3lGL4NvA0dVR49fCXFMkNaqK2+x1vIMmPZyaCPYDUea
 EiEcuu2XP80YdISzxDRiKnFalLoPHLRrs+BPSDuUxPflkp3mdDL0rueP/9UY9TKAsH6hhh
 T3NGDcPuhqZ9mQTaTLd35fNleQXRbFnRYg12+0mlyMKpkFqtd7yXICaPQg7eEkmXvMJj/b
 7qTCJNRPyQTqux8xlrxIUqgH9YKhnerMsJ+IDdSQuq/HEUrdwwCHfsYqkgdD3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:12 +0100
Subject: [PATCH 2/5] clk: Add a helper to determine a clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-2-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, 
 Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
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

In the context of the clock core, "determine" means we calculate a
possible clock rate based on its hardware capabilities and its current
upstream parent frequency. This is opposed to "round" which tries to
find the best parent and best rate and "recalc" which is about finding
the next output clock based on a parent frequency change.

The prototype is based on clk_recalc() which does exactly the same for
the "recalc" situation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d02451f951cf057d068f980d985c95deb861a2d9..f171539bbb842f57698249a475c62f3f5719ccd1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1927,6 +1927,18 @@ long clk_get_accuracy(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_accuracy);
 
+__maybe_unused
+static unsigned long clk_determine(struct clk_core *core, unsigned long rate)
+{
+	struct clk_rate_request req = {};
+
+	clk_hw_init_rate_request(core->hw, &req, rate);
+	if (__clk_determine_rate(core->hw, &req))
+		return 0;
+
+	return req.rate;
+}
+
 static unsigned long clk_recalc(struct clk_core *core,
 				unsigned long parent_rate)
 {

-- 
2.47.0

