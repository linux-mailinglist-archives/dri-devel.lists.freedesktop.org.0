Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81294862E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 01:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0372610E2D5;
	Mon,  5 Aug 2024 23:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="TJuoqoqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB33110E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 23:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 9F01B419DB;
 Tue,  6 Aug 2024 01:38:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtfodAOLA_bi; Tue,  6 Aug 2024 01:38:36 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1722901116; bh=TNw+4TUvG5q2B83KkombW/c+lYkfCTu08Y5Ep2VOai4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TJuoqoqx0VtYGc4Zlyxty1Xk9nZidSvdccqv+3WbaHOZV/q7eOAmd863MbZWloSOq
 JOutC3svqL0qpKl4TSIvYBQ5IZyJ1+2Uqc9mwoD85yZ9m/X1evLaKIpsQXx9ej6aCx
 mSWyn7lV141Ne//28Awb+lgvnuNCuiXRIGNvPVsIh7JblobHBD94K8KcgaR1sF/MO4
 oLWdfJUCBAGtdCYR2z+XMW4ZpTA+/xVUkfpH1s0oZIDq5KWd5ad/Xy43dMlsTjxcNC
 BkZtqYjkBUYECSniMHvthPZ+bmlzMwy9fI1BFV+sNpxGIfyzlc2qE7qtUwRZoTx8Mm
 4edEAMNqQK3iw==
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
Subject: [PATCH v4 5/9] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Date: Mon,  5 Aug 2024 20:39:30 -0300
Message-ID: <20240805234022.18586-6-gcarlos@disroot.org>
In-Reply-To: <20240805234022.18586-1-gcarlos@disroot.org>
References: <20240805234022.18586-1-gcarlos@disroot.org>
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

Add a parametrized test for the drm_framebuffer_check_src_coords function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
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
index 888aadb6a4ac..9cd85ac789bb 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -99,6 +99,7 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 
 	return 0;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_check_src_coords);
 
 /**
  * drm_mode_addfb - add an FB to the graphics configuration
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 2ea3abfd5e7a..1924e3f9538e 100644
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
@@ -438,7 +439,67 @@ static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, PTR_ERR(fb), -EINVAL);
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
2.44.2

