Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7C9D51F6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 18:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C976410EA14;
	Thu, 21 Nov 2024 17:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y85agxXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606EB10EA07
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:41:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 017F020002;
 Thu, 21 Nov 2024 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732210900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9fPs0nLthnmbo8a6LrEY10rX186VeNy9SlwRtv5peU=;
 b=Y85agxXtRhcAxZzQaTYfg/Fqro4DYf58mDGp1y2m/tvKQcRgdR/TTvqBShF6rleawyFLVC
 IL3KSEBqc9lFFlv8XSTrCWVE7Ya1BYJoyqXcfSCbfjV69dQjmX/PdKTVyRgr5zJeu7hK6G
 8QIJEAuv3qhpsSXUiv6lQXu86m7nOjj0jX/WYxZmuwglh7Xnm6RtoJrgjNEVary+Nfx2Q6
 D/XqaeYScbjs1uQ4vuWWzrVr1nPrz+Ys1W03dt9oE7tWDDdnFIpjlUXRQC1HDQ9GUDNqxZ
 iK2+XlZEwiGBprWAfMHfqxvln9cn4lB0BmnJ+r6gkj4PK7WuOPUASa/oLCCeUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:13 +0100
Subject: [PATCH 3/5] clk: Split clk_calc_subtree()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-3-0f1b722588fe@bootlin.com>
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

This helper does two different things:
- it calculates the new clock frequency
    - as part of this task, it also handles a possible parent change
- it walks the clock subtree to further update frequencies as well (but
  the parent changes are no longer relevant there).

In order to ease the understanding of the next step, let's split this
helper into:
- clk_calc_core_and_subtree() which performs the top clock update (with
  the parents handling) and then calls...
- clk_calc_subtree() (which calls itself recursively) in order to
  perform the subtree updates.

There is no functional change intended.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f171539bbb842f57698249a475c62f3f5719ccd1..adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2268,8 +2268,18 @@ static int __clk_speculate_rates(struct clk_core *core,
 	return ret;
 }
 
-static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+static void clk_calc_subtree(struct clk_core *core)
+{
+	struct clk_core *child;
+
+	core->new_rate = clk_recalc(core, core->parent->new_rate);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_calc_subtree(child);
+}
+
+static void clk_calc_core_and_subtree(struct clk_core *core, unsigned long new_rate,
+				      struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
 
@@ -2281,10 +2291,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 	if (new_parent && new_parent != core->parent)
 		new_parent->new_child = core;
 
-	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
-		clk_calc_subtree(child, child->new_rate, NULL, 0);
-	}
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_calc_subtree(child);
 }
 
 /*
@@ -2368,7 +2376,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		top = clk_calc_new_rates(parent, best_parent_rate);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_calc_core_and_subtree(core, new_rate, parent, p_index);
 
 	return top;
 }

-- 
2.47.0

