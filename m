Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71605CF5169
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3337D10E202;
	Mon,  5 Jan 2026 17:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iZFy1usK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xc3f6UBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F110E202
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:53:04 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlMMz1dkfz9tQq;
 Mon,  5 Jan 2026 18:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767635583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mlFYT/HEOvUY7CDKakI9f1tmEuOow/Z3hA5FQFme7mI=;
 b=iZFy1usK2fdQj0XU3g3+JdxY/JSJ+ylW8JeV5uq8c9f0qo3R3muAx39MlLs4UWDbgkTuah
 7MTSOaplzhptD0plupo4tdzWB0Vt1kmh95U6naHbV49afTsZ8hvkAEzajzlXfEHQC18Uk1
 WdTQWhaIBUc/DfEiv8Ji5Ut0BA2+WePHAvjEJtOarV1pqVSAhRbE85j7h6SlcgvWF1y99b
 Um3Yhas5G9kTyxs81TeZRVpdtbf3PVkTDGQpfbrzkJfCym2dXsV/mupY3R8NVzsZyfcKNW
 uV3K1hzMZKUDAuIM8gd2F+NUwBcyXJRpOGqArKnEY/T+ycg2YQTYjRYnddSmBA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767635580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mlFYT/HEOvUY7CDKakI9f1tmEuOow/Z3hA5FQFme7mI=;
 b=Xc3f6UBe9tmQN9xVsvtBBJ+depcCxoJX3bhMBBQMV5iWEqhkSXlZF3pDGaXvL+ytc6n+e7
 y1rjHv9MBnrzhwnoPgDXVTWd3QD6y+EAgqHrmaVxqyLwOD3OfWJ5PL99cgsranRHFqfVdC
 J63Dx9mGRAkh1WyEpnUPLdIlVKZh9FVJFdL5N3/Zfgev0i7fxC506ucZaN/CUmKzgjM1WF
 V9hvC0TOIYM4SeXpOTlH8D2XbSUGQQa9oPJgpPbNe0xHo14xvYYmyXaMtFuuDkafIM5Yk2
 ZzA0xI2iJyufGskZmUTNOqF9AAOlMIlk22F8aCoGxYIwgUqhJXyYzNVRU9AN5w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/rcar-du: dsi: Clean up VCLK divider calculation
Date: Mon,  5 Jan 2026 18:52:04 +0100
Message-ID: <20260105175250.64309-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6czwgu3o71sasbatj75ppfox5y8wi7nc
X-MBO-RS-ID: 22b2408a7d8588c0a71
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

Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
is passed to __ffs() to calculate back the divider out of the value again.

Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
function and call the function from both rcar_mipi_dsi_parameters_calc()
and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
and avoid unnecessarily storing the divider value in setup_info at all.

This rework has a slight side-effect, in that it should allow the compiler
to better evaluate the code and avoid compiler warnings about variable
value overflows, which can never happen.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Use BIT_U16()
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4ef2e3c129ed7..508977b9e8926 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -84,7 +84,6 @@ struct dsi_setup_info {
 	unsigned long fout;
 	u16 m;
 	u16 n;
-	u16 vclk_divider;
 	const struct dsi_clk_config *clkset;
 };
 
@@ -335,10 +334,24 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
  * Hardware Setup
  */
 
+static unsigned int rcar_mipi_dsi_vclk_divider(struct rcar_mipi_dsi *dsi,
+					       struct dsi_setup_info *setup_info)
+{
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		return (setup_info->clkset->vco_cntrl >> 4) & 0x3;
+
+	case RCAR_DSI_V4H:
+		return (setup_info->clkset->vco_cntrl >> 3) & 0x7;
+	}
+}
+
 static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
 				   unsigned long fin_rate,
 				   unsigned long fout_target,
-				   struct dsi_setup_info *setup_info)
+				   struct dsi_setup_info *setup_info,
+				   u16 vclk_divider)
 {
 	unsigned int best_err = -1;
 	const struct rcar_mipi_dsi_device_info *info = dsi->info;
@@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
 			if (fout < info->fout_min || fout > info->fout_max)
 				continue;
 
-			fout = div64_u64(fout, setup_info->vclk_divider);
+			fout = div64_u64(fout, vclk_divider);
 
 			if (fout < setup_info->clkset->min_freq ||
 			    fout > setup_info->clkset->max_freq)
@@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	unsigned long fout_target;
 	unsigned long fin_rate;
 	unsigned int i;
+	unsigned int div;
 	unsigned int err;
+	u16 vclk_divider;
 
 	/*
 	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
@@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 
 	fin_rate = clk_get_rate(clk);
 
+	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
+
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
 	default:
-		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
+		vclk_divider = BIT_U16(div);
 		break;
 
 	case RCAR_DSI_V4H:
-		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
+		vclk_divider = BIT_U16(div + 1);
 		break;
 	}
 
-	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
+	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
 
 	/* Find hsfreqrange */
 	setup_info->hsfreq = setup_info->fout * 2;
@@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	dev_dbg(dsi->dev,
 		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
 		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
-		setup_info->vclk_divider, setup_info->fout, fout_target,
+		vclk_divider, setup_info->fout, fout_target,
 		err / 100, err % 100);
 
 	dev_dbg(dsi->dev,
@@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
 	default:
-		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
+		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
 		break;
 
 	case RCAR_DSI_V4H:
-		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
+		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
 		break;
 	}
 
-- 
2.51.0

