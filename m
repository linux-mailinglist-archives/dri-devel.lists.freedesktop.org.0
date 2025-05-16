Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2CABA105
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872510EB2B;
	Fri, 16 May 2025 16:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WitPjM45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C603210EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:48:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1805439C3;
 Fri, 16 May 2025 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747414125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQrmPmkpZLcvYwzVyIcePfVAEoL0IdnmeRCnBsVn4Rs=;
 b=WitPjM45siFcCw96knYm6XtevTudsV5ENtd7wJBmPN4Rc9EoSceN4Zyw9kyMra6Zm+Vder
 2+UwNe5ork0e99LkrJ6Bm0STiTWKGU3jK1TW+SQrV5KufimwzDUaRWijOU1RAYuXx+GmIN
 n6e3q1qxSphY+kXRY2G25wZKZyi30MnLtC1fouXotJWGupHM+Tk4aD2587vpM4wujq1jqL
 BLRBlEHX7cZAHq7y079Iaid+WuuT46o+GHLwRnLOgZQB0P8JYLoetSU/jSCelMH+X7sguG
 m9cxUwdBr1B+Bgbi2B9l8hhzOt+GvXNcZi16wYZSU2JAFsSve4y8DUOHzzoRjQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 May 2025 18:48:39 +0200
Subject: [PATCH v8 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-drm-bridge-alloc-doc-test-v8-3-7e356fd58ba5@bootlin.com>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhumhgrghesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepphgruhhlkhesshihshdqsggrshgvrdhiohdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
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

Add KUnit tests for the newly introduced devm_drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v8:
 - rebase on new patch converting drm_bridge_test.c to
   devm_drm_bridge_alloc()
 - add check that bridge is removed (thanks to the .destroy callback)
 - add a check with get/put

Changed in v7:
 - rebase on current drm-misc-next, which now has a drm_bridge_test.c file
 - cleanup commit message

Changed in v6:
 - update to new devm_drm_bridge_alloc() API
 - remove drm_test_drm_bridge_put test, not straightforward to write with
   the new API and the current notification mechanism
 - do not allocate a drm_device: a bridge is allocated without one
 - rename some identifiers for easier code reading

This patch was added in v5.
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index f3a625c536f610dc8560b56531056df7c613f564..32db3a82fe6d14a3e9d6536bcf4b19f1bc65969a 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -8,6 +8,7 @@
 #include <drm/drm_bridge_helper.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include <kunit/device.h>
 #include <kunit/test.h>
 
 /*
@@ -21,6 +22,7 @@ struct dummy_drm_bridge {
 	unsigned int enable_count;
 	unsigned int disable_count;
 	struct drm_bridge bridge;
+	void *data;
 };
 
 struct drm_bridge_init_priv {
@@ -422,11 +424,93 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
 	.test_cases = drm_bridge_helper_reset_crtc_tests,
 };
 
+struct drm_bridge_alloc_test_ctx {
+	struct device *dev;
+	struct dummy_drm_bridge *dummy_br;
+	bool destroyed;
+};
+
+static void dummy_drm_bridge_destroy(struct drm_bridge *bridge)
+{
+	struct dummy_drm_bridge *dummy_br = bridge_to_dummy_bridge(bridge);
+	struct drm_bridge_alloc_test_ctx *ctx = (struct drm_bridge_alloc_test_ctx *)dummy_br->data;
+
+	ctx->destroyed = true;
+}
+
+static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
+	.destroy = dummy_drm_bridge_destroy,
+};
+
+static int drm_test_bridge_alloc_init(struct kunit *test)
+{
+	struct drm_bridge_alloc_test_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
+
+	test->priv = ctx;
+
+	ctx->dummy_br = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
+					      &drm_bridge_dummy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dummy_br);
+
+	ctx->dummy_br->data = ctx;
+
+	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
+
+	return 0;
+}
+
+static void drm_test_drm_bridge_alloc_basic(struct kunit *test)
+{
+	struct drm_bridge_alloc_test_ctx *ctx = test->priv;
+
+	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
+
+	kunit_device_unregister(test, ctx->dev);
+	KUNIT_ASSERT_TRUE(test, ctx->destroyed);
+}
+
+static void drm_test_drm_bridge_alloc_get_put(struct kunit *test)
+{
+	struct drm_bridge_alloc_test_ctx *ctx = test->priv;
+
+	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
+
+	drm_bridge_get(&ctx->dummy_br->bridge);
+	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
+
+	kunit_device_unregister(test, ctx->dev);
+	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
+
+	drm_bridge_put(&ctx->dummy_br->bridge);
+	KUNIT_ASSERT_TRUE(test, ctx->destroyed);
+}
+
+static struct kunit_case drm_bridge_alloc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_alloc_basic),
+	KUNIT_CASE(drm_test_drm_bridge_alloc_get_put),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_alloc_test_suite = {
+	.name = "drm_bridge_alloc",
+	.init = drm_test_bridge_alloc_init,
+	.test_cases = drm_bridge_alloc_tests,
+};
+
 kunit_test_suites(
 	&drm_bridge_get_current_state_test_suite,
 	&drm_bridge_helper_reset_crtc_test_suite,
+	&drm_bridge_alloc_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+
 MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
 MODULE_LICENSE("GPL");

-- 
2.49.0

