Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3F6C4D10
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4A10E950;
	Wed, 22 Mar 2023 14:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025A010E94F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:31 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PhVgf43jdz9tDb;
 Wed, 22 Mar 2023 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679494110; bh=elqKTR7jJqaJa01DazVec6DGI5ZIrg7ojrmzkI353aM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVaElt4asOXs+D3CbmY6/5tDjE8rIt7t0Z+4YHmGFBNpbbcURdtJ4uANM683UH9Qc
 x7Jf7f+o0opz+eNdB6AnqXYVxisDAJsiiKAQYWJ+DGmZuB+ggXqqVqY/hfoHd3vW/y
 o5YRslGhxKQGC1YRMI+LfA/CcIdGzAeRKmaZEuVc=
X-Riseup-User-ID: 6A4CE56EAB94217BC65140A2AF257B6C91529CE0614EF07DC3829661217CA346
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PhVgY4KMWz1y7V;
 Wed, 22 Mar 2023 14:08:25 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/test: Test drm_rect_rotate_inv()
Date: Wed, 22 Mar 2023 11:07:01 -0300
Message-Id: <20230322140701.69852-6-arthurgrillo@riseup.net>
In-Reply-To: <20230322140701.69852-1-arthurgrillo@riseup.net>
References: <20230322140701.69852-1-arthurgrillo@riseup.net>
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
 andrealmeid@riseup.net, airled@gmail.com,
 Arthur Grillo <arthurgrillo@riseup.net>, matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert test for the drm_rect_rotate_inv() function, by expanding the
existing test framework for the drm_rect_rotate().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 46139e796f3f..6d41c0a3cae0 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,6 +406,18 @@ static void drm_test_rect_rotate(struct kunit *test)
 	drm_rect_compare(test, &r, &params->expected);
 }
 
+static void drm_test_rect_rotate_inv(struct kunit *test)
+{
+	const struct drm_rect_rotate_case *params = test->param_value;
+	struct drm_rect r;
+
+	memcpy(&r, &params->expected, sizeof(struct drm_rect));
+
+	drm_rect_rotate_inv(&r, params->width, params->height, params->rotation);
+
+	drm_rect_compare(test, &r, &params->rect);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -419,6 +431,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
 	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
 	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate_inv, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.39.2

