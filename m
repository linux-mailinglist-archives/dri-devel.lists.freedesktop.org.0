Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A64926729
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35210E95C;
	Wed,  3 Jul 2024 17:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="JUKvRuws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725610E953
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:22 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027262; bh=ksrD/Tq/2rB6BgiXT3q4kCWNpwHrXVB98PTd7OrH8+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JUKvRuwsm58Wyf+pe4kmSajuqBorUtZRpe6lldgQs05ks1mabIJDfer2quZqj+qoe
 qMFKuPKUwJvQr76JHrSRGTYN3626ix3sVgCQNqp2HF9N39+n3MUc8xsSY0aCCkOpod
 Me+5YZ7r+jQ5WQdOAU7KsjYxQwg2olXJzdNDZghXo2wrLsLKJhxE4wnT+0kWO3Fr3b
 l9sqm1QKv464sG7YLUGZCwAbHVo9v6zMeCtUvC/jOWJ2NNWA+NYQSeQ2U91w92djay
 g74I7teRnpWGcHg/310LVy3CS2lO86gF0FdVrwYIBf+7tUdb0VC9FiQ1HPjYIpX15m
 s0lyDeHQ6c8xQ==
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: [PATCH v3 1/9] drm/tests: Stop using deprecated dev_private member on
 drm_framebuffer tests
Date: Wed,  3 Jul 2024 14:22:20 -0300
Message-ID: <20240703172228.11166-2-gcarlos@disroot.org>
In-Reply-To: <20240703172228.11166-1-gcarlos@disroot.org>
References: <20240703172228.11166-1-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The dev_private member of drm_device is deprecated and its use should
be avoided. Stop using it by embedding the drm_device onto a mock struct.

The new mock struct allows to share variables and even further mocks
over the tests in a cleaner way than using dev_private void pointer.

Also start using drm_kunit_helper_alloc_drm_device() for allocating
the drm_device mock.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Start using drm_kunit_helper_alloc_drm_device() for drm_device mock.
  - Rename struct drm_mock to drm_framebuffer_test_priv
v3:
  - Replace the use of void pointer on drm_framebuffer_test_priv struct.
  - Document struct drm_framebuffer_test_priv here.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 54 ++++++++++++++------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 06f03b78c9c4..3882a88b6631 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -8,8 +8,10 @@
 #include <kunit/test.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_print.h>
 
 #include "../drm_crtc_internal.h"
@@ -317,12 +319,25 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 },
 };
 
+/*
+ * This struct is intended to provide a way to mocked functions communicate
+ * with the outer test when it can't be achieved by using its return value. In
+ * this way, the functions that receive the mocked drm_device, for example, can
+ * grab a reference to this and actually return something to be used on some
+ * expectation.
+ */
+struct drm_framebuffer_test_priv {
+	struct drm_device dev;
+	bool buffer_created;
+};
+
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
 					      struct drm_file *file_priv,
 					      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	int *buffer_created = dev->dev_private;
-	*buffer_created = 1;
+	struct drm_framebuffer_test_priv *priv = container_of(dev, typeof(*priv), dev);
+
+	priv->buffer_created = true;
 	return ERR_PTR(-EINVAL);
 }
 
@@ -332,30 +347,37 @@ static struct drm_mode_config_funcs mock_config_funcs = {
 
 static int drm_framebuffer_test_init(struct kunit *test)
 {
-	struct drm_device *mock;
+	struct device *parent;
+	struct drm_framebuffer_test_priv *priv;
+	struct drm_device *dev;
+
+	parent = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
 
-	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
+	priv = drm_kunit_helper_alloc_drm_device(test, parent, typeof(*priv),
+						 dev, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	dev = &priv->dev;
 
-	mock->mode_config.min_width = MIN_WIDTH;
-	mock->mode_config.max_width = MAX_WIDTH;
-	mock->mode_config.min_height = MIN_HEIGHT;
-	mock->mode_config.max_height = MAX_HEIGHT;
-	mock->mode_config.funcs = &mock_config_funcs;
+	dev->mode_config.min_width = MIN_WIDTH;
+	dev->mode_config.max_width = MAX_WIDTH;
+	dev->mode_config.min_height = MIN_HEIGHT;
+	dev->mode_config.max_height = MAX_HEIGHT;
+	dev->mode_config.funcs = &mock_config_funcs;
 
-	test->priv = mock;
+	test->priv = priv;
 	return 0;
 }
 
 static void drm_test_framebuffer_create(struct kunit *test)
 {
 	const struct drm_framebuffer_test *params = test->param_value;
-	struct drm_device *mock = test->priv;
-	int buffer_created = 0;
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
 
-	mock->dev_private = &buffer_created;
-	drm_internal_framebuffer_create(mock, &params->cmd, NULL);
-	KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
+	priv->buffer_created = false;
+	drm_internal_framebuffer_create(dev, &params->cmd, NULL);
+	KUNIT_EXPECT_EQ(test, params->buffer_created, priv->buffer_created);
 }
 
 static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
-- 
2.44.2

