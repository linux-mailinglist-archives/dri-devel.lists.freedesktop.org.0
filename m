Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF27808C42
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEA910E8E7;
	Thu,  7 Dec 2023 15:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0A10E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:49:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55430CE1D03;
 Thu,  7 Dec 2023 15:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF5AC433C8;
 Thu,  7 Dec 2023 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964185;
 bh=xJnMCtf3ntBpekt5KmTcAothtAUv0sGGZE7OhCZRHUo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JPwrJE41BLKIlkHNWiy6AiVj6OR3oFFq1xs/pVvlmt+f02zX1eKvB98ppMdDJNIf6
 CM8ZfF7YJkEv7o3+e9C41ViWC9VnsI7RE9eqorEbabf/TF1WWfXBYjNLLzw0aqXcLB
 BGRg2wGPcM5tL9rTvVgBcqOd47nlTXELvQ6ASMR+HyOyGYKLNcuq+KBZm95ipTjJTK
 h671hahnkHveE/+X/5XdJNN1dCyeuMSP9diIimpNu8KbXaYek8zRd0WyM2OOrQog6h
 wb0prWAgXTQvdJVvYzttiH34iX6QnaQR3fA7yFC8XllpqzrMADopIhjM0WZiGUwZer
 zUHIsyJ0NjGFQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:28 +0100
Subject: [PATCH v5 05/44] drm/tests: connector: Add tests for
 drmm_connector_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-5-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5901; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xJnMCtf3ntBpekt5KmTcAothtAUv0sGGZE7OhCZRHUo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1st37PGm0tde7lxacTNpTdzjXymdKg7Z7b9WdjRI
 e/cr7Gzo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABN5PpmRYWVfbPNzJb3zjAcE
 2UqnF3auNU8tfFv5bYXpAUWjH3qsGxj+cEpwu5xb189hueqGspHpPoXJayPu/qtiYeN8/457r1s
 hLwA=
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

drmm_connector_init is the preferred function to initialize a
drm_connector structure. Let's add a bunch of unit tests for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 170 ++++++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..a268847be8d1 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -3,10 +3,175 @@
  * Kunit test for drm_modes functions
  */
 
+#include <linux/i2c.h>
+
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
+struct drm_connector_init_priv {
+	struct drm_device drm;
+	struct drm_connector connector;
+	struct i2c_adapter ddc;
+};
+
+static const struct drm_connector_funcs dummy_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.reset			= drm_atomic_helper_connector_reset,
+};
+
+static int dummy_ddc_xfer(struct i2c_adapter *adapter,
+			  struct i2c_msg *msgs, int num)
+{
+	return num;
+}
+
+static u32 dummy_ddc_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm dummy_ddc_algorithm = {
+	.master_xfer = dummy_ddc_xfer,
+	.functionality = dummy_ddc_func,
+};
+
+static void i2c_del_adapter_wrapper(void *ptr)
+{
+	struct i2c_adapter *adap = ptr;
+
+	i2c_del_adapter(adap);
+}
+
+static int drm_test_connector_init(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_connector_init_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	strscpy(priv->ddc.name, "dummy-connector-ddc", sizeof(priv->ddc.name));
+	priv->ddc.owner = THIS_MODULE;
+	priv->ddc.algo = &dummy_ddc_algorithm;
+	priv->ddc.dev.parent = dev;
+
+	ret = i2c_add_adapter(&priv->ddc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, i2c_del_adapter_wrapper, &priv->ddc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	test->priv = priv;
+	return 0;
+}
+
+/*
+ * Test that the registration of a bog standard connector works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_drmm_connector_init(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, &priv->connector,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector without a DDC adapter
+ * doesn't report any error.
+ */
+static void drm_test_drmm_connector_init_null_ddc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, &priv->connector,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector succeeds for all possible
+ * connector types.
+ */
+static void drm_test_drmm_connector_init_type_valid(struct kunit *test)
+{
+       struct drm_connector_init_priv *priv = test->priv;
+       unsigned int connector_type = *(unsigned int *)test->param_value;
+       int ret;
+
+       ret = drmm_connector_init(&priv->drm, &priv->connector,
+				 &dummy_funcs,
+				 connector_type,
+				 &priv->ddc);
+       KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static const unsigned int drm_connector_init_type_valid_tests[] = {
+	DRM_MODE_CONNECTOR_Unknown,
+	DRM_MODE_CONNECTOR_VGA,
+	DRM_MODE_CONNECTOR_DVII,
+	DRM_MODE_CONNECTOR_DVID,
+	DRM_MODE_CONNECTOR_DVIA,
+	DRM_MODE_CONNECTOR_Composite,
+	DRM_MODE_CONNECTOR_SVIDEO,
+	DRM_MODE_CONNECTOR_LVDS,
+	DRM_MODE_CONNECTOR_Component,
+	DRM_MODE_CONNECTOR_9PinDIN,
+	DRM_MODE_CONNECTOR_DisplayPort,
+	DRM_MODE_CONNECTOR_HDMIA,
+	DRM_MODE_CONNECTOR_HDMIB,
+	DRM_MODE_CONNECTOR_TV,
+	DRM_MODE_CONNECTOR_eDP,
+	DRM_MODE_CONNECTOR_VIRTUAL,
+	DRM_MODE_CONNECTOR_DSI,
+	DRM_MODE_CONNECTOR_DPI,
+	DRM_MODE_CONNECTOR_WRITEBACK,
+	DRM_MODE_CONNECTOR_SPI,
+	DRM_MODE_CONNECTOR_USB,
+};
+
+static void drm_connector_init_type_desc(const unsigned int *type, char *desc)
+{
+	sprintf(desc, "%s", drm_get_connector_type_name(*type));
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_init_type_valid,
+		  drm_connector_init_type_valid_tests,
+		  drm_connector_init_type_desc);
+
+static struct kunit_case drmm_connector_init_tests[] = {
+	KUNIT_CASE(drm_test_drmm_connector_init),
+	KUNIT_CASE(drm_test_drmm_connector_init_null_ddc),
+	KUNIT_CASE_PARAM(drm_test_drmm_connector_init_type_valid,
+			 drm_connector_init_type_valid_gen_params),
+	{ }
+};
+
+static struct kunit_suite drmm_connector_init_test_suite = {
+	.name = "drmm_connector_init",
+	.init = drm_test_connector_init,
+	.test_cases = drmm_connector_init_tests,
+};
+
 struct drm_get_tv_mode_from_name_test {
 	const char *name;
 	enum drm_connector_tv_mode expected_mode;
@@ -70,7 +235,10 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
-kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
+kunit_test_suites(
+	&drmm_connector_init_test_suite,
+	&drm_get_tv_mode_from_name_test_suite
+);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");

-- 
2.43.0

