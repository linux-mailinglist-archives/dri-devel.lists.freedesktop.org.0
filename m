Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDE46CA625
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 15:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D4510E373;
	Mon, 27 Mar 2023 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DB610E373
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 13:39:28 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PlYnq4Sh1zDqJ5;
 Mon, 27 Mar 2023 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679924367; bh=ZbhbxRPpqDxBPpby6AoAh/6FbNAP69FxdKFtXX5L7hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JVLQSiQD1rtzcXaC+wyZ73Pon6lzWv5BPgkUlEEjTqkSHR9TDx/WP4Y/GEyucngw/
 PHggt4JHAAlwISmzZ9q1eCOomSzIycA/O261NeUBD+JugENEJIvl7NPdQg38zHhVIW
 07nt+XtappCtDA8ZjFXXqL51UtQ80BRoXYntUB/o=
X-Riseup-User-ID: F91D87FED72F9C272E056779BC978E916EA9140D17E370AE1C1D0F6D102C0229
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PlYnk4cVvz1yBT;
 Mon, 27 Mar 2023 13:39:22 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/tests: Test drm_rect_calc_vscale()
Date: Mon, 27 Mar 2023 10:38:46 -0300
Message-Id: <20230327133848.5250-4-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_vscale() function, besides the test
for the usual case it also test for the exceptions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index c282e1cf9c30..a14da86ef435 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -388,6 +388,59 @@ static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
 }
 
+static void drm_test_rect_calc_vscale(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 0, 2 << 16);
+	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
+
+	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
+}
+
+static void drm_test_rect_calc_vscale_out_of_range(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 0, 10 << 16);
+	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
+
+	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+
+	drm_rect_init(&src, 0, 0, 0, 2 << 16);
+	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
+
+	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+}
+
+static void drm_test_rect_calc_vscale_negative_args(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 0, -1 << 16);
+	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
+
+	scaling_factor = drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+
+	drm_rect_init(&src, 0, 0, 0, 1 << 16);
+	drm_rect_init(&dst, 0, 0, 0, -1 << 16);
+
+	scaling_factor = drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -397,6 +450,9 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_calc_hscale),
 	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
 	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
+	KUNIT_CASE(drm_test_rect_calc_vscale),
+	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
+	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
 	{ }
 };
 
-- 
2.39.2

