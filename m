Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80777A9C569
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427A610E943;
	Fri, 25 Apr 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lK3Yu1Wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF8910E929
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576909;
 bh=ABLVH0fZJ3K/S4w0Vgcp47RVtxyTMxfkt9nfRrx9wCI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lK3Yu1WkxuyCgQ4hWZaK5+NOVA92lHstpPUPaRP6IkN4KaubLR8RyN1kS15tnj5ur
 60e6XLKtQO1SUP9jgCdX6UJiND2j9FDtv7cN+7scC1QbL+kVV2sREphERzLayG7jz5
 en0/ZQiUeeX+OqUxDVIFZqyp6DvkhmRrE/eEThXG3plopCS/b0w0THVRTxzfQ8Ui/9
 AWuSF4q1kJg2tEsERjmJd7nQql9AoWtbyoEDx0FWg0l2KrvmYtlAgrdhgpmrnTT2fN
 rKwX2wrcZVpfjoqeJt1JqJMTLFwdRdVhA8mdKtGUVAMBHP0TIwsVtBLlUmpfuDCSoc
 eUQMGpiZ7ekBw==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 930D917E36C2;
 Fri, 25 Apr 2025 12:28:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:04 +0300
Subject: [PATCH v4 13/23] drm/tests: hdmi: Switch to
 drm_kunit_helper_try_enable_crtc_connector()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-13-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable automatic handling of EDEADLK by switching from
drm_kunit_helper_enable_crtc_connector() to
drm_kunit_helper_try_enable_crtc_connector().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 180 ++++++++++-----------
 1 file changed, 88 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 323863a24a498d220f9fb73081abfbb00575c370..c8969ee6518954ab4496d3a4398f428bf4104a36 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -257,10 +257,10 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -326,10 +326,10 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -397,10 +397,10 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -457,10 +457,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     mode,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 mode, &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -518,10 +517,10 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -580,10 +579,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     mode,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 mode, &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -643,10 +641,10 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -705,10 +703,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     mode,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 mode, &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -769,10 +766,10 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -845,10 +842,10 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -921,10 +918,10 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -968,10 +965,10 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1017,10 +1014,10 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1066,10 +1063,10 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1117,10 +1114,10 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
@@ -1191,10 +1188,10 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1265,10 +1262,10 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1330,10 +1327,9 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	drm_modeset_acquire_init(&ctx, 0);
 
 	crtc = priv->crtc;
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     mode,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 mode, &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1397,10 +1393,10 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1466,10 +1462,10 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1526,10 +1522,10 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1588,10 +1584,10 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1631,10 +1627,10 @@ static void drm_test_check_disable_connector(struct kunit *test)
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
-						     crtc, conn,
-						     preferred,
-						     &ctx);
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);

-- 
2.49.0

