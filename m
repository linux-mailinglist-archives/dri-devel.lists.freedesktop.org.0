Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90ED2DAB61
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0B46E24E;
	Tue, 15 Dec 2020 10:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C306E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAmNBm124526
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029303;
 bh=uyMh7V76ZCDa/j0vuYou1UKT9HtbZIcN8y1KkVkyzz8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gLsv2WWGip+4D2QxyM1U2TiKpY23s0QwzLNQvuj+GgQBhKJ2BlupHgHdIE2hOErRR
 v/l2upOs4qBc4Bu451+0S3p+SMU9jbwICfmPwQEAYuCjKvEhuT8BurdJtcVDTIWENk
 a3iStikAB3Mu4S5JYPC7xyAh0WRpKnYLA80pmV1Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAmN6X001878
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:23 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:23 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwb7046467;
 Tue, 15 Dec 2020 04:48:22 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 81/84] drm/omap: dsi: fix and cleanup ddr_clk_always_on
Date: Tue, 15 Dec 2020 12:46:54 +0200
Message-ID: <20201215104657.802264-82-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver ignores MIPI_DSI_CLOCK_NON_CONTINUOUS, and always uses
non-continuous clock.

Fix this by using MIPI_DSI_CLOCK_NON_CONTINUOUS and at the same time,
drop ddr_clk_always_on field which seems pretty useless.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++-------
 drivers/gpu/drm/omapdrm/dss/dsi.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a17d7345fc9a..749f591a3d5e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -1736,11 +1736,10 @@ static int dsi_cio_init(struct dsi_data *dsi)
 
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
 
@@ -3643,7 +3642,7 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
 	dsi_force_tx_stop_mode_io(dsi);
 
 	/* start the DDR clock by sending a NULL packet */
-	if (dsi->vm_timings.ddr_clk_always_on)
+	if (!(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
 }
 
@@ -4152,7 +4151,6 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_calc_ctx *ctx)
 	dsi_vm->hfp_blanking_mode = 1;
 	dsi_vm->hbp_blanking_mode = 1;
 
-	dsi_vm->ddr_clk_always_on = cfg->ddr_clk_always_on;
 	dsi_vm->window_sync = 4;
 
 	/* setup DISPC videomode */
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index 478fc10bd18d..476069fda082 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -212,7 +212,6 @@ struct omap_dss_dsi_videomode_timings {
 
 	enum omap_dss_dsi_trans_mode trans_mode;
 
-	bool ddr_clk_always_on;
 	int window_sync;
 };
 
@@ -224,7 +223,6 @@ struct omap_dss_dsi_config {
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
