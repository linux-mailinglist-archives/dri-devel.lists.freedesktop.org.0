Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3F2C812E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9AE89DB4;
	Mon, 30 Nov 2020 09:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B77289DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:40:20 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AU9eDRB037147;
 Mon, 30 Nov 2020 03:40:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606729213;
 bh=PqDRr/7VPYcHII8tDeyh8slU+NbS/EkhmXcXLitOnVw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Wv3J4MpOywrAq//IYK5Kmu78SXhiSVw1YCCePCStoFqizZNSxx37FBC72bQ/Zi2Oq
 8MLT6qKG9Oof0nkpv+ghjPPkcA4n2F5vIMnQAHBgpPo51W09S8J9vGGafCZHQqG3Mj
 C5QTK/jCTXH5KtQ9knA+TSeOPEVqBKxZ9M+eZ3jk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AU9eD4m001291
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 03:40:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 03:40:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 03:40:12 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AU9eAIj041208;
 Mon, 30 Nov 2020 03:40:10 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 81/80] drm/omap: dsi: allow DSI commands to be sent early
Date: Mon, 30 Nov 2020 11:39:52 +0200
Message-ID: <20201130093952.133326-1-tomi.valkeinen@ti.com>
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

Panel drivers can send DSI commands in panel's prepare(), which happens
before the bridge's enable() is called. The OMAP DSI driver currently
only sets up the DSI interface at bridge's enable(), so prepare() cannot
be used to send DSI commands.

This patch fixes the issue by making it possible to enable the DSI
interface any time a command is about to be sent. Disabling the
interface is be done via delayed work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

One more patch. With this video mode panels seem to work cleanly (tested
by me on omap5 uevm + custom panel and Nikolaus on pyra).

 drivers/gpu/drm/omapdrm/dss/dsi.c | 49 +++++++++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index d52bef0c7aa2..ae504ab122b4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3498,6 +3498,9 @@ static void dsi_enable(struct dsi_data *dsi)
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	r = dsi_runtime_get(dsi);
@@ -3510,6 +3513,8 @@ static void dsi_enable(struct dsi_data *dsi)
 	if (r)
 		goto err_init_dsi;
 
+	dsi->iface_enabled = true;
+
 	mutex_unlock(&dsi->lock);
 
 	return;
@@ -3525,6 +3530,9 @@ static void dsi_disable(struct dsi_data *dsi)
 {
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(!dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	dsi_sync_vc(dsi, 0);
@@ -3536,6 +3544,8 @@ static void dsi_disable(struct dsi_data *dsi)
 
 	dsi_runtime_put(dsi);
 
+	dsi->iface_enabled = false;
+
 	mutex_unlock(&dsi->lock);
 }
 
@@ -4224,10 +4234,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 
 	dsi_bus_lock(dsi);
 
-	if (dsi->video_enabled)
-		r = _omap_dsi_host_transfer(dsi, vc, msg);
-	else
-		r = -EIO;
+	if (!dsi->iface_enabled) {
+		dsi_enable(dsi);
+		schedule_delayed_work(&dsi->dsi_disable_work, msecs_to_jiffies(2000));
+	}
+
+	r = _omap_dsi_host_transfer(dsi, vc, msg);
 
 	dsi_bus_unlock(dsi);
 
@@ -4392,6 +4404,14 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
+	if (dsi->iface_enabled) {
+		dsi_bus_lock(dsi);
+		dsi_disable(dsi);
+		dsi_bus_unlock(dsi);
+	}
+
 	omap_dsi_unregister_te_irq(dsi);
 	dsi->dsidev = NULL;
 	return 0;
@@ -4627,9 +4647,12 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
-	dsi_enable(dsi);
+	if (!dsi->iface_enabled)
+		dsi_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
@@ -4643,6 +4666,8 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
 	dsi->video_enabled = false;
@@ -4835,6 +4860,18 @@ static const struct soc_device_attribute dsi_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
+static void omap_dsi_disable_work_callback(struct work_struct *work)
+{
+	struct dsi_data *dsi = container_of(work, struct dsi_data, dsi_disable_work.work);
+
+	dsi_bus_lock(dsi);
+
+	if (dsi->iface_enabled && !dsi->video_enabled)
+		dsi_disable(dsi);
+
+	dsi_bus_unlock(dsi);
+}
+
 static int dsi_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *soc;
@@ -4868,6 +4905,8 @@ static int dsi_probe(struct platform_device *pdev)
 	INIT_DEFERRABLE_WORK(&dsi->framedone_timeout_work,
 			     dsi_framedone_timeout_work_callback);
 
+	INIT_DEFERRABLE_WORK(&dsi->dsi_disable_work, omap_dsi_disable_work_callback);
+
 #ifdef DSI_CATCH_MISSING_TE
 	timer_setup(&dsi->te_timer, dsi_te_timeout, 0);
 #endif
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index 452cee3279db..805f9073d9a5 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -391,6 +391,7 @@ struct dsi_data {
 	atomic_t do_ext_te_update;
 
 	bool te_enabled;
+	bool iface_enabled;
 	bool video_enabled;
 
 	struct delayed_work framedone_timeout_work;
@@ -440,6 +441,8 @@ struct dsi_data {
 
 	struct omap_dss_device output;
 	struct drm_bridge bridge;
+
+	struct delayed_work dsi_disable_work;
 };
 
 struct dsi_packet_sent_handler_data {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
