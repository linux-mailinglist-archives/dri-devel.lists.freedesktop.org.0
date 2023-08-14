Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1677BAB0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B1F10E208;
	Mon, 14 Aug 2023 13:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCCD10E208
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D35E61202;
 Mon, 14 Aug 2023 13:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4047FC433C9;
 Mon, 14 Aug 2023 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021408;
 bh=g++ofW1dWzrJFCe/PqAHGgE6yXVKaJFsc5QCbk7jsYE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jbdTAUfNdH0v7148wd7Q+sEg+/Y5cgdrTeFOcx6EcKK7GPttIkCW9Q3UqXsbgdRtq
 KFcNuhCBqaFWf2Ou7flX/RHfYkNgoPvXyxYTxNKuCPJaEKpzqYcVRkcnulwR0GqqpI
 RN7nEvR313fPfYvpFuiq8Re/pb5CieYSUSgaWtXeeWBkDB/C5YF6FnyXON3tpBfifg
 lVm7B8e895RRdjIr5XeaizcF48eJsaS457iBNDR5lz6CfT27lWpTN2T9jevD6VoDmj
 mkw8Jjj2jPJbdegMPA/C0+DXUlb8sJizzYrjM5dHRyfEhWxuR1j6EtEZStaRY5V458
 /2x/oLYRQBjPQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:20 +0200
Subject: [PATCH RFC 08/13] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-8-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4570; i=mripard@kernel.org;
 h=from:subject:message-id; bh=g++ofW1dWzrJFCe/PqAHGgE6yXVKaJFsc5QCbk7jsYE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNomvVjKu6qR09b37rmdDxt1Lnp4zz/6uuih5fGTF
 57sTPxxqKOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATcfRj+M2yUmnNFvd7U+Im
 TeMwmhF7MP3AOpEZh7U2XLTZ1irzizOE4X/00ezuxOAI/Z3umuvXfr+3egl/qE/YCSaGas/oebl
 CxewA
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

Most of the HDMI controllers have an upper TMDS character rate limit
they can't exceed. On "embedded"-grade display controllers, it will
typically be lower than what high-grade monitors can provide these days,
so drivers will filter the TMDS character rate based on the controller
capabilities.

To make that easier to handle for drivers, let's provide an optional
hook to be implemented by drivers so they can tell the HDMI controller
helpers if a given TMDS character rate is reachable for them or not.

This will then be useful to figure out the best format and bpc count for
a given mode.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_hdmi_connector.c |  8 ++++++++
 include/drm/drm_connector.h          | 30 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index e49782a284a5..d94ceeb6a8ef 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -263,12 +263,16 @@ drm_hdmi_connector_clock_valid(const struct drm_hdmi_connector *hdmi_connector,
 			       const struct drm_display_mode *mode,
 			       unsigned long long clock)
 {
+	const struct drm_hdmi_connector_funcs *funcs = hdmi_connector->funcs;
 	const struct drm_connector *connector = &hdmi_connector->base;
 	const struct drm_display_info *info = &connector->display_info;
 
 	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
 		return MODE_CLOCK_HIGH;
 
+	if (funcs && funcs->tmds_char_rate_valid)
+		return funcs->tmds_char_rate_valid(hdmi_connector, mode, clock);
+
 	return MODE_OK;
 }
 
@@ -458,6 +462,7 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
  * drmm_hdmi_connector_init - Init a preallocated HDMI connector
  * @dev: DRM device
  * @hdmi_connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @max_bpc: Maximum bits per char the HDMI connector supports
@@ -476,6 +481,7 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
 int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_hdmi_connector_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned int max_bpc)
@@ -516,6 +522,8 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 		hdmi_connector->max_bpc = max_bpc;
 	}
 
+	hdmi_connector->funcs = hdmi_funcs;
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_hdmi_connector_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 03c5af34323d..6e25a16420e4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2131,12 +2131,41 @@ bool
 drm_atomic_helper_hdmi_connector_is_full_range(const struct drm_hdmi_connector *hdmi_connector,
 					       const struct drm_hdmi_connector_state *hdmi_state);
 
+/**
+ * struct drm_hdmi_connector_funcs - drm_hdmi_connector control functions
+ */
+struct drm_hdmi_connector_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_hdmi_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+};
+
 struct drm_hdmi_connector {
 	/**
 	 * @base: Base Connector
 	 */
 	struct drm_connector base;
 
+	/**
+	 * @funcs: HDMI connector Control Functions
+	 */
+	const struct drm_hdmi_connector_funcs *funcs;
+
 	/**
 	 * @max_bpc: Maximum bits per character the connector supports.
 	 */
@@ -2160,6 +2189,7 @@ drm_hdmi_connector_compute_mode_clock(const struct drm_display_mode *mode,
 int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_hdmi_connector_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned int max_bpc);

-- 
2.41.0

