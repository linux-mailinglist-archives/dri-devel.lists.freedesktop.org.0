Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0376E6FCC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04C710E279;
	Tue, 18 Apr 2023 23:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD1310E277
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 23:02:33 +0000 (UTC)
Received: from fews02-sea.riseup.net (unknown [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q1KFN6SfjzDqPJ;
 Tue, 18 Apr 2023 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681858953; bh=LdyUXruZ+HF1gPEiScTwp3zK+jinmkPjE/Gye59/aYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QTLhS4M86ObP6KDySMi4HLVyset1jMSb4yKoSN+qO2ska8m3JYhQvv2qYHIL0oJpO
 G+d3FVoyR3pUxzeZYHRDUcN8CgUurWFe4rfhj1aAxqidqKKsje1dhfHcu3TExhQT6v
 G9uqlKd6shjZcCh1wM4V9bIYQEpSlDfOCQvS1ufE=
X-Riseup-User-ID: 963828EC06E35F981AAC9D74AE1D87C5C18E28CEB9F6A0BD0F00A859CA4ED093
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q1KFJ4fHdzFq7h;
 Tue, 18 Apr 2023 23:02:28 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/5] drm/test: Add test cases for drm_rect_rotate_inv()
Date: Tue, 18 Apr 2023 20:01:46 -0300
Message-Id: <20230418230146.461129-6-arthurgrillo@riseup.net>
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

Insert a parameterized test for the drm_rect_rotate_inv() to ensure its
correctness and prevent future regressions. The test covers all rotation
modes.

It uses the same test cases from drm_test_rect_rotate().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 514b9b3337e9..76332cd2ead8 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -496,6 +496,16 @@ static void drm_test_rect_rotate(struct kunit *test)
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
@@ -505,6 +515,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_scale_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_scale_gen_params),
 	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate_inv, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.40.0

