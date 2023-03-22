Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95AA6C4D0B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C1C10E381;
	Wed, 22 Mar 2023 14:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9352010E381
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:19 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PhVgR0rNrz9sBV;
 Wed, 22 Mar 2023 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679494099; bh=o1VzzB+7NsRXn5kW8WzT8SolqVYPi/O66203uaj/U5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d6WiuMwYNbBvyKCjPqxqa/MkNdlf1IkORhEDfWJfia4s2e0cbvNphJ7Vid9tEBmHu
 rM87d7Oi0LqDWTwfNM2kjKXLd05VpP7wSaBiXh9f/jlJbw2aYzWtgnqMk7O+0dWQAO
 dkaBarPMwKWXj3BvcNnIgHb2iInMNX5WQ2F0GV+I=
X-Riseup-User-ID: F1C1B79971C97704F76C95666C97F3C78B7703904497D358FAB77072EE517C47
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PhVgL679fz1y7V;
 Wed, 22 Mar 2023 14:08:14 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/tests: Test drm_rect_calc_vscale()
Date: Wed, 22 Mar 2023 11:06:59 -0300
Message-Id: <20230322140701.69852-4-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_vscale() function, besides the test
for the usual case it also test for the exceptions.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 7e02393092fa..0f7736073390 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -280,6 +280,59 @@ static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
 }
 
+static void drm_test_rect_calc_vscale(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 0, 2);
+	drm_rect_init(&dst, 0, 0, 0, 1);
+
+	scaling_factor =  drm_rect_calc_vscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
+}
+
+static void drm_test_rect_calc_vscale_out_of_range(struct kunit *test)
+{
+	struct drm_rect src, dst;
+	int scaling_factor;
+
+	drm_rect_init(&src, 0, 0, 0, 10);
+	drm_rect_init(&dst, 0, 0, 0, 1);
+
+	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 3, 5);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
+
+	drm_rect_init(&src, 0, 0, 0, 2);
+	drm_rect_init(&dst, 0, 0, 0, 1);
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
+	drm_rect_init(&src, 0, 0, 0, -1);
+	drm_rect_init(&dst, 0, 0, 0, 1);
+
+	scaling_factor = drm_rect_calc_vscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+
+	drm_rect_init(&src, 0, 0, 0, 1);
+	drm_rect_init(&dst, 0, 0, 0, -1);
+
+	scaling_factor = drm_rect_calc_vscale(&src, &dst, INT_MIN, INT_MAX);
+
+	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -289,6 +342,9 @@ static struct kunit_case drm_rect_tests[] = {
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

