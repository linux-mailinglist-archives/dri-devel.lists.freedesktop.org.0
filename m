Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBD74CEF4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149B10E212;
	Mon, 10 Jul 2023 07:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32F10E213
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:48:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F1D960EBA;
 Mon, 10 Jul 2023 07:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A237C433C8;
 Mon, 10 Jul 2023 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975290;
 bh=sh661OiebuthJZpmMjfk/uDz8mfCFIBOnwj6laIfZvA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=H2lP3U9cY4rSUv9Cw8OH5npmN1IbNMWpBdTRyoHqZiTFZ+N12+8Fx7Amri+c1oH+S
 0v1c3c6zPzFuj15OlDjXhM2j4HkG1NbSx0rrPU9nodGgVZu6WiQdU+ZA8ilpKf6hZn
 yAheO9nrMy8byNlePMvbVDttZhRZ4o3F3k5mAIzF4jyLoxK02/GIpUJOhcXJv30jRQ
 sCBvkrU/1qxaF21YdWiv2oVGN+qpI2W17jKcZsI44PXp2L/v0iojo6sgL5TopRvvRM
 NDRUduGvofFZ+FMof3SC7ckWmWWXP+P506Q+eXOSdlL8yPjYvKpjC4IZomS5TPUNNi
 rRzaJOGneLDiw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:41 +0200
Subject: [PATCH 10/11] drm/vc4: tests: Switch to atomic state allocation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-10-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=6125; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sh661OiebuthJZpmMjfk/uDz8mfCFIBOnwj6laIfZvA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt88ITQ9eoX/QfYmP89PJ82c+bGfg1MhIbxFvObPCd2PF
 6YVNHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIax+Gv4JTF/ptLczneyz92uRIr1
 ZcqOW96zzL/87nWyey98Ly+kuMDLsD/Y0XFIjazrsju0Ona2rHwiw1iZOHzv3d729Tz6zNygYA
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a helper that takes care of an atomic state allocation
and cleanup, we can migrate to it to simplify our tests.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 55 ++++----------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index ff1deaed0cab..5f9f5626329d 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -725,7 +725,6 @@ static int vc4_pv_muxing_test_init(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
 	struct drm_modeset_acquire_ctx *ctx;
-	struct drm_atomic_state *state;
 	struct pv_muxing_priv *priv;
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -742,24 +741,12 @@ static int vc4_pv_muxing_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	drm = &vc4->base;
-	state = drm_atomic_state_alloc(drm);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
-
-	state->acquire_ctx = ctx;
-
-	priv->state = state;
+	priv->state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->state);
 
 	return 0;
 }
 
-static void vc4_pv_muxing_test_exit(struct kunit *test)
-{
-	struct pv_muxing_priv *priv = test->priv;
-	struct drm_atomic_state *state = priv->state;
-
-	drm_atomic_state_put(state);
-}
-
 static struct kunit_case vc4_pv_muxing_tests[] = {
 	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,
 			 vc4_test_pv_muxing_gen_params),
@@ -771,7 +758,6 @@ static struct kunit_case vc4_pv_muxing_tests[] = {
 static struct kunit_suite vc4_pv_muxing_test_suite = {
 	.name = "vc4-pv-muxing-combinations",
 	.init = vc4_pv_muxing_test_init,
-	.exit = vc4_pv_muxing_test_exit,
 	.test_cases = vc4_pv_muxing_tests,
 };
 
@@ -786,7 +772,6 @@ static struct kunit_case vc5_pv_muxing_tests[] = {
 static struct kunit_suite vc5_pv_muxing_test_suite = {
 	.name = "vc5-pv-muxing-combinations",
 	.init = vc4_pv_muxing_test_init,
-	.exit = vc4_pv_muxing_test_exit,
 	.test_cases = vc5_pv_muxing_tests,
 };
 
@@ -814,11 +799,9 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	drm = &vc4->base;
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -839,13 +822,9 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_atomic_state_put(state);
-
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -864,8 +843,6 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi1_channel].in_use);
 
 	KUNIT_EXPECT_NE(test, hdmi0_channel, hdmi1_channel);
-
-	drm_atomic_state_put(state);
 }
 
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
@@ -887,11 +864,9 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	drm = &vc4->base;
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -923,13 +898,9 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_atomic_state_put(state);
-
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -951,8 +922,6 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 
 		KUNIT_EXPECT_EQ(test, old_hdmi1_channel, hdmi1_channel);
 	}
-
-	drm_atomic_state_put(state);
 }
 
 static void
@@ -972,11 +941,9 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
 	drm = &vc4->base;
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -986,13 +953,9 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	ret = drm_atomic_helper_swap_state(state, false);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_atomic_state_put(state);
-
-	state = drm_atomic_state_alloc(drm);
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
-	state->acquire_ctx = ctx;
-
 	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1002,8 +965,6 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
 							    VC4_ENCODER_TYPE_HDMI0);
 	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);
-
-	drm_atomic_state_put(state);
 }
 
 static struct kunit_case vc5_pv_muxing_bugs_tests[] = {

-- 
2.41.0

