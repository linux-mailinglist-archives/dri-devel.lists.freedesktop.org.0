Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CE788CEC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31B910E6C4;
	Fri, 25 Aug 2023 16:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB3B10E6C4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E696140DCA;
 Fri, 25 Aug 2023 18:08:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MG5M8nFeLYlw; Fri, 25 Aug 2023 18:08:13 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979693; bh=NREuScQqpzr9B7RRBvcYJeAp/EjqDAnHFpfcC5B3YYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hjQ7ZQQtj6n657S9N5PzIeNX9GS51wi3a1UTVtQZ9uFoSZzSN0Q/5ZHFL08W24E0T
 4Unhwm6k3jEk4ZsbL17OX4EjMn8iAXtuNjrETPEGZU1cRSiyv7i3qJsz2n5p3nsYz9
 aeqluHEZcAfmGZ1PrO5w975XWHNSlzWiIHiWUm/iHj8SWv1T2xdGfb8LUaQn4Q9S5f
 dyN2xj5eAhCN+JKPsT2baXNOjOxRDmnjhDf80/ZM/E5FlR1vWsRBu7jieRhRViKOrs
 AA79QWDzKnwQ45Agx9iub5NpD4S1l7zvPWLtkMhhX44MH3Zv7k35gBhvnkZjo4Drdl
 lgSAmr7/r0nyQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/tests: Stop using deprecated dev_private member on
 drm_framebuffer tests
Date: Fri, 25 Aug 2023 13:07:16 -0300
Message-ID: <20230825160725.12861-2-gcarlos@disroot.org>
In-Reply-To: <20230825160725.12861-1-gcarlos@disroot.org>
References: <20230825160725.12861-1-gcarlos@disroot.org>
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
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_private member of drm_device is deprecated and its use should
be avoided. Stop using it by embedding the drm_device onto a mock struct
with a void pointer like dev_private, using it instead.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 29 +++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index f759d9f3b76e..173d42b145ed 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -317,11 +317,17 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 },
 };
 
+struct drm_mock {
+	struct drm_device dev;
+	void *private;
+};
+
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
 					      struct drm_file *file_priv,
 					      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	int *buffer_created = dev->dev_private;
+	struct drm_mock *mock = container_of(dev, typeof(*mock), dev);
+	int *buffer_created = mock->private;
 	*buffer_created = 1;
 	return ERR_PTR(-EINVAL);
 }
@@ -332,16 +338,18 @@ static struct drm_mode_config_funcs mock_config_funcs = {
 
 static int drm_framebuffer_test_init(struct kunit *test)
 {
-	struct drm_device *mock;
+	struct drm_mock *mock;
+	struct drm_device *dev;
 
 	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
+	dev = &mock->dev;
 
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
 
 	test->priv = mock;
 	return 0;
@@ -350,11 +358,12 @@ static int drm_framebuffer_test_init(struct kunit *test)
 static void drm_test_framebuffer_create(struct kunit *test)
 {
 	const struct drm_framebuffer_test *params = test->param_value;
-	struct drm_device *mock = test->priv;
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
 	int buffer_created = 0;
 
-	mock->dev_private = &buffer_created;
-	drm_internal_framebuffer_create(mock, &params->cmd, NULL);
+	mock->private = &buffer_created;
+	drm_internal_framebuffer_create(dev, &params->cmd, NULL);
 	KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
 }
 
-- 
2.41.0

