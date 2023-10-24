Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8CC7D5B27
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAD410E47B;
	Tue, 24 Oct 2023 19:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B551510E482
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5B32E408F8;
 Tue, 24 Oct 2023 21:10:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4frr9Gg0Sn6U; Tue, 24 Oct 2023 21:10:17 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174617; bh=DiKl2koVnBGX21+lmWWRQuD/jkk8B2lf0cH1gy4HOp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BcYmTDSHRwuT7i0oke0GdbnHuyaHsPD6fuHJ2iq6zvYjItePZwDv3v+bgbS8R9Rcs
 2fzgHzAbYcA3OjsOblNVhtX3REThDlNth+vMOeywMTqOKQIQGpJEEa5PhGrWFTgrk3
 jFHblFDrkGNqVR894IAvsVHzorZW8uJ6p+3kMcHTRPcMNIxUcisFO9I57cVllpc5M4
 p1PRJqmUMy33y3cvOBcBPf1bisU1nVdYUosvIL5PNbMzP2eYlNF1zq0rfVd0bZ2//o
 HP3uNKnK3Dm79CQ+BIKPs3dVSvU3GxcFXqn5UWTHZ1hD+oEuEphX2oyhfBHySuAw9/
 9rb/SrsQe8sMA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/11] drm/tests: Stop using deprecated dev_private member
 on drm_framebuffer tests
Date: Tue, 24 Oct 2023 16:09:52 -0300
Message-ID: <20231024191002.1620-2-gcarlos@disroot.org>
In-Reply-To: <20231024191002.1620-1-gcarlos@disroot.org>
References: <20231024191002.1620-1-gcarlos@disroot.org>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_private member of drm_device is deprecated and its use should
be avoided. Stop using it by embedding the drm_device onto a mock struct
with a void pointer like dev_private, using it instead.

Also start using drm_kunit_helper_alloc_drm_device() for allocating
the drm_device mock.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Start using drm_kunit_helper_alloc_drm_device() for drm_device mock.
  - Rename struct drm_mock to drm_framebuffer_test_priv
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 42 ++++++++++++++------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index f759d9f3b76e..9c6170edd5f7 100644
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
@@ -317,11 +319,17 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 },
 };
 
+struct drm_framebuffer_test_priv {
+	struct drm_device dev;
+	void *private;
+};
+
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
 					      struct drm_file *file_priv,
 					      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	int *buffer_created = dev->dev_private;
+	struct drm_framebuffer_test_priv *priv = container_of(dev, typeof(*priv), dev);
+	int *buffer_created = priv->private;
 	*buffer_created = 1;
 	return ERR_PTR(-EINVAL);
 }
@@ -332,29 +340,37 @@ static struct drm_mode_config_funcs mock_config_funcs = {
 
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
+	struct drm_framebuffer_test_priv *priv = test->priv;
+	struct drm_device *dev = &priv->dev;
 	int buffer_created = 0;
 
-	mock->dev_private = &buffer_created;
-	drm_internal_framebuffer_create(mock, &params->cmd, NULL);
+	priv->private = &buffer_created;
+	drm_internal_framebuffer_create(dev, &params->cmd, NULL);
 	KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
 }
 
-- 
2.41.0

