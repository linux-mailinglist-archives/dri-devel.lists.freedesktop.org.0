Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B26E6FC3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD51C10E23E;
	Tue, 18 Apr 2023 23:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34A10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 23:02:07 +0000 (UTC)
Received: from fews02-sea.riseup.net (unknown [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Q1KDt54Nyz9tFY;
 Tue, 18 Apr 2023 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681858927; bh=IFx2T7OptOuR1+9k/NNX5uqlxaKmb8rr830NNCj05p8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1EyxAEFXZnedq7/5D9Hu58MhT+ddq1SgIohmq96qF1zEpSEepW0PnBPI3UkGsq5/
 u1Mc4MToqX+LsdggI7QLIh1cb3kqxElNK9a9UuyHbyccx82h08YuSgatKSUnO9PRyf
 Rbm7oEpotqW/Z2u1lREKtfGjPj833gUEOuEa6a60=
X-Riseup-User-ID: 74A1C98233FECFDE01E86289FB59302115D58F02EEBF48A1447CEB9F50F26DCD
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q1KDl1q41zFsL6;
 Tue, 18 Apr 2023 23:01:59 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/5] drm/tests: Add test cases for drm_rect_intersect()
Date: Tue, 18 Apr 2023 20:01:42 -0300
Message-Id: <20230418230146.461129-2-arthurgrillo@riseup.net>
In-Reply-To: <20230418230146.461129-1-arthurgrillo@riseup.net>
References: <20230418230146.461129-1-arthurgrillo@riseup.net>
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, javierm@redhat.com,
 mairacanal@riseup.net, maxime@cerno.tech, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>, matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized tests for the drm_rect_intersect() to ensure
correctness and prevent future regressions.

Also, create a helper for testing if two drm_rects are equal.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 148 ++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index e9809ea32696..33584f63be37 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -9,6 +9,17 @@
 
 #include <drm/drm_rect.h>
 
+#include <linux/string_helpers.h>
+
+static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
+			     const struct drm_rect *expected)
+{
+	KUNIT_EXPECT_EQ(test, r->x1, expected->x1);
+	KUNIT_EXPECT_EQ(test, r->y1, expected->y1);
+	KUNIT_EXPECT_EQ(test, drm_rect_width(r), drm_rect_width(expected));
+	KUNIT_EXPECT_EQ(test, drm_rect_height(r), drm_rect_height(expected));
+}
+
 static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
 {
 	struct drm_rect src, dst, clip;
@@ -196,11 +207,148 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
 	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
 }
 
+struct drm_rect_intersect_case {
+	const char *description;
+	struct drm_rect r1, r2;
+	bool should_be_visible;
+	struct drm_rect expected_intersection;
+};
+
+static const struct drm_rect_intersect_case drm_rect_intersect_cases[] = {
+	{
+		.description = "top-left x bottom-right",
+		.r1 = DRM_RECT_INIT(1, 1, 2, 2),
+		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
+	},
+	{
+		.description = "top-right x bottom-left",
+		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
+		.r2 = DRM_RECT_INIT(1, -1, 2, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
+	},
+	{
+		.description = "bottom-left x top-right",
+		.r1 = DRM_RECT_INIT(1, -1, 2, 2),
+		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
+	},
+	{
+		.description = "bottom-right x top-left",
+		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
+		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
+	},
+	{
+		.description = "right x left",
+		.r1 = DRM_RECT_INIT(0, 0, 2, 1),
+		.r2 = DRM_RECT_INIT(1, 0, 3, 1),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
+	},
+	{
+		.description = "left x right",
+		.r1 = DRM_RECT_INIT(1, 0, 3, 1),
+		.r2 = DRM_RECT_INIT(0, 0, 2, 1),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
+	},
+	{
+		.description = "up x bottom",
+		.r1 = DRM_RECT_INIT(0, 0, 1, 2),
+		.r2 = DRM_RECT_INIT(0, -1, 1, 3),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
+	},
+	{
+		.description = "bottom x up",
+		.r1 = DRM_RECT_INIT(0, -1, 1, 3),
+		.r2 = DRM_RECT_INIT(0, 0, 1, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
+	},
+	{
+		.description = "touching corner",
+		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
+		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
+		.should_be_visible = false,
+		.expected_intersection = DRM_RECT_INIT(1, 1, 0, 0),
+	},
+	{
+		.description = "touching side",
+		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
+		.r2 = DRM_RECT_INIT(1, 0, 1, 1),
+		.should_be_visible = false,
+		.expected_intersection = DRM_RECT_INIT(1, 0, 0, 1),
+	},
+	{
+		.description = "equal rects",
+		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
+		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(0, 0, 2, 2),
+	},
+	{
+		.description = "inside another",
+		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
+		.r2 = DRM_RECT_INIT(1, 1, 1, 1),
+		.should_be_visible = true,
+		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
+	},
+	{
+		.description = "far away",
+		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
+		.r2 = DRM_RECT_INIT(3, 6, 1, 1),
+		.should_be_visible = false,
+		.expected_intersection = DRM_RECT_INIT(3, 6, -2, -5),
+	},
+	{
+		.description = "points intersecting",
+		.r1 = DRM_RECT_INIT(5, 10, 0, 0),
+		.r2 = DRM_RECT_INIT(5, 10, 0, 0),
+		.should_be_visible = false,
+		.expected_intersection = DRM_RECT_INIT(5, 10, 0, 0),
+	},
+	{
+		.description = "points not intersecting",
+		.r1 = DRM_RECT_INIT(0, 0, 0, 0),
+		.r2 = DRM_RECT_INIT(5, 10, 0, 0),
+		.should_be_visible = false,
+		.expected_intersection = DRM_RECT_INIT(5, 10, -5, -10),
+	},
+};
+
+static void drm_rect_intersect_case_desc(const struct drm_rect_intersect_case *t, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
+		 "%s: " DRM_RECT_FMT " x " DRM_RECT_FMT,
+		 t->description, DRM_RECT_ARG(&t->r1), DRM_RECT_ARG(&t->r2));
+}
+
+KUNIT_ARRAY_PARAM(drm_rect_intersect, drm_rect_intersect_cases, drm_rect_intersect_case_desc);
+
+static void drm_test_rect_intersect(struct kunit *test)
+{
+	const struct drm_rect_intersect_case *params = test->param_value;
+	struct drm_rect r1_aux = params->r1;
+	bool visible;
+
+	visible = drm_rect_intersect(&r1_aux, &params->r2);
+
+	KUNIT_EXPECT_EQ(test, visible, params->should_be_visible);
+	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
+	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
 	{ }
 };
 
-- 
2.40.0

