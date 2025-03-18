Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B148BA67622
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A427E10E49D;
	Tue, 18 Mar 2025 14:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tOcIvueU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625810E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:17:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C1E25A48720;
 Tue, 18 Mar 2025 14:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAF5C4CEEE;
 Tue, 18 Mar 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742307474;
 bh=Qse+YpYm1YMkR9UE3SKy6BavWvSqQlpvnDsgaxildas=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tOcIvueUgOEJxFr9+nGMRNUA7zNlNutA1Dh32HyaZQRSl8v0BpwARLovQmDZqU/EW
 N7z5vxkxESfQocNDRjqBQo90m0A8GBjOaArI1S2Oib4ISCI6iHOoGBRREmzPtI3/xU
 FjLUwW8TQqHEBAsuspQV7L37XjPGau7/yzO3tLG8SgGosAfhnnGg4PKWTzDbAUabOG
 rJV7ZcBjZRyxcMUdRkCEwjeZQjXt5cuXodUcPEVjjWdwbGWynFExDM0Y19+iMqePl3
 1UlehcexXnMXfjUgm3xXamVQtbE5ZUiZb9mer+u+MVMRuK+kyluGD2lruspIkyo/3e
 DH9+banXXoDOA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 18 Mar 2025 15:17:40 +0100
Subject: [PATCH 4/4] drm/vc4: tests: Retry pv-muxing tests when EDEADLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-vc4-kunit-failures-v1-4-779864d9ab37@kernel.org>
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
In-Reply-To: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6791; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Qse+YpYm1YMkR9UE3SKy6BavWvSqQlpvnDsgaxildas=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOk3G5q/2ngGhdZ+u2l560t2WsaM7d5h0Wa/7Jdtl/X6s
 DZ++ZJLHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiRy8yNtzoWOv2J0B4jUyz
 ZmQxs6VMf/Jkz5fmEk1XIo8Krcu5lxARcOvcLr2JYtZc0ded90kvZmz42CfLm/b/Y9+/r+smfJG
 7/2hx8fUHT7QOxW+9af5+Ul6v14rWLK+qnxN4pjBfa+c7enAWAA==
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
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 52c04ef33206bf4f9e21e3c8b7cea932824a67fa..94e05bddb630a79aab189d9bc16f09a9d84ce396 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -685,20 +685,26 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
 
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
+		if (ret == -EDEADLK)
+			goto retry;
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry;
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_TRUE(test,
 			  check_fifo_conflict(test, state));
 
@@ -726,21 +732,27 @@ static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
 
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
+		if (ret == -EDEADLK)
+			goto retry;
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry;
 	KUNIT_EXPECT_LT(test, ret, 0);
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
@@ -811,17 +823,22 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -834,17 +851,22 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi0_channel].in_use);
 
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -885,20 +907,27 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -919,17 +948,22 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[old_hdmi1_channel].in_use);
 
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_hvs_state = vc4_hvs_get_new_global_state(state);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
 
@@ -979,29 +1013,39 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	drm = &vc4->base;
+retry_first:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_first;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+retry_second:
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK)
+		goto retry_second;
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
 							    VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);

-- 
2.48.1

