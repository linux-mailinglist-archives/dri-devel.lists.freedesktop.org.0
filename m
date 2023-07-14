Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D191754240
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B606F10E8CD;
	Fri, 14 Jul 2023 18:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D29210E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 18:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id C2CFF417DF;
 Fri, 14 Jul 2023 20:08:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x634WJrbEqXS; Fri, 14 Jul 2023 20:08:37 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689358117; bh=BUdWzGGUIraxiwSGjTBXbs/5tBXQvtbqo8XCpVksx8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lp+57JqlATj+nHs2KwNdFMzV6BY7KdwItr1z5YKYGlWKWkGXFUUPzHHsWrSCUl2Hz
 RYQYgR92eSoCythPHgB0UIvr8dJtO5aPhL9/GzqgH3QeaZ4ySOKXF7uVGzzytR3M5l
 kd5U5vD6xo5p0eoUeoBg0mpLSAnEc55V/9a20ShhIIzlW2ryLingzNTepjRoTeyRDX
 C0imO2jpss6ahVIm1u4Iy89cIbZpwbvOOocpKAqIgPTcrlR0hCaEkYkJ+zGzVcGfeo
 X4iQD1WWpYUzC9MkCmkD+itR1YryxU0Zb/m7AAvvN5G+j1AwXEb+LK4LdhsynbasZh
 LSJa55rSnn5zQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/tests: Add test for drm_framebuffer_check_src_coords()
Date: Fri, 14 Jul 2023 15:06:17 -0300
Message-ID: <20230714180619.15850-3-gcarlos@disroot.org>
In-Reply-To: <20230714180619.15850-1-gcarlos@disroot.org>
References: <20230714180619.15850-1-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 mripard@kernel.org, mairacanal@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a parametrized test for the drm_framebuffer_check_src_coords function.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 107 +++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index f759d9f3b76e..175146f7ac9e 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
@@ -366,8 +367,114 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+struct check_src_coords_case {
+	const int expect;
+	const uint32_t src_x;
+	const uint32_t src_y;
+	const uint32_t src_w;
+	const uint32_t src_h;
+	const struct drm_framebuffer fb;
+	const char *name;
+};
+
+static const struct check_src_coords_case check_src_coords_cases[] = {
+	{ .name = "source inside framebuffer",
+	  .expect = 0,
+	  .src_x = 500 << 16, .src_y = 700 << 16,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "out of bound with normal sizes and coordinates",
+	  .expect = -ENOSPC,
+	  .src_x = (500 << 16) + 1, .src_y = (700 << 16) + 1,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "source width higher than framebuffer width",
+	  .expect = -ENOSPC,
+	  .src_x = 0, .src_y = 700 << 16,
+	  .src_w = (600 << 16) + 1, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "source width equal framebuffer width with x coordinates 0",
+	  .expect = 0,
+	  .src_x = 0, .src_y = 700 << 16,
+	  .src_w = 600 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "source width equal framebuffer width with non-zero x coordinate",
+	  .expect = -ENOSPC,
+	  .src_x = 1, .src_y = 700 << 16,
+	  .src_w = 600 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "out of bound with normal width and x",
+	  .expect = -ENOSPC,
+	  .src_x = (500 << 16) + 1, .src_y = 700 << 16,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "x coordinate higher than framebuffer width",
+	  .expect = -ENOSPC,
+	  .src_x = (600 << 16) + 1, .src_y = 700 << 16,
+	  .src_w = 0, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "source height higher than framebuffer height",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = 0,
+	  .src_w = 100 << 16, .src_h = (600 << 16) + 1,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "source height equal framebuffer height with y coordinates 0",
+	  .expect = 0,
+	  .src_x = 700 << 16, .src_y = 0,
+	  .src_w = 100 << 16, .src_h = 600 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "source height equal framebuffer height with non-zero y coordinate",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = 1,
+	  .src_w = 100 << 16, .src_h = 600 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "out of bound with normal height and y",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = (500 << 16) + 1,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "y coordinate higher than framebuffer height",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = (600 << 16) + 1,
+	  .src_w = 100 << 16, .src_h = 0,
+	  .fb = { .width = 800, .height = 600 }
+	},
+};
+
+static void drm_test_framebuffer_check_src_coords(struct kunit *test)
+{
+	const struct check_src_coords_case *params = test->param_value;
+	int r;
+
+	r = drm_framebuffer_check_src_coords(params->src_x, params->src_y,
+					     params->src_w, params->src_h,
+					     &params->fb);
+	KUNIT_EXPECT_EQ(test, r, params->expect);
+}
+
+static void check_src_coords_test_to_desc(const struct check_src_coords_case *t,
+					  char *desc)
+{
+	strcpy(desc, t->name);
+}
+
+KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
+		  check_src_coords_test_to_desc);
+
 static struct kunit_case drm_framebuffer_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
+	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	{ }
 };
 
-- 
2.41.0

