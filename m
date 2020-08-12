Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B124348D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2146E47B;
	Thu, 13 Aug 2020 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F6E6E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:44:06 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id F163AC5ED8;
 Wed, 12 Aug 2020 16:34:44 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P18983T140547726436096S1597221280087704_; 
 Wed, 12 Aug 2020 16:34:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <aabb62171f4c56eb93f47e37d26bd229>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: a.hajda@samsung.com
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Algea Cao <algea.cao@rock-chips.com>
To: a.hajda@samsung.com, kuankuan.y@gmail.com, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 airlied@linux.ie, heiko@sntech.de, jernej.skrabec@siol.net,
 algea.cao@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 2/6] drm: bridge: dw-hdmi: Implement connector
 atomic_begin/atomic_flush
Date: Wed, 12 Aug 2020 16:34:33 +0800
Message-Id: <20200812083433.934-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200812083120.743-1-algea.cao@rock-chips.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce dw_hdmi_connector_atomic_begin() and
dw_hdmi_connector_atomic_flush() to implement connector
atomic_begin/atomic_flush. When enc_out_bus_format or
enc_in_bus_format changed, dw_hdmi_setup is called.

To avoid screen flash when updating bus format, it's need
to send AVMUTE flag to make screen black, and clear flag
after bus format updated.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 65 +++++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6148a022569a..a1a81fc768c2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -108,6 +108,8 @@ struct hdmi_vmode {
 };
 
 struct hdmi_data_info {
+	unsigned int prev_enc_in_bus_format;
+	unsigned int prev_enc_out_bus_format;
 	unsigned int enc_in_bus_format;
 	unsigned int enc_out_bus_format;
 	unsigned int enc_in_encoding;
@@ -116,6 +118,7 @@ struct hdmi_data_info {
 	unsigned int hdcp_enable;
 	struct hdmi_vmode video_mode;
 	bool rgb_limited_range;
+	bool update;
 };
 
 struct dw_hdmi_i2c {
@@ -2401,6 +2404,60 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
+static void
+dw_hdmi_connector_atomic_begin(struct drm_connector *connector,
+			       struct drm_connector_state *conn_state)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
+					    connector);
+	unsigned int enc_in_bus_fmt = hdmi->hdmi_data.enc_in_bus_format;
+	unsigned int enc_out_bus_fmt = hdmi->hdmi_data.enc_out_bus_format;
+	unsigned int prev_enc_in_bus_fmt =
+		hdmi->hdmi_data.prev_enc_in_bus_format;
+	unsigned int prev_enc_out_bus_fmt =
+		hdmi->hdmi_data.prev_enc_out_bus_format;
+
+	if (!conn_state->crtc)
+		return;
+
+	if (!hdmi->hdmi_data.video_mode.mpixelclock)
+		return;
+
+	if (enc_in_bus_fmt != prev_enc_in_bus_fmt ||
+	    enc_out_bus_fmt != prev_enc_out_bus_fmt) {
+		hdmi->hdmi_data.update = true;
+		hdmi_writeb(hdmi, HDMI_FC_GCP_SET_AVMUTE, HDMI_FC_GCP);
+		/* Add delay to make av mute work on sink*/
+		msleep(50);
+	} else {
+		hdmi->hdmi_data.update = false;
+	}
+}
+
+static void
+dw_hdmi_connector_atomic_flush(struct drm_connector *connector,
+			       struct drm_connector_state *conn_state)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
+					     connector);
+
+	if (!conn_state->crtc)
+		return;
+
+	DRM_DEBUG("%s\n", __func__);
+
+	if (hdmi->hdmi_data.update) {
+		dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
+		/*
+		 * Before clear AVMUTE, delay is needed to
+		 * prevent display flash.
+		 */
+		msleep(50);
+		hdmi_writeb(hdmi, HDMI_FC_GCP_CLEAR_AVMUTE, HDMI_FC_GCP);
+		hdmi->hdmi_data.update = false;
+	}
+}
+
 static bool hdr_metadata_equal(const struct drm_connector_state *old_state,
 			       const struct drm_connector_state *new_state)
 {
@@ -2465,6 +2522,8 @@ static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs = {
 	.get_modes = dw_hdmi_connector_get_modes,
 	.atomic_check = dw_hdmi_connector_atomic_check,
+	.atomic_begin = dw_hdmi_connector_atomic_begin,
+	.atomic_flush = dw_hdmi_connector_atomic_flush,
 };
 
 static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
@@ -2778,6 +2837,12 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
+	hdmi->hdmi_data.prev_enc_out_bus_format =
+			hdmi->hdmi_data.enc_out_bus_format;
+
+	hdmi->hdmi_data.prev_enc_in_bus_format =
+			hdmi->hdmi_data.enc_in_bus_format;
+
 	hdmi->hdmi_data.enc_out_bus_format =
 			bridge_state->output_bus_cfg.format;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 1999db05bc3b..05182418efbb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -842,6 +842,10 @@ enum {
 	HDMI_FC_AVICONF3_QUANT_RANGE_LIMITED = 0x00,
 	HDMI_FC_AVICONF3_QUANT_RANGE_FULL = 0x04,
 
+/* HDMI_FC_GCP */
+	HDMI_FC_GCP_SET_AVMUTE = 0x2,
+	HDMI_FC_GCP_CLEAR_AVMUTE = 0x1,
+
 /* FC_DBGFORCE field values */
 	HDMI_FC_DBGFORCE_FORCEAUDIO = 0x10,
 	HDMI_FC_DBGFORCE_FORCEVIDEO = 0x1,
-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
