Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77A951D47
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D38110E4B7;
	Wed, 14 Aug 2024 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K3jN91+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6544810E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 536561C000B;
 Wed, 14 Aug 2024 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oh5J5yJD1QGXQVNHCbk2GC0MqGv1gEpAaQW/069rk7E=;
 b=K3jN91+Kx3zJmu5DOH+VR/lCakJNEz3osLVwNK/5/8HdfAidm8TwP+lQhCMvz6SnfMYL7G
 J+cnoWE9mSk0pbKt27mAJI2VSvv+uksRK8SI5qRMI9U/nH2i5KmthbvC5u2lEXWgdGMO9a
 C7aBjVNHHpXgrZjD7Iw1HfMTlPbaBhOmqHLV0Z5ltO043AZvtrDPy7QMaVtn3gP58JWn9R
 9t4xSGTbACmwMctANsHqYSmczN0JO29C2Zt0bzgn/naE/Kn+ENqhPAC3fBXBLm93scka/F
 4Y0XgncbqNq9haVStqB4MVZhH4Lbmcl9ekW264MFqYcreP8Y1inyPHpTbCQdjQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:37 +0200
Subject: [PATCH RFC 15/15] drm/vkms: Add test for config structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-15-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6983;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IzCagxCQflBHvQnmqL8UXu+1mbrEZiyd8TFVurkvc4Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDrRPo9xTG6T0MkQPgb/eR9WdxHXLHpuhS3/
 zCR4KmcVIyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6wAKCRAgrS7GWxAs
 4iJdD/wOfjpz39KFwiLAqQRxLg8+8Y9opnQ/2NpCNdKRAXp95hA9y1KJX3e+OQf11SzOwl/5Ffc
 9VR27pfOH2BUbnMnCtBCbyrw0gtwdGAb8K0YRXOgk4oi/ZrHOUfHFV5AAAVvHLsbr+rHdgW7WdH
 OS1/QMu4fky2YNPNib6AA4CFQD9bR9sQUuUlWE16KQPpqUc+ABP290J1z8kY/S08oIzRyQpkEGI
 YPd+n49wTGfVKFAHF350vEl/uK4ezCAmAquDn6MPhqiL43axuDiD8wgn4xGPC8qwTAZVXgQGg1q
 V3Lxx6/LXybp6+dEJe6trJwvMYnD9LSvNZXAFYcCmEBvPBs/jz3o0XNB3b85PJFtxsGu33z9TDg
 BLH5vjvij32u27bIUdhSsneSqKQe0teDfyvaLPjlYt/YkZGZd0VvdBMAwTYGGAOtUg6VRSdNdgc
 GgYG+lcOCTA3tbms86f3AAy1uHKylWB7em1cJZ1PdnSXEAAA4epdF1+40tvCT0Wnio2WEU2GcFI
 4YmshbY6UgNBwpVh6LSIG1irGgV7RKxUM0u5rFGbh9e/vWlupF1OlRxH6fc8aY0W9BPW6z7Uwgo
 4qMfvfEu7VMimfmpp3hM7zG4+NxkMMG7RNS8iVoLQE+15r0AuaFVxf3SPy2X28QB5MQhLC9lr8w
 b1nC7tm9T57q6VA==
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
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 135 ++++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 2d1df668569e..ec71b5fe7f9d 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 000000000000..6ec0021a8df3
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include "../vkms_config.h"
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
2.44.2

