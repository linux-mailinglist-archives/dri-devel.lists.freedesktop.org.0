Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DA788CEF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3771810E6C6;
	Fri, 25 Aug 2023 16:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0F110E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0F21F40EFD;
 Fri, 25 Aug 2023 18:08:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJ1lN6w-bRaM; Fri, 25 Aug 2023 18:08:35 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979715; bh=66FDIYweIUmVcCsItABOpdYkcLbsfZhCHZ8Q0xFCTAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BzK9RSYa3xAajgLng8HtIFtRo/Gczz8+9nrt+C0hZbDVokIUvSZqNaJuBGCqDy9nP
 1KmBzzGyPWSebJy2IStIwBPyCaVn0ij1YRnDk5WXIeThijjm8vWnXWNzGoqMvUUhwf
 1RoPNONhTKPiKX+OomxQMCICYcH3N4ERSYIuNSBWWlvoYHk3ps1SOLfXUTIxx8REJW
 QnVxQu99yXNym+OpyhD/ajJajgt3UtEDr3H4C3gJnexZldO8XZ/BtnpcEa7kH7bbYm
 4N5lyjEp5qbI8BPqLbrm8RaAQofhrCGQLw7+9bVvpKCEWnJxnYNgd83AOXGtlAmbCl
 8QkkM0Dvl51kA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Date: Fri, 25 Aug 2023 13:07:19 -0300
Message-ID: <20230825160725.12861-5-gcarlos@disroot.org>
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

Add a parametrized test for the drm_framebuffer_check_src_coords function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/drm_framebuffer.c            |  1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 61 ++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..9fbf3c85618f 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -99,6 +99,7 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 
 	return 0;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_check_src_coords);
 
 /**
  * drm_mode_addfb - add an FB to the graphics configuration
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index b20871e88995..0e0e8216bbbc 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -9,11 +9,15 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
 #include "../drm_crtc_internal.h"
 
+#define FB_WIDTH  800
+#define FB_HEIGHT 600
+
 #define MIN_WIDTH 4
 #define MAX_WIDTH 4096
 #define MIN_HEIGHT 4
@@ -423,8 +427,65 @@ static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, buffer_created);
 }
 
+/* Parameters for testing drm_framebuffer_check_src_coords function */
+struct check_src_coords_case {
+	const char *name; /* Description of the parameter case */
+	const int expect; /* Expected return value by the function */
+
+	/* Deltas to be applied on source */
+	const uint32_t dsrc_x;
+	const uint32_t dsrc_y;
+	const uint32_t dsrc_w;
+	const uint32_t dsrc_h;
+};
+
+static const struct check_src_coords_case check_src_coords_cases[] = {
+	{ .name = "Success: source fits into fb",
+	  .expect = 0,
+	},
+	{ .name = "Fail: overflowing fb with x-axis coordinate",
+	  .expect = -ENOSPC, .dsrc_x = 1,
+	},
+	{ .name = "Fail: overflowing fb with y-axis coordinate",
+	  .expect = -ENOSPC, .dsrc_y = 1,
+	},
+	{ .name = "Fail: overflowing fb with source width",
+	  .expect = -ENOSPC, .dsrc_w = 1,
+	},
+	{ .name = "Fail: overflowing fb with source height",
+	  .expect = -ENOSPC, .dsrc_h = 1,
+	},
+};
+
+static void drm_test_framebuffer_check_src_coords(struct kunit *test)
+{
+	const struct check_src_coords_case *params = test->param_value;
+	const uint32_t src_x = 0 + params->dsrc_x;
+	const uint32_t src_y = 0 + params->dsrc_y;
+	const uint32_t src_w = (FB_WIDTH << 16) + params->dsrc_w;
+	const uint32_t src_h = (FB_HEIGHT << 16) + params->dsrc_h;
+	const struct drm_framebuffer fb = {
+		.width  = FB_WIDTH,
+		.height = FB_HEIGHT,
+	};
+	int ret;
+
+	ret = drm_framebuffer_check_src_coords(src_x, src_y, src_w, src_h, &fb);
+	KUNIT_EXPECT_EQ(test, ret, params->expect);
+}
+
+static void check_src_coords_test_to_desc(const struct check_src_coords_case *t,
+					  char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
+		  check_src_coords_test_to_desc);
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
+	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	{ }
 };
-- 
2.41.0

