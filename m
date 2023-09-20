Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888F7A86B3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0729C10E4D3;
	Wed, 20 Sep 2023 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFF710E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:35:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E334F619B5;
 Wed, 20 Sep 2023 14:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B92C433C9;
 Wed, 20 Sep 2023 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695220548;
 bh=nepQLLKsrdqR+bFLGLuPmm3JeqsJJl9xSfF4WgZmnUM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PJo4p+FKomVp8MnMFEaG64GHE7rJW9lCLDOTXplFKz4P3A22ptWJxqitTyL6fpQOg
 Gene/nllC7GFRIZN6EWDlfGMBFjStd3CpV6a4kA0JgJJHJPdISYVvSSnF7VlanBrau
 eHd8zVfC2bBcwhH3hZVKtYii4LrLpZetG2lxb678ndSOuvzTuwLr3yfOTYQRd4JIGL
 nf9foLOv7W2Ny8vJ0hL6IzDr5r2JsZMFTyhII/widdC/jE5XzFbEPxTbfYa+Gn+Br8
 HqP7e+KIoq6VQ2X24PNKELyW/x9V0L9blrAGZ2yOZ4ebZ/gOEGsZoG27tFoYmYYXPi
 lncfHMh0jrGhg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:17 +0200
Subject: [PATCH RFC v2 02/37] drm/connector: hdmi: Create a custom state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-2-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4019; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nepQLLKsrdqR+bFLGLuPmm3JeqsJJl9xSfF4WgZmnUM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczJYe8d+//7n17YZN+IX6D6y/75qeXH+zL/9fmeuz8
 lTXc6qFHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIThXD/+iwRcd/xyue2Vym
 zn9esWrx3KAJ278mu50NWP6N/WVV4HKGf5pGYht6uPdzBKZnHG3Yuztjk+di19O6T/3l39f/CTn
 9jAMA
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

The next features we will need to share across drivers will need to
store some parameters for drivers to use, such as the selected output
format.

Let's create a new connector state dedicated to HDMI controllers, that
will eventually store everything we need.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 34 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  4 ++++
 include/drm/drm_connector.h               |  3 +++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..972710a9fd49 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -556,6 +556,21 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_state)
+{
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
 /**
  * drm_atomic_helper_connector_tv_check - Validate an analog TV connector state
  * @connector: DRM Connector
@@ -605,6 +620,25 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 
+/**
+ * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Provides a default connector state check handler for HDMI connectors.
+ * Checks that a desired connector update is valid, and updates various
+ * fields of derived state.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
+{
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb2658..d59d2b3aef9a 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -71,7 +71,11 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_state);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c86cd363d652..5961f2ad48b1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1022,6 +1022,9 @@ struct drm_connector_state {
 	 * DRM blob property for HDR output metadata
 	 */
 	struct drm_property_blob *hdr_output_metadata;
+
+	struct {
+	} hdmi;
 };
 
 /**

-- 
2.41.0

