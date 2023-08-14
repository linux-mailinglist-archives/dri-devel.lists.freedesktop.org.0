Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4377BAAE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED7810E201;
	Mon, 14 Aug 2023 13:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B510E207
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5A2E62653;
 Mon, 14 Aug 2023 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3945C433C8;
 Mon, 14 Aug 2023 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021403;
 bh=pEBIIxPM9wHqohnSBbI/wG/es129PtwIxcG2qf1ek3Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eadwZtiCo59Eo5VViEHS3pAyPR7T+5giEv03vEjLG2WLaJswzSa0apilc4e2q5rNK
 ++icSIFjNhGuRyPIolHvCdg9VXDf4Pun3zKZ/P223Sxg8njRxP92JTijpyz8rCgiM7
 SDvTmb8BVWthHZKDE1b3G5AqA07+Rx9OkIk7obH5ZSWd1KrKl0IDjIRNuzkDw6Uymv
 riP06t8q/hIf7ubAVxROfiL6B8TeP0TePpIxMzXHxm4vC5X8qIUR+/uIln8jRAGz+K
 AL7aNEy+vEw1VMU7gGSXquUM09LdpfUUzoecPKl8sNxL1uxVlz775+vhUNFtUAjuHc
 JabJLO412gayQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:18 +0200
Subject: [PATCH RFC 06/13] drm/connector: hdmi: Add support for output format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-6-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3872; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pEBIIxPM9wHqohnSBbI/wG/es129PtwIxcG2qf1ek3Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNoO7r920ks89qX17AynpkJf1g4twx2bTl5i8b723
 PfOzTksHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIwSyG/yE/N7/j6rANlXbX
 2brIYlHEuh8rd88v+y8SaPpQ/8oh3WSG/8U3tyXMDZy+Y9733Du3ZWbt6EtTUVTZJ/7i6rSsr1e
 ++DIBAA==
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

Just like BPC, we'll add support for automatic selection of the output
format for HDMI connectors.

Let's add the needed defaults and fields for now.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_hdmi_connector.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h          |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index 6d5535e613c6..55f685c0095b 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -29,6 +29,7 @@ void __drm_atomic_helper_hdmi_connector_reset(struct drm_hdmi_connector *hdmi_co
 	new_hdmi_state->base.max_bpc = 8;
 	new_hdmi_state->base.max_requested_bpc = 8;
 	new_hdmi_state->output_bpc = 8;
+	new_hdmi_state->output_format = HDMI_COLORSPACE_RGB;
 	new_hdmi_state->broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_hdmi_connector_reset);
@@ -82,6 +83,7 @@ __drm_atomic_helper_hdmi_connector_duplicate_state(struct drm_hdmi_connector *hd
 		connector_state_to_hdmi_connector_state(old_state);
 
 	new_hdmi_state->output_bpc = old_hdmi_state->output_bpc;
+	new_hdmi_state->output_format = old_hdmi_state->output_format;
 	new_hdmi_state->broadcast_rgb = old_hdmi_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_hdmi_state->base);
 }
@@ -222,6 +224,30 @@ int drm_atomic_helper_hdmi_connector_set_property(struct drm_connector *connecto
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_set_property);
 
+static const char * const output_format_str[] = {
+	[HDMI_COLORSPACE_RGB]		= "RGB",
+	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
+	[HDMI_COLORSPACE_YUV422]	= "YUV 4:2:2",
+	[HDMI_COLORSPACE_YUV444]	= "YUV 4:4:4",
+};
+
+/*
+ * drm_hdmi_connector_get_output_format_name() - Return a string for HDMI connector output format
+ * @fmt: Output format to compute name of
+ *
+ * Returns: the name of the output format, or NULL if the type is not
+ * valid.
+ */
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
+{
+	if (fmt >= ARRAY_SIZE(output_format_str))
+		return NULL;
+
+	return output_format_str[fmt];
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
+
 static const struct drm_display_mode *
 connector_state_get_adjusted_mode(const struct drm_connector_state *state)
 {
@@ -259,6 +285,7 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 		connector_state_to_hdmi_connector_state(new_state);
 
 	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb ||
+	    old_hdmi_state->output_format != new_hdmi_state->output_format ||
 	    old_hdmi_state->output_bpc != new_hdmi_state->output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
@@ -345,6 +372,8 @@ void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tbroadcast_rgb=%s\n",
 		   drm_hdmi_connector_get_broadcast_rgb_name(hdmi_state->broadcast_rgb));
 	drm_printf(p, "\toutput_bpc=%u\n", hdmi_state->output_bpc);
+	drm_printf(p, "\toutput_format=%s\n",
+		   drm_hdmi_connector_get_output_format_name(hdmi_state->output_format));
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 353aa8e5a117..995700110a16 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2080,6 +2080,11 @@ struct drm_hdmi_connector_state {
 	 */
 	unsigned int output_bpc;
 
+	/**
+	 * @output_format: Pixel format to output in.
+	 */
+	enum hdmi_colorspace output_format;
+
 	/**
 	 * @broadcast_rgb: Connector property to pass the Broadcast RGB
 	 * selection value.

-- 
2.41.0

