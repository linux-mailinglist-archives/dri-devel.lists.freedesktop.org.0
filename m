Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20AC2D2AE9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C196E973;
	Tue,  8 Dec 2020 12:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745F06E973
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUh6U067347;
 Tue, 8 Dec 2020 06:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430643;
 bh=s8y6wYmG9GO4vi2S9XHeuiDFu4nrYrC0Yp24j5XVhEk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kvkMDXED/DBFyQWYncUcY4OddI0XczYsLJSWuZJcKtPEOuFhVQtDYuBBoVR2O7sg2
 AOudp4onPhQbsaWc096bmfhBMaFPsQLnS/IQUWonVxVPn+UOrSu/n4754cuSqar43/
 Y7EBAzEkeeQVtHG0hoS9VnNkz4OYrKW96/ESsFi4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUhnB014778
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:30:43 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:43 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjc095068;
 Tue, 8 Dec 2020 06:30:41 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 24/29] drm/omap: dsi: cleanup initial vc setup
Date: Tue, 8 Dec 2020 14:28:50 +0200
Message-ID: <20201208122855.254819-25-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
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
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
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
index d9c2cd849328..c32884f167b8 100644
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
@@ -3522,14 +3478,12 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 
 	dsi_set_ulps_auto(dsi, false);
 
-	dsi_vc_enable_hs(dssdev, vc, true);
-
 	/*
 	 * Send NOP between the frames. If we don't send something here, the
 	 * updates stop working. This is probably related to DSI spec stating
 	 * that the DSI host should transition to LP at least once per frame.
 	 */
-	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
+	r = _dsi_send_nop(dsi, VC_CMD, dsi->dsidev->channel);
 	if (r < 0) {
 		DSSWARN("failed to send nop between frames: %d\n", r);
 		goto err;
@@ -3654,6 +3608,35 @@ static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
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
@@ -3696,13 +3679,7 @@ static int dsi_init_dsi(struct dsi_data *dsi)
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
