Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCFD808C51
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491C10E8F2;
	Thu,  7 Dec 2023 15:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7CE10E8EC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AF198CE1FC8;
 Thu,  7 Dec 2023 15:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30A3C433CB;
 Thu,  7 Dec 2023 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964200;
 bh=vkQnawnybgcxQe4r/BKfuMDeYrLPWtC+ZLmpRglzOHc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sEYclr+csIPkdW4AhjbSXv9IqDnaoHiWaWUgSuZTBrjZ+Prrt6TD0z7u0UunqYxcT
 n7TNTRc7alChziRJOPqtb2hhcQXg3udX+laDgAnmxrwCKAB/2wMCy969Y98YDO8xao
 zQLrEFj6ReAnFkHCPk1W1at8suTqL6WCIFm2vVMoinWmDg/KUl0wSnzsYerO4UXyk8
 pyNlXy2gXynqSbvJjmxBrS8w9p7Qj5b2y3YT7yuIE5PgWBy1Iz4xSV1hobF5stqThg
 ijjpsPP4YVMa7VpZ5RAXwcZ9M3ua8DII64QR7sCO6Xp5xJFZYWbqFB4qgZQdniDeIX
 IYp2bxcvGfHoA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:33 +0100
Subject: [PATCH v5 10/44] drm/connector: hdmi: Add output BPC to the
 connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-10-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=24518; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vkQnawnybgcxQe4r/BKfuMDeYrLPWtC+ZLmpRglzOHc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1ufPBPxuatidMuCZYN2R6lLoNrbmSJzLxWcPJ6+1
 NPAS/lbRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZS18HI8Ej39Iu8f++Kb585
 FCS14eQEzQC9E9ULxIwOian7WGgITmL4w6W94/dt87ijQue18vKnG/efeFxolXsi9pH2xYmJdTn
 TuQE=
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
 drivers/gpu/drm/drm_atomic.c                       |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   7 +-
 drivers/gpu/drm/drm_connector.c                    |  20 +-
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 227 ++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_connector_test.c         | 153 +++++++++++++-
 include/drm/drm_connector.h                        |  13 +-
 6 files changed, 402 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e4ad53e64e07..76c63ed04af4 100644
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
index 4a7114978c47..883bdc0349c0 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -584,6 +584,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_state->max_bpc = max_bpc;
+	new_state->max_requested_bpc = max_bpc;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -700,7 +704,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
-	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 929b0a911f62..139ac3d8160c 100644
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
 
@@ -483,10 +485,26 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
+	/*
+	 * drm_connector_attach_max_bpc_property() requires the
+	 * connector to have a state.
+	 */
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+	connector->max_bpc = max_bpc;
+
+	if (max_bpc > 8)
+		drm_connector_attach_hdr_output_metadata_property(connector);
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 7750c3d214a4..a1b0e6914cf8 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -146,7 +146,8 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test)
+drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -188,7 +189,8 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test)
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL);
+				       NULL,
+				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
@@ -223,7 +225,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -284,7 +286,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -345,7 +347,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -399,7 +401,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -452,7 +454,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -508,7 +510,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -563,7 +565,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -619,7 +621,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -657,6 +659,138 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
 }
 
+/*
+ * Test that if we change the maximum bpc property to a different value,
+ * we trigger a mode change on the connector's CRTC, which will in turn
+ * disable/enable the connector.
+ */
+static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.output_bpc = 8;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
+}
+
+/*
+ * Test that if we set the output bpc property to the same value, we
+ * don't trigger a mode change on the connector's CRTC and leave the
+ * connector unaffected.
+ */
+static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			new_conn_state->hdmi.output_bpc,
+			old_conn_state->hdmi.output_bpc);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_EXPECT_EQ(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -666,6 +800,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	{ }
 };
 
@@ -684,7 +820,7 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -692,8 +828,77 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
 }
 
+/*
+ * Test that if the connector was initialised with a maximum bpc of 8,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 8, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_8_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 10,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 10, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_10_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 12,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 12, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_12_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
+	KUNIT_CASE(drm_test_check_bpc_8_value),
+	KUNIT_CASE(drm_test_check_bpc_10_value),
+	KUNIT_CASE(drm_test_check_bpc_12_value),
 	{ }
 };
 
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 41d33dea30af..fef7d53d34d4 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -186,7 +186,8 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -202,10 +203,144 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL);
+				       NULL,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of a connector with an invalid maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       9);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a null maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       0);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 8 succeeds, registers the max bpc property, but doesn't register the
+ * HDR output metadata one.
+ */
+static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 8);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 10 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       10);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 10);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 12 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       12);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 12);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
@@ -219,7 +354,8 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -250,7 +386,8 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -282,6 +419,11 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
 
 static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
@@ -447,7 +589,8 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	ret = drm_connector_attach_broadcast_rgb_property(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 76eecd449fb8..1b1b6aed04ee 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1072,6 +1072,11 @@ struct drm_connector_state {
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
 
@@ -1717,6 +1722,11 @@ struct drm_connector {
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
@@ -1956,7 +1966,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
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
2.43.0

