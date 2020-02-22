Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C7F168F9A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981C6E936;
	Sat, 22 Feb 2020 15:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969756E924
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:02:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BDBB27;
 Sat, 22 Feb 2020 16:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383732;
 bh=2LMjeb6y4TKfZuxYyIwJ8C0hWrijUvCPFb/G+Dj3rfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E65O5dJIPJxHmvm4DKUJCHDzbgE2csiYALDIH1RudIysmA4s/qwQp7qciuPC7NR3U
 txbPhM3gMkvpxRZp51i3qlJQWh5Dn2T5HrIVLJ1eMd89SZcBtgwGgPFWF6QUj/lWRh
 7DUT7rIKXJbk3W+0LaP8V9LFJhK6RznpJkwG9SJ0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 47/54] drm/omap: dpi: Simplify clock setting API
Date: Sat, 22 Feb 2020 17:00:59 +0200
Message-Id: <20200222150106.22919-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
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
