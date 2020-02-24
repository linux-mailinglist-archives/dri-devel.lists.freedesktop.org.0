Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A952A16BC44
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6907E6EA28;
	Tue, 25 Feb 2020 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CA66E9C4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6585E293E8E
Received: by earth.universe (Postfix, from userid 1000)
 id A129F3C0CB1; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 46/56] drm/omap: remove legacy DSS device operations
Date: Tue, 25 Feb 2020 00:21:16 +0100
Message-Id: <20200224232126.3385250-47-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All DSS devices have been converted to bridge API, so
the device operations are always NULL. This removes
the device ops function pointers and all code using it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 66 ------------------------
 drivers/gpu/drm/omapdrm/dss/dss.c        |  8 ---
 drivers/gpu/drm/omapdrm/dss/omapdss.h    | 34 ------------
 drivers/gpu/drm/omapdrm/omap_connector.c | 29 -----------
 drivers/gpu/drm/omapdrm/omap_encoder.c   | 40 --------------
 5 files changed, 177 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 8e08c49b4f97..c2791305c332 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -161,8 +161,6 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *src,
 			   struct omap_dss_device *dst)
 {
-	int ret;
-
 	dev_dbg(&dss->pdev->dev, "connect(%s, %s)\n",
 		src ? dev_name(src->dev) : "NULL",
 		dst ? dev_name(dst->dev) : "NULL");
@@ -181,14 +179,6 @@ int omapdss_device_connect(struct dss_device *dss,
 
 	dst->dss = dss;
 
-	if (dst->ops && dst->ops->connect) {
-		ret = dst->ops->connect(src, dst);
-		if (ret < 0) {
-			dst->dss = NULL;
-			return ret;
-		}
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(omapdss_device_connect);
@@ -212,66 +202,10 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 		return;
 	}
 
-	WARN_ON(dst->state != OMAP_DSS_DISPLAY_DISABLED);
-
-	if (dst->ops && dst->ops->disconnect)
-		dst->ops->disconnect(src, dst);
 	dst->dss = NULL;
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
 
-void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	omapdss_device_pre_enable(dssdev->next);
-
-	if (dssdev->ops && dssdev->ops->pre_enable)
-		dssdev->ops->pre_enable(dssdev);
-}
-EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
-
-void omapdss_device_enable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	if (dssdev->ops && dssdev->ops->enable)
-		dssdev->ops->enable(dssdev);
-
-	omapdss_device_enable(dssdev->next);
-
-	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-}
-EXPORT_SYMBOL_GPL(omapdss_device_enable);
-
-void omapdss_device_disable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	omapdss_device_disable(dssdev->next);
-
-	if (dssdev->ops && dssdev->ops->disable)
-		dssdev->ops->disable(dssdev);
-}
-EXPORT_SYMBOL_GPL(omapdss_device_disable);
-
-void omapdss_device_post_disable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	if (dssdev->ops && dssdev->ops->post_disable)
-		dssdev->ops->post_disable(dssdev);
-
-	omapdss_device_post_disable(dssdev->next);
-
-	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-}
-EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
-
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index a0b37d9b62ea..bf627a50e72f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1553,15 +1553,7 @@ static int dss_remove(struct platform_device *pdev)
 
 static void dss_shutdown(struct platform_device *pdev)
 {
-	struct omap_dss_device *dssdev = NULL;
-
 	DSSDBG("shutdown\n");
-
-	for_each_dss_output(dssdev) {
-		if (dssdev->state == OMAP_DSS_DISPLAY_ACTIVE &&
-		    dssdev->ops && dssdev->ops->disable)
-			dssdev->ops->disable(dssdev);
-	}
 }
 
 static int dss_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 45f5c46712eb..325a89d802e2 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -122,11 +122,6 @@ enum omap_dss_dsi_mode {
 	OMAP_DSS_DSI_VIDEO_MODE,
 };
 
