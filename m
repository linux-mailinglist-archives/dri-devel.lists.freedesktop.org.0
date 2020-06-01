Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B131E9E37
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6B6E03B;
	Mon,  1 Jun 2020 06:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B366E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:28:58 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E0E01A0634;
 Mon,  1 Jun 2020 08:23:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8220D1A062C;
 Mon,  1 Jun 2020 08:23:17 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 51C164030C;
 Mon,  1 Jun 2020 14:23:10 +0800 (SGT)
From: sandor.yu@nxp.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, heiko@sntech.de, hjc@rock-chips.com,
 Sandor.yu@nxp.com, dkos@cadence.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm: bridge: cadence: Initial support for MHDP HDMI
 bridge driver
Date: Mon,  1 Jun 2020 14:17:35 +0800
Message-Id: <b7ef05362af4127a90af31bf17a37f98b71eff1e.1590982881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

This adds initial support for cadence MHDP HDMI bridge driver.
Basic HDMI functions are supported, that include:
 -Video mode set on-the-fly
 -Cable hotplug detect
 -MAX support resolution to 3096x2160@60fps
 -HDMI audio
 -AV infoframe
 -EDID read
 -SCDC read

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   3 +-
 .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 600 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  14 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c   | 330 ++++++++++
 include/drm/bridge/cdns-mhdp.h                |  69 ++
 6 files changed, 1019 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index b7b8d30b18b6..9bc098302837 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -9,3 +9,7 @@ config DRM_CDNS_MHDP
 config DRM_CDNS_DP
 	tristate "Cadence DP DRM driver"
 	depends on DRM_CDNS_MHDP
+
+config DRM_CDNS_HDMI
+	tristate "Cadence HDMI DRM driver"
+	depends on DRM_CDNS_MHDP
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index cb3c88311a64..1d60166c2bf5 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-cdns_mhdp_drmcore-y := cdns-mhdp-common.o cdns-mhdp-audio.o cdns-mhdp-dp.o
+cdns_mhdp_drmcore-y := cdns-mhdp-common.o cdns-mhdp-audio.o cdns-mhdp-dp.o cdns-mhdp-hdmi.o
 cdns_mhdp_drmcore-$(CONFIG_DRM_CDNS_DP) += cdns-dp-core.o
+cdns_mhdp_drmcore-$(CONFIG_DRM_CDNS_HDMI) += cdns-hdmi-core.o
 obj-$(CONFIG_DRM_CDNS_MHDP)		+= cdns_mhdp_drmcore.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
