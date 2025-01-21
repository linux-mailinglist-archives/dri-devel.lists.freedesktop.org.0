Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71350A17C69
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0610E568;
	Tue, 21 Jan 2025 10:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JUyIfvh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2C10E564
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB25440017;
 Tue, 21 Jan 2025 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyoz6hGAiMXFfiBD2XG/lRALUOk86qPhSdruGkc+xRY=;
 b=JUyIfvh0nvn/aj8byXQJUYYj/x1+eLENlzwYKfWJQf1lB4waOxhzFSRm+sbJQBbGKqWJdu
 FUHel23dlpdnjk56WAaapODry/vy8i5+TdEKo0og1VVffjQMXPMNt2hwwm6dVk4ou7KQC9
 9rBgiTOXsI9+Ppo1zlar4jjo7A3F8DBf4PdBUWzQwKoPmwWF2f2K65WSDBipoy+CPSu7zv
 To5kgjD2A4Qv/jdHmdJQu9gxVYxu8FmlhAsQQcTTGYHXp9FhCDEDnq01n0eYAXiwhCxPoZ
 Gc3YKa1Z9+Hl0/9brllmuTIGm92ggQ3AMESTcUs6TzexMdAZL/1TNfxg7qXB6g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:34 +0100
Subject: [PATCH v3 10/16] drm/vkms: Add test for config structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-10-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7076;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TdAiaY7K4To7ayPwrxgH2o4ItNXyv04HwPf+t0hDlXQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30je8wQP1UMU1zQ0+mMW3sui59CBDtI5FAeb
 JOM9mVrelWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IwAKCRAgrS7GWxAs
 4uwYD/9I3wgiqhK37VvX20c28qoVmmFQ5I6h07ZoZqBqLp9vSsTe6wDM1xpHY9EXF7AgO5MuCAZ
 WwVpA9O4n3fkEyzddS7j8A57yNkNqEG72ouafiFBdNTQhuoNNoBfFYAtDJsVL6NPtSjIbNrY4xu
 tZx1JoeXdWkYgpL+ginfuS2g7qCGys/Nx8B3fsiFJOZ+3YCGV43SloMdafZd/+o/cZoQk/g5AIU
 LfZtwj1aE+dGOMpob5Eey70NspNzpYWeZz+ET8YP2d7Gt/A6HZDpBaZCc/V1zMXIMsiPW4sO6DN
 9d1ARtv6pyw4g4PTf9vE/pRif2LImT73U9KSU4z1WazuNVBCvBUlU2jDfLinNLPYgyVP6NijKu9
 ZLRuhEcTSObBvUPOnJKXSaMWCRii8iT0EMXTbZEJcAem1LOH/+m4/fVXigsOml30wSKk5jojwZ9
 D2K+pTxvzlJFQFNhLV/s8LpjXpgjksFsZSYokSnCK1Srhva+dgKhAsqHxkj0gAHxZBW6ernRZdd
 iUVjM5EZUAdykDuis3IFT6VWOiE4egg7f+N/jhMPkTh0MOzue/OOvI2Lv0DN5sf8ez6AyJmPa5j
 e1WU0vMbgF7UtGLCxBxv++dlepjwlpxKY1DkJO/qiozMsJHKVKrTqzJPVV3uAkYtQzcZE43BR7I
 2eG8ekubFXKEPXA==
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
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 137 ++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..b78371d08aa9531a5151225cc33e34452225832c
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..f7a2b8ecd4e1f791e9abc86659ef459e3ea8be43
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include "../vkms_config.h"
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
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
2.47.1

