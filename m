Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA63AF136B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76C10E6F6;
	Wed,  2 Jul 2025 11:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="fuKNpMPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47E4010E6F6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=i0
 f2S/Q0/+orl3Pvf55FTU5OEoFqQoshECzHEuVQu1w=; b=fuKNpMPGl1GrC6zT/j
 ryv7stS5bo+lHDMIhiNSCabGAjg9heesCXJXGBtIwftMX4Ux5a7f8BYpa58cVfFe
 r26iak0/Mt43cbhbTkNbaKbtv5qZnnnUk1AsX0nSayIBOmlLoi5KgYfs1bI3MFNa
 tYZVDpM3/VTrqXYCIJpSyrYBs=
Received: from ProDesk.. (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgCHTGOvFGVoldg0Aw--.49301S3;
 Wed, 02 Jul 2025 19:15:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep the
 same paramter order with get_modes
Date: Wed,  2 Jul 2025 19:14:43 +0800
Message-ID: <20250702111453.102539-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702111453.102539-1-andyshrk@163.com>
References: <20250702111453.102539-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCHTGOvFGVoldg0Aw--.49301S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfJF4xtw1UtryrAw17ZryDAwb_yoW8Cr4xWo
 WxAa9Y9a1Fq34kXrWktF12gF4Yv3Zxtan3Wrn5KaykWayUK347tF1IgF1UtFy7ZF4agr4D
 Zw1DG348ArnrAan7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RDMa1UUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA1+XmhlDvqMoAABsp
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

Make the dp/hdmi_audio_* callback maintain the same parameter order as
get_modes and edid_read: first the bridge, then the connector.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Signed-off-by: Andy Yan <andyshrk@163.com>
---

Changes in v2:
- First included in this series.

 drivers/gpu/drm/bridge/adv7511/adv7511.h      | 16 ++++-----
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 12 +++----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |  4 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c       | 12 +++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 12 +++----
 .../gpu/drm/display/drm_bridge_connector.c    | 18 +++++-----
 drivers/gpu/drm/msm/dp/dp_audio.c             |  8 ++---
 drivers/gpu/drm/msm/dp/dp_audio.h             |  8 ++---
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  8 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c         |  8 ++---
 include/drm/drm_bridge.h                      | 36 +++++++++----------
 11 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 71bb64e5f481..85ebead9809c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -399,8 +399,8 @@ static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 }
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-int adv7511_cec_init(struct drm_connector *connector,
-		     struct drm_bridge *bridge);
+int adv7511_cec_init(struct drm_bridge *bridge,
+		     struct drm_connector *connector);
 int adv7511_cec_enable(struct drm_bridge *bridge, bool enable);
 int adv7511_cec_log_addr(struct drm_bridge *bridge, u8 addr);
 int adv7511_cec_transmit(struct drm_bridge *bridge, u8 attempts,
@@ -424,12 +424,12 @@ int adv7533_attach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
-int adv7511_hdmi_audio_startup(struct drm_connector *connector,
-			       struct drm_bridge *bridge);
-void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
-				 struct drm_bridge *bridge);
-int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
-			       struct drm_bridge *bridge,
+int adv7511_hdmi_audio_startup(struct drm_bridge *bridge,
+			       struct drm_connector *connector);
+void adv7511_hdmi_audio_shutdown(struct drm_bridge *bridge,
+				 struct drm_connector *connector);
+int adv7511_hdmi_audio_prepare(struct drm_bridge *bridge,
+			       struct drm_connector *connector,
 			       struct hdmi_codec_daifmt *fmt,
 			       struct hdmi_codec_params *hparms);
 #else /*CONFIG_DRM_I2C_ADV7511_AUDIO */
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 915c3b967216..766b1c96bc88 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -55,8 +55,8 @@ static int adv7511_update_cts_n(struct adv7511 *adv7511)
 	return 0;
 }
 