-enum omap_dss_display_state {
-	OMAP_DSS_DISPLAY_DISABLED = 0,
-	OMAP_DSS_DISPLAY_ACTIVE,
-};
-
 enum omap_dss_rotation_type {
 	OMAP_DSS_ROT_NONE	= 0,
 	OMAP_DSS_ROT_TILER	= 1 << 0,
@@ -280,24 +275,6 @@ struct omapdss_dsi_ops {
 };
 
 struct omap_dss_device_ops {
-	int (*connect)(struct omap_dss_device *dssdev,
-			struct omap_dss_device *dst);
-	void (*disconnect)(struct omap_dss_device *dssdev,
-			struct omap_dss_device *dst);
-
-	void (*pre_enable)(struct omap_dss_device *dssdev);
-	void (*enable)(struct omap_dss_device *dssdev);
-	void (*disable)(struct omap_dss_device *dssdev);
-	void (*post_disable)(struct omap_dss_device *dssdev);
-
-	int (*check_timings)(struct omap_dss_device *dssdev,
-			     struct drm_display_mode *mode);
-	void (*set_timings)(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode);
-
-	int (*get_modes)(struct omap_dss_device *dssdev,
-			 struct drm_connector *connector);
-
 	const struct omapdss_dsi_ops dsi;
 };
 
@@ -341,8 +318,6 @@ struct omap_dss_device {
 	unsigned long ops_flags;
 	u32 bus_flags;
 
-	enum omap_dss_display_state state;
-
 	/* OMAP DSS output specific fields */
 
 	/* DISPC channel for this output */
@@ -373,10 +348,6 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct omap_dss_device *src,
 			       struct omap_dss_device *dst);
-void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
-void omapdss_device_enable(struct omap_dss_device *dssdev);
-void omapdss_device_disable(struct omap_dss_device *dssdev);
-void omapdss_device_post_disable(struct omap_dss_device *dssdev);
 
 int omap_dss_get_num_overlay_managers(void);
 
@@ -396,11 +367,6 @@ int omap_dispc_unregister_isr(omap_dispc_isr_t isr, void *arg, u32 mask);
 int omapdss_compat_init(void);
 void omapdss_compat_uninit(void);
 
-static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
-{
-	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
-}
-
 enum dss_writeback_channel {
 	DSS_WB_LCD1_MGR =	0,
 	DSS_WB_LCD2_MGR =	1,
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index 528764566b17..db6becd345a0 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -43,24 +43,8 @@ static void omap_connector_destroy(struct drm_connector *connector)
 
 static int omap_connector_get_modes(struct drm_connector *connector)
 {
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct omap_dss_device *dssdev = NULL;
-	struct omap_dss_device *d;
-
 	DBG("%s", connector->name);
 
-	/*
-	 * If the display pipeline reports modes (e.g. with a fixed resolution
-	 * panel or an analog TV output), query it.
-	 */
-	for (d = omap_connector->output; d; d = d->next) {
-		if (d->ops_flags & OMAP_DSS_DEVICE_OP_MODES)
-			dssdev = d;
-	}
-
-	if (dssdev)
-		return dssdev->ops->get_modes(dssdev, connector);
-
 	/* We can't retrieve modes. The KMS core will add the default modes. */
 	return 0;
 }
@@ -69,19 +53,6 @@ enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
 					const struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode)
 {
-	int ret;
-
-	drm_mode_copy(adjusted_mode, mode);
-
-	for (; dssdev; dssdev = dssdev->next) {
-		if (!dssdev->ops || !dssdev->ops->check_timings)
-			continue;
-
-		ret = dssdev->ops->check_timings(dssdev, adjusted_mode);
-		if (ret)
-			return MODE_BAD;
-	}
-
 	return MODE_OK;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 10abe4d01b0b..abb3821de8b8 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -115,11 +115,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 
 	/* Set timings for all devices in the display pipeline. */
 	dss_mgr_set_timings(output, &vm);
-
-	for (dssdev = output; dssdev; dssdev = dssdev->next) {
-		if (dssdev->ops && dssdev->ops->set_timings)
-			dssdev->ops->set_timings(dssdev, adjusted_mode);
-	}
 }
 
 static void omap_encoder_disable(struct drm_encoder *encoder)
@@ -129,25 +124,6 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 
 	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
-
-	/*
-	 * Disable the chain of external devices, starting at the one at the
-	 * internal encoder's output.
-	 */
-	omapdss_device_disable(dssdev->next);
-
-	/*
-	 * Disable the internal encoder. This will disable the DSS output.
-	 */
-	if (dssdev->ops && dssdev->ops->disable)
-		dssdev->ops->disable(dssdev);
-	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-
-	/*
-	 * Perform the post-disable operations on the chain of external devices
-	 * to complete the display pipeline disable.
-	 */
-	omapdss_device_post_disable(dssdev->next);
 }
 
 static void omap_encoder_enable(struct drm_encoder *encoder)
@@ -157,22 +133,6 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 
 	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
-
-	/* Prepare the chain of external devices for pipeline enable. */
-	omapdss_device_pre_enable(dssdev->next);
-
-	/*
-	 * Enable the internal encoder. This will enable the DSS output.
-	 */
-	if (dssdev->ops && dssdev->ops->enable)
-		dssdev->ops->enable(dssdev);
-	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-
-	/*
-	 * Enable the chain of external devices, starting at the one at the
-	 * internal encoder's output.
-	 */
-	omapdss_device_enable(dssdev->next);
 }
 
 static int omap_encoder_atomic_check(struct drm_encoder *encoder,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