new file mode 100644
index 000000000000..5775ed21b734
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
@@ -0,0 +1,600 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence High-Definition Multimedia Interface (HDMI) driver
+ *
+ * Copyright (C) 2019-2020 NXP Semiconductor, Inc.
+ *
+ */
+#include <drm/bridge/cdns-mhdp.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_scdc_helper.h>
+#include <drm/drm_vblank.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hdmi.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+
+#include "cdns-mhdp-common.h"
+
+static void hdmi_sink_config(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_scdc *scdc = &mhdp->connector.base.display_info.hdmi.scdc;
+	u8 buff = 0;
+
+	/* Default work in HDMI1.4 */
+	mhdp->hdmi.hdmi_type = MODE_HDMI_1_4;
+
+	/* check sink support SCDC or not */
+	if (scdc->supported != true) {
+		DRM_INFO("Sink Not Support SCDC\n");
+		return;
+	}
+
+	if (mhdp->hdmi.char_rate > 340000) {
+		/*
+		 * TMDS Character Rate above 340MHz should working in HDMI2.0
+		 * Enable scrambling and TMDS_Bit_Clock_Ratio
+		 */
+		buff = SCDC_TMDS_BIT_CLOCK_RATIO_BY_40 | SCDC_SCRAMBLING_ENABLE;
+		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
+	} else  if (scdc->scrambling.low_rates) {
+		/*
+		 * Enable scrambling and HDMI2.0 when scrambling capability of sink
+		 * be indicated in the HF-VSDB LTE_340Mcsc_scramble bit
+		 */
+		buff = SCDC_SCRAMBLING_ENABLE;
+		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
+	}
+
+	/* TMDS config */
+	cdns_hdmi_scdc_write(mhdp, SCDC_TMDS_CONFIG, buff);
+}
+
+static void hdmi_lanes_config(struct cdns_mhdp_device *mhdp)
+{
+	u32 lane_mapping = mhdp->plat_data->lane_mapping;
+	/* Line swaping */
+	cdns_mhdp_reg_write(mhdp, LANES_CONFIG, 0x00400000 | lane_mapping);
+}
+
+static int hdmi_avi_info_set(struct cdns_mhdp_device *mhdp,
+			     struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	int format = mhdp->video_info.color_fmt;
+	struct drm_connector_state *conn_state = mhdp->connector.base.state;
+	struct drm_display_mode *adj_mode;
+	enum hdmi_quantization_range qr;
+	u8 buf[32];
+	int ret;
+
+	/* Initialise info frame from DRM mode */
+	drm_hdmi_avi_infoframe_from_display_mode(&frame,
+						&mhdp->connector.base, mode);
+
+	switch (format) {
+	case YCBCR_4_4_4:
+		frame.colorspace = HDMI_COLORSPACE_YUV444;
+		break;
+	case YCBCR_4_2_2:
+		frame.colorspace = HDMI_COLORSPACE_YUV422;
+		break;
+	case YCBCR_4_2_0:
+		frame.colorspace = HDMI_COLORSPACE_YUV420;
+		break;
+	default:
+		frame.colorspace = HDMI_COLORSPACE_RGB;
+		break;
+	}
+
+	drm_hdmi_avi_infoframe_colorspace(&frame, conn_state);
+
+	adj_mode = &mhdp->bridge.base.encoder->crtc->state->adjusted_mode;
+
+	qr = drm_default_rgb_quant_range(adj_mode);
+
+	drm_hdmi_avi_infoframe_quant_range(&frame, &mhdp->connector.base,
+					   adj_mode, qr);
+
+	ret = hdmi_avi_infoframe_check(&frame);
+	if (WARN_ON(ret))
+		return false;
+
+	ret = hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
+		return -1;
+	}
+
+	buf[0] = 0;
+	cdns_mhdp_infoframe_set(mhdp, 0, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_AVI);
+	return 0;
+}
+
+static void hdmi_vendor_info_set(struct cdns_mhdp_device *mhdp,
+				struct drm_display_mode *mode)
+{
+	struct hdmi_vendor_infoframe frame;
+	u8 buf[32];
+	int ret;
+
+	/* Initialise vendor frame from DRM mode */
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(&frame, &mhdp->connector.base, mode);
+	if (ret < 0) {
+		DRM_INFO("No vendor infoframe\n");
+		return;
+	}
+
+	ret = hdmi_vendor_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_WARN("Unable to pack vendor infoframe: %d\n", ret);
+		return;
+	}
+
+	buf[0] = 0;
+	cdns_mhdp_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_VENDOR);
+}
+
+static void hdmi_drm_info_set(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_connector_state *conn_state;
+	struct hdmi_drm_infoframe frame;
+	u8 buf[32];
+	int ret;
+
+	conn_state = mhdp->connector.base.state;
+
+	if (!conn_state->hdr_output_metadata)
+		return;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
+		return;
+	}
+
+	ret = hdmi_drm_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("couldn't pack HDR infoframe\n");
+		return;
+	}
+
+	buf[0] = 0;
+	cdns_mhdp_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_DRM);
+}
+
+void cdns_hdmi_mode_set(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_display_mode *mode = &mhdp->mode;
+	int ret;
+
+	/* video mode check */
+	if (mode->clock == 0 || mode->hdisplay == 0 ||  mode->vdisplay == 0)
+		return;
+
+	hdmi_lanes_config(mhdp);
+
+	cdns_mhdp_plat_call(mhdp, pclk_rate);
+
+	/* Delay for HDMI FW stable after pixel clock relock */
+	msleep(20);
+
+	cdns_mhdp_plat_call(mhdp, phy_set);
+
+	hdmi_sink_config(mhdp);
+
+	ret = cdns_hdmi_ctrl_init(mhdp, mhdp->hdmi.hdmi_type, mhdp->hdmi.char_rate);
+	if (ret < 0) {
+		DRM_ERROR("%s, ret = %d\n", __func__, ret);
+		return;
+	}
+
+	/* Config GCP */
+	if (mhdp->video_info.color_depth == 8)
+		cdns_hdmi_disable_gcp(mhdp);
+	else
+		cdns_hdmi_enable_gcp(mhdp);
+
+	ret = hdmi_avi_info_set(mhdp, mode);
+	if (ret < 0) {
+		DRM_ERROR("%s ret = %d\n", __func__, ret);
+		return;
+	}
+
+	/* vendor info frame is enabled only for HDMI1.4 4K mode */
+	hdmi_vendor_info_set(mhdp, mode);
+
+	hdmi_drm_info_set(mhdp);
+
+	ret = cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
+	if (ret < 0) {
+		DRM_ERROR("CDN_API_HDMITX_SetVic_blocking ret = %d\n", ret);
+		return;
+	}
+}
+
+static enum drm_connector_status
+cdns_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct cdns_mhdp_device *mhdp =
+				container_of(connector, struct cdns_mhdp_device, connector.base);
+	u8 hpd = 0xf;
+
+	hpd = cdns_mhdp_read_hpd(mhdp);
+	if (hpd == 1)
+		return connector_status_connected;
+	else if (hpd == 0)
+		return connector_status_disconnected;
+	else {
+		DRM_INFO("Unknow cable status, hdp=%u\n", hpd);
+		return connector_status_unknown;
+	}
+}
+
+static int cdns_hdmi_connector_get_modes(struct drm_connector *connector)
+{
+	struct cdns_mhdp_device *mhdp =
+				container_of(connector, struct cdns_mhdp_device, connector.base);
+	int num_modes = 0;
+	struct edid *edid;
+
+	edid = drm_do_get_edid(&mhdp->connector.base,
+				   cdns_hdmi_get_edid_block, mhdp);
+	if (edid) {
+		dev_info(mhdp->dev, "%x,%x,%x,%x,%x,%x,%x,%x\n",
+			 edid->header[0], edid->header[1],
+			 edid->header[2], edid->header[3],
+			 edid->header[4], edid->header[5],
+			 edid->header[6], edid->header[7]);
+		drm_connector_update_edid_property(connector, edid);
+		num_modes = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	}
+
+	if (num_modes == 0)
+		DRM_ERROR("Invalid edid\n");
+	return num_modes;
+}
+
+static bool blob_equal(const struct drm_property_blob *a,
+		       const struct drm_property_blob *b)
+{
+	if (a && b)
+		return a->length == b->length &&
+			!memcmp(a->data, b->data, a->length);
+
+	return !a == !b;
+}
+
+static int cdns_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *new_con_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_connector_state *old_con_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_crtc *crtc = new_con_state->crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	if (!blob_equal(new_con_state->hdr_output_metadata,
+			old_con_state->hdr_output_metadata) ||
+	    new_con_state->colorspace != old_con_state->colorspace) {
+		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(new_crtc_state))
+			return PTR_ERR(new_crtc_state);
+
+		new_crtc_state->mode_changed =
+			!new_con_state->hdr_output_metadata ||
+			!old_con_state->hdr_output_metadata ||
+			new_con_state->colorspace != old_con_state->colorspace;
+	}
+
+	return 0;
+}
+
+static const struct drm_connector_funcs cdns_hdmi_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = cdns_hdmi_connector_detect,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs cdns_hdmi_connector_helper_funcs = {
+	.get_modes = cdns_hdmi_connector_get_modes,
+	.atomic_check = cdns_hdmi_connector_atomic_check,
+};
+
+static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct drm_mode_config *config = &bridge->dev->mode_config;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector = &mhdp->connector.base;
+
+	connector->interlace_allowed = 1;
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(connector, &cdns_hdmi_connector_helper_funcs);
+
+	drm_connector_init(bridge->dev, connector, &cdns_hdmi_connector_funcs,
+			   DRM_MODE_CONNECTOR_HDMIA);
+
+	drm_object_attach_property(&connector->base,
+				   config->hdr_output_metadata_property, 0);
+
+	if (!drm_mode_create_hdmi_colorspace_property(connector))
+		drm_object_attach_property(&connector->base,
+					connector->colorspace_property, 0);
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+static enum drm_mode_status
+cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	enum drm_mode_status mode_status = MODE_OK;
+	int ret;
+
+	/* We don't support double-clocked and Interlaced modes */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
+			mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_BAD;
+
+	/* MAX support pixel clock rate 594MHz */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	/* 4096x2160 is not supported */
+	if (mode->hdisplay > 3840 || mode->vdisplay > 2160)
+		return MODE_BAD_HVALUE;
+
+	/* Check modes supported by PHY */
+	mhdp->hdmi.mode_valid = mode;
+	ret = cdns_mhdp_plat_call(mhdp, phy_video_valid);
+	if (ret == false)
+		return MODE_CLOCK_RANGE;
+
+	return mode_status;
+}
+
+static void cdns_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+				    const struct drm_display_mode *orig_mode,
+				    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct video_info *video = &mhdp->video_info;
+
+	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
+	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
+
+	DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay, mode->clock);
+	memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
+
+	mutex_lock(&mhdp->lock);
+	cdns_hdmi_mode_set(mhdp);
+	mutex_unlock(&mhdp->lock);
+}
+
+bool cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct video_info *video = &mhdp->video_info;
+
+	video->color_depth = 8;
+	video->color_fmt = PXL_RGB;
+
+	return true;
+}
+
+static const struct drm_bridge_funcs cdns_hdmi_bridge_funcs = {
+	.attach = cdns_hdmi_bridge_attach,
+	.mode_set = cdns_hdmi_bridge_mode_set,
+	.mode_valid = cdns_hdmi_bridge_mode_valid,
+	.mode_fixup = cdns_hdmi_bridge_mode_fixup,
+};
+
+static void hotplug_work_func(struct work_struct *work)
+{
+	struct cdns_mhdp_device *mhdp = container_of(work,
+					   struct cdns_mhdp_device, hotplug_work.work);
+	struct drm_connector *connector = &mhdp->connector.base;
+
+	drm_helper_hpd_irq_event(connector->dev);
+
+	if (connector->status == connector_status_connected) {
+		DRM_INFO("HDMI Cable Plug In\n");
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	} else if (connector->status == connector_status_disconnected) {
+		/* Cable Disconnedted  */
+		DRM_INFO("HDMI Cable Plug Out\n");
+		enable_irq(mhdp->irq[IRQ_IN]);
+	}
+}
+
+static irqreturn_t cdns_hdmi_irq_thread(int irq, void *data)
+{
+	struct cdns_mhdp_device *mhdp = data;
+
+	disable_irq_nosync(irq);
+
+	mod_delayed_work(system_wq, &mhdp->hotplug_work,
+			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+
+	return IRQ_HANDLED;
+}
+
+static int __cdns_hdmi_probe(struct platform_device *pdev,
+		  struct cdns_mhdp_device *mhdp)
+{
+	struct device *dev = &pdev->dev;
+	struct platform_device_info pdevinfo;
+	struct resource *iores = NULL;
+	int ret;
+
+	mutex_init(&mhdp->lock);
+
+	INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
+
+	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mhdp->regs_base = devm_ioremap(dev, iores->start, resource_size(iores));
+	if (IS_ERR(mhdp->regs_base)) {
+		dev_err(dev, "No regs_base memory\n");
+		return -ENOMEM;
+	}
+
+	mhdp->irq[IRQ_IN] = platform_get_irq_byname(pdev, "plug_in");
+	if (mhdp->irq[IRQ_IN] < 0) {
+		dev_info(dev, "No plug_in irq number\n");
+		return -EPROBE_DEFER;
+	}
+
+	mhdp->irq[IRQ_OUT] = platform_get_irq_byname(pdev, "plug_out");
+	if (mhdp->irq[IRQ_OUT] < 0) {
+		dev_info(dev, "No plug_out irq number\n");
+		return -EPROBE_DEFER;
+	}
+
+	cdns_mhdp_plat_call(mhdp, power_on);
+
+	/* Initialize FW */
+	cdns_mhdp_plat_call(mhdp, firmware_init);
+
+	/* HDMI FW alive check */
+	ret = cdns_mhdp_check_alive(mhdp);
+	if (ret == false) {
+		dev_err(dev, "NO HDMI FW running\n");
+		return -ENXIO;
+	}
+
+	/* Enable Hotplug Detect thread */
+	irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
+					NULL, cdns_hdmi_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret < 0) {
+		dev_err(dev, "can't claim irq %d\n",
+						mhdp->irq[IRQ_IN]);
+		return -EINVAL;
+	}
+
+	irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
+					NULL, cdns_hdmi_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret < 0) {
+		dev_err(dev, "can't claim irq %d\n",
+						mhdp->irq[IRQ_OUT]);
+		return -EINVAL;
+	}
+
+	if (cdns_mhdp_read_hpd(mhdp))
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	else
+		enable_irq(mhdp->irq[IRQ_IN]);
+
+	mhdp->bridge.base.driver_private = mhdp;
+	mhdp->bridge.base.funcs = &cdns_hdmi_bridge_funcs;
+#ifdef CONFIG_OF
+	mhdp->bridge.base.of_node = dev->of_node;
+#endif
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.parent = dev;
+	pdevinfo.id = PLATFORM_DEVID_AUTO;
+
+	dev_set_drvdata(dev, mhdp);
+
+	/* register audio driver */
+	cdns_mhdp_register_audio_driver(dev);
+
+	return 0;
+}
+
+static void __cdns_hdmi_remove(struct cdns_mhdp_device *mhdp)
+{
+	cdns_mhdp_unregister_audio_driver(mhdp->dev);
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe/remove API, used from platforms based on the DRM bridge API.
+ */
+int cdns_hdmi_probe(struct platform_device *pdev,
+		struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	ret  = __cdns_hdmi_probe(pdev, mhdp);
+	if (ret < 0)
+		return ret;
+
+	drm_bridge_add(&mhdp->bridge.base);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_hdmi_probe);
+
+void cdns_hdmi_remove(struct platform_device *pdev)
+{
+	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&mhdp->bridge.base);
+
+	__cdns_hdmi_remove(mhdp);
+}
+EXPORT_SYMBOL_GPL(cdns_hdmi_remove);
+
+/* -----------------------------------------------------------------------------
+ * Bind/unbind API, used from platforms based on the component framework.
+ */
+int cdns_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
+			struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	ret = __cdns_hdmi_probe(pdev, mhdp);
+	if (ret)
+		return ret;
+
+	ret = drm_bridge_attach(encoder, &mhdp->bridge.base, NULL, 0);
+	if (ret) {
+		cdns_hdmi_remove(pdev);
+		DRM_ERROR("Failed to initialize bridge with drm\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_hdmi_bind);
+
+void cdns_hdmi_unbind(struct device *dev)
+{
+	struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
+
+	__cdns_hdmi_remove(mhdp);
+}
+EXPORT_SYMBOL_GPL(cdns_hdmi_unbind);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDMI transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cdn-hdmi");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
index b122bf5f0bdf..fea648070611 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
@@ -23,4 +23,18 @@ int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
 /* Audio */
 int cdns_mhdp_register_audio_driver(struct device *dev);
 void cdns_mhdp_unregister_audio_driver(struct device *dev);
+
+/* HDMI */
+int cdns_hdmi_scdc_write(struct cdns_mhdp_device *mhdp, u8 addr, u8 value);
+void cdns_mhdp_infoframe_set(struct cdns_mhdp_device *mhdp,
+					u8 entry_id, u8 packet_len, u8 *packet, u8 packet_type);
+int cdns_hdmi_ctrl_init(struct cdns_mhdp_device *mhdp,
+					int protocol, u32 char_rate);
+int cdns_hdmi_enable_gcp(struct cdns_mhdp_device *mhdp);
+int cdns_hdmi_disable_gcp(struct cdns_mhdp_device *mhdp);
+int cdns_hdmi_mode_config(struct cdns_mhdp_device *mhdp,
+			struct drm_display_mode *mode, struct video_info *video_info);
+int cdns_hdmi_get_edid_block(void *data, u8 *edid,
+			  u32 block, size_t length);
+
 #endif
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c
new file mode 100644
index 000000000000..b8826a9ed524
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2020 NXP Semiconductor, Inc.
+ *
+ */
+
+#include <drm/bridge/cdns-mhdp.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
+#include <linux/io.h>
+#include <linux/regmap.h>
+
+#include "cdns-mhdp-common.h"
+
+void cdns_mhdp_infoframe_set(struct cdns_mhdp_device *mhdp,
+					u8 entry_id, u8 packet_len, u8 *packet, u8 packet_type)
+{
+	u32 *packet32, len32;
+	u32 val, i;
+
+	/* invalidate entry */
+	val = F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_PIF_PKT_ALLOC_REG);
+	cdns_mhdp_bus_write(F_PKT_ALLOC_WR_EN(1), mhdp, SOURCE_PIF_PKT_ALLOC_WR_EN);
+
+	/* flush fifo 1 */
+	cdns_mhdp_bus_write(F_FIFO1_FLUSH(1), mhdp, SOURCE_PIF_FIFO1_FLUSH);
+
+	/* write packet into memory */
+	packet32 = (u32 *)packet;
+	len32 = packet_len / 4;
+	for (i = 0; i < len32; i++)
+		cdns_mhdp_bus_write(F_DATA_WR(packet32[i]), mhdp, SOURCE_PIF_DATA_WR);
+
+	/* write entry id */
+	cdns_mhdp_bus_write(F_WR_ADDR(entry_id), mhdp, SOURCE_PIF_WR_ADDR);
+
+	/* write request */
+	cdns_mhdp_bus_write(F_HOST_WR(1), mhdp, SOURCE_PIF_WR_REQ);
+
+	/* update entry */
+	val =  F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
+			F_PACKET_TYPE(packet_type) | F_PKT_ALLOC_ADDRESS(entry_id);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_PIF_PKT_ALLOC_REG);
+
+	cdns_mhdp_bus_write(F_PKT_ALLOC_WR_EN(1), mhdp, SOURCE_PIF_PKT_ALLOC_WR_EN);
+}
+
+int cdns_hdmi_get_edid_block(void *data, u8 *edid,
+			  u32 block, size_t length)
+{
+	struct cdns_mhdp_device *mhdp = data;
+	u8 msg[2], reg[5], i;
+	int ret;
+
+	for (i = 0; i < 4; i++) {
+		msg[0] = block / 2;
+		msg[1] = block % 2;
+
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_EDID,
+					  sizeof(msg), msg);
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_HDMI_TX,
+						      HDMI_TX_EDID, sizeof(reg) + length);
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, edid, length);
+		if (ret)
+			continue;
+
+		if ((reg[3] << 8 | reg[4]) == length)
+			break;
+	}
+
+	if (ret)
+		DRM_ERROR("get block[%d] edid failed: %d\n", block, ret);
+	return ret;
+}
+
+int cdns_hdmi_scdc_read(struct cdns_mhdp_device *mhdp, u8 addr, u8 *data)
+{
+	u8 msg[4], reg[6];
+	int ret;
+
+	msg[0] = 0x54;
+	msg[1] = addr;
+	msg[2] = 0;
+	msg[3] = 1;
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_READ,
+				  sizeof(msg), msg);
+	if (ret)
+		goto err_scdc_read;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_HDMI_TX,
+					      HDMI_TX_READ, sizeof(reg));
+	if (ret)
+		goto err_scdc_read;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto err_scdc_read;
+
+	*data = reg[5];
+
+err_scdc_read:
+	if (ret)
+		DRM_ERROR("scdc read failed: %d\n", ret);
+	return ret;
+}
+
+int cdns_hdmi_scdc_write(struct cdns_mhdp_device *mhdp, u8 addr, u8 value)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	msg[0] = 0x54;
+	msg[1] = addr;
+	msg[2] = 0;
+	msg[3] = 1;
+	msg[4] = value;
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
+				  sizeof(msg), msg);
+	if (ret)
+		goto err_scdc_write;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_HDMI_TX,
+					      HDMI_TX_WRITE, sizeof(reg));
+	if (ret)
+		goto err_scdc_write;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto err_scdc_write;
+
+	if (reg[0] != 0)
+		ret = -EINVAL;
+
+err_scdc_write:
+	if (ret)
+		DRM_ERROR("scdc write failed: %d\n", ret);
+	return ret;
+}
+
+int cdns_hdmi_ctrl_init(struct cdns_mhdp_device *mhdp,
+				 int protocol, u32 char_rate)
+{
+	u32 reg0;
+	u32 reg1;
+	u32 val;
+	int ret;
+
+	/* Set PHY to HDMI data */
+	ret = cdns_mhdp_reg_write(mhdp, PHY_DATA_SEL, F_SOURCE_PHY_MHDP_SEL(1));
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_HPD,
+					F_HPD_VALID_WIDTH(4) | F_HPD_GLITCH_WIDTH(0));
+	if (ret < 0)
+		return ret;
+
+	/* open CARS */
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_PHY_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, 0xFF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_PKT_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_AIF_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CIPHER_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CRYPTO_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CEC_CAR, 3);
+	if (ret < 0)
+		return ret;
+
+	reg0 = reg1 = 0x7c1f;
+	if (protocol == MODE_HDMI_2_0 && char_rate >= 340000) {
+		reg0 = 0;
+		reg1 = 0xFFFFF;
+	}
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CLOCK_REG_0, reg0);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CLOCK_REG_1, reg1);
+	if (ret < 0)
+		return ret;
+
+	/* set hdmi mode and preemble mode data enable */
+	val = F_HDMI_MODE(protocol) | F_HDMI2_PREAMBLE_EN(1) |  F_DATA_EN(1) |
+			F_HDMI2_CTRL_IL_MODE(1) | F_BCH_EN(1) | F_PIC_3D(0XF);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+
+	return ret;
+}
+
+int cdns_hdmi_mode_config(struct cdns_mhdp_device *mhdp,
+					      struct drm_display_mode *mode,
+						  struct video_info *video_info)
+{
+	int ret;
+	u32 val;
+	u32 vsync_lines = mode->vsync_end - mode->vsync_start;
+	u32 eof_lines = mode->vsync_start - mode->vdisplay;
+	u32 sof_lines = mode->vtotal - mode->vsync_end;
+	u32 hblank = mode->htotal - mode->hdisplay;
+	u32 hactive = mode->hdisplay;
+	u32 vblank = mode->vtotal - mode->vdisplay;
+	u32 vactive = mode->vdisplay;
+	u32 hfront = mode->hsync_start - mode->hdisplay;
+	u32 hback = mode->htotal - mode->hsync_end;
+	u32 vfront = eof_lines;
+	u32 hsync = hblank - hfront - hback;
+	u32 vsync = vsync_lines;
+	u32 vback = sof_lines;
+	u32 v_h_polarity = ((mode->flags & DRM_MODE_FLAG_NHSYNC) ? 0 : 1) +
+						((mode->flags & DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
+
+	ret = cdns_mhdp_reg_write(mhdp, SCHEDULER_H_SIZE, (hactive << 16) + hblank);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, SCHEDULER_V_SIZE, (vactive << 16) + vblank);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_SYNC_WIDTH, (vsync << 16) + hsync);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_BACK_WIDTH, (vback << 16) + hback);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HSYNC2VSYNC_POL_CTRL, v_h_polarity);
+	if (ret < 0)
+		return ret;
+
+	/* Reset Data Enable */
+	val = cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER);
+	val &= ~F_DATA_EN(1);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+	if (ret < 0)
+		return ret;
+
+	/* Set bpc */
+	val &= ~F_VIF_DATA_WIDTH(3);
+	switch (video_info->color_depth) {
+	case 10:
+		val |= F_VIF_DATA_WIDTH(1);
+		break;
+	case 12:
+		val |= F_VIF_DATA_WIDTH(2);
+		break;
+	case 16:
+		val |= F_VIF_DATA_WIDTH(3);
+		break;
+	case 8:
+	default:
+		val |= F_VIF_DATA_WIDTH(0);
+		break;
+	}
+
+	/* select color encoding */
+	val &= ~F_HDMI_ENCODING(3);
+	switch (video_info->color_fmt) {
+	case YCBCR_4_4_4:
+		val |= F_HDMI_ENCODING(2);
+		break;
+	case YCBCR_4_2_2:
+		val |= F_HDMI_ENCODING(1);
+		break;
+	case YCBCR_4_2_0:
+		val |= F_HDMI_ENCODING(3);
+		break;
+	case PXL_RGB:
+	default:
+		val |= F_HDMI_ENCODING(0);
+		break;
+	}
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+	if (ret < 0)
+		return ret;
+
+	/* set data enable */
+	val |= F_DATA_EN(1);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+
+	return ret;
+}
+
+int cdns_hdmi_disable_gcp(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	val = cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER);
+	val &= ~F_GCP_EN(1);
+
+	return cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+}
+
+int cdns_hdmi_enable_gcp(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	val = cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER);
+	val |= F_GCP_EN(1);
+
+	return cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+}
diff --git a/include/drm/bridge/cdns-mhdp.h b/include/drm/bridge/cdns-mhdp.h
index 6ffb97e17fae..7902ecb115e2 100644
--- a/include/drm/bridge/cdns-mhdp.h
+++ b/include/drm/bridge/cdns-mhdp.h
@@ -84,6 +84,7 @@
 /* bellow registers need access by mailbox */
 
 /* source phy comp */
