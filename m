Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAB5B0DBE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EFE10E866;
	Wed,  7 Sep 2022 20:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A0F10E866
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 20:05:42 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MNCtF70mVz9sdZ;
 Wed,  7 Sep 2022 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662581142; bh=cQj2iyDMliA/bCXjKY1ERkLILYcbmwXjdapERd70sJw=;
 h=From:To:Cc:Subject:Date:From;
 b=IVYuHBPOotuFsRzV32LbQk59Nc2o4WCdJfrgxVk5bMUHzU8Bw4h/w0fHqaORrX2nS
 cNHd0VjAIj5bxXkUcRsQSwFW/vm3d/lt0C+0dtzTqNuHaCXlQu6npq+Vfq3D9g+lsZ
 MWe5R0L7WgitZAZIRoKN6SikWSw9GVfVd+r/v2GA=
X-Riseup-User-ID: 1C140A385A49F8B23FC455DD0D05073008D1958C1D7500AFA0B2AB16478369AB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MNCt66jTPz5vh4;
 Wed,  7 Sep 2022 20:05:34 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Gow <davidgow@google.com>, brendanhiggins@google.com,
 Arthur Grillo <arthur.grillo@usp.br>, michal.winiarski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 1/2] drm/tests: Split drm_framebuffer_create_test into
 parameterized tests
Date: Wed,  7 Sep 2022 17:02:46 -0300
Message-Id: <20220907200247.89679-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The igt_check_drm_framebuffer_create is based on a loop that executes
tests for all createbuffer_tests test cases. This could be better
represented by parameterized tests, provided by KUnit.

So, convert the igt_check_drm_framebuffer_create into parameterized tests.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: David Gow <davidgow@google.com>
---
v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
- Use .init for mock_drm_device instead of a global variable. (Michał Winiarski)
- Add Michał's Reviewed-by tag.

v2 -> v3: https://lore.kernel.org/dri-devel/20220901124210.591994-1-mairacanal@riseup.net/
- Add David's Reviewed-by tag.
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 45 ++++++++++++--------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index ec7a08ba4056..6b6f6ff4f591 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -25,7 +25,7 @@ struct drm_framebuffer_test {
 	const char *name;
 };
 
-static struct drm_framebuffer_test createbuffer_tests[] = {
+static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 { .buffer_created = 1, .name = "ABGR8888 normal sizes",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_ABGR8888,
 		 .handles = { 1, 0, 0 }, .pitches = { 4 * 600, 0, 0 },
@@ -330,43 +330,52 @@ static struct drm_mode_config_funcs mock_config_funcs = {
 	.fb_create = fb_create_mock,
 };
 
-static struct drm_device mock_drm_device = {
-	.mode_config = {
+static int drm_framebuffer_test_init(struct kunit *test)
+{
+	struct drm_device *mock;
+
+	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
+
+	mock->mode_config = (struct drm_mode_config) {
 		.min_width = MIN_WIDTH,
 		.max_width = MAX_WIDTH,
 		.min_height = MIN_HEIGHT,
 		.max_height = MAX_HEIGHT,
 		.funcs = &mock_config_funcs,
-	},
-};
+	};
 
-static int execute_drm_mode_fb_cmd2(struct drm_mode_fb_cmd2 *r)
+	test->priv = mock;
+	return 0;
+}
+
+static void drm_test_framebuffer_create(struct kunit *test)
 {
+	const struct drm_framebuffer_test *params = test->param_value;
+	struct drm_device *mock = test->priv;
 	int buffer_created = 0;
 
-	mock_drm_device.dev_private = &buffer_created;
-	drm_internal_framebuffer_create(&mock_drm_device, r, NULL);
-	return buffer_created;
+	mock->dev_private = &buffer_created;
+	drm_internal_framebuffer_create(mock, &params->cmd, NULL);
+	KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
 }
 
-static void igt_check_drm_framebuffer_create(struct kunit *test)
+static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
 {
-	int i = 0;
-
-	for (i = 0; i < ARRAY_SIZE(createbuffer_tests); i++) {
-		KUNIT_EXPECT_EQ_MSG(test, createbuffer_tests[i].buffer_created,
-				    execute_drm_mode_fb_cmd2(&createbuffer_tests[i].cmd),
-		     "Test %d: \"%s\" failed\n", i, createbuffer_tests[i].name);
-	}
+	strcpy(desc, t->name);
 }
 
+KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
+		  drm_framebuffer_test_to_desc);
+
 static struct kunit_case drm_framebuffer_tests[] = {
-	KUNIT_CASE(igt_check_drm_framebuffer_create),
+	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	{ }
 };
 
 static struct kunit_suite drm_framebuffer_test_suite = {
 	.name = "drm_framebuffer",
+	.init = drm_framebuffer_test_init,
 	.test_cases = drm_framebuffer_tests,
 };
 
-- 
2.37.3

