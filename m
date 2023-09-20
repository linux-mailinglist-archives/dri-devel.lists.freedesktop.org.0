Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34A7A86BB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ED810E4D7;
	Wed, 20 Sep 2023 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52F10E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:35:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 530C761C11;
 Wed, 20 Sep 2023 14:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BF8C433C9;
 Wed, 20 Sep 2023 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695220554;
 bh=JesZ3/fGi45agkZSRIpZKjw+nUimuCRXqZlxL7MJq34=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rN6jdbxR+lin7qkeZL8yAqr/9jAXLXWnjbHZLeMB3wWStx51gdaKnwaxY4i882Tzn
 nvDHWD/Sq+Ts4Rz+N91IJz2929Pg8QrcsD9wsk122eC01Z91DvG1eYbfT5hqq1F+CN
 dGRQ/N0DItDe+mUiWq3X12tKUAjBdxoUXPgeEP8t4qALwXRQd+qgmtpxrM8lZadLCm
 hmR4j1P67xycAaOAbEYkcdU8kcI7VIjEXV13xFm2ApyA/JTfkxhtT+DSxIMhfxq1Zq
 oEC68LBlpqGJYB3uVR5TBDWhqwc+c9FlSNdPM0DyymJdjzyxyt/7zutX+7/74Bv78T
 EDd+FdC9Y0WBw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:19 +0200
Subject: [PATCH RFC v2 04/37] drm/connector: hdmi: Add helper to get the
 RGB range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-4-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JesZ3/fGi45agkZSRIpZKjw+nUimuCRXqZlxL7MJq34=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczJbnTpQ8z3V13da+PPDPnKPHGC5skdTlOr3x/S4Wu
 /T5DVEFHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhISBDD/5AFbUndRWYKhxny
 b5xofhR9Tl/LQ7PfUc06N3zryfolKxgZVhdcd78bEheQzxT0e7OP7ZlfbOUq00O+hSc/yTlpvMe
 MBwA=
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

HDMI controller drivers will need to figure out the RGB range they need
to configure based on a given atomic state.

Let's provide a helper to provide that information.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 39 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  5 ++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 4b24ebb7e3e8..0f7e5ba555b8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -31,6 +31,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
@@ -621,6 +622,15 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 
+static const struct drm_display_mode *
+connector_state_get_adjusted_mode(const struct drm_connector_state *state)
+{
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_crtc_state *crtc_state = crtc->state;
+
+	return &crtc_state->adjusted_mode;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -656,6 +666,35 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
+/**
+ * drm_atomic_helper_connector_hdmi_is_full_range() - Checks whether a state uses Full-Range RGB
+ * @connector: the HDMI connector this state refers to
+ * @state: the HDMI connector state to check
+ *
+ * RETURNS:
+ * True if @state requires a Full range RGB output, False otherwise
+ */
+bool
+drm_atomic_helper_connector_hdmi_is_full_range(const struct drm_connector *connector,
+					       const struct drm_connector_state *state)
+{
+	const struct drm_display_mode *mode =
+		connector_state_get_adjusted_mode(state);
+	const struct drm_display_info *display = &connector->display_info;
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
+		return true;
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return false;
+
+	if (!display->is_hdmi)
+		return true;
+
+	return drm_default_rgb_quant_range(mode);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_is_full_range);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index d59d2b3aef9a..c6d941b9e846 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -88,6 +88,11 @@ void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
+
+bool
+drm_atomic_helper_connector_hdmi_is_full_range(const struct drm_connector *connector,
+					       const struct drm_connector_state *state);
+
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 

-- 
2.41.0

