Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7286CA627
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 15:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E6C10E5CF;
	Mon, 27 Mar 2023 13:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDD810E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 13:39:33 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PlYnk2KpszDr07;
 Mon, 27 Mar 2023 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679924373; bh=G+63XP5wcg7jD1vPsJ/NozI4ge3Dhjgooy42h6s25Wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SurOPJ/+Oz6CUGi6wioQ5PGWZjB6nEF229kPPW8xjJARg5eQ7tNKavNG5JYEv5e3P
 P3+PAzraZ0Si8YUbjnQUsVr1C2B9yXBAR4lfWko2sHJIjwhY+XAtSwFn6LSRGb+OVN
 N7kMt9L3j9vScswdUZLIREbp5jr2sOgkhOKULWHw=
X-Riseup-User-ID: A20F34228033A100078A234D5F15A968DA11267FE65F610997E808C5F5182AD6
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PlYnf02x5z1yPW;
 Mon, 27 Mar 2023 13:39:17 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/tests: Test drm_rect_calc_hscale()
Date: Mon, 27 Mar 2023 10:38:45 -0300
Message-Id: <20230327133848.5250-3-arthurgrillo@riseup.net>
In-Reply-To: <20230327133848.5250-1-arthurgrillo@riseup.net>
References: <20230327133848.5250-1-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_hscale() function, besides the test
for the usual case it also test for the exceptions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 3654c0be3d6b..c282e1cf9c30 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_rect.h>
 
 #include <linux/string_helpers.h>
+#include <linux/errno.h>
 
 static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
 			     const struct drm_rect *expected)
@@ -334,12 +335,68 @@ static void drm_test_rect_intersect(struct kunit *test)
 	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
 }
 
+static void drm_test_rect_calc_hscale(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 2 << 16, 0);
+	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
+
+	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
+}
+
+static void drm_test_rect_calc_hscale_out_of_range(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 10 << 16, 0);
+	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
+
+	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+
+	drm_rect_init(&src, 0, 0, 2 << 16, 0);
+	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
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
+	drm_rect_init(&src, 0, 0, -1 << 16, 0);
+	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
+
+	scaling_factor = drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+
+	drm_rect_init(&src, 0, 0, 1 << 16, 0);
+	drm_rect_init(&dst, 0, 0, -1 << 16, 0);
+
+	scaling_factor = drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
 	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
+	KUNIT_CASE(drm_test_rect_calc_hscale),
+	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
+	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
 	{ }
 };
 
-- 
2.39.2

