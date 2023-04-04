Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E36D6C85
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FBC10E76B;
	Tue,  4 Apr 2023 18:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219BB10E769
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 18:42:38 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Prc7x4nqdz9tG4;
 Tue,  4 Apr 2023 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1680633757; bh=JpaZ0SQl51V7z8ld+c7j18y1NfeZXdXo3cjc8A8YyjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5eDnWzdT9hP+CvayQE9qXdO3ZHHVWAFnHP1BlaKa4KhuzMeDhirhhuuRoPLElZQp
 LHsHLw8p5FEyXGLqvBMYSGTC37uDE7RHKbGGQppGkZYbyiqwaLflRDmCUUoR66c/zv
 pFwGymiEZkNK9ZsnYGIPYoJe7FMggHjHC/SxYlS4=
X-Riseup-User-ID: 6CA6A8A777927615895A667E2BC9B853481FA2A5EB334F9EB93481CFC65EE4D7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4Prc7s0q3Rz1yNK;
 Tue,  4 Apr 2023 18:42:32 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/test: Add test cases for drm_rect_rotate_inv()
Date: Tue,  4 Apr 2023 15:41:58 -0300
Message-Id: <20230404184158.26290-6-arthurgrillo@riseup.net>
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

Insert a parameterized test for the drm_rect_rotate_inv() to ensure its
correctness and prevent future regressions. The test covers all rotation
modes.

It uses the same test cases from drm_test_rect_rotate().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index dca63552d289..862b9435dcc6 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -543,6 +543,16 @@ static void drm_test_rect_rotate(struct kunit *test)
 	drm_rect_compare(test, &r, &params->expected);
 }
 
+static void drm_test_rect_rotate_inv(struct kunit *test)
+{
+	const struct drm_rect_rotate_case *params = test->param_value;
+	struct drm_rect r = params->expected;
+
+	drm_rect_rotate_inv(&r, params->width, params->height, params->rotation);
+
+	drm_rect_compare(test, &r, &params->rect);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -552,6 +562,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate_inv, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.39.2

