Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9502D2AC7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EC06E92D;
	Tue,  8 Dec 2020 12:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605346E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTvvD066640;
 Tue, 8 Dec 2020 06:29:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430597;
 bh=XD/sefueOKoXyqgCh9BxBBpoHqtt4qwCxN2yjeUoZK4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=RnZgNyPinWYkfuZjDZMZm8tgYth+cDBHPr7zePICNhiuUfeNe4F+NW17D9jlQ5WTR
 sdOGbpWAOOgPFIUptiO5rjGsZ4+rTCEo9XGV3yI9XS9Zr27murYwRHHqcuuttWfxGh
 K9k07GZYyAJR82vK7baJyA5FDeDL/TixkVo96clA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTue4086386
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:29:57 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:56 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjK095068;
 Tue, 8 Dec 2020 06:29:54 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 06/29] drm/omap: dsi: send nop instead of page & column
Date: Tue, 8 Dec 2020 14:28:32 +0200
Message-ID: <20201208122855.254819-7-tomi.valkeinen@ti.com>
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
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 46 ++++++++++++-------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 7fee9cf8782d..c6e044f8bece 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3884,35 +3884,19 @@ static int _dsi_update(struct dsi_data *dsi)
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
@@ -3944,10 +3928,14 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 
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
