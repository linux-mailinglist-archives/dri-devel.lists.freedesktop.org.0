Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1B8C3232
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 17:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31B210E204;
	Sat, 11 May 2024 15:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="c5J30rpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1328710E1D0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 15:39:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BFV27D024843;
 Sat, 11 May 2024 10:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715441462;
 bh=H7GJwTsKO0pIYC74rsnEoR0NpjjEWRzNaWxMzLFC10c=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=c5J30rpGRlvd8fuF9ZEC0cXypvQZ1mhpFe1a86a/Ci93/YNZeTPEerLRFAf7fnbNv
 +ehwyoKfeV3GAD/FULKv865ho9aadYUhQp2M/4oPgcTp98oaKPSgyYg1UiRCjL719Y
 J/uSxRXlwxyIiEQfQM2LoShrIGSFfVB4uoRJmY0M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BFV2cb017933
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 10:31:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 10:31:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 10:31:01 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BFV0AO043328;
 Sat, 11 May 2024 10:31:01 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>, Aradhya Bhatia
 <a-bhatia1@ti.com>
Subject: [PATCH 6/7] drm/bridge: Introduce early_enable and late disable
Date: Sat, 11 May 2024 21:00:50 +0530
Message-ID: <20240511153051.1355825-7-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511153051.1355825-1-a-bhatia1@ti.com>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the existing pre_enable and enable function hooks, the order of
enable of display elements looks as follows,

crtc_enable -> bridge[n]_pre_enable -> ... -> bridge[1]_pre_enable ->
encoder_enable -> bridge[1]_enable -> ... -> bridge[n]_enable

and vice versa for the disable.

Some bridges need to be up and running before and after their source
gets enabled and has run. In some case, that source is a display unit,
controlled as part of &drm_crtc.

For those bridges, add support for early_enable and late_disable
function hooks.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 67 +++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c        | 84 +++++++++++++++++++++++++++++
 include/drm/drm_bridge.h            | 73 +++++++++++++++++++++++++
 3 files changed, 224 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index fb97b51b38f1..396bb83e4296 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1234,6 +1234,49 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		if (ret == 0)
 			drm_crtc_vblank_put(crtc);
 	}