+#define PHY_DATA_SEL			0x0818
 #define LANES_CONFIG			0x0814
 
 /* source car addr */
@@ -97,6 +98,17 @@
 #define SOURCE_CIPHER_CAR		0x0920
 #define SOURCE_CRYPTO_CAR		0x0924
 
+/* mhdp tx_top_comp */
+#define SCHEDULER_H_SIZE		0x1000
+#define SCHEDULER_V_SIZE		0x1004
+#define HDTX_SIGNAL_FRONT_WIDTH	0x100c
+#define HDTX_SIGNAL_SYNC_WIDTH	0x1010
+#define HDTX_SIGNAL_BACK_WIDTH	0x1014
+#define HDTX_CONTROLLER			0x1018
+#define HDTX_HPD				0x1020
+#define HDTX_CLOCK_REG_0		0x1024
+#define HDTX_CLOCK_REG_1		0x1028
+
 /* clock meters addr */
 #define CM_CTRL				0x0a00
 #define CM_I2S_CTRL			0x0a04
@@ -333,6 +345,7 @@
 #define GENERAL_READ_REGISTER           0x07
 #define GENERAL_GET_HPD_STATE           0x11
 
+/* DPTX opcode */
 #define DPTX_SET_POWER_MNG			0x00
 #define DPTX_SET_HOST_CAPABILITIES		0x01
 #define DPTX_GET_EDID				0x02
