Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AA2C2680
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F1F6E44F;
	Tue, 24 Nov 2020 12:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCF6E436
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:49:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmtES033350;
 Tue, 24 Nov 2020 06:48:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222135;
 bh=m7rqos5vJTFQlnMyZhV0MfW/fR6NA/rh3TlwrHMdBVM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pAP7yYYMy1S/r9dZEwWrooy76mRzoHOoIhd+FLbXxro6zDPRMpG3rfdh5/CZXSYai
 co5ETdOnxlNA+q0CaNzCColc18VKbjqRyummP6YPckj8Li7xlbJMnvswx2z8WB3cSR
 2eR5o6DYwQ5JQ6XHSrMMWZgpf8Z3f0K0F4mW3hPg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmtA2109563
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:55 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:55 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq5040922;
 Tue, 24 Nov 2020 06:48:53 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 76/80] drm/omap: dsi: cleanup initial vc setup
Date: Tue, 24 Nov 2020 14:45:34 +0200
Message-ID: <20201124124538.660710-77-tomi.valkeinen@ti.com>
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

As we now have a fixed setup for VCs (VC0 for video stream, VC1 for
commands), we can simplify the VC setup.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 85 +++++++++++--------------------
 1 file changed, 31 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ff8ace957291..27d0d119668b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2017,40 +2017,6 @@ static void dsi_vc_initial_config(struct dsi_data *dsi, int vc)
 	dsi->vc[vc].source = DSI_VC_SOURCE_L4;
 }
 
-static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
-				enum dsi_vc_source source)
-{
-	if (dsi->vc[vc].source == source)
-		return 0;
-
-	DSSDBG("Source config of VC %d", vc);
-
-	dsi_sync_vc(dsi, vc);
-
-	dsi_vc_enable(dsi, vc, 0);
-
-	/* VC_BUSY */
-	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
-		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
-		return -EIO;
-	}
-
-	/* SOURCE, 0 = L4, 1 = video port */
-	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
-
-	/* DCS_CMD_ENABLE */
-	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
-		bool enable = source == DSI_VC_SOURCE_VP;
-		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
-	}
-
-	dsi_vc_enable(dsi, vc, 1);
-
-	dsi->vc[vc].source = source;
-
-	return 0;
-}
-
 static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 		bool enable)
 {
@@ -2072,10 +2038,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 	dsi_if_enable(dsi, 1);
 
 	dsi_force_tx_stop_mode_io(dsi);
-
-	/* start the DDR clock by sending a NULL packet */
-	if (dsi->vm_timings.ddr_clk_always_on && enable)
-		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
 }
 
 static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
@@ -2270,8 +2232,6 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 		return -EINVAL;
 	}
 
-	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
-
 	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
 
 	p = msg->tx_buf;
@@ -2331,8 +2291,6 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
 		       vc, msg->type, pkt.header[1], pkt.header[2]);
 
-	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
-
 	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
 		DSSERR("ERROR FIFO FULL, aborting transfer\n");
 		return -EINVAL;
@@ -3351,8 +3309,6 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
 
 	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
 
-	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
-
 	bytespp	= mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
 	bytespl = w * bytespp;
 	bytespf = bytespl * h;
@@ -3522,9 +3478,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 
 	dsi_set_ulps_auto(dsi, false);
 
-	dsi_vc_enable_hs(dssdev, vc, !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_LPM));
-
-	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
+	r = _dsi_send_nop(dsi, VC_CMD, dsi->dsidev->channel);
 	if (r < 0) {
 		DSSWARN("failed to send nop between frames: %d\n", r);
 		goto err;
@@ -3649,6 +3603,35 @@ static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
+static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
+{
+	/* Setup VC_CMD for LP and cpu transfers */
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_CMD), 0, 9, 9); /* LP */
+
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_CMD), 0, 1, 1); /* SOURCE_L4 */
+	dsi->vc[VC_CMD].source = DSI_VC_SOURCE_L4;
+
+	/* Setup VC_VIDEO for HS and dispc transfers */
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 9, 9); /* HS */
+
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
+	dsi->vc[VC_VIDEO].source = DSI_VC_SOURCE_VP;
+
+	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
+		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE */
+
+	dsi_vc_enable(dsi, VC_CMD, 1);
+	dsi_vc_enable(dsi, VC_VIDEO, 1);
+
+	dsi_if_enable(dsi, 1);
+
+	dsi_force_tx_stop_mode_io(dsi);
+
+	/* start the DDR clock by sending a NULL packet */
+	if (dsi->vm_timings.ddr_clk_always_on)
+		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
+}
+
 static int dsi_init_dsi(struct dsi_data *dsi)
 {
 	int r;
@@ -3691,13 +3674,7 @@ static int dsi_init_dsi(struct dsi_data *dsi)
 	if (r)
 		goto err3;
 
-	/* enable interface */
-	dsi_vc_enable(dsi, 0, 1);
-	dsi_vc_enable(dsi, 1, 1);
-	dsi_vc_enable(dsi, 2, 1);
-	dsi_vc_enable(dsi, 3, 1);
-	dsi_if_enable(dsi, 1);
-	dsi_force_tx_stop_mode_io(dsi);
+	dsi_setup_dsi_vcs(dsi);
 
 	return 0;
 err3:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
