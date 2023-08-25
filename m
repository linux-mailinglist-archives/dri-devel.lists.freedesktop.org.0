Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A8788CF0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427210E6CA;
	Fri, 25 Aug 2023 16:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7310E6CA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 886E041280;
 Fri, 25 Aug 2023 18:08:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpwzMEPK6YY7; Fri, 25 Aug 2023 18:08:39 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979719; bh=OYfbtrnU4OnxyA4/6sFVcjPEzIje++zxCrtt6ew88QM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZLUVKpXk3Sw7HhVGGBIvg0wpa3JTiKw4h9cGyBrckZ3MknYv/OvCumHkpGTkadnR+
 5dzJiOgButzSJ6cq+ZrYy1VoeU9R/8x11uLXiGiFTmUwKHlAheKdAO9sj9f+u5B3Bw
 2ByLw1b6Yw1T+9JBZ+zZTYduYRRpiqnLEOpX7kLkSZ5BuEwoATOycR5UAqWwyZxkXM
 mdfr3Bd+N+orTWdHUc8sn58/sAUdszGXLe8p0eGUgPkC+X1gC7K6JGvwuLFfFVYVHr
 0GjpZsqGEK7XAF3AV4kBwK9NF3fA7mfrIgna74kwaEKFhs4h6dJ7+NK9khdqFa2JpH
 LbhjiXsFGBGTg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/tests: Add test for drm_framebuffer_cleanup()
Date: Fri, 25 Aug 2023 13:07:20 -0300
Message-ID: <20230825160725.12861-6-gcarlos@disroot.org>
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

Add a single KUnit test case for the drm_framebuffer_cleanup function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 0e0e8216bbbc..16d9cf4bed88 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -370,6 +370,9 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
 	dev = &mock->dev;
 
+	mutex_init(&dev->mode_config.fb_lock);
+	INIT_LIST_HEAD(&dev->mode_config.fb_list);
+	dev->mode_config.num_fb = 0;
 	dev->mode_config.min_width = MIN_WIDTH;
 	dev->mode_config.max_width = MAX_WIDTH;
 	dev->mode_config.min_height = MIN_HEIGHT;
@@ -380,6 +383,14 @@ static int drm_framebuffer_test_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_framebuffer_test_exit(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+
+	mutex_destroy(&dev->mode_config.fb_lock);
+}
+
 static void drm_test_framebuffer_create(struct kunit *test)
 {
 	const struct drm_framebuffer_test *params = test->param_value;
@@ -483,7 +494,44 @@ static void check_src_coords_test_to_desc(const struct check_src_coords_case *t,
 KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
 		  check_src_coords_test_to_desc);
 
+static void drm_test_framebuffer_cleanup(struct kunit *test)
+{
+	struct drm_mock *mock = test->priv;
+	struct drm_device *dev = &mock->dev;
+	struct list_head *fb_list = &dev->mode_config.fb_list;
+	struct drm_framebuffer fb1 = { .dev = dev };
+	struct drm_framebuffer fb2 = { .dev = dev };
+
+	/* This must result on [fb_list] -> fb1 -> fb2 */
+	list_add_tail(&fb1.head, fb_list);
+	list_add_tail(&fb2.head, fb_list);
+	dev->mode_config.num_fb = 2;
+
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb1.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb1.head.prev, fb_list);
+	KUNIT_ASSERT_PTR_EQ(test, fb1.head.next, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, &fb1.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
+
+	drm_framebuffer_cleanup(&fb1);
+
+	/* Now [fb_list] -> fb2 */
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb2.head);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, fb_list);
+	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
+	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 1);
+
+	drm_framebuffer_cleanup(&fb2);
+
+	/* Now fb_list is empty */
+	KUNIT_ASSERT_TRUE(test, list_empty(fb_list));
+	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
+}
+
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(drm_test_framebuffer_cleanup),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
@@ -493,6 +541,7 @@ static struct kunit_case drm_framebuffer_tests[] = {
 static struct kunit_suite drm_framebuffer_test_suite = {
 	.name = "drm_framebuffer",
 	.init = drm_framebuffer_test_init,
+	.exit = drm_framebuffer_test_exit,
 	.test_cases = drm_framebuffer_tests,
 };
 
-- 
2.41.0

