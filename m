Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87922D2AD4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E656E954;
	Tue,  8 Dec 2020 12:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D6D6E954
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CU2uF064098;
 Tue, 8 Dec 2020 06:30:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430602;
 bh=wdap3DjOYmxXlAFEu1U0+KG+ezB+xoP2+U85DXN3G/Y=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=v5/QsdC18suXRt6+2v9Q13abdLEhX+zg/udCx/oTG+uxu5v+0/SAgdbbTMblkocfg
 kX1ayjfOr4SgXy6TqegRAWQfeEwNZcamv7zokU4ekQEy8jV6MdD2HetjczzLsnZLGP
 tjUVE3Oua9UOA5qOo6lpxG6yA/Ca2/++aSz/UPCg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CU1bS086526
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:30:02 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:01 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjM095068;
 Tue, 8 Dec 2020 06:29:59 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 08/29] drm/omap: dsi: drop useless channel checks
Date: Tue, 8 Dec 2020 14:28:34 +0200
Message-ID: <20201208122855.254819-9-tomi.valkeinen@ti.com>
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

A DSI peripheral can have virtual channel ID of 0-3. This should be
always the case, and there's no need in the driver to validate the
channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5e13478010db..c78ae99c8742 100644
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
@@ -5068,12 +5065,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
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
@@ -5123,10 +5116,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
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
