Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F02C264C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33EE6E431;
	Tue, 24 Nov 2020 12:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CDF6E420
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmP3v033187;
 Tue, 24 Nov 2020 06:48:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222105;
 bh=OzS9hctnVOx46cFklaoF1BsEwxZJ2uBRcjNr+C/Q+to=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CeSQQY6NAK/IScP3LFZwlpwXNf451HcS9QrN1Yxj7/tW0zCBQmCUHoS3cNv1Qmz+f
 0KZWnKi5yVwKE5m4x2UIRO+LWQKFQ4NhfNss6yiDSALD1LmCZd+7FWArzKAffrylYP
 abRRL8II4OuH6Px9W2QYAaJCkEOkrtFRJ5zN37o0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmPh3045588
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:25 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:24 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpq040922;
 Tue, 24 Nov 2020 06:48:23 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 63/80] drm/omap: dsi: drop useless channel checks
Date: Tue, 24 Nov 2020 14:45:21 +0200
Message-ID: <20201124124538.660710-64-tomi.valkeinen@ti.com>
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

A DSI peripheral can have virtual channel ID of 0-3. This should be
always the case, and there's no need in the driver to validate the
channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 63338324c564..fbf05097612f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3902,9 +3902,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	if (channel > 3)
-		return -EINVAL;
-
 	dsi_bus_lock(dsi);
 
 	if (!dsi->video_enabled) {
@@ -5063,12 +5060,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
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
@@ -5118,10 +5111,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
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
