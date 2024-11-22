Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C529D62E6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED95A10EC24;
	Fri, 22 Nov 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TW0wPuCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3310EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 124F51C000F;
 Fri, 22 Nov 2024 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pZcj0NZ2YBqvq/J6zcsQjddfQSR7x65pN9aBnV0Z70=;
 b=TW0wPuCvZtLUIvB5O8cXj9uyD7EojxDl5I/0Q3Dofj86gHyLnhKpAbX7W9JSjNSeXCjLYk
 LfkSgUiaVwWcIrM468zW7jJVZv3/0gOIC5imG/8IdYtZeIDHQm5oZe4Q19LOduVu8KDJlT
 dQobElcq+yUqf/ylZlpxXAELH65eL9C2pQt+PMAw0F5jlLjw/Woc3FX0x6iecmED9ULCFc
 dAL1ks4d+zkSHve0skstAIPuU+6PcX/pcjrTpIpzb+j/GzgDcZs3uVxAMsRgek+FkTXett
 g17UF7HNbxHlpWxaO7soz6S94rQ2xVOpYdGBC4MEuv9PlyRrtjmZqEyOp+takA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:16 +0100
Subject: [PATCH RFC v2 12/18] drm/vkms: Add test for config structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-12-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7146;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oBmYPdGSswsqPrnaij5RkMl4T5hw1Ka1JTJFwGsUKVM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1QFXRgp9FfoKX1rGti1LDTphZeiZUud6LF5
 koAkx53Sp+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UAAKCRAgrS7GWxAs
 4m7RD/99H8lhoNGL5h2CeYT8EfUFiQmDiffEHDEn1cmYZ86xgSNCEUYd2Ouy4uEBYAZa7Y8EPRG
 8XA7X2JOUJNYTZvvi+hw6D/iEbc3IUNQT83qzs90KtwUvftvMea4pNSJ/bu1Jw0Ned0mkjxJdl3
 t77KufmVq8vKfM5IAqMrPTPPWGjqHWXhnqA2FGVa1M8Qi+kzhjy2aTdxaJBBQUdghhG2XxruGn0
 Md6UfFIPfsOhGPpRfTSXwcN2XQEPmu/r4evPvCrb5ASa5pjmzlrI44ooJDtehpV/4D1MSOPj90O
 PdgGpMIDvj/ezzPNLJuRFJTDfOFAjkL61yZjdxwVa0evFIYrx9Sdk0yelTB54LsOvCzVWGhqkb4
 fDIfwEjpGxJ4e1A2xI8rZbLMse6L2bX+9ki8IUEbM1Mi9Mqin6orlpBb7MrIugityljs35c4R/z
 INv0qSTdRrUJnUExl2ENFi0IhjIDkhVHOjXdpm9ZnCxpdPlKQju+RjgS11CZGQQfoEh1vcSlSPx
 A6b+KHCsiQT5tpKHkZJb2QFdx3bcywFmWQV3XxgT2W/2gvwImUtwRVRb52dFIY0w/0xCJMTUb8r
 1u3V+wTtHGMq3uM6WKBXJAXF6cZq8kg2IoESYLRGmZaHVZsCj4cY1htFI5Q9k1TT6OwYCoWjP9x
 iQKkMTBAi29kpQQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The config structure is a bit complex in term of memory management. Add
basic test to avoid breaking it in the future.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/Makefile           |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 137 ++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 2d1df668569e4f243ed9a06c1e16e595c131c4f6..ec71b5fe7f9d957eeeabd233bb75c4c250789ff4 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..12b845bc358aaa44434c6b66184cf17d19656596
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include "../vkms_config.h"
+
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
+static void vkms_config_test_basic_allocation(struct kunit *test)
+{
+	struct vkms_config *config = vkms_config_create();
+
+	KUNIT_EXPECT_TRUE_MSG(test, list_empty(&config->encoders),
+			      "Encoder list is not empty after allocation");
+	KUNIT_EXPECT_TRUE_MSG(test, list_empty(&config->crtcs),
+			      "CRTC list is not empty after allocation");
+	KUNIT_EXPECT_TRUE_MSG(test, list_empty(&config->planes),
+			      "Plane list is not empty after allocation");
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_simple_config(struct kunit *test)
+{
+	struct vkms_config *config = vkms_config_create();
+
+	struct vkms_config_plane *plane_1 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_2 = vkms_config_create_plane(config);
+	struct vkms_config_crtc *crtc = vkms_config_create_crtc(config);
+	struct vkms_config_encoder *encoder = vkms_config_create_encoder(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->planes), 2);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 1);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
+
+	plane_1->type = DRM_PLANE_TYPE_PRIMARY;
+	plane_2->type = DRM_PLANE_TYPE_CURSOR;
+
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_1, crtc), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_2, crtc), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder, crtc), 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_delete_plane(plane_1, config);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->planes), 1);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 1);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	plane_2->type = DRM_PLANE_TYPE_PRIMARY;
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_complex_config(struct kunit *test)
+{
+	struct vkms_config *config = vkms_config_create();
+
+	struct vkms_config_plane *plane_1 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_2 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_3 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_4 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_5 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_6 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_7 = vkms_config_create_plane(config);
+	struct vkms_config_plane *plane_8 = vkms_config_create_plane(config);
+	struct vkms_config_crtc *crtc_1 = vkms_config_create_crtc(config);
+	struct vkms_config_crtc *crtc_2 = vkms_config_create_crtc(config);
+	struct vkms_config_encoder *encoder_1 = vkms_config_create_encoder(config);
+	struct vkms_config_encoder *encoder_2 = vkms_config_create_encoder(config);
+	struct vkms_config_encoder *encoder_3 = vkms_config_create_encoder(config);
+	struct vkms_config_encoder *encoder_4 = vkms_config_create_encoder(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->planes), 8);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 2);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 4);
+
+	plane_1->type = DRM_PLANE_TYPE_PRIMARY;
+	plane_2->type = DRM_PLANE_TYPE_CURSOR;
+	plane_3->type = DRM_PLANE_TYPE_OVERLAY;
+	plane_4->type = DRM_PLANE_TYPE_OVERLAY;
+	plane_5->type = DRM_PLANE_TYPE_PRIMARY;
+	plane_6->type = DRM_PLANE_TYPE_CURSOR;
+	plane_7->type = DRM_PLANE_TYPE_OVERLAY;
+	plane_8->type = DRM_PLANE_TYPE_OVERLAY;
+
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_1, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_2, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_3, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_4, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_5, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_6, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_7, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_8, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_3, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_plane_attach_crtc(plane_4, crtc_2), 0);
+
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder_1, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder_2, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder_3, crtc_1), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder_3, crtc_2), 0);
+	KUNIT_EXPECT_EQ(test, vkms_config_encoder_attach_crtc(encoder_4, crtc_2), 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_delete_plane(plane_4, config);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->planes), 7);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 2);
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 4);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static struct kunit_case vkms_config_test_cases[] = {
+	KUNIT_CASE(vkms_config_test_basic_allocation),
+	KUNIT_CASE(vkms_config_test_simple_config),
+	KUNIT_CASE(vkms_config_test_complex_config),
+	{}
+};
+
+static struct kunit_suite vkms_config_test_suite = {
+	.name = "vkms-config",
+	.test_cases = vkms_config_test_cases,
+};
+
+kunit_test_suite(vkms_config_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Kunit test for vkms config utility");

-- 
2.47.0

