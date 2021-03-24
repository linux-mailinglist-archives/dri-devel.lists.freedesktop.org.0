Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39D34814D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 20:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4926EA6E;
	Wed, 24 Mar 2021 19:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92C6EA7F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 19:12:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id C32651F45E00
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mediatek: Switch the hdmi bridge ops to the atomic
 versions
Date: Wed, 24 Mar 2021 20:12:40 +0100
Message-Id: <20210324191241.22622-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210324191241.22622-1-dafna.hirschfeld@collabora.com>
References: <20210324191241.22622-1-dafna.hirschfeld@collabora.com>
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
Cc: chunkuang.hu@kernel.org, dafna.hirschfeld@collabora.com, airlied@linux.ie,
 dafna3@gmail.com, laurent.pinchart@ideasonboard.com,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge operation '.enable' and the audio cb '.get_eld'
access hdmi->conn. In the future we will want to support
the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
not have direct access to the connector.
The atomic version '.atomic_enable' allows accessing the
current connector from the state.
This patch switches the bridge to the atomic version and
saves the current connector in a new field 'curr_conn'.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 41 ++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8ee55f9e2954..9f415c508b33 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -154,6 +154,7 @@ struct mtk_hdmi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector conn;
+	struct drm_connector *curr_conn;
 	struct device *dev;
 	const struct mtk_hdmi_conf *conf;
 	struct phy *phy;
@@ -974,7 +975,7 @@ static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
 	ssize_t err;
 
 	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
-						       &hdmi->conn, mode);
+						       hdmi->curr_conn, mode);
 	if (err < 0) {
 		dev_err(hdmi->dev,
 			"Failed to get AVI infoframe from mode: %zd\n", err);
@@ -1054,7 +1055,7 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	ssize_t err;
 
 	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame,
-							  &hdmi->conn, mode);
+							  hdmi->curr_conn, mode);
 	if (err) {
 		dev_err(hdmi->dev,
 			"Failed to get vendor infoframe from mode: %zd\n", err);
@@ -1357,7 +1358,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1368,10 +1370,13 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
 
+	hdmi->curr_conn = NULL;
+
 	hdmi->enabled = false;
 }
 
-static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1406,7 +1411,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&hdmi->mode, adjusted_mode);
 }
 
-static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1426,10 +1432,16 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
 		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
 }
 
-static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
 {
+	struct drm_atomic_state *state = old_state->base.state;
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
+	/* Retrieve the connector through the atomic state. */
+	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+
 	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
 	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
 	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
@@ -1440,13 +1452,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = mtk_hdmi_bridge_attach,
 	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
-	.disable = mtk_hdmi_bridge_disable,
-	.post_disable = mtk_hdmi_bridge_post_disable,
+	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
+	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,
-	.pre_enable = mtk_hdmi_bridge_pre_enable,
-	.enable = mtk_hdmi_bridge_enable,
+	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
+	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
@@ -1662,8 +1677,10 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
-	memcpy(buf, hdmi->conn.eld, min(sizeof(hdmi->conn.eld), len));
-
+	if (hdmi->curr_conn)
+		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
+	else
+		memset(buf, 0, len);
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
