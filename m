Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B736D9667
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95910EB80;
	Thu,  6 Apr 2023 11:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73C810EB80
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:54:16 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Psfzr0Dw0z9tBm;
 Thu,  6 Apr 2023 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1680782056; bh=5ScewzVbdesvfvA+z4+V0CXcdLjb2SH20a2kJVPM6JI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kR9MONvzsqnWTiDbfEN3G9LTaVl57YMTlEV4YL6pjj+99Pb3Bg5NUItt+C5SlKwnV
 cYF0aWTF/JxfZwJfCq/jx75ecbzmqH8g3nSv8NyPthrHD3H5XD4T9oh3m0RSdKLQRA
 fFQa87u1W146Uwt0TMds4e9SNB0Ra33k38kroxgc=
X-Riseup-User-ID: AB699C1F0907E5BAFE3444253474456AC87A87D353866BE5C55D7D37A149CF70
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4Psfzl3VPQz1yPW;
 Thu,  6 Apr 2023 11:54:11 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/tests: Add test cases for drm_rect_calc_vscale()
Date: Thu,  6 Apr 2023 08:53:36 -0300
Message-Id: <20230406115338.36228-4-arthurgrillo@riseup.net>
In-Reply-To: <20230406115338.36228-1-arthurgrillo@riseup.net>
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
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

Insert parameterized test for the drm_rect_calc_vscale() to ensure
correctness and prevent future regressions. Besides the test for the
usual case, tests the exceptions.

It uses the same struct from drm_rect_calc_hscale().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 44150545c1bc..a1fd9b2c5128 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -414,6 +414,64 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
+static const struct drm_rect_scale_case drm_rect_vscale_cases[] = {
+	{
+		.name = "normal use",
+		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
+		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = 2,
+	},
+	{
+		.name = "out of max range",
+		.src = DRM_RECT_INIT(0, 0, 0, 10 << 16),
+		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
+		.min_range = 3, .max_range = 5,
+		.expected_scaling_factor = -ERANGE,
+	},
+	{
+		.name = "out of min range",
+		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
+		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
+		.min_range = 3, .max_range = 5,
+		.expected_scaling_factor = -ERANGE,
+	},
+	{
+		.name = "zero dst height",
+		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
+		.dst = DRM_RECT_INIT(0, 0, 0, 0 << 16),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = 0,
+	},
+	{
+		.name = "negative src height",
+		.src = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
+		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = -EINVAL,
+	},
+	{
+		.name = "negative dst height",
+		.src = DRM_RECT_INIT(0, 0, 0, 1 << 16),
+		.dst = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
+		.min_range = 0, .max_range = INT_MAX,
+		.expected_scaling_factor = -EINVAL,
+	},
+};
+
+KUNIT_ARRAY_PARAM(drm_rect_vscale, drm_rect_vscale_cases, drm_rect_scale_case_desc);
+
+static void drm_test_rect_calc_vscale(struct kunit *test)
+{
+	const struct drm_rect_scale_case *params = test->param_value;
+	int scaling_factor;
+
+	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
+					      params->min_range, params->max_range);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -421,6 +479,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
 	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
 	{ }
 };
 
-- 
2.39.2

