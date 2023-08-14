Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF877BAAF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F2510E207;
	Mon, 14 Aug 2023 13:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7949B10E208
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F404E614E1;
 Mon, 14 Aug 2023 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C79C433CA;
 Mon, 14 Aug 2023 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021400;
 bh=oWUDOi4NfdQFSp0O5CoIevtT3gTEWUAlM+FIqPYfeaU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DqSrboWq+iUh8KA2DjsHy6RX2Tg2W7xKKlty5uSJEilpYePLA6Rk8+FGRU4ZDKROj
 galX+EsAcFXAE8KXpKlq6FOdSg+Jj+MuHPrYThAQDPBg8CI3z3SW7n3BCEVGsUzATj
 Hhz7yxHaqzhBJmxZ954lN+3BMthy4Mp+fT8sxJdSyPfwh5+La64ktyQEezuxbemCoa
 7Ti4q7Fc80yQqZ4VjYHsvjex4q1f3QdU6p0mHmlsm7t2TKMWVUrv3ObQ16y7Mm+/a9
 KAfjqnYisC5CSU3sGVTWJh1vd+b3u+S3oWcZAszA+okhWKccXQPteey2sl/y79RCxy
 g2NN+KFFS35Yg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:17 +0200
Subject: [PATCH RFC 05/13] drm/connector: hdmi: Add output BPC to the
 connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-5-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4839; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oWUDOi4NfdQFSp0O5CoIevtT3gTEWUAlM+FIqPYfeaU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNq+zLuQt/ZF2JTgDS9+Sm8rUHP1EDUJaYyXXinOH
 qCzIGViRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYyPYqR4ZZl1Ovi92v+nsiz
 v3xjRQmD7fSfPbfniHxcF3v1X+K3GyKMDNd9tzHWxQoeuKu6ON/54KJ6J8Hq/TvFw/mSOi3sdzj
 JMQIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_hdmi_connector.c | 21 +++++++++++++++++++--
 include/drm/drm_connector.h          | 13 ++++++++++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index 1fe3f3ebf719..6d5535e613c6 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -26,6 +26,9 @@ void __drm_atomic_helper_hdmi_connector_reset(struct drm_hdmi_connector *hdmi_co
 
 	__drm_atomic_helper_connector_reset(connector, &new_hdmi_state->base);
 
+	new_hdmi_state->base.max_bpc = 8;
+	new_hdmi_state->base.max_requested_bpc = 8;
+	new_hdmi_state->output_bpc = 8;
 	new_hdmi_state->broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_hdmi_connector_reset);
@@ -78,6 +81,7 @@ __drm_atomic_helper_hdmi_connector_duplicate_state(struct drm_hdmi_connector *hd
 	struct drm_hdmi_connector_state *old_hdmi_state =
 		connector_state_to_hdmi_connector_state(old_state);
 
+	new_hdmi_state->output_bpc = old_hdmi_state->output_bpc;
 	new_hdmi_state->broadcast_rgb = old_hdmi_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_hdmi_state->base);
 }
@@ -254,7 +258,8 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 	struct drm_hdmi_connector_state *new_hdmi_state =
 		connector_state_to_hdmi_connector_state(new_state);
 
-	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb) {
+	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb ||
+	    old_hdmi_state->output_bpc != new_hdmi_state->output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
@@ -339,6 +344,7 @@ void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tbroadcast_rgb=%s\n",
 		   drm_hdmi_connector_get_broadcast_rgb_name(hdmi_state->broadcast_rgb));
+	drm_printf(p, "\toutput_bpc=%u\n", hdmi_state->output_bpc);
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
 
@@ -348,6 +354,7 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
  * @hdmi_connector: A pointer to the HDMI connector to init
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
@@ -364,7 +371,8 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	struct drm_connector *connector = &hdmi_connector->base;
 	struct drm_property *prop;
@@ -393,6 +401,15 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 	drm_object_attach_property(&connector->base, prop,
 				   DRM_HDMI_BROADCAST_RGB_AUTO);
 
+	if (max_bpc) {
+		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+			return -EINVAL;
+
+		drm_connector_attach_hdr_output_metadata_property(connector);
+		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+		hdmi_connector->max_bpc = max_bpc;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_hdmi_connector_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index dff95e6e2b48..353aa8e5a117 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2075,6 +2075,11 @@ struct drm_hdmi_connector_state {
 	 */
 	struct drm_connector_state base;
 
+	/**
+	 * @output_bpc: Bits per character to output.
+	 */
+	unsigned int output_bpc;
+
 	/**
 	 * @broadcast_rgb: Connector property to pass the Broadcast RGB
 	 * selection value.
@@ -2121,6 +2126,11 @@ struct drm_hdmi_connector {
 	 */
 	struct drm_connector base;
 
+	/**
+	 * @max_bpc: Maximum bits per character the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @broadcast_rgb_property: Connector property to set the
 	 * Broadcast RGB selection to output with.
@@ -2135,7 +2145,8 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 
 /**
  * struct drm_tile_group - Tile group metadata

-- 
2.41.0

