Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214DD14775B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAF46FEF4;
	Fri, 24 Jan 2020 03:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD506FEE0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:42 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F8DC3CAE;
 Fri, 24 Jan 2020 04:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838130;
 bh=8fuKrA8R2epYM9DqkHZt5us7YnRMXjoq6qJCgjjLl4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BUQpdqGMXSqfkaaIBnORKkeJYVy36kDJjb1ivaTTUhjp7qBuvsaaop+Nggk8o6KpP
 VOgrf48giWYxzg42iATgJUDT8jtJq58SWKHFgSa3/7wjMOrF047UhEcfiKLyFUrkWp
 eFo7byV7dWRxpBUVD3p3RvXpHEEc6tJ2AAol8H0k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 45/52] drm/omap: dpi: Simplify clock setting API
Date: Fri, 24 Jan 2020 05:54:38 +0200
Message-Id: <20200124035445.1830-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpi_set_pll_clk() and dpi_set_dispc_clk() return various information
through pointer arguments that are never used by the callers. Remove
them to simplify the clock setting API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 32 ++++++++-----------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index dccf81e4ce64..c167bd1116ec 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -287,9 +287,7 @@ static bool dpi_dss_clk_calc(struct dpi_data *dpi, unsigned long pck,
 
 
 
-static int dpi_set_pll_clk(struct dpi_data *dpi, enum omap_channel channel,
-		unsigned long pck_req, unsigned long *fck, int *lck_div,
-		int *pck_div)
+static int dpi_set_pll_clk(struct dpi_data *dpi, unsigned long pck_req)
 {
 	struct dpi_clk_calc_ctx ctx;
 	int r;
@@ -303,19 +301,15 @@ static int dpi_set_pll_clk(struct dpi_data *dpi, enum omap_channel channel,
 	if (r)
 		return r;
 
-	dss_select_lcd_clk_source(dpi->dss, channel, dpi->clk_src);
+	dss_select_lcd_clk_source(dpi->dss, dpi->output.dispc_channel,
+				  dpi->clk_src);
 
 	dpi->mgr_config.clock_info = ctx.dispc_cinfo;
 
-	*fck = ctx.pll_cinfo.clkout[ctx.clkout_idx];
-	*lck_div = ctx.dispc_cinfo.lck_div;
-	*pck_div = ctx.dispc_cinfo.pck_div;
-
 	return 0;
 }
 
-static int dpi_set_dispc_clk(struct dpi_data *dpi, unsigned long pck_req,
-		unsigned long *fck, int *lck_div, int *pck_div)
+static int dpi_set_dispc_clk(struct dpi_data *dpi, unsigned long pck_req)
 {
 	struct dpi_clk_calc_ctx ctx;
 	int r;
@@ -331,29 +325,19 @@ static int dpi_set_dispc_clk(struct dpi_data *dpi, unsigned long pck_req,
 
 	dpi->mgr_config.clock_info = ctx.dispc_cinfo;
 
-	*fck = ctx.fck;
-	*lck_div = ctx.dispc_cinfo.lck_div;
-	*pck_div = ctx.dispc_cinfo.pck_div;
-
 	return 0;
 }
 
 static int dpi_set_mode(struct dpi_data *dpi)
 {
-	int lck_div = 0, pck_div = 0;
-	unsigned long fck = 0;
-	int r = 0;
+	int r;
 
 	if (dpi->pll)
-		r = dpi_set_pll_clk(dpi, dpi->output.dispc_channel,
-				    dpi->pixelclock, &fck, &lck_div, &pck_div);
+		r = dpi_set_pll_clk(dpi, dpi->pixelclock);
 	else
-		r = dpi_set_dispc_clk(dpi, dpi->pixelclock, &fck,
-				&lck_div, &pck_div);
-	if (r)
-		return r;
+		r = dpi_set_dispc_clk(dpi, dpi->pixelclock);
 
-	return 0;
+	return r;
 }
 
 static void dpi_config_lcd_manager(struct dpi_data *dpi)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
