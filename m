Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990552DAB4F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CFE6E2BC;
	Tue, 15 Dec 2020 10:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A706E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAm4Di124296
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029285;
 bh=3oYgrcVCUxDze/iSFGpz8cDyF4w+jisKFfgE8e0iehA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dRP5NWvmEYpPGa/kra5GIRjE0a8OTP7dO2V+BWQcwEtrR0AVokrlYmlKz49J7G92K
 Vx5shxBfl1O8PiE4vbC0c1BuW95KOSbk7ZwzA1nXWdMayjPiD5Cvlny71XJ0855Gog
 f2oKbb9GfugqX0MnyUnUMkLxP+Th6IVZovl6BLvk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAm42U102482
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:04 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:04 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwan046467;
 Tue, 15 Dec 2020 04:48:04 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 63/84] drm/omap: dsi: drop useless channel checks
Date: Tue, 15 Dec 2020 12:46:36 +0200
Message-ID: <20201215104657.802264-64-tomi.valkeinen@ti.com>
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

A DSI peripheral can have virtual channel ID of 0-3. This should be
always the case, and there's no need in the driver to validate the
channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 96193a04b2b8..32e6170abd95 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3899,9 +3899,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	if (channel > 3)
-		return -EINVAL;
-
 	dsi_bus_lock(dsi);
 
 	if (!dsi->video_enabled) {
@@ -5065,12 +5062,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 				struct mipi_dsi_device *client)
 {
 	struct dsi_data *dsi = host_to_omap(host);
-	unsigned int channel = client->channel;
 	int r;
 
-	if (channel > 3)
-		return -EINVAL;
-
 	if (dsi->dsidev) {
 		DSSERR("dsi client already attached\n");
 		return -EBUSY;
@@ -5120,10 +5113,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 				struct mipi_dsi_device *client)
 {
 	struct dsi_data *dsi = host_to_omap(host);
-	unsigned int channel = client->channel;
-
-	if (channel > 3)
-		return -EINVAL;
 
 	if (WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
