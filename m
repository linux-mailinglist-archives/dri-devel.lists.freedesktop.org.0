Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4187CEC1FE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 15:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1745A10E1A5;
	Wed, 31 Dec 2025 14:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="T9hmkp2A";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ul1P8CKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09710E1A5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 14:57:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhCjb4cyvz9spZ;
 Wed, 31 Dec 2025 15:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767193043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zYJ8kzWutfRSPsdYu3drYc9ucfml/6sYeN0EXyrlcbc=;
 b=T9hmkp2AFUcyzsIujtc+9+Fvo6bOx+5w+4AyLvCXdA5UjfyrJiwxelV3Ywt3ZI/P95ABMC
 DdwJuRt3lUBQFKOI84oRLnYodms8dBOxNP2Pv9/BvRlg1oZp387oVyMERKWONtFxOeCrJc
 B+qL+NGmidPTXf2Nt17PKRj86/mOFG1Pj60x6qyQGgcSrqBROB6C5T5YybHn9awgRaXL7+
 6RGUX1owJwbi2h4zIplbCx8A00KpFO6mg1clRYIVc0gEGmwqOuDsckjlZciaEx8KXi5Cs6
 x16Ye/7UDltTgD1KMmlOla+3aPkswWxcFIQ43RTwhii2SWL69eH9x0DVPHMr9g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767193041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zYJ8kzWutfRSPsdYu3drYc9ucfml/6sYeN0EXyrlcbc=;
 b=Ul1P8CKwyr9E2xVgFUKNJV0u1ftzJmfgnDr3EC/7o40hmwD1zS3YG9alTFU9XQNNG0lRat
 hYCrOtCLwswZFdMDT5K22c/y/LhP075RnYgoviU10+TFAStshWiDIkLn75/9E0QqPCEhJQ
 bPCznFiAbyPUb9IjdIXrmfKoXjCh5xRFGS0DDmnmyAxVCfZ15CFnTGjx+jCR5tcGEUvhJa
 dR9UytzrF/0lF/ZysFK/Y7IjTsMvpgQp9LMBU7Q6avHJFGc1o98QPhEEVbhzeVHQ55lhmE
 xvIlU87RYDRoth1s1Mom9/yxkVQVuAaXrJxLsbKmSFJ16qNioIL3LNWoTkT6LA==
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
Subject: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Date: Wed, 31 Dec 2025 15:56:10 +0100
Message-ID: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ff6989a8d355aa239b4
X-MBO-RS-META: q9na4simyma7cqza8h9e8ik6hjyksppa
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
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4ef2e3c129ed7..875945bf8255b 100644
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
+		vclk_divider = BIT_U32(div);
 		break;
 
 	case RCAR_DSI_V4H:
-		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
+		vclk_divider = BIT_U32(div + 1);
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

