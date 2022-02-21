Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEAA4BDA5E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFB710E54A;
	Mon, 21 Feb 2022 14:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8A10E2A0;
 Mon, 21 Feb 2022 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645455120; x=1676991120;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Pxh0j8i5HRx/ZnoC5AY1Xirjq4XIKV1wOb846dWaw70=;
 b=iUGYaSYKMFTkF1mGd9WkElnpQQwK/cX91H063AygQu2/5180vFLLQJMN
 Gp9E72OEme1XtYC+DXxkqbU0F+Tj8A+uk90SeZMTJferbJpoKAZkwA3jw
 tw/nb9s8mBcJXWlF+sIU6MKSEQCdUpMcFh/lynOsrxrwp15QPju2q1q/v U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2022 06:51:59 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2022 06:51:57 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Feb 2022 20:21:37 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 9B3D753A4; Mon, 21 Feb 2022 20:21:36 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, dianders@chromium.org,
 krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 2/4] drm/bridge: use atomic enable/disable for bridge
 callbacks
Date: Mon, 21 Feb 2022 20:21:24 +0530
Message-Id: <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic enable/disable for bridge callbacks to access certain
states like self-refresh.

This change avoids panel prepare/unprepare based on self-refresh
state.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Changes in V2:
- As per review suggestion by Dmitry.
---
 drivers/gpu/drm/bridge/panel.c | 102 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index b32295a..5c7dc82 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -41,6 +41,40 @@ static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(panel_bridge->panel, connector);
 }
 
+static struct drm_crtc *bridge_drm_get_old_connector_crtc(struct drm_encoder *encoder,
+						struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+
+static struct drm_crtc *bridge_drm_get_new_connector_crtc(struct drm_encoder *encoder,
+						struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+
 static const struct drm_connector_helper_funcs
 panel_bridge_connector_helper_funcs = {
 	.get_modes = panel_bridge_connector_get_modes,
@@ -102,30 +136,82 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
-static void panel_bridge_pre_enable(struct drm_bridge *bridge)
+static void panel_bridge_pre_enable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_prepare(panel_bridge->panel);
 }
 
-static void panel_bridge_enable(struct drm_bridge *bridge)
+static void panel_bridge_enable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_enable(panel_bridge->panel);
 }
 
-static void panel_bridge_disable(struct drm_bridge *bridge)
+static void panel_bridge_disable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_disable(panel_bridge->panel);
 }
 
-static void panel_bridge_post_disable(struct drm_bridge *bridge)
+static void panel_bridge_post_disable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_unprepare(panel_bridge->panel);
 }
@@ -141,10 +227,10 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
-	.pre_enable = panel_bridge_pre_enable,
-	.enable = panel_bridge_enable,
-	.disable = panel_bridge_disable,
-	.post_disable = panel_bridge_post_disable,
+	.atomic_pre_enable = panel_bridge_pre_enable,
+	.atomic_enable = panel_bridge_enable,
+	.atomic_disable = panel_bridge_disable,
+	.atomic_post_disable = panel_bridge_post_disable,
 	.get_modes = panel_bridge_get_modes,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.7.4

