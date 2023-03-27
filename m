Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B891F6CA628
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 15:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E210E5D2;
	Mon, 27 Mar 2023 13:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00710E5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 13:39:38 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PlYp22lbHz9sxg;
 Mon, 27 Mar 2023 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679924378; bh=jwkx7cxH5mPQnO6CaM5FAIAMPPA/T2adQyIjgxt87Tk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SZmDqsvoZhauOv6HkFOEDgY/UCpQwFuXJZlAqM2q5/mUsr2HdNsjr8wcme19DFXWd
 WOF4inViKehJhRJfJTrnLbo5OzKtrrVBx1H1I7vp/yPxObDakwAeF54x0DJQowLf5/
 FXtMfuDkYhegV3rp3LODhfqhyZ3/FvhV/90PY9A8=
X-Riseup-User-ID: 758E7C7CCDD08DA7240F4A9A599C93395DFD60E8B1078E6E3A4705A299DC72CB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PlYnx5Wnnz1yBT;
 Mon, 27 Mar 2023 13:39:33 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/test: Test drm_rect_rotate_inv()
Date: Mon, 27 Mar 2023 10:38:48 -0300
Message-Id: <20230327133848.5250-6-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_rotate_inv() function, by expanding the
existing test framework for the drm_rect_rotate().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index bb3fff09cb7b..f3805a8512de 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -512,6 +512,16 @@ static void drm_test_rect_rotate(struct kunit *test)
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
@@ -525,6 +535,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
 	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
 	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate_inv, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.39.2

