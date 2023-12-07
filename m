Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F243808C3C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59D710E8E4;
	Thu,  7 Dec 2023 15:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436B10E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F02AEB826B4;
 Thu,  7 Dec 2023 15:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2D5C433C8;
 Thu,  7 Dec 2023 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964179;
 bh=QsiPo+B04Y1hXaUVj9yAPd4DGQRLjHkQnobeAYrsDpM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Be8MtWZJrnQ1Dmcwkd96YSXsO2k9D9uiMPAS4D6bp1dTRLuTpA+ZpugEZXpfSk/+R
 G1nc+Qn9XXlSB7//TH0xr6Mrj+QrebFEpLKEd+UD6bBVBck3JHhpbuQDx+RP+ONw+H
 RFOtS/SnT7lOpwRKdfKrcI4RXIdf7rMhp9qTT3dkCh+6bs1/hgMghJYdl4oz9rD8Gv
 jKrudjL7UxelgndrurU+VmIetKJ7l8o5Twv9T5GEbZ9RkOzY8+hmiD86dBZxAbQTLb
 s3h80QFs3FpnsB0HJ+IeTzuL/Q+HNnhLOo/aUXciC2LfQTKDGWyJsH6nEdtL4IsQd/
 kAl83OXflnL6A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:26 +0100
Subject: [PATCH v5 03/44] drm/tests: Add helper to create mock plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-3-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4849; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QsiPo+B04Y1hXaUVj9yAPd4DGQRLjHkQnobeAYrsDpM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1t4trsEqOaufaWhZar1aMP0FY2iovpLAsWO7/jif
 //Z2UbmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkgBvD/7Avqxt3iclcOK+V
 eih0vZVm2xaJLed/aYvONxd8raTPspyRYY6mblIvl/ffxSyRbf/j2Xi2Hww5WeL087ssr258YdE
 XXgA=
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

We're going to need a full-blown, functional, KMS device to test more
components of the atomic modesetting infrastructure.

Let's add a new helper to create a dumb, mocked, primary plane. By
default, it will create a linear XRGB8888 plane, using the default
helpers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 85 +++++++++++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           | 11 ++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 272a3ba46d60..e0778a7ec260 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
 
@@ -236,5 +237,89 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_atomic_state_alloc);
 
+static const uint32_t default_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const uint64_t default_plane_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const struct drm_plane_helper_funcs default_plane_helper_funcs = {
+};
+
+static const struct drm_plane_funcs default_plane_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.reset			= drm_atomic_helper_plane_reset,
+};
+
+/**
+ * drm_kunit_helper_create_primary_plane - Creates a mock primary plane for a KUnit test
+ * @test: The test context object
+ * @drm: The device to alloc the plane for
+ * @funcs: Callbacks for the new plane. Optional.
+ * @helper_funcs: Helpers callbacks for the new plane. Optional.
+ * @formats: array of supported formats (DRM_FORMAT\_\*). Optional.
+ * @num_formats: number of elements in @formats
+ * @modifiers: array of struct drm_format modifiers terminated by
+ *             DRM_FORMAT_MOD_INVALID. Optional.
+ *
+ * This allocates and initializes a mock struct &drm_plane meant to be
+ * part of a mock device for a KUnit test.
+ *
+ * Resources will be cleaned up automatically.
+ *
+ * @funcs will default to the default helpers implementations.
+ * @helper_funcs will default to an empty implementation. @formats will
+ * default to XRGB8888 only. @modifiers will default to a linear
+ * modifier only.
+ *
+ * Returns:
+ * A pointer to the new plane, or an ERR_PTR() otherwise.
+ */
+struct drm_plane *
+drm_kunit_helper_create_primary_plane(struct kunit *test,
+				      struct drm_device *drm,
+				      const struct drm_plane_funcs *funcs,
+				      const struct drm_plane_helper_funcs *helper_funcs,
+				      const uint32_t *formats,
+				      unsigned int num_formats,
+				      const uint64_t *modifiers)
+{
+	struct drm_plane *plane;
+
+	if (!funcs)
+		funcs = &default_plane_funcs;
+
+	if (!helper_funcs)
+		helper_funcs = &default_plane_helper_funcs;
+
+	if (!formats || !num_formats) {
+		formats = default_plane_formats;
+		num_formats = ARRAY_SIZE(default_plane_formats);
+	}
+
+	if (!modifiers)
+		modifiers = default_plane_modifiers;
+
+	plane = __drmm_universal_plane_alloc(drm,
+					     sizeof(struct drm_plane), 0,
+					     0,
+					     funcs,
+					     formats,
+					     num_formats,
+					     default_plane_modifiers,
+					     DRM_PLANE_TYPE_PRIMARY,
+					     NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
+
+	drm_plane_helper_add(plane, helper_funcs);
+
+	return plane;
+}
+EXPORT_SYMBOL_GPL(drm_kunit_helper_create_primary_plane);
+
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 3ae19892229d..38667d624aa8 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -10,6 +10,8 @@
 #include <kunit/test.h>
 
 struct drm_device;
+struct drm_plane_funcs;
+struct drm_plane_helper_funcs;
 struct kunit;
 
 struct device *drm_kunit_helper_alloc_device(struct kunit *test);
@@ -99,4 +101,13 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
 				    struct drm_device *drm,
 				    struct drm_modeset_acquire_ctx *ctx);
 
+struct drm_plane *
+drm_kunit_helper_create_primary_plane(struct kunit *test,
+				      struct drm_device *drm,
+				      const struct drm_plane_funcs *funcs,
+				      const struct drm_plane_helper_funcs *helper_funcs,
+				      const uint32_t *formats,
+				      unsigned int num_formats,
+				      const uint64_t *modifiers);
+
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.43.0

