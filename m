Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D56E6FC5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08B10E26C;
	Tue, 18 Apr 2023 23:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6398C10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 23:02:21 +0000 (UTC)
Received: from fews02-sea.riseup.net (unknown [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Q1KF85mnxz9tFY;
 Tue, 18 Apr 2023 23:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681858941; bh=CiOEWRg2hz4fmnonROn9BZxEq9VXDywlxx0uJtFCvrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eW/kxrFOZaU+RX/b1nSMxZJGCbdUkeY6Sj8+Z9nQUccUJAc6xmBzfDcwO6LAg6voG
 JT+IT9wQ41FN9Z9MZjtHpkdJyQivQEv5FGjYDXb+gi9vRWd6rGMUKWDUXOyLESu6v9
 Korcy8QKyJcPge+qLYBEH9BtbVo4PX0OcFwA1kos=
X-Riseup-User-ID: 7426031481943B017E0EEDB41811B5511F1914B0FB6D1ED013A423BC76DD8D7D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q1KF21ZXDzFq7h;
 Tue, 18 Apr 2023 23:02:13 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/5] drm/tests: Add test cases for drm_rect_calc_vscale()
Date: Tue, 18 Apr 2023 20:01:44 -0300
Message-Id: <20230418230146.461129-4-arthurgrillo@riseup.net>
In-Reply-To: <20230418230146.461129-1-arthurgrillo@riseup.net>
References: <20230418230146.461129-1-arthurgrillo@riseup.net>
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
 drivers/gpu/drm/tests/drm_rect_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index aae682ad9ee1..fd89e62ad2cb 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -414,6 +414,17 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
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
@@ -421,6 +432,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
 	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_scale_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_scale_gen_params),
 	{ }
 };
 
-- 
2.40.0

