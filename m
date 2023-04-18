Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCA6E6FC9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07AD10E271;
	Tue, 18 Apr 2023 23:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AAF10E271
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 23:02:28 +0000 (UTC)
Received: from fews02-sea.riseup.net (unknown [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q1KFH6BBGzDqBP;
 Tue, 18 Apr 2023 23:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681858948; bh=DKoICF3N+vcd+O0wRZtt6GlKQpQrsAlA7rdHfbhiKxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O8anvxBZp0dQr97oTHDD876tjePmrKEFK0A+Vym+nYiAAnhPGap60/tmp/46IqU3L
 fYXrUMqU+semL0xnKXwYZ2KJkd4YW2dU+zuG5Pf7RCycDUWf8EWgxJ5jUfe1VBjOHx
 8Q4uuM7gBdeAOsxrOaP9HsNpvzqsPMbVD2KeUTo8=
X-Riseup-User-ID: B0A847F07CFE5FE5992F57F6B94FBA964C831B0B9AB0ECD88B062B8E6D36B60B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q1KF94ZZvzFq7h;
 Tue, 18 Apr 2023 23:02:21 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/tests: Add test cases for drm_rect_rotate()
Date: Tue, 18 Apr 2023 20:01:45 -0300
Message-Id: <20230418230146.461129-5-arthurgrillo@riseup.net>
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

Insert a parameterized test for the drm_rect_rotate() to ensure
correctness and prevent future regressions.

All possible rotation modes are covered by the test.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index fd89e62ad2cb..514b9b3337e9 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_rect.h>
+#include <drm/drm_mode.h>
 
 #include <linux/string_helpers.h>
 #include <linux/errno.h>
@@ -425,6 +426,76 @@ static void drm_test_rect_calc_vscale(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
+struct drm_rect_rotate_case {
+	const char *name;
+	unsigned int rotation;
+	struct drm_rect rect;
+	int width, height;
+	struct drm_rect expected;
+};
+
+static const struct drm_rect_rotate_case drm_rect_rotate_cases[] = {
+	{
+		.name = "reflect-x",
+		.rotation = DRM_MODE_REFLECT_X,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 5, 5),
+	},
+	{
+		.name = "reflect-y",
+		.rotation = DRM_MODE_REFLECT_Y,
+		.rect = DRM_RECT_INIT(2, 0, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(2, 5, 5, 5),
+	},
+	{
+		.name = "rotate-0",
+		.rotation = DRM_MODE_ROTATE_0,
+		.rect = DRM_RECT_INIT(0, 2, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 2, 5, 5),
+	},
+	{
+		.name = "rotate-90",
+		.rotation = DRM_MODE_ROTATE_90,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 10, 5),
+	},
+	{
+		.name = "rotate-180",
+		.rotation = DRM_MODE_ROTATE_180,
+		.rect = DRM_RECT_INIT(11, 3, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(-11, -3, 5, 10),
+	},
+	{
+		.name = "rotate-270",
+		.rotation = DRM_MODE_ROTATE_270,
+		.rect = DRM_RECT_INIT(6, 3, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(-3, 6, 10, 5),
+	},
+};
+
+static void drm_rect_rotate_case_desc(const struct drm_rect_rotate_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_rect_rotate, drm_rect_rotate_cases, drm_rect_rotate_case_desc);
+
+static void drm_test_rect_rotate(struct kunit *test)
+{
+	const struct drm_rect_rotate_case *params = test->param_value;
+	struct drm_rect r = params->rect;
+
+	drm_rect_rotate(&r, params->width, params->height, params->rotation);
+
+	drm_rect_compare(test, &r, &params->expected);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -433,6 +504,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_scale_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_scale_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.40.0

