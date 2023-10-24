Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735947D5B38
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1771710E480;
	Tue, 24 Oct 2023 19:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D025E10E482
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8AB0F41ABF;
 Tue, 24 Oct 2023 21:10:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3nnleWsHl9O; Tue, 24 Oct 2023 21:10:57 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174657; bh=L00NlW2dLKkJxsszs3+whc7LDl3yiKAj88AsbZ8oQxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aLz9xXAOTolBp+kU8ftBK4rySfqyCIdAHkFcwRopyI4cBiMQac8NUnxXIA2jUV/Qk
 LRTqUIjTLa+tCm+cPSW6uOESpnhJAPl1fnuXEpK0z19HfnVxvAvpNkab7ZIHYIZutE
 zaiUN6ftbIXiit408TjiVJ0aIjTn8cTPY4G8a9laVc3TYGyizCZCGH3geT7bSKWVZA
 1YzLRGkvdhMMCGkLlZ43eg/SHw0K9QyzUysQo4JPsfNuZyWUQQJoG76yydPKW6GBRL
 7cIgOEv58EUgoWwX/s+C9A94zAypYGNYtS3PsL+2ayEWUu++s23QNOVSBhHuCIAM/P
 ZCd8aGO5BBWyg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/11] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Date: Tue, 24 Oct 2023 16:09:56 -0300
Message-ID: <20231024191002.1620-6-gcarlos@disroot.org>
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

Add a parametrized test for the drm_framebuffer_check_src_coords function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Order kunit cases alphabetically.
  - Rename check_src_coords_case to drm_framebuffer_check_src_coords_case.
  - Remove unnecessary comments.
  - Add framebuffer size as a parameter and use edge values.
---
 drivers/gpu/drm/drm_framebuffer.c            |  1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 61 ++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d3ba0698b84b..a4b264e4ac97 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -99,6 +99,7 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 
 	return 0;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_check_src_coords);
 
 /**
  * drm_mode_addfb - add an FB to the graphics configuration
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 8a9b6d08d639..7b51862fb0f2 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_print.h>
@@ -430,7 +431,67 @@ static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, buffer_created);
 }
 
+/* Parameters for testing drm_framebuffer_check_src_coords function */
+struct drm_framebuffer_check_src_coords_case {
+	const char *name;
+	const int expect;
+	const unsigned int fb_size;
+	const uint32_t src_x;
+	const uint32_t src_y;
+
+	/* Deltas to be applied on source */
+	const uint32_t dsrc_w;
+	const uint32_t dsrc_h;
+};
+
+static const struct drm_framebuffer_check_src_coords_case
+drm_framebuffer_check_src_coords_cases[] = {
+	{ .name = "Success: source fits into fb",
+	  .expect = 0,
+	},
+	{ .name = "Fail: overflowing fb with x-axis coordinate",
+	  .expect = -ENOSPC, .src_x = 1, .fb_size = UINT_MAX,
+	},
+	{ .name = "Fail: overflowing fb with y-axis coordinate",
+	  .expect = -ENOSPC, .src_y = 1, .fb_size = UINT_MAX,
+	},
+	{ .name = "Fail: overflowing fb with source width",
+	  .expect = -ENOSPC, .dsrc_w = 1, .fb_size = UINT_MAX - 1,
+	},
+	{ .name = "Fail: overflowing fb with source height",
+	  .expect = -ENOSPC, .dsrc_h = 1, .fb_size = UINT_MAX - 1,
+	},
+};
+
+static void drm_test_framebuffer_check_src_coords(struct kunit *test)
+{
+	const struct drm_framebuffer_check_src_coords_case *params = test->param_value;
+	const uint32_t src_x = params->src_x;
+	const uint32_t src_y = params->src_y;
+	const uint32_t src_w = (params->fb_size << 16) + params->dsrc_w;
+	const uint32_t src_h = (params->fb_size << 16) + params->dsrc_h;
+	const struct drm_framebuffer fb = {
+		.width  = params->fb_size,
+		.height = params->fb_size
+	};
+	int ret;
+
+	ret = drm_framebuffer_check_src_coords(src_x, src_y, src_w, src_h, &fb);
+	KUNIT_EXPECT_EQ(test, ret, params->expect);
+}
+
+static void
+check_src_coords_test_to_desc(const struct drm_framebuffer_check_src_coords_case *t,
+			      char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(check_src_coords, drm_framebuffer_check_src_coords_cases,
+		  check_src_coords_test_to_desc);
+
 static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
 	{ }
-- 
2.41.0

