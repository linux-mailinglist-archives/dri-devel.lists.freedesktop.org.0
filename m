Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15B7DD2A7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6F10E577;
	Tue, 31 Oct 2023 16:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4443F10E576
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:48:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9322160FA7;
 Tue, 31 Oct 2023 16:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E446FC433C8;
 Tue, 31 Oct 2023 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770929;
 bh=NE9ZQi0quukkEFgUc0oJfWhNAR8pjL+9EmU2GJrMnDw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XDiUakTLpif9725+Vda0ONBIPTrOjSbkaSKI43oCZPRpyEg0gTEY47YatadFNSPZu
 8zh8GOYPkB9bmHyoNqbVn1ZN7sxJQVtwZf6HLJN6sBvNsNACYSkUl5V8UByi7hKkOL
 4LBPNr/zxOct1HoMOEzK+2KeGkgVN+cMOW4TCEk+WFE5NwpZK894AngVEpyTEee07F
 xHMCYJnb/BZPp5TpEqoECa1zd/PO6yzbAGHm0LSOOM3H/OYJzctwHw/V3551QVYT99
 0HL3oHisbzZtYkaBaTDL5jhK0DgRB8/8oNWAcD1rZKtEEWvorEF6630kRlNd3pBite
 K76+Ocf2WaZ9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:18 +0100
Subject: [PATCH RFC v3 05/37] drm/connector: hdmi: Add output BPC to the
 connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-5-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NE9ZQi0quukkEFgUc0oJfWhNAR8pjL+9EmU2GJrMnDw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+nf/L9EIj++dKN20a8/JzcLth77NXLTCvJNPdHb6u
 QVtV97JdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAim6oYGR5ZiG62sGK4EOet
 tzfRjfHfhbdn5k3xTuywL3vfaSFy+xPDP9UZysyKF1I8/mzoVmRe3sy+aD1H86d3kg15tYV/2Ds
 ZuAE=
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c              |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  8 +++++++-
 drivers/gpu/drm/drm_connector.c           | 20 +++++++++++++++++++-
 include/drm/drm_connector.h               | 13 ++++++++++++-
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 55cb117cd49a..51aac1b2aaaf 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1147,6 +1147,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
 		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
+		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index c3f124af64dc..406ba358aa14 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -570,6 +570,11 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_state->max_bpc = max_bpc;
+	new_state->max_requested_bpc = max_bpc;
+	new_state->hdmi.output_bpc = max_bpc;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -686,7 +691,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
-	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 36d728e811ae..508d1c667732 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
@@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	int ret;
 
@@ -487,6 +489,22 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (max_bpc) {
+		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+			return -EINVAL;
+
+		/*
+		 * drm_connector_attach_max_bpc_property() requires the
+		 * connector to have a state.
+		 */
+		if (connector->funcs->reset)
+			connector->funcs->reset(connector);
+
+		drm_connector_attach_hdr_output_metadata_property(connector);
+		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+		connector->max_bpc = max_bpc;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fc1fa754a40d..2d664b6ac0a6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1059,6 +1059,11 @@ struct drm_connector_state {
 		 * RGB Quantization Range or not?
 		 */
 		bool is_full_range;
+
+		/**
+		 * @output_bpc: Bits per color channel to output.
+		 */
+		unsigned int output_bpc;
 	} hdmi;
 };
 
@@ -1703,6 +1708,11 @@ struct drm_connector {
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
+	/**
+	 * @max_bpc: Maximum bits per color channel the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.
@@ -1942,7 +1952,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.41.0

