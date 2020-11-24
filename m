Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE462C2636
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EEA6E40F;
	Tue, 24 Nov 2020 12:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8D6E314
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClX2q123688;
 Tue, 24 Nov 2020 06:47:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222053;
 bh=5cPI0FV2QxlfwqQ2+9JC+JgClNRTGvTTW41QtiDg5DI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mDDx4+l+IMPHiJqT6Mv6Vr1N1DRD6/ouUJBnsqTjP5nQ3Kj2KPBY+FTgg6H40M5vi
 ipKa5XmyyG/5FnsiXA7QKL35EfJqT5zZgm5oV7jl8knnm9QYPFHP4MTrSmbumY1YKa
 HkjSCXR7TnRDJum+8XwS3IApoGcKN0nq4828QKr8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClXRO043636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:47:33 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:32 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpU040922;
 Tue, 24 Nov 2020 06:47:30 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 41/80] drm/omap: remove legacy DSS device operations
Date: Tue, 24 Nov 2020 14:44:59 +0200
Message-ID: <20201124124538.660710-42-tomi.valkeinen@ti.com>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

All DSS devices have been converted to bridge API, so
the device operations are always NULL. This removes
the device ops function pointers and all code using it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 66 ------------------------
 drivers/gpu/drm/omapdrm/dss/dss.c        |  8 ---
 drivers/gpu/drm/omapdrm/dss/omapdss.h    | 34 ------------
 drivers/gpu/drm/omapdrm/omap_connector.c | 29 -----------
 drivers/gpu/drm/omapdrm/omap_encoder.c   | 56 --------------------
 5 files changed, 193 deletions(-)

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
index 6e86f4e67a2c..6a160138bf88 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1565,15 +1565,7 @@ static int dss_remove(struct platform_device *pdev)
 
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
index 42d1ec3aaf0c..5d6edec5a427 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -123,11 +123,6 @@ enum omap_dss_dsi_mode {
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
@@ -281,24 +276,6 @@ struct omapdss_dsi_ops {
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
 
@@ -342,8 +319,6 @@ struct omap_dss_device {
 	unsigned long ops_flags;
 	u32 bus_flags;
 
-	enum omap_dss_display_state state;
-
 	/* OMAP DSS output specific fields */
 
 	/* DISPC channel for this output */
@@ -374,10 +349,6 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct omap_dss_device *src,
 			       struct omap_dss_device *dst);
-void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
-void omapdss_device_enable(struct omap_dss_device *dssdev);
-void omapdss_device_disable(struct omap_dss_device *dssdev);
-void omapdss_device_post_disable(struct omap_dss_device *dssdev);
 
 int omap_dss_get_num_overlay_managers(void);
 
@@ -397,11 +368,6 @@ int omap_dispc_unregister_isr(omap_dispc_isr_t isr, void *arg, u32 mask);
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
index de95dc1b861c..c6d9b4268841 100644
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
index 330296ae8344..ef28dfa49ca1 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -115,60 +115,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 
 	/* Set timings for all devices in the display pipeline. */
 	dss_mgr_set_timings(output, &vm);
-
-	for (dssdev = output; dssdev; dssdev = dssdev->next) {
-		if (dssdev->ops && dssdev->ops->set_timings)
-			dssdev->ops->set_timings(dssdev, adjusted_mode);
-	}
-}
-
-static void omap_encoder_disable(struct drm_encoder *encoder)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	struct omap_dss_device *dssdev = omap_encoder->output;
-	struct drm_device *dev = encoder->dev;
-
-	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
-
-	/*
-	 * Disable the chain of external devices, starting at the one at the
-	 * internal encoder's output.
-	 */
-	omapdss_device_disable(dssdev->next);
-
-	/* Disable the internal encoder. This will disable the DSS output. */
-	if (dssdev->ops && dssdev->ops->disable)
-		dssdev->ops->disable(dssdev);
-	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-
-	/*
-	 * Perform the post-disable operations on the chain of external devices
-	 * to complete the display pipeline disable.
-	 */
-	omapdss_device_post_disable(dssdev->next);
-}
-
-static void omap_encoder_enable(struct drm_encoder *encoder)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	struct omap_dss_device *dssdev = omap_encoder->output;
-	struct drm_device *dev = encoder->dev;
-
-	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
-
-	/* Prepare the chain of external devices for pipeline enable. */
-	omapdss_device_pre_enable(dssdev->next);
-
-	/* Enable the internal encoder. This will enable the DSS output. */
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
@@ -191,8 +137,6 @@ static int omap_encoder_atomic_check(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs omap_encoder_helper_funcs = {
 	.mode_set = omap_encoder_mode_set,
-	.disable = omap_encoder_disable,
-	.enable = omap_encoder_enable,
 	.atomic_check = omap_encoder_atomic_check,
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
