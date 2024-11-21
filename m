Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352A9D51F2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 18:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10110EA0B;
	Thu, 21 Nov 2024 17:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XPJhU6Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4F10EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:41:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1472000A;
 Thu, 21 Nov 2024 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732210896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rt80qnAyyepZvbd8DfB3ShuvRFOqvgROOwcu9fM6x3U=;
 b=XPJhU6AwXFGRUUnfGQvejV+oHxkMvweUkwv9ULqvHbQa8KI16HGZgTZzN7fv0AWbOGlv9k
 Ykr621Z3EWSQFd0/Eh4GQ5JaBq19W19D1tx0V82mCLr56bacduLtP9ITRqEX3GjJvSvt9V
 uixNsJpbWe4tnkysNvTuVA+/5DnMevlnv6uLbVS+q4olykwKN8OSRYr5av9Ycaaytja792
 vvAB1aZOjvs8cZtuR+kon8EIZ89Mk6DHMm3EEXEKzpHJjptxGjMGNM2FVEnDLEVi4ljdD8
 zb6YH3vlOoQTG6XstKJeBVuEHA85FLbEQoTmTtKrLn9gRCEAo4310ZykbKN5qQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
Date: Thu, 21 Nov 2024 18:41:10 +0100
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZwP2cC/x3MTQ5AMBBA4avIrE1i6ifiKmJROpigpEUk4u7K8
 nuLd4NnJ+yhim5wfIqX1QZQHEE3ajswigkGlaiMSBF+RVs03B4DynKV2M0T7o4ZW5OqXOuyKHq
 CMNgc93L987p5nhenn/rUbAAAAA==
X-Change-ID: 20241121-ge-ian-debug-imx8-clk-tree-bd325aa866f1
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
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
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

Recent changes in the clock tree have set CLK_SET_RATE_PARENT to the two
LCDIF pixel clocks. The idea is, instead of using assigned-clock
properties to set upstream PLL rates to high frequencies and hoping that
a single divisor (namely media_disp[12]_pix) will be close enough in
most cases, we should tell the clock core to use the PLL to properly
derive an accurate pixel clock rate in the first place. Here is the
situation.

[Before ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]

Before setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the sequence of events was:
- PLL is assigned to a high rate,
- media_disp[12]_pix is set to approximately freq A by using a single divisor,
- media_ldb is set to approximately freq 7*A by using another single divisor.
=> The display was working, but the pixel clock was inaccurate.

[After ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]

After setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the
sequence of events became:
- media_disp[12]_pix is set to freq A by using a divisor of 1 and
  setting video_pll1 to freq A.
- media_ldb is trying to compute its divisor to set freq 7*A, but the
  upstream PLL is to low, it does not recompute it, so it ends up
  setting a divisor of 1 and being at freq A instead of 7*A.
=> The display is sadly no longer working

[After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate"]

This is a commit from Marek, which is, I believe going in the right
direction, so I am including it. Just with this change, the situation is
slightly different, but the result is the same:
- media_disp[12]_pix is set to freq A by using a divisor of 1 and
  setting video_pll1 to freq A.
- media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
  to freq 7*A.
  /!\ This as the side effect of changing media_disp[12]_pix from freq A
  to freq 7*A.
=> The display is still not working

[After applying this series]

The goal of the following patches is to prevent clock subtree walks to
"just recalculate" the pixel clocks, ignoring the fact that they should
no longer change. They should adapt their divisors to the new upstream
rates instead. As a result, the display pipeline is working again.

Note: if more than one display is connected, we need the LDB driver to
act accordingly, thus the LDB driver must be adapted. Also, if accurate
pixel clocks are not possible with two different displays, we will still
need (at least for now) to make sure one of them is reparented to
another PLL, like the audio PLL (but audio PLL are of a different kind,
and are slightly less accurate).

So this series aims at fixing the i.MX8MP display pipeline for simple
setups. Said otherwise, returning to the same level of support as
before, but with (hopefully) more accurate frequencies. I believe this
approach manages to fix both Marek situation and all people using a
straightforward LCD based setup. For more complex setups, we need more
smartness from DRM and clk, but this is gonna take a bit of time.

---
Marek Vasut (1):
      clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate

Miquel Raynal (4):
      clk: Add a helper to determine a clock rate
      clk: Split clk_calc_subtree()
      clk: Add flag to prevent frequency changes when walking subtrees
      clk: imx: imx8mp: Prevent media clocks to be incompatibly changed

 drivers/clk/clk.c            | 39 ++++++++++++++++++++++++++++++++-------
 drivers/clk/imx/clk-imx8mp.c |  6 +++---
 include/linux/clk-provider.h |  2 ++
 3 files changed, 37 insertions(+), 10 deletions(-)
---
base-commit: 62facaf164585923d081eedcb6871f4ff3c2e953
change-id: 20241121-ge-ian-debug-imx8-clk-tree-bd325aa866f1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

