Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD02DAB5C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6F36E2B4;
	Tue, 15 Dec 2020 10:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E16E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAmQRE011129
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029306;
 bh=1cevKIMDTiUY3z4u2DGvcFB/ACR+NiElAdW9Jl8V92M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=osVzsAud7RA+9Tv6LSq4ydrB8yC662+W21OR0VbGGeMYMnMg4pGVRxn26itoLJteT
 NMnLZiSqGLLTOr0/+uPuK2yiCwUuykiG3QYDnDc2tZQ89KcbY5HRSjOORvNaYRJoDe
 UrQIMPkJv/zEEb20UyqqE85UUKWinmGRLp4M2n7k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAmQ6j103347
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:26 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:26 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwbA046467;
 Tue, 15 Dec 2020 04:48:25 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 84/84] drm/omap: dsi: allow DSI commands to be sent early
Date: Tue, 15 Dec 2020 12:46:57 +0200
Message-ID: <20201215104657.802264-85-tomi.valkeinen@ti.com>
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

Panel drivers can send DSI commands in panel's prepare(), which happens
before the bridge's enable() is called. The OMAP DSI driver currently
only sets up the DSI interface at bridge's enable(), so prepare() cannot
be used to send DSI commands.

This patch fixes the issue by making it possible to enable the DSI
interface any time a command is about to be sent. Disabling the
interface is be done via delayed work.

Clarifications for the delayed disable work and the panel doing DSI
transactions:

bridge_enable: If the disable callback is called just before
bridge_enable takes the dsi_bus_lock, no problem, bridge_enable just
enables the interface again. If the callback is ran just after
bridge_enable's dsi_bus_unlock, no problem, dsi->video_enabled == true
so the callback does nothing.

bridge_disable: similar to bridge-enable, the callback won't do anything
if video_enabled == true, and after bridge-disable has turned the video
and the interface off, there's nothing to do for the callback.

omap_dsi_host_detach: this is called when the panel does
mipi_dsi_detach(), and we expect the panel to _not_ do any DSI
transactions after (or during) mipi_dsi_detatch(), so there are no
race conditions.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 50 +++++++++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 0dd5c0381080..8e11612f5fe1 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3500,6 +3500,9 @@ static void dsi_enable(struct dsi_data *dsi)
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	r = dsi_runtime_get(dsi);
@@ -3512,6 +3515,8 @@ static void dsi_enable(struct dsi_data *dsi)
 	if (r)
 		goto err_init_dsi;
 
+	dsi->iface_enabled = true;
+
 	mutex_unlock(&dsi->lock);
 
 	return;
@@ -3527,6 +3532,9 @@ static void dsi_disable(struct dsi_data *dsi)
 {
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(!dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	dsi_sync_vc(dsi, 0);
@@ -3538,6 +3546,8 @@ static void dsi_disable(struct dsi_data *dsi)
 
 	dsi_runtime_put(dsi);
 
+	dsi->iface_enabled = false;
+
 	mutex_unlock(&dsi->lock);
 }
 
@@ -4226,10 +4236,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 
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
 
@@ -4394,6 +4406,15 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
+	dsi_bus_lock(dsi);
+
+	if (dsi->iface_enabled)
+		dsi_disable(dsi);
+
+	dsi_bus_unlock(dsi);
+
 	omap_dsi_unregister_te_irq(dsi);
 	dsi->dsidev = NULL;
 	return 0;
@@ -4629,9 +4650,12 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
-	dsi_enable(dsi);
+	if (!dsi->iface_enabled)
+		dsi_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
@@ -4645,6 +4669,8 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
 	dsi->video_enabled = false;
@@ -4837,6 +4863,18 @@ static const struct soc_device_attribute dsi_soc_devices[] = {
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
@@ -4870,6 +4908,8 @@ static int dsi_probe(struct platform_device *pdev)
 	INIT_DEFERRABLE_WORK(&dsi->framedone_timeout_work,
 			     dsi_framedone_timeout_work_callback);
 
+	INIT_DEFERRABLE_WORK(&dsi->dsi_disable_work, omap_dsi_disable_work_callback);
+
 #ifdef DSI_CATCH_MISSING_TE
 	timer_setup(&dsi->te_timer, dsi_te_timeout, 0);
 #endif
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index de9411067ba2..601707c0ecc4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -394,6 +394,7 @@ struct dsi_data {
 	atomic_t do_ext_te_update;
 
 	bool te_enabled;
+	bool iface_enabled;
 	bool video_enabled;
 
 	struct delayed_work framedone_timeout_work;
@@ -443,6 +444,8 @@ struct dsi_data {
 
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
