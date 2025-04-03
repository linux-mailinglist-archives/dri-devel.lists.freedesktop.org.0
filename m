Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E9A7A3C0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50CF10E9C2;
	Thu,  3 Apr 2025 13:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fFYDb8c+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217A910E9EA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 13:33:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 891F65C4957;
 Thu,  3 Apr 2025 13:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1064C4CEE5;
 Thu,  3 Apr 2025 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743687234;
 bh=hMXyl/o28HCBQcio/Vf3sP3GQUcIbXdFe9WHjTM8Fjg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fFYDb8c+ymb+FThbz5S66LzuzIlEmTagnsBzHN+4WB/dn+oaKsnCtqOl/FKxUUAnj
 R3egR4ORvs/j+6eVL1V3vpLZM86m9aH+5lYQMVZzcmpUpq7N2qxBbeaywu/AKII1Wv
 xv7u/Q+Zva9F9hpoN259KRX1UubvPoL9sW81wSQEPFO1Xk9Q4AUK5g0v6wTtyQMI86
 26DF7vXWSSCFh+/r7Urrg+oBaghk32w6BJSvf1A4G/s29RGryB7aidJe5mBi+Lkke+
 4KsVzunC14pehqmyMtnPhi+aA3fZvndoiCDBm71q6+am357vEVUYjb0/JJcOlSiYQa
 U+bSPR9ix0uKA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Apr 2025 15:33:33 +0200
Subject: [PATCH v2 4/4] drm/vc4: tests: Retry pv-muxing tests when EDEADLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-drm-vc4-kunit-failures-v2-4-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8413; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hMXyl/o28HCBQcio/Vf3sP3GQUcIbXdFe9WHjTM8Fjg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+oxazp7jtlO+vjvaklNjRUIw55wc6XLLI9GWv9erz
 3tTIG3fUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkEzWf4K7pIt+vamZv7Eq4z
 7RQXu/0i/7pXi9muPzIh+zUfhoRu+cjw32tfJafSG5nvnI8bQ1TeLyy88Mo2J+YPh/f1N5PS5sy
 +wgIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Some functions used by the HVS->PV muxing tests can return with EDEADLK,
meaning the entire sequence should be restarted. It's not a fatal error
and we should treat it as a recoverable error, and recover, instead of
failing the test like we currently do.

Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 113 ++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 52c04ef33206bf4f9e21e3c8b7cea932824a67fa..d1f694029169adf6a907a72614bc66afd745017e 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -685,20 +685,34 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	vc4 = priv->vc4;
 	drm = &vc4->base;
+
+retry:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
+		if (ret == -EDEADLK) {
+			drm_atomic_state_clear(state);
+			ret = drm_modeset_backoff(&ctx);
+			if (!ret)
+				goto retry;
+		}
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_TRUE(test,
 			  check_fifo_conflict(test, state));
 
@@ -726,21 +740,35 @@ static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	vc4 = priv->vc4;
 	drm = &vc4->base;
+
+retry:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
+		if (ret == -EDEADLK) {
+			drm_atomic_state_clear(state);
+			ret = drm_modeset_backoff(&ctx);
+			if (!ret)
+				goto retry;
+		}
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
 	KUNIT_EXPECT_LT(test, ret, 0);
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
@@ -811,17 +839,30 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -834,17 +875,30 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi0_channel].in_use);
 
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -885,20 +939,39 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -919,17 +992,30 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[old_hdmi1_channel].in_use);
 
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -979,29 +1065,54 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_first;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_second;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
 							    VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);

-- 
2.49.0

