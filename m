Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD582DAB5A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4216E22F;
	Tue, 15 Dec 2020 10:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6F6E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAm8eB010839
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029288;
 bh=3OGKyYGaURz7U9NItCAl8XZoyQpDIM/3KoVgE6CfgvQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xBT6CjRFQSijKxVlKigNU4BF9Ql1rvpgTtRtvaWb+wnBQ5I4HMB3eSFap44m1lpqL
 MjTYJYTfGwd08rwkFRndhXy23j03EGOflgPtCEjVwqomQgtt7Vi9ukhcvTVq5/6/1K
 muOGa8Yxq119EBHK+h+wGKlTWc5r4Kd56wrKxYOM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAm84k001409
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:08 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:07 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaq046467;
 Tue, 15 Dec 2020 04:48:07 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 66/84] drm/omap: dsi: pass vc and channel to various
 functions
Date: Tue, 15 Dec 2020 12:46:39 +0200
Message-ID: <20201215104657.802264-67-tomi.valkeinen@ti.com>
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

To start fixing the issues related to channels and vcs described in the
previous commit, pass vc and/or channel to various functions which will
need it do properly handle different DSI channels and VCs.

No functional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 54 ++++++++++++++++---------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 08dd76b4549a..7c8fe5da3099 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -214,9 +214,9 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
 static int dsi_display_init_dispc(struct dsi_data *dsi);
 static void dsi_display_uninit_dispc(struct dsi_data *dsi);
 
-static int dsi_vc_send_null(struct dsi_data *dsi, int vc);
+static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
 
-static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
+static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 				       const struct mipi_dsi_msg *msg);
 
 static void dsi_display_disable(struct omap_dss_device *dssdev);
@@ -2457,7 +2457,7 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 
 	/* start the DDR clock by sending a NULL packet */
 	if (dsi->vm_timings.ddr_clk_always_on && enable)
-		dsi_vc_send_null(dsi, vc);
+		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
 
 	dsi->in_lp_mode = !enable;
 }
@@ -2607,7 +2607,8 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int vc)
 }
 
 static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
-					    u8 data_type, u16 len, u8 ecc)
+					    int channel, u8 data_type, u16 len,
+					    u8 ecc)
 {
 	u32 val;
 	u8 data_id;
@@ -2635,7 +2636,7 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int vc,
 	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
 }
 
-static int dsi_vc_send_long(struct dsi_data *dsi,
+static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 			    const struct mipi_dsi_msg *msg)
 {
 	/*u32 val; */
@@ -2655,7 +2656,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
 
 	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
 
-	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len, 0);
+	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
 
 	p = msg->tx_buf;
 	for (i = 0; i < msg->tx_len >> 2; i++) {
@@ -2698,7 +2699,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
 	return r;
 }
 
-static int dsi_vc_send_short(struct dsi_data *dsi,
+static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 			     const struct mipi_dsi_msg *msg)
 {
 	struct mipi_dsi_packet pkt;
@@ -2729,26 +2730,26 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
 	return 0;
 }
 
-static int dsi_vc_send_null(struct dsi_data *dsi, int vc)
+static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
 {
 	const struct mipi_dsi_msg msg = {
 		.channel = vc,
 		.type = MIPI_DSI_NULL_PACKET,
 	};
 
-	return dsi_vc_send_long(dsi, &msg);
+	return dsi_vc_send_long(dsi, vc, &msg);
 }
 
-static int dsi_vc_write_common(struct omap_dss_device *dssdev,
+static int dsi_vc_write_common(struct omap_dss_device *dssdev, int vc,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
 	if (mipi_dsi_packet_format_is_short(msg->type))
-		r = dsi_vc_send_short(dsi, msg);
+		r = dsi_vc_send_short(dsi, vc, msg);
 	else
-		r = dsi_vc_send_long(dsi, msg);
+		r = dsi_vc_send_long(dsi, vc, msg);
 
 	if (r < 0)
 		return r;
@@ -2884,7 +2885,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int vc, u8 *buf,
 	return r;
 }
 
-static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
+static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
 			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
@@ -2895,7 +2896,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 	if (dsi->debug_read)
 		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
 
-	r = dsi_vc_send_short(dsi, msg);
+	r = dsi_vc_send_short(dsi, vc, msg);
 	if (r)
 		goto err;
 
@@ -2919,13 +2920,13 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 	return r;
 }
 
-static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
+static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	r = dsi_vc_send_short(dsi, msg);
+	r = dsi_vc_send_short(dsi, vc, msg);
 	if (r)
 		goto err;
 
@@ -3674,7 +3675,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
 
 		word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
 
-		dsi_vc_write_long_header(dsi, vc, data_type,
+		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
 				word_count, 0);
 
 		dsi_vc_enable(dsi, vc, true);
@@ -3772,7 +3773,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
 	l = FLD_VAL(total_len, 23, 0); /* TE_SIZE */
 	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
 
-	dsi_vc_write_long_header(dsi, vc, MIPI_DSI_DCS_LONG_WRITE,
+	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, MIPI_DSI_DCS_LONG_WRITE,
 		packet_len, 0);
 
 	if (dsi->te_enabled)
@@ -3879,7 +3880,7 @@ static int _dsi_update(struct dsi_data *dsi)
 	return 0;
 }
 
-static int _dsi_send_nop(struct dsi_data *dsi, int channel)
+static int _dsi_send_nop(struct dsi_data *dsi, int vc, int channel)
 {
 	const u8 payload[] = { MIPI_DCS_NOP };
 	const struct mipi_dsi_msg msg = {
@@ -3891,7 +3892,7 @@ static int _dsi_send_nop(struct dsi_data *dsi, int channel)
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-	return _omap_dsi_host_transfer(dsi, &msg);
+	return _omap_dsi_host_transfer(dsi, vc, &msg);
 }
 
 static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
@@ -3920,7 +3921,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 	 * updates stop working. This is probably related to DSI spec stating
 	 * that the DSI host should transition to LP at least once per frame.
 	 */
-	r = _dsi_send_nop(dsi, vc);
+	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
 	if (r < 0) {
 		DSSWARN("failed to send nop between frames: %d\n", r);
 		goto err;
@@ -4882,7 +4883,7 @@ static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
 	}
 }
 
-static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
+static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 				       const struct mipi_dsi_msg *msg)
 {
 	struct omap_dss_device *dssdev = &dsi->output;
@@ -4902,15 +4903,15 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
 	case MIPI_DSI_DCS_LONG_WRITE:
 	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
 	case MIPI_DSI_NULL_PACKET:
-		r = dsi_vc_write_common(dssdev, msg);
+		r = dsi_vc_write_common(dssdev, vc, msg);
 		break;
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		r = dsi_vc_generic_read(dssdev, msg);
+		r = dsi_vc_generic_read(dssdev, vc, msg);
 		break;
 	case MIPI_DSI_DCS_READ:
-		r = dsi_vc_dcs_read(dssdev, msg);
+		r = dsi_vc_dcs_read(dssdev, vc, msg);
 		break;
 	default:
 		r = -EINVAL;
@@ -4938,12 +4939,13 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	int r;
+	int vc = VC_DEFAULT;
 
 	dsi_bus_lock(dsi);
 
 	if (dsi->video_enabled) {
 		dsi_set_ulps_auto(dsi, false);
-		r = _omap_dsi_host_transfer(dsi, msg);
+		r = _omap_dsi_host_transfer(dsi, vc, msg);
 		dsi_set_ulps_auto(dsi, true);
 	} else {
 		r = -EIO;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
