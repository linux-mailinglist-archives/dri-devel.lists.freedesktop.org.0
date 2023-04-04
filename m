Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B46D6C7D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ED310E763;
	Tue,  4 Apr 2023 18:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADB110E763
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 18:42:23 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Prc7f6b07z9s8c;
 Tue,  4 Apr 2023 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1680633743; bh=dKVQ8eO8jDi2R7IB7DZQ7WgzzS0pv0MAq48TDS3jdd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EFmfgUbwifet6w9Vsu2gun1ngVNWQuXwqQXNML69gy0XD03WnZeah5t/6pK1J6mMn
 lNy8edFbILPGWJUgGXSl67N4KQRBVoOUbKot7RTzXv6J9JqTWPgpjb5vonXjnEPwrT
 XO1qnHFNaVqoU+EHBs216BJYJ0fAqgqg4MEfqfgA=
X-Riseup-User-ID: 806A0C1E4B749755D4E7911A84116CF1554CA7C97CD80CA7CCA8392620A2E34E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4Prc7Z3Nqsz1yNK;
 Tue,  4 Apr 2023 18:42:18 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/tests: Add test cases for drm_rect_calc_hscale()
Date: Tue,  4 Apr 2023 15:41:55 -0300
Message-Id: <20230404184158.26290-3-arthurgrillo@riseup.net>
In-Reply-To: <20230404184158.26290-1-arthurgrillo@riseup.net>
References: <20230404184158.26290-1-arthurgrillo@riseup.net>
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, mairacanal@riseup.net, maxime@cerno.tech,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert parameterized test for the drm_rect_calc_hscale() to ensure
correctness and prevent future regressions. Besides the test for the
usual case, tests the exceptions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 33584f63be37..293e5c48bb32 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_rect.h>
 
 #include <linux/string_helpers.h>
+#include <linux/errno.h>
 
 static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
 			     const struct drm_rect *expected)
@@ -343,12 +344,83 @@ static void drm_test_rect_intersect(struct kunit *test)
 	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
 }
 
+struct drm_rect_scale_case {
+	const char *name;
+	struct drm_rect src, dst;
+	int min_range, max_range;
+	int expected_scaling_factor;
+};
+
+static const struct drm_rect_scale_case drm_rect_hscale_cases[] = {
+	{
+		.name = "normal use",
+		.src = DRM_RECT_INIT(0, 0, 2 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 0),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = 2,
+	},
+	{
+		.name = "out of max range",
+		.src = DRM_RECT_INIT(0, 0, 10 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 0),
+		.min_range = 3, .max_range = 5,
+		.expected_scaling_factor = -ERANGE,
+	},
+	{
+		.name = "out of min range",
+		.src = DRM_RECT_INIT(0, 0, 2 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 0),
+		.min_range = 3, .max_range = 5,
+		.expected_scaling_factor = -ERANGE,
+	},
+	{
+		.name = "zero dst width",
+		.src = DRM_RECT_INIT(0, 0, 2 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, 0 << 16, 0),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = 0,
+	},
+	{
+		.name = "negative src width",
+		.src = DRM_RECT_INIT(0, 0, -1 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 0),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = -EINVAL,
+	},
+	{
+		.name = "negative dst width",
+		.src = DRM_RECT_INIT(0, 0, 1 << 16, 0),
+		.dst = DRM_RECT_INIT(0, 0, -1 << 16, 0),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = -EINVAL,
+	},
+};
+
+static void drm_rect_scale_case_desc(const struct drm_rect_scale_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_rect_hscale, drm_rect_hscale_cases, drm_rect_scale_case_desc);
+
+static void drm_test_rect_calc_hscale(struct kunit *test)
+{
+	const struct drm_rect_scale_case *params = test->param_value;
+	int scaling_factor;
+
+	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
+					      params->min_range, params->max_range);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
 	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
 	{ }
 };
 
-- 
2.39.2

