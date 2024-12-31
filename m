Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDBA9FEED5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028B410E64A;
	Tue, 31 Dec 2024 10:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YZ34XH8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1DB10E646
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:40:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D81FF808;
 Tue, 31 Dec 2024 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735641629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8pur7/mdaBDK3Ok0R7BqviMkiAqadB8vn4pZnI/S7c=;
 b=YZ34XH8GutkTLZ+aFI/dpqCvBNef9HrvqXC72uGgH6hRP5vrnLsv/1mDSiKRvrfy0rhYu0
 9+vjk9S0nQGJeaefEjZ9vlA/9mmIMRtkcQiiH/r9JiE/GQpyxH5JMTdE7AOVQnvAfTx1ha
 tdM/n8EEuUGqUF8QIBpvEEm1RRpFPRfQwpHCtKuu0SfARLAdEpIoDSXa2qyzm8/+v6P3df
 vPQrMna3ZU6EGDpi20o/3rwLl+KP6uys3EINDDT6mJChWhHAOZXFXUTjAlDbmHJSYImPN7
 WL9sBUfcYQ9frYMoURtu318JpIwpwPH2okiZTVrVO9Ae/ZWjnSh6/VApVmpopw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:39:59 +0100
Subject: [PATCH v5 05/10] drm/tests: bridge: add KUnit tests for DRM
 bridges (init and destroy)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-5-173065a1ece1@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add two simple KUnit tests for the newly introduced drm_bridge_init() and
the corresponding .destroy deallocation function.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/tests/Makefile          |   1 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 128 ++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 56dab563abd7a7ee7c147bd6b4927e2436b82e1d..909f98a132bb1d057b2666e8b891683ffb11cca4 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_bridge_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..b42e6b81a904abccfe1b3e88999b64cc6b2d4946
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for DRM bridges
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+struct drm_bridge_init_priv {
+	struct drm_device drm;
+	bool destroyed;
+};
+
+/*
+ * Mimick the typical struct defined by a bridge driver, which embeds a
+ * bridge plus other fields.
+ */
+struct dummy_drm_bridge {
+	struct drm_bridge_init_priv *init_priv;
+	struct drm_bridge bridge;
+};
+
+static struct dummy_drm_bridge *bridge_to_dummy(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct dummy_drm_bridge, bridge);
+}
+
+static void dummy_drm_bridge_destroy(struct drm_bridge *bridge)
+{
+	struct dummy_drm_bridge *dummy = bridge_to_dummy(bridge);
+
+	dummy->init_priv->destroyed = true;
+	kfree(dummy);
+}
+
+static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
+	.destroy		= dummy_drm_bridge_destroy,
+};
+
+static int drm_test_bridge_init(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_bridge_init_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	test->priv = priv;
+	return 0;
+}
+
+/*
+ * Test that the allocation and initialization of a bridge works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_drm_bridge_init(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv = test->priv;
+	struct dummy_drm_bridge *dummy;
+	int ret;
+
+	dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);
+
+	dummy->init_priv = priv;
+
+	ret = drm_bridge_init(priv->drm.dev,
+			      &dummy->bridge,
+			      &drm_bridge_dummy_funcs);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_FALSE(test, priv->destroyed);
+}
+
+/*
+ * Test that the allocation and initialization of a bridge works as expected
+ * and doesn't report any error, and that the destroy func is called at the
+ * last drm_bridge_put().
+ */
+static void drm_test_drm_bridge_put(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv = test->priv;
+	struct dummy_drm_bridge *dummy;
+	int ret;
+
+	dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);
+
+	dummy->init_priv = priv;
+
+	ret = drm_bridge_init(priv->drm.dev,
+			      &dummy->bridge,
+			      &drm_bridge_dummy_funcs);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	drm_bridge_get(&dummy->bridge);
+	drm_bridge_put(&dummy->bridge);
+	KUNIT_EXPECT_FALSE(test, priv->destroyed);
+	drm_bridge_put(&dummy->bridge);
+	KUNIT_EXPECT_TRUE(test, priv->destroyed);
+}
+
+static struct kunit_case drm_bridge_init_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_init),
+	KUNIT_CASE(drm_test_drm_bridge_put),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_init_test_suite = {
+	.name = "drm_bridge_init",
+	.init = drm_test_bridge_init,
+	.test_cases = drm_bridge_init_tests,
+};
+
+kunit_test_suites(
+	&drm_bridge_init_test_suite,
+);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
+MODULE_LICENSE("GPL");

-- 
2.34.1