-int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
-			       struct drm_bridge *bridge,
+int adv7511_hdmi_audio_prepare(struct drm_bridge *bridge,
+			       struct drm_connector *connector,
 			       struct hdmi_codec_daifmt *fmt,
 			       struct hdmi_codec_params *hparms)
 {
@@ -168,8 +168,8 @@ int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
 	return 0;
 }
 
-int adv7511_hdmi_audio_startup(struct drm_connector *connector,
-			       struct drm_bridge *bridge)
+int adv7511_hdmi_audio_startup(struct drm_bridge *bridge,
+			       struct drm_connector *connector)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
@@ -206,8 +206,8 @@ int adv7511_hdmi_audio_startup(struct drm_connector *connector,
 	return 0;
 }
 
-void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
-				 struct drm_bridge *bridge)
+void adv7511_hdmi_audio_shutdown(struct drm_bridge *bridge,
+				 struct drm_connector *connector)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 822265426f58..8ecbc25dc647 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -346,8 +346,8 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 	return 0;
 }
 
-int adv7511_cec_init(struct drm_connector *connector,
-		     struct drm_bridge *bridge)
+int adv7511_cec_init(struct drm_bridge *bridge,
+		     struct drm_connector *connector)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	struct device *dev = &adv7511->i2c_main->dev;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index d6ee79c1e427..ff85ac8130b4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -936,8 +936,8 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int lt9611_hdmi_audio_startup(struct drm_connector *connector,
-				     struct drm_bridge *bridge)
+static int lt9611_hdmi_audio_startup(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
@@ -952,8 +952,8 @@ static int lt9611_hdmi_audio_startup(struct drm_connector *connector,
 	return 0;
 }
 
-static int lt9611_hdmi_audio_prepare(struct drm_connector *connector,
-				     struct drm_bridge *bridge,
+static int lt9611_hdmi_audio_prepare(struct drm_bridge *bridge,
+				     struct drm_connector *connector,
 				     struct hdmi_codec_daifmt *fmt,
 				     struct hdmi_codec_params *hparms)
 {
@@ -974,8 +974,8 @@ static int lt9611_hdmi_audio_prepare(struct drm_connector *connector,
 								       &hparms->cea);
 }
 
-static void lt9611_hdmi_audio_shutdown(struct drm_connector *connector,
-				       struct drm_bridge *bridge)
+static void lt9611_hdmi_audio_shutdown(struct drm_bridge *bridge,
+				       struct drm_connector *connector)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 7ade80f02a94..f9438e39b94a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -440,8 +440,8 @@ static void dw_hdmi_qp_set_sample_rate(struct dw_hdmi_qp *hdmi, unsigned long lo
 	dw_hdmi_qp_set_cts_n(hdmi, cts, n);
 }
 
-static int dw_hdmi_qp_audio_enable(struct drm_connector *connector,
-				   struct drm_bridge *bridge)
+static int dw_hdmi_qp_audio_enable(struct drm_bridge *bridge,
+				   struct drm_connector *connector)
 {
 	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
 
@@ -451,8 +451,8 @@ static int dw_hdmi_qp_audio_enable(struct drm_connector *connector,
 	return 0;
 }
 
-static int dw_hdmi_qp_audio_prepare(struct drm_connector *connector,
-				    struct drm_bridge *bridge,
+static int dw_hdmi_qp_audio_prepare(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    struct hdmi_codec_daifmt *fmt,
 				    struct hdmi_codec_params *hparms)
 {
@@ -497,8 +497,8 @@ static void dw_hdmi_qp_audio_disable_regs(struct dw_hdmi_qp *hdmi)
 		       AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
 }
 
-static void dw_hdmi_qp_audio_disable(struct drm_connector *connector,
-				     struct drm_bridge *bridge)
+static void dw_hdmi_qp_audio_disable(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
 {
 	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 6cdb432dbc30..717d96530c38 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -463,7 +463,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		if (!bridge->funcs->hdmi_audio_startup)
 			return 0;
 
-		return bridge->funcs->hdmi_audio_startup(connector, bridge);
+		return bridge->funcs->hdmi_audio_startup(bridge, connector);
 	}
 
 	if (bridge_connector->bridge_dp_audio) {
@@ -472,7 +472,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		if (!bridge->funcs->dp_audio_startup)
 			return 0;
 
-		return bridge->funcs->dp_audio_startup(connector, bridge);
+		return bridge->funcs->dp_audio_startup(bridge, connector);
 	}
 
 	return -EINVAL;
@@ -489,13 +489,13 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
 	if (bridge_connector->bridge_hdmi_audio) {
 		bridge = bridge_connector->bridge_hdmi_audio;
 
-		return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+		return bridge->funcs->hdmi_audio_prepare(bridge, connector, fmt, hparms);
 	}
 
 	if (bridge_connector->bridge_dp_audio) {
 		bridge = bridge_connector->bridge_dp_audio;
 
-		return bridge->funcs->dp_audio_prepare(connector, bridge, fmt, hparms);
+		return bridge->funcs->dp_audio_prepare(bridge, connector, fmt, hparms);
 	}
 
 	return -EINVAL;
@@ -509,12 +509,12 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
 
 	if (bridge_connector->bridge_hdmi_audio) {
 		bridge = bridge_connector->bridge_hdmi_audio;
-		bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+		bridge->funcs->hdmi_audio_shutdown(bridge, connector);
 	}
 
 	if (bridge_connector->bridge_dp_audio) {
 		bridge = bridge_connector->bridge_dp_audio;
-		bridge->funcs->dp_audio_shutdown(connector, bridge);
+		bridge->funcs->dp_audio_shutdown(bridge, connector);
 	}
 }
 
@@ -531,7 +531,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		if (!bridge->funcs->hdmi_audio_mute_stream)
 			return -ENOTSUPP;
 
-		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
+		return bridge->funcs->hdmi_audio_mute_stream(bridge, connector,
 							     enable, direction);
 	}
 
@@ -541,7 +541,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		if (!bridge->funcs->dp_audio_mute_stream)
 			return -ENOTSUPP;
 
-		return bridge->funcs->dp_audio_mute_stream(connector, bridge,
+		return bridge->funcs->dp_audio_mute_stream(bridge, connector,
 							   enable, direction);
 	}
 
@@ -604,7 +604,7 @@ static int drm_bridge_connector_hdmi_cec_init(struct drm_connector *connector)
 	if (!bridge->funcs->hdmi_cec_init)
 		return 0;
 
-	return bridge->funcs->hdmi_cec_init(connector, bridge);
+	return bridge->funcs->hdmi_cec_init(bridge, connector);
 }
 
 static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_funcs = {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index f8bfb908f9b4..a0830bffdca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -173,8 +173,8 @@ static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_
 	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 }
 
-int msm_dp_audio_prepare(struct drm_connector *connector,
-			 struct drm_bridge *bridge,
+int msm_dp_audio_prepare(struct drm_bridge *bridge,
+			 struct drm_connector *connector,
 			 struct hdmi_codec_daifmt *daifmt,
 			 struct hdmi_codec_params *params)
 {
@@ -216,8 +216,8 @@ int msm_dp_audio_prepare(struct drm_connector *connector,
 	return rc;
 }
 
-void msm_dp_audio_shutdown(struct drm_connector *connector,
-			   struct drm_bridge *bridge)
+void msm_dp_audio_shutdown(struct drm_bridge *bridge,
+			   struct drm_connector *connecter)
 {
 	struct msm_dp_audio_private *audio;
 	struct msm_dp *msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 58fc14693e48..66b32215c0f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -44,12 +44,12 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
  */
 void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
 
-int msm_dp_audio_prepare(struct drm_connector *connector,
-			 struct drm_bridge *bridge,
+int msm_dp_audio_prepare(struct drm_bridge *bridge,
+			 struct drm_connector *connector,
 			 struct hdmi_codec_daifmt *daifmt,
 			 struct hdmi_codec_params *params);
-void msm_dp_audio_shutdown(struct drm_connector *connector,
-			   struct drm_bridge *bridge);
+void msm_dp_audio_shutdown(struct drm_bridge *bridge,
+			   struct drm_connector *connector);
 
 #endif /* _DP_AUDIO_H_ */
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index d5e572d10d6a..1d02d4e1ed5b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -200,12 +200,12 @@ struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
 
 int msm_hdmi_audio_update(struct hdmi *hdmi);
-int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
-				  struct drm_bridge *bridge,
+int msm_hdmi_bridge_audio_prepare(struct drm_bridge *bridge,
+				  struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params);
-void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
-				    struct drm_bridge *bridge);
+void msm_hdmi_bridge_audio_shutdown(struct drm_bridge *bridge,
+				    struct drm_connector *connector);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index b9ec14ef2c20..d9a8dc9dae8f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -122,8 +122,8 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
-				  struct drm_bridge *bridge,
+int msm_hdmi_bridge_audio_prepare(struct drm_bridge *bridge,
+				  struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
@@ -163,8 +163,8 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 	return msm_hdmi_audio_update(hdmi);
 }
 
-void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
-				    struct drm_bridge *bridge)
+void msm_hdmi_bridge_audio_shutdown(struct drm_bridge *bridge,
+				    struct drm_connector *connector)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7f66f9018c10..7a75b449bc91 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -817,8 +817,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*hdmi_audio_startup)(struct drm_connector *connector,
-				  struct drm_bridge *bridge);
+	int (*hdmi_audio_startup)(struct drm_bridge *bridge,
+				  struct drm_connector *connector);
 
 	/**
 	 * @hdmi_audio_prepare:
@@ -831,8 +831,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*hdmi_audio_prepare)(struct drm_connector *connector,
-				  struct drm_bridge *bridge,
+	int (*hdmi_audio_prepare)(struct drm_bridge *bridge,
+				  struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *fmt,
 				  struct hdmi_codec_params *hparms);
 
@@ -847,8 +847,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	void (*hdmi_audio_shutdown)(struct drm_connector *connector,
-				    struct drm_bridge *bridge);
+	void (*hdmi_audio_shutdown)(struct drm_bridge *bridge,
+				    struct drm_connector *connector);
 
 	/**
 	 * @hdmi_audio_mute_stream:
@@ -861,12 +861,12 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
-				      struct drm_bridge *bridge,
+	int (*hdmi_audio_mute_stream)(struct drm_bridge *bridge,
+				      struct drm_connector *connector,
 				      bool enable, int direction);
 
-	int (*hdmi_cec_init)(struct drm_connector *connector,
-			     struct drm_bridge *bridge);
+	int (*hdmi_cec_init)(struct drm_bridge *bridge,
+			     struct drm_connector *connector);
 
 	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
 
@@ -886,8 +886,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*dp_audio_startup)(struct drm_connector *connector,
-				struct drm_bridge *bridge);
+	int (*dp_audio_startup)(struct drm_bridge *bridge,
+				struct drm_connector *connector);
 
 	/**
 	 * @dp_audio_prepare:
@@ -900,8 +900,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*dp_audio_prepare)(struct drm_connector *connector,
-				struct drm_bridge *bridge,
+	int (*dp_audio_prepare)(struct drm_bridge *bridge,
+				struct drm_connector *connector,
 				struct hdmi_codec_daifmt *fmt,
 				struct hdmi_codec_params *hparms);
 
@@ -916,8 +916,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	void (*dp_audio_shutdown)(struct drm_connector *connector,
-				  struct drm_bridge *bridge);
+	void (*dp_audio_shutdown)(struct drm_bridge *bridge,
+				  struct drm_connector *connector);
 
 	/**
 	 * @dp_audio_mute_stream:
@@ -930,8 +930,8 @@ struct drm_bridge_funcs {
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*dp_audio_mute_stream)(struct drm_connector *connector,
-				    struct drm_bridge *bridge,
+	int (*dp_audio_mute_stream)(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    bool enable, int direction);
 
 	/**
-- 
2.43.0

