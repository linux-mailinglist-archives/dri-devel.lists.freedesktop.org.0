Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3B56FCEB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7D48D49E;
	Mon, 11 Jul 2022 09:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7614A479;
 Mon, 11 Jul 2022 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657532913; x=1689068913;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=jeChhiyWoLcjAegHXqh/rf8PudXtR1Yc73pLcMWtrq0=;
 b=YkByWsKlxhziB6lkZwC8/yc8qOUZUGTll0javFi7CtLeh3UZDhf+fwfB
 WWM25mXMAY6fg8HziTvD6613bZbZJf62Ilg2M9KHuPQCLDg8itQsG2ZNk
 YhY/gJ0xMM/wkvrR24HGPklFVJZnP/OmitGOwhSiuQ2E4UKrA2buAANYr 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 02:48:32 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jul 2022 02:48:31 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2022 15:18:08 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id CD2D43E4E; Mon, 11 Jul 2022 15:18:04 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v5 07/10] drm/bridge: add psr support for panel bridge
 callbacks
Date: Mon, 11 Jul 2022 15:17:57 +0530
Message-Id: <1657532880-12897-9-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change will handle the psr entry exit cases in the panel
bridge atomic callback functions. For example, the panel power
should not turn off if the panel is entering psr.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index eeb9546..9770b8c 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -112,6 +112,18 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_prepare(panel_bridge->panel);
 }
@@ -120,6 +132,18 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_enable(panel_bridge->panel);
 }
@@ -128,6 +152,18 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_disable(panel_bridge->panel);
 }
@@ -136,6 +172,18 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_unprepare(panel_bridge->panel);
 }
-- 
2.7.4