@@ -352,6 +365,17 @@
 #define DPTX_FORCE_LANES			0x10
 #define DPTX_HPD_STATE				0x11
 
+/* HDMI TX opcode */
+#define HDMI_TX_READ				0x00
+#define HDMI_TX_WRITE				0x01
+#define HDMI_TX_UPDATE_READ			0x02
+#define HDMI_TX_EDID				0x03
+#define HDMI_TX_EVENTS				0x04
+#define HDMI_TX_HPD_STATUS			0x05
+#define HDMI_TX_DEBUG_ECHO			0xAA
+#define HDMI_TX_TEST				0xBB
+#define HDMI_TX_EDID_INTERNAL		0xF0
+
 #define FW_STANDBY				0
 #define FW_ACTIVE				1
 
@@ -402,6 +426,34 @@
 #define TU_SIZE					30
 #define CDNS_DP_MAX_LINK_RATE	540000
 
+#define F_HDMI_ENCODING(x) (((x) & ((1 << 2) - 1)) << 16)
+#define F_VIF_DATA_WIDTH(x) (((x) & ((1 << 2) - 1)) << 2)
+#define F_HDMI_MODE(x) (((x) & ((1 << 2) - 1)) << 0)
+#define F_GCP_EN(x) (((x) & ((1 << 1) - 1)) << 12)
+#define F_DATA_EN(x) (((x) & ((1 << 1) - 1)) << 15)
+#define F_HDMI2_PREAMBLE_EN(x) (((x) & ((1 << 1) - 1)) << 18)
+#define F_PIC_3D(x) (((x) & ((1 << 4) - 1)) << 7)
+#define F_BCH_EN(x) (((x) & ((1 << 1) - 1)) << 11)
+#define F_SOURCE_PHY_MHDP_SEL(x) (((x) & ((1 << 2) - 1)) << 3)
+#define F_HPD_VALID_WIDTH(x) (((x) & ((1 << 12) - 1)) << 0)
+#define F_HPD_GLITCH_WIDTH(x) (((x) & ((1 << 8) - 1)) << 12)
+#define F_HDMI2_CTRL_IL_MODE(x) (((x) & ((1 << 1) - 1)) << 19)
+#define F_SOURCE_PHY_LANE0_SWAP(x) (((x) & ((1 << 2) - 1)) << 0)
+#define F_SOURCE_PHY_LANE1_SWAP(x) (((x) & ((1 << 2) - 1)) << 2)
+#define F_SOURCE_PHY_LANE2_SWAP(x) (((x) & ((1 << 2) - 1)) << 4)
+#define F_SOURCE_PHY_LANE3_SWAP(x) (((x) & ((1 << 2) - 1)) << 6)
+#define F_SOURCE_PHY_COMB_BYPASS(x) (((x) & ((1 << 1) - 1)) << 21)
+#define F_SOURCE_PHY_20_10(x) (((x) & ((1 << 1) - 1)) << 22)
+#define F_PKT_ALLOC_ADDRESS(x) (((x) & ((1 << 4) - 1)) << 0)
+#define F_ACTIVE_IDLE_TYPE(x) (((x) & ((1 << 1) - 1)) << 17)
+#define F_FIFO1_FLUSH(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_PKT_ALLOC_WR_EN(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_DATA_WR(x) (x)
+#define F_WR_ADDR(x) (((x) & ((1 << 4) - 1)) << 0)
+#define F_HOST_WR(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_TYPE_VALID(x) (((x) & ((1 << 1) - 1)) << 16)
+#define F_PACKET_TYPE(x) (((x) & ((1 << 8) - 1)) << 8)
+
 /* audio */
 #define AUDIO_PACK_EN				BIT(8)
 #define SAMPLING_FREQ(x)			(((x) & 0xf) << 16)
@@ -481,6 +533,12 @@ enum audio_format {
 	AFMT_UNUSED,
 };
 
+enum {
+	MODE_DVI,
+	MODE_HDMI_1_4,
+	MODE_HDMI_2_0,
+};
+
 struct audio_info {
 	enum audio_format format;
 	int sample_rate;
@@ -567,6 +625,11 @@ struct cdns_mhdp_device {
 			struct drm_dp_aux aux;
 			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 		} dp;
+		struct _hdmi_data {
+			u32 char_rate;
+			u32 hdmi_type;
+			const struct drm_display_mode *mode_valid;
+		} hdmi;
 	};
 	const struct cdns_plat_data *plat_data;
 
@@ -603,4 +666,10 @@ u32 cdns_phy_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
 int cdns_dp_bind(struct platform_device *pdev, struct drm_encoder *encoder,
 		struct cdns_mhdp_device *mhdp);
 void cdns_dp_unbind(struct device *dev);
+
+/* HDMI */
+int cdns_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
+			struct cdns_mhdp_device *mhdp);
+void cdns_hdmi_unbind(struct device *dev);
+
 #endif /* CDNS_MHDP_H_ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
