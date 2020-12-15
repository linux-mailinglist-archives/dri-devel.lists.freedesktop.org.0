Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B42DAB4B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93A96E23D;
	Tue, 15 Dec 2020 10:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6DB6E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAm3ub124274
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029283;
 bh=i9J3vip5kbzSTViIxa1W4EygcwivbPnvDqC2JMEivQ0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DS2syTS/0cO4yzb7tW0NbLomFVr3T+Og+zNpOJdYh0UHKW3/CyLg3oNA66r3uBYOF
 ALBFg4tTrLHa2NaXqi1nOVDTWfoK6T3QNPMN6HA/6d8zANgK2cIJIbc3Vyym3ZVT9m
 beJjqdSWmJ9WFMfm+q5iJPNwwe0Ae95o/iyhpVcE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAm2IY023715
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:02 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwal046467;
 Tue, 15 Dec 2020 04:48:01 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 61/84] drm/omap: dsi: send nop instead of page & column
Date: Tue, 15 Dec 2020 12:46:34 +0200
Message-ID: <20201215104657.802264-62-tomi.valkeinen@ti.com>
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

The OMAP DSI command mode panel driver used to send page & column
address before each frame update, and this code was moved into the DSI
host driver when converting it to the DRM bridge model.

However, it's not really required to send the page & column address
before each frame. It's also something that doesn't really belong to the
DSI host driver, so we should drop the code.

That said, frame updates break if we don't send _something_ between the
frames. A NOP command does the trick.

It is not clear if this behavior is as expected from a DSI command mode
frame transfer, or is it a feature/issue with OMAP DSI driver, or a
feature/issue in the command mode panel used.

Most likely this is related to the following from the DSI spec:

"To enable PHY synchronization the host processor should periodically
end HS transmission and drive the Data Lanes to the LP state. This
transition should take place at least once per frame."

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 46 ++++++++++++-------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c5682b2e26eb..e24db2431fb8 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3881,35 +3881,19 @@ static int _dsi_update(struct dsi_data *dsi)
 	return 0;
 }
 
-static int _dsi_update_window(struct dsi_data *dsi, int channel,
-			      int x, int y, int w, int h)
-{
-	int x1 = x, x2 = (x + w - 1);
-	int y1 = y, y2 = (y + h - 1);
-	u8 payloadX[5] = { MIPI_DCS_SET_COLUMN_ADDRESS,
-			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
-	u8 payloadY[5] = { MIPI_DCS_SET_PAGE_ADDRESS,
-			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
-	struct mipi_dsi_msg msgX = { 0 }, msgY = { 0 };
-	int ret;
+static int _dsi_send_nop(struct dsi_data *dsi, int channel)
+{
+	const u8 payload[] = { MIPI_DCS_NOP };
+	const struct mipi_dsi_msg msg = {
+		.channel = channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE,
+		.tx_len = 1,
+		.tx_buf = payload,
+	};
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-	msgX.type = MIPI_DSI_DCS_LONG_WRITE;
-	msgX.channel = channel;
-	msgX.tx_buf = payloadX;
-	msgX.tx_len = sizeof(payloadX);
-
-	msgY.type = MIPI_DSI_DCS_LONG_WRITE;
-	msgY.channel = channel;
-	msgY.tx_buf = payloadY;
-	msgY.tx_len = sizeof(payloadY);
-
-	ret = _omap_dsi_host_transfer(dsi, &msgX);
-	if (ret != 0)
-		return ret;
-
-	return _omap_dsi_host_transfer(dsi, &msgY);
+	return _omap_dsi_host_transfer(dsi, &msg);
 }
 
 static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
@@ -3941,10 +3925,14 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 
 	dsi_set_ulps_auto(dsi, false);
 
-	r = _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
-			       dsi->vm.vactive);
+	/*
+	 * Send NOP between the frames. If we don't send something here, the
+	 * updates stop working. This is probably related to DSI spec stating
+	 * that the DSI host should transition to LP at least once per frame.
+	 */
+	r = _dsi_send_nop(dsi, channel);
 	if (r < 0) {
-		DSSWARN("window update error: %d\n", r);
+		DSSWARN("failed to send nop between frames: %d\n", r);
 		goto err;
 	}
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
