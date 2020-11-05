Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D72A7DDD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A5C6EA5C;
	Thu,  5 Nov 2020 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D86EA5C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:04:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4ZVH070100;
 Thu, 5 Nov 2020 06:04:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577875;
 bh=F7S7Xfkp/kNtsLBhFCjHg7XOVHhiMw3wA9fwR7dcWuk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=v3B41dfUgowZxN8UBvJLrluwAKpr8mShVLiCfTu5m9kECp1m0hwiNIRMsqFOaY3eL
 WLqXgLrrs7/byyRwb58+XAq8D3XvBwxwZP9fGAF4EoivI/ZirpScXV7gc/C7kuB2LI
 AXoJawGIsh8TWOurM/PdA5pOrwDd+gMPG2T8PODU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4ZML125384
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:04:35 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:35 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfE039111;
 Thu, 5 Nov 2020 06:04:32 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 16/56] drm/omap: panel-dsi-cm: drop hardcoded VC
Date: Thu, 5 Nov 2020 14:02:53 +0200
Message-ID: <20201105120333.947408-17-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use dsi->channel everywhere, which originates from DT.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index b1ca9b34ce17..25183744a61d 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -27,9 +27,6 @@
 
 #include "../dss/omapdss.h"
 
-/* DSI Virtual channel. Hardcoded for now. */
-#define TCH 0
-
 #define DCS_READ_NUM_ERRORS	0x05
 #define DCS_BRIGHTNESS		0x51
 #define DCS_CTRL_DISPLAY	0x53
@@ -73,7 +70,6 @@ struct panel_drv_data {
 	bool te_enabled;
 
 	atomic_t do_update;
-	int channel;
 
 	struct delayed_work te_timeout_work;
 
@@ -274,7 +270,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 		return 0;
 
 	src->ops->enable(src);
-	src->ops->dsi.enable_hs(src, ddata->channel, true);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
 
 	r = _dsicm_enable_te(ddata, true);
 	if (r) {
@@ -591,7 +587,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.enable_hs(src, ddata->channel, false);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, false);
 
 	r = dsicm_sleep_out(ddata);
 	if (r)
@@ -622,7 +618,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = src->ops->dsi.enable_video_output(src, ddata->channel);
+	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
 	if (r)
 		goto err;
 
@@ -634,7 +630,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		ddata->intro_printed = true;
 	}
 
-	src->ops->dsi.enable_hs(src, ddata->channel, true);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
 
 	return 0;
 err:
@@ -658,7 +654,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
-	src->ops->dsi.disable_video_output(src, ddata->channel);
+	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
@@ -777,7 +773,7 @@ static irqreturn_t dsicm_te_isr(int irq, void *data)
 	if (old) {
 		cancel_delayed_work(&ddata->te_timeout_work);
 
-		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
+		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
 				ddata);
 		if (r)
 			goto err;
@@ -834,7 +830,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 				msecs_to_jiffies(250));
 		atomic_set(&ddata->do_update, 1);
 	} else {
-		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
+		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
 				ddata);
 		if (r)
 			goto err;
@@ -1110,8 +1106,6 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	struct display_timing timing;
 	int err;
 
-	ddata->channel = TCH;
-
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
