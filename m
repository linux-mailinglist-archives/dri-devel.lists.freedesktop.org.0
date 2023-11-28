Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544EA7FB720
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9F310E482;
	Tue, 28 Nov 2023 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7A310E47E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:24:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCEE9616D4;
 Tue, 28 Nov 2023 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB85C433C8;
 Tue, 28 Nov 2023 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167070;
 bh=GttmzrDWIK/GfBZPgJoa7M3MmKe5Xdi8JByTyUrEs+k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=u9JYllTCMX3DyNqCdnT8eP5XiONz5FvM7ibbDBtk7gwBCR26iV5lzZFwn3wl5Dvjs
 Hq2CojmuizBIEf0LSVn+2346rG98vuzoSyJoZVaCeyUEhlBh20dLZ92CWHfcAUfT6s
 64ghGCqlHT5hlbEZreY5gqjbMVFa65780h/Z1ZHg91dBHlYxoeqqutmJOUAeE1wnsW
 b0C/n8mfX9W8xW7IWT/9BUCxcsafOpjcpcsJgg2Bk4A0EWnCv5VZFJ6fM2TE207R06
 6pLOz32DpTkhPmbAez6F5l6DlgoFGf1egcgFAvEpuZ1zRe+sdfiwiJR4vRpNB0ZjoN
 gbQMimOhnmcFQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:14 +0100
Subject: [PATCH v4 03/45] drm/tests: Add helper to create mock plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-3-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4850; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GttmzrDWIK/GfBZPgJoa7M3MmKe5Xdi8JByTyUrEs+k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y/ud68R0A+5t9qt6qhWR2na6p9711pfzlzRo5uwZ
 3Hf+fivHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI8XWGX8yaWY84PvM+2bVT
 bVPFrvn2U79k5710ljzPNvF8wLmQxWWMDFszn0oVCz4wDlz5+PvcJSx63zrCjUv8/kcVPohMfrq
 1iwMA
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
index 272a3ba46d60..4a1559424396 100644
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
+ * @format_count: number of elements in @formats
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
2.41.0

