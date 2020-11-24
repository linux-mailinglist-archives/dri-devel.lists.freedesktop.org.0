Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2F2C2641
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AEB6E41A;
	Tue, 24 Nov 2020 12:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076926E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmIpq033150;
 Tue, 24 Nov 2020 06:48:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222098;
 bh=S6rQLgfS7r0pKvQSnV/Xn/sFnp7EE5AeZBN/q77QReo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=H0g5kcoycUZKBSHev2dO9nRcuPw3tv4Igru/Li2m/cdQ3o3NJBmTb1/N9Z1cQ0VRu
 Z4ZyualWRjwv8cImr0Gg6SNydAE0cm9pI5p+anyaW9ol7gVmvw4FvEzR+DIdaHvolC
 vEHvfIBLsZH9I8goZw9LJ+ISOz6K4zNgVr0as+CE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmIsv044587
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:18 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:18 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpn040922;
 Tue, 24 Nov 2020 06:48:16 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 60/80] drm/panel: panel-dsi-cm: set column & page at setup
Date: Tue, 24 Nov 2020 14:45:18 +0200
Message-ID: <20201124124538.660710-61-tomi.valkeinen@ti.com>
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

Set the column & page address once during setup, instead of relying the
DSI host driver to set those.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 59e8e6b18e97..1e7f73340736 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -171,6 +171,26 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 	return 0;
 }
 
+static int dsicm_set_update_window(struct panel_drv_data *ddata)
+{
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	int r;
+	u16 x1 = 0;
+	u16 x2 = ddata->mode.hdisplay - 1;
+	u16 y1 = 0;
+	u16 y2 = ddata->mode.vdisplay - 1;
+
+	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
+	if (r < 0)
+		return r;
+
+	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
+	if (r < 0)
+		return r;
+
+	return 0;
+}
+
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
@@ -308,6 +328,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
+	r = dsicm_set_update_window(ddata);
+	if (r)
+		goto err;
+
 	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
 	if (r)
 		goto err;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