+
+	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state,
+					   new_conn_state, i) {
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		/*
+		 * Shut down everything that's in the changeset and currently
+		 * still on. So need to check the old, saved state.
+		 */
+		if (!old_conn_state->crtc)
+			continue;
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+
+		if (new_conn_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(old_state,
+								       new_conn_state->crtc);
+		else
+			new_crtc_state = NULL;
+
+		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
+		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
+			continue;
+
+		encoder = old_conn_state->best_encoder;
+
+		/* We shouldn't get this far if we didn't previously have
+		 * an encoder.. but WARN_ON() rather than explode.
+		 */
+		if (WARN_ON(!encoder))
+			continue;
+
+		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call disable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_late_disable(bridge, old_state);
+	}
 }
 
 /**
@@ -1469,6 +1512,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 	struct drm_connector_state *new_conn_state;
 	int i;
 
+	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		if (!new_conn_state->best_encoder)
+			continue;
+
+		if (!new_conn_state->crtc->state->active ||
+		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
+			continue;
+
+		encoder = new_conn_state->best_encoder;
+
+		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_early_enable(bridge, old_state);
+	}
+
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 28abe9aa99ca..b9070f6b3554 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -623,6 +623,50 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
+/**
+ * drm_atomic_bridge_chain_late_disable - disables all bridges in the encoder
+ *					  chain after crtc is disabled.
+ * @bridge: bridge control structure
+ * @old_state: old atomic state
+ *
+ * Calls &drm_bridge_funcs.atomic_late_disable (falls back on
+ * &drm_bridge_funcs.late_disable) op for all the bridges in the
+ * encoder chain, starting from the last bridge to the first. These are called
+ * after calling &drm_crtc_helper_funcs.atomic_disable.
+ *
+ * Note: the bridge passed should be the one closest to the encoder
+ */
+void drm_atomic_bridge_chain_late_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *old_state)
+{
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
+	if (!bridge)
+		return;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->funcs->atomic_late_disable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								iter);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			iter->funcs->atomic_late_disable(iter, old_bridge_state);
+		} else if (iter->funcs->late_disable) {
+			iter->funcs->late_disable(iter);
+		}
+
+		if (iter == bridge)
+			break;
+	}
+}
+EXPORT_SYMBOL(drm_atomic_bridge_chain_late_disable);
+
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
 						struct drm_atomic_state *old_state)
 {
@@ -728,6 +772,46 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
+/**
+ * drm_atomic_bridge_chain_early_enable - enables all bridges in the encoder
+ *					  chain before it's crtc is enabled
+ * @bridge: bridge control structure
+ * @old_state: old atomic state
+ *
+ * Calls &drm_bridge_funcs.atomic_early_enable (falls back on
+ * &drm_bridge_funcs.early_enable) op for all the bridges in the
+ * encoder chain, starting from the first bridge to the last. These are called
+ * before even the &drm_crtc_helper_funcs.atomic_enable is called.
+ *
+ * Note: the bridge passed should be the one closest to the encoder.
+ */
+void drm_atomic_bridge_chain_early_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *old_state)
+{
+	struct drm_encoder *encoder;
+
+	if (!bridge)
+		return;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (bridge->funcs->atomic_early_enable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								bridge);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			bridge->funcs->atomic_early_enable(bridge, old_bridge_state);
+		} else if (bridge->funcs->early_enable) {
+			bridge->funcs->early_enable(bridge);
+		}
+	}
+}
+EXPORT_SYMBOL(drm_atomic_bridge_chain_early_enable);
+
 static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
 					      struct drm_atomic_state *old_state)
 {
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..40f93230abb2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -206,6 +206,20 @@ struct drm_bridge_funcs {
 	 */
 	void (*post_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @late_disable:
+	 *
+	 * This callback should disable the bridge. It is called right after the
+	 * preceding element in the display pipe is disabled. If the preceding
+	 * element is a bridge this means it's called after that bridge's
+	 * @atomic_post_disable. If the preceding element is a &drm_crtc it's
+	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_disable
+	 * hook.
+	 *
+	 * The @late_disable callback is optional.
+	 */
+	void (*late_disable)(struct drm_bridge *bridge);
+
 	/**
 	 * @mode_set:
 	 *
@@ -235,6 +249,26 @@ struct drm_bridge_funcs {
 	void (*mode_set)(struct drm_bridge *bridge,
 			 const struct drm_display_mode *mode,
 			 const struct drm_display_mode *adjusted_mode);
+
+	/**
+	 * @early_enable:
+	 *
+	 * This callback should enable the bridge. It is called right before
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @early_enable. If the preceding element is a &drm_crtc it's
+	 * called right before the crtc's &drm_crtc_helper_funcs.atomic_enable
+	 * hook.
+	 *
+	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
+	 * will not yet be running when this callback is called. The bridge can
+	 * enable the display link feeding the next bridge in the chain (if
+	 * there is one) when this callback is called.
+	 *
+	 * The @early_enable callback is optional.
+	 */
+	void (*early_enable)(struct drm_bridge *bridge);
+
 	/**
 	 * @pre_enable:
 	 *
@@ -285,6 +319,26 @@ struct drm_bridge_funcs {
 	 */
 	void (*enable)(struct drm_bridge *bridge);
 
+	/**
+	 * @atomic_early_enable:
+	 *
+	 * This callback should enable the bridge. It is called right before
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @atomic_early_enable. If the preceding element is a
+	 * &drm_crtc it's called right before the crtc's
+	 * &drm_crtc_helper_funcs.atomic_enable hook.
+	 *
+	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
+	 * will not yet be running when this callback is called. The bridge can
+	 * enable the display link feeding the next bridge in the chain (if
+	 * there is one) when this callback is called.
+	 *
+	 * The @early_enable callback is optional.
+	 */
+	void (*atomic_early_enable)(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state);
+
 	/**
 	 * @atomic_pre_enable:
 	 *
@@ -361,6 +415,21 @@ struct drm_bridge_funcs {
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
 				    struct drm_bridge_state *old_bridge_state);
 
+	/**
+	 * @atomic_late_disable:
+	 *
+	 * This callback should disable the bridge. It is called right after the
+	 * preceding element in the display pipe is disabled. If the preceding
+	 * element is a bridge this means it's called after that bridge's
+	 * @atomic_late_disable. If the preceding element is a &drm_crtc it's
+	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_disable
+	 * hook.
+	 *
+	 * The @atomic_late_disable callback is optional.
+	 */
+	void (*atomic_late_disable)(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
@@ -873,6 +942,10 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state);
+void drm_atomic_bridge_chain_late_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state);
+void drm_atomic_bridge_chain_early_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
-- 
2.34.1

