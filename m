Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D0119EE7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246916EA0C;
	Tue, 10 Dec 2019 22:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B716EA08
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:47 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7B53DBF;
 Tue, 10 Dec 2019 23:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018722;
 bh=kqgswpOm34Uj8ssPEq+me6IzANU+0ieYbfe6z8n7Bs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vtj0qDr+4KxyWsLKWZDJg48M6//Iy3w5e8rjfBSdezS5SmuIMnr60WObDLIL6569R
 pnLEF/OuJ1gxEsAqUwBL7XTaQvRi5lHkCrmy6ALUKPcufTJxmZvHBmPEuQfc9FnZHd
 9Gk+E4UGUKGkgfOmndJy3RhMf/yw/5uQENVtP5tM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 44/50] drm/omap: dpi: Simplify clock setting API
Date: Wed, 11 Dec 2019 00:57:44 +0200
Message-Id: <20191210225750.15709-45-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpi_set_pll_clk() and dpi_set_dispc_clk() return various information
through pointer arguments that are never used by the callers. Remove
them to simplify the clock setting API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
