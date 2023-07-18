Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB2758483
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4FA10E3BC;
	Tue, 18 Jul 2023 18:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF7810E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 1B5CF44EBD;
 Tue, 18 Jul 2023 20:19:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sU-d-WpO4tlV; Tue, 18 Jul 2023 20:19:33 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689704373; bh=yo2f7TJTqdzCWC4vZ9PniiFq8G5bU+eddn7hXvpw53o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iaqi8Y2lJTAOM34I1Phh5nKSi5SMCLzlZqzkReUpzCPpJzPPkN2RPVnoiYihVbFXy
 sMuZUyspXgyYqoegzdH/+b8H0p4lgm1ey8WRPDucaQEUV6wz7vV2HeAH5mQdh/15mT
 D63/duVsmGoG9ltTsqJbdmbxGCjrzr5uYNPQ3W3DgjZkQqADlZ7k/yCc5OvKOPbaI6
 ik4TBsqHueSV4JczI1sxaM6G4jzBxxz+jKPurqTPChjg4teBHp5T37HNkG3qA9Wzv8
 tO4cbSvOHsp0QYbdwUTj9t5yYe1+pQNONE+zdnoTmdX7Erqq/N1aO/bRtoZsHBDRdF
 3Ndnx0cYl13pw==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Date: Tue, 18 Jul 2023 15:17:24 -0300
Message-ID: <20230718181726.3799-3-gcarlos@disroot.org>
In-Reply-To: <20230718181726.3799-1-gcarlos@disroot.org>
References: <20230718181726.3799-1-gcarlos@disroot.org>
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
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 126 +++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index f759d9f3b76e..ee92120cd8e9 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
@@ -366,7 +367,132 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
 		  drm_framebuffer_test_to_desc);
 
+/* Parameters for testing drm_framebuffer_check_src_coords function */
+struct check_src_coords_case {
+	const char *name; /* Description of the parameter case */
+	const int expect; /* Expected returned value by the function */
+
+	/* All function args */
+	const uint32_t src_x;
+	const uint32_t src_y;
+	const uint32_t src_w;
+	const uint32_t src_h;
+	const struct drm_framebuffer fb;
+};
+
+static const struct check_src_coords_case check_src_coords_cases[] = {
+	/* Regular case where the source just fit in the framebuffer */
+	{ .name = "source inside framebuffer with normal sizes and coordinates",
+	  .expect = 0,
+	  .src_x = 500 << 16, .src_y = 700 << 16,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "out of bound by both x and y with normal sizes and coordinates",
+	  .expect = -ENOSPC,
+	  .src_x = (500 << 16) + 1, .src_y = (700 << 16) + 1,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	/* From here, cases involving only x axis */
+	{ .name = "out of bound by x with normal width and x",
+	  .expect = -ENOSPC,
+	  .src_x = (500 << 16) + 1, .src_y = 700 << 16,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "out of bound by x due to source width higher than framebuffer width",
+	  .expect = -ENOSPC,
+	  .src_x = 0, .src_y = 700 << 16,
+	  .src_w = (600 << 16) + 1, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	/* Source fullfill framebuffer width just by its width */
+	{ .name = "source inside framebuffer with its width equal framebuffer width and zero x",
+	  .expect = 0,
+	  .src_x = 0, .src_y = 700 << 16,
+	  .src_w = 600 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	/*
+	 * Source fullfill framebuffer with its width and get out of
+	 * bound by having a non-zero x coordinate
+	 */
+	{ .name = "out of bound by x due to source width equal framebuffer width and non-zero x",
+	  .expect = -ENOSPC,
+	  .src_x = 1, .src_y = 700 << 16,
+	  .src_w = 600 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	{ .name = "out of bound by x due to x coordinate higher than framebuffer width",
+	  .expect = -ENOSPC,
+	  .src_x = (600 << 16) + 1, .src_y = 700 << 16,
+	  .src_w = 0, .src_h = 100 << 16,
+	  .fb = { .width = 600, .height = 800 }
+	},
+	/*
+	 * From here, the same of previous cases involving x axis but with
+	 * src_x and src_w values swapped with src_y and src_h, so we can cover
+	 * the same cases for the y axis
+	 */
+	{ .name = "out of bound by y with normal height and y",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = (500 << 16) + 1,
+	  .src_w = 100 << 16, .src_h = 100 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "out of bound by y due to source height higher than framebuffer height",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = 0,
+	  .src_w = 100 << 16, .src_h = (600 << 16) + 1,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "source inside framebuffer with its height equal framebuffer height and zero y",
+	  .expect = 0,
+	  .src_x = 700 << 16, .src_y = 0,
+	  .src_w = 100 << 16, .src_h = 600 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "out of bound by y due to source height equal framebuffer height and non-zero y",
+	  .expect = -ENOSPC,
+	  .src_x = 700 << 16, .src_y = 1,
+	  .src_w = 100 << 16, .src_h = 600 << 16,
+	  .fb = { .width = 800, .height = 600 }
+	},
+	{ .name = "out of bound by y due to y coordinate higher than framebuffer height",
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
+	/*
+	 * Just compare the expected value with the one returned by the
+	 * function called with args from parameter
+	 */
+	r = drm_framebuffer_check_src_coords(params->src_x, params->src_y,
+					     params->src_w, params->src_h,
+					     &params->fb);
+	KUNIT_EXPECT_EQ(test, r, params->expect);
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
+	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
 	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
 	{ }
 };
-- 
2.41.0

