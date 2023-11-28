Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3E7FB729
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0234110E483;
	Tue, 28 Nov 2023 10:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724B410E483
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:24:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D191D616CD;
 Tue, 28 Nov 2023 10:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2EAC433C7;
 Tue, 28 Nov 2023 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167079;
 bh=3X0my8D9PYgi7EcRYdh/ciCZnSzC7V4KrXKwBufu/RU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fdMh5m/wf1os2Twf7x9R3y/oESAVctil6OOi0TD8uMJqzgm2ucDNofyTTaqSkHupD
 YSnLuC2ECniJbZZHj7YtntwJ2DpmWicxvNFJo+/wtvXTX2T79ww9PHWPxfxGfyg01i
 pXoVueYoFt/fAFWChl6J3s0Q4lypDwqlEB4MM11ZqTPN2RXqXUGGfgvCy9/j0DQVMN
 ks9PX2Y5xpD2q+kS3Hty/oqBr2woV5uVyyVQk4CtdoZlaC4guFJ7l5qwV+SiEZlA3q
 ZuDItQ77sFqTI35wn96NlL1uKkwOkRoOxs0nAvVWKUQBzwsGvoEGJBFdazdxwPwjPQ
 FGzLhLfH8FPHA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:17 +0100
Subject: [PATCH v4 06/45] drm/tests: connector: Add tests for
 drmm_connector_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-6-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7273; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3X0my8D9PYgi7EcRYdh/ciCZnSzC7V4KrXKwBufu/RU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y+WV9joJ/mFc+6fInpil2zk3YA9xl3yXgukNSNrW
 i/rpi3uKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwESEtjIy/GN3fJF6asbkBW0/
 t/98+WJ14YKDT/R6nbIrrvQlXf5zZinDP4XH06U/6K0tnNn9wsf8vabUV2/xS2nMKYrnU+9/7BS
 YyAoA
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
 drivers/gpu/drm/tests/drm_connector_test.c | 219 ++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..4951b5b121a2 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -3,10 +3,224 @@
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
+ * Test that the registration of a connector without a DRM device fails.
+ */
+static void drm_test_drmm_connector_init_null_device(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_init(NULL, &priv->connector,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a NULL connector fails.
+ */
+static void drm_test_drmm_connector_init_null_connector(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, NULL,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector without any callbacks
+ * fails.
+ */
+static void drm_test_drmm_connector_init_null_funcs(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, &priv->connector,
+				  NULL,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
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
+	KUNIT_CASE(drm_test_drmm_connector_init_null_connector),
+	KUNIT_CASE(drm_test_drmm_connector_init_null_ddc),
+	KUNIT_CASE(drm_test_drmm_connector_init_null_device),
+	KUNIT_CASE(drm_test_drmm_connector_init_null_funcs),
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
@@ -70,7 +284,10 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
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
2.41.0

