Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BCA2B01F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F49B10E90E;
	Thu,  6 Feb 2025 18:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IBixXvFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173DA10E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4304344264;
 Thu,  6 Feb 2025 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBTI6/Bcswhpw8thl+NLYiq9PLKUDYQ9vhvmnSdscmM=;
 b=IBixXvFRbyY/P5+MTKGjMacyLR8bGcsqgmm3KY22v1Cdo5rb6K7WZ5F8RqhTqswlBLkos/
 zhyJFtk3xhdqU3oinvUwC1iBIIGjcv9cDVU0YfxcmNXBNNVMDGlCu5TzgeHCR3/Gc/8mpy
 yn17NVwxcEf09RzdlxcM7xZ/9LnoHtKoSw+GhgENWZhNG6E7dATtzsEAmNqt5N4ZZNYVe2
 o9lPiF/vWt1BkXJTDrWU/5veT4QYSoeVE4rxlek/bUdmFYppcYqtOI6Ym4KfICaRafaRW3
 f3/d2BABH6ZjtJoNFriDF2Ttdg8h89KgN+9/OpTEBuEdqf46Ts474RUtfPOHVg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:34 +0100
Subject: [PATCH v6 19/26] drm/tests: bridge: add KUnit tests for DRM
 bridges (init and destroy)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-19-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
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
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Add a basic KUnit test for the newly introduced drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v6:
 - update to new drm_bridge_alloc() API
 - remove drm_test_drm_bridge_put test, not straightforward to write with
   the new API and the current notification mechanism
 - do not allocate a drm_device: a bridge is allocated without one
 - rename some identifiers for easier code reading

This patch was added in v5.
---
 drivers/gpu/drm/tests/Makefile          |  1 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 72 +++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

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
index 0000000000000000000000000000000000000000..dc5e9260cedaa29126fd6af25a6ba2f6eee05a87
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for DRM bridges
+ */
+
+#include <drm/drm_bridge.h>
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+
+struct drm_bridge_test_ctx {
+	struct device *dev;
+};
+
+/*
+ * Mimick the typical struct defined by a bridge driver, which embeds a
+ * bridge plus other fields.
+ */
+struct dummy_drm_bridge {
+	int dummy; // ensure we test non-zero @bridge offset
+	struct drm_bridge bridge;
+};
+
+static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
+};
+
+static int drm_test_bridge_init(struct kunit *test)
+{
+	struct drm_bridge_test_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
+
+	test->priv = ctx;
+	return 0;
+}
+
+/*
+ * Test that the allocation and initialization of a bridge works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_drm_bridge_alloc(struct kunit *test)
+{
+	struct drm_bridge_test_ctx *ctx = test->priv;
+	struct dummy_drm_bridge *dummy;
+
+	dummy = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
+				      &drm_bridge_dummy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);
+}
+
+static struct kunit_case drm_bridge_alloc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_alloc),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_alloc_test_suite = {
+	.name = "drm_bridge_alloc",
+	.init = drm_test_bridge_init,
+	.test_cases = drm_bridge_alloc_tests,
+};
+
+kunit_test_suites(
+	&drm_bridge_alloc_test_suite,
+);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
+MODULE_LICENSE("GPL");

-- 
2.34.1

