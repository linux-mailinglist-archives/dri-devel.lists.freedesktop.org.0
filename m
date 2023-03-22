Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD346C4D0A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A279510E38F;
	Wed, 22 Mar 2023 14:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0A910E381
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:14 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PhVgL1RgQz9sBV;
 Wed, 22 Mar 2023 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679494094; bh=GHfB5gaxIvtV/NH+pa6/XZydmW0DnzcJHrvmn1kR43o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ACzJZEOWNJk/W+R5slG1kk1OCCn0aW9oN1ngJ1F1eXz4dH0zQ1PuTZcZblP54NBY2
 5fbQgwS/ggLuj1om0ZiJqq5DM/iarPXqaYyvjYg50UGwfTFScSPCM3aFpMT2e05lzT
 9X4dNWu0opnhof3JMvv9gHgD2J/gghFNyZyqMI8g=
X-Riseup-User-ID: 0DEBE64EE1D9BCF099A44936D1938F2ACAF61EE1ED4842B8AD604F42A76D3FAB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PhVgD6cRxz1y7V;
 Wed, 22 Mar 2023 14:08:08 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/tests: Test drm_rect_calc_hscale()
Date: Wed, 22 Mar 2023 11:06:58 -0300
Message-Id: <20230322140701.69852-3-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_hscale() function, besides the test
for the usual case it also test for the exceptions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index f700984f70a8..7e02393092fa 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -9,6 +9,8 @@
 
 #include <drm/drm_rect.h>
 
+#include <linux/errno.h>
+
 static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
 			     const struct drm_rect *expected)
 {
@@ -225,12 +227,68 @@ static void drm_test_rect_intersect(struct kunit *test)
 	KUNIT_EXPECT_FALSE_MSG(test, visible, "Interserction should not be a visible rect");
 }
 
+static void drm_test_rect_calc_hscale(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 2, 0);
+	drm_rect_init(&dst, 0, 0, 1, 0);
+
+	scaling_factor =  drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
+}
+
+static void drm_test_rect_calc_hscale_out_of_range(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 10, 0);
+	drm_rect_init(&dst, 0, 0, 1, 0);
+
+	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+
+	drm_rect_init(&src, 0, 0, 2, 0);
+	drm_rect_init(&dst, 0, 0, 1, 0);
+
+	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+}
+
+static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, -1, 0);
+	drm_rect_init(&dst, 0, 0, 1, 0);
+
+	scaling_factor = drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+
+	drm_rect_init(&src, 0, 0, 1, 0);
+	drm_rect_init(&dst, 0, 0, -1, 0);
+
+	scaling_factor = drm_rect_calc_hscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
 	KUNIT_CASE(drm_test_rect_intersect),
+	KUNIT_CASE(drm_test_rect_calc_hscale),
+	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
+	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
 	{ }
 };
 
-- 
2.39.2

