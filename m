Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7F2C2686
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265A96E45E;
	Tue, 24 Nov 2020 12:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7B6E442
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:49:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCn0aL124007;
 Tue, 24 Nov 2020 06:49:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222140;
 bh=eRysWfrfoecxf28NTJMjs88QhNPn5J0kT4R6J6yCRQg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vGL4jTa3rfZJRipey6WUTcqDdSezC8dZXVXZzG1HKBiRsGPgm08FnxuA7EpZca2RU
 kJ3K6e0P6FF1ybQaYb5JWhCkkn2qiaZYFzRCpt3CQoWlcAzg070vl7++xqLjEDyHgG
 QvkzOzdmzFLqN0p2ckyEcShE1U/YHDWwm1wpw6AU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCn0RB109604
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:49:00 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:49:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:49:00 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq7040922;
 Tue, 24 Nov 2020 06:48:58 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 78/80] drm/omap: dsi: fix and cleanup ddr_clk_always_on
Date: Tue, 24 Nov 2020 14:45:36 +0200
Message-ID: <20201124124538.660710-79-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver ignores MIPI_DSI_CLOCK_NON_CONTINUOUS, and always uses
non-continuous clock.

Fix this by using MIPI_DSI_CLOCK_NON_CONTINUOUS and at the same time,
drop ddr_clk_always_on field which seems pretty useless.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++-------
 drivers/gpu/drm/omapdrm/dss/dsi.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 6d20245495ac..6e9c99402540 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -1734,11 +1734,10 @@ static int dsi_cio_init(struct dsi_data *dsi)
 
 	dsi_cio_timings(dsi);
 
-	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
-		/* DDR_CLK_ALWAYS_ON */
-		REG_FLD_MOD(dsi, DSI_CLK_CTRL,
-			dsi->vm_timings.ddr_clk_always_on, 13, 13);
-	}
+	/* DDR_CLK_ALWAYS_ON */
+	REG_FLD_MOD(dsi, DSI_CLK_CTRL,
+		    !(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS),
+		    13, 13);
 
 	dsi->ulps_enabled = false;
 
@@ -3641,7 +3640,7 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
 	dsi_force_tx_stop_mode_io(dsi);
 
 	/* start the DDR clock by sending a NULL packet */
-	if (dsi->vm_timings.ddr_clk_always_on)
+	if (!(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
 }
 
@@ -4150,7 +4149,6 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_calc_ctx *ctx)
 	dsi_vm->hfp_blanking_mode = 1;
 	dsi_vm->hbp_blanking_mode = 1;
 
-	dsi_vm->ddr_clk_always_on = cfg->ddr_clk_always_on;
 	dsi_vm->window_sync = 4;
 
 	/* setup DISPC videomode */
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index 7cc2cc748ed9..3543828e30eb 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -209,7 +209,6 @@ struct omap_dss_dsi_videomode_timings {
 
 	enum omap_dss_dsi_trans_mode trans_mode;
 
-	bool ddr_clk_always_on;
 	int window_sync;
 };
 
@@ -221,7 +220,6 @@ struct omap_dss_dsi_config {
 	unsigned long hs_clk_min, hs_clk_max;
 	unsigned long lp_clk_min, lp_clk_max;
 
-	bool ddr_clk_always_on;
 	enum omap_dss_dsi_trans_mode trans_mode;
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
