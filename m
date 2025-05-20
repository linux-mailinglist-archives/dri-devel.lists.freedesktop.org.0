Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A4ABD7E6
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 14:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7610E572;
	Tue, 20 May 2025 12:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XE/0GPzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B226E10E572
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 12:08:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 521EF4A58B;
 Tue, 20 May 2025 12:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEB0C4CEE9;
 Tue, 20 May 2025 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747742922;
 bh=ZQfsFVX5UD/XSRwAU4E/sTwO70gFfISTPfGjtIaP3xg=;
 h=From:Date:Subject:To:Cc:From;
 b=XE/0GPzIkKGDpNRmePgSqqJhADflIro7oL9sMYg+dynvngh9eLWKPlrt2AaxRzq/R
 BLykpXA2nzdqRlF0njgAM/WXR3AOo8HvTOFA/uEIPiw1fLSgWaYqwHyeOKacE/rKk+
 W0JD+0Ui6nlMIwteO/N3p3600EeT5aY6aw5yeamhnwSawiispjcoacMPxk70RNNDbo
 /aiRZArItRRXoBBMBXG/6vz6KCgOX++RZx60QPdFRC3JCdRgfItwgts2uUeVZ2/83x
 bVgWVbWvMmxFAPfiWEiIq8E6JC9qUs4I3uVMgC5olZ8E81ZQoh4vW86lYcEjxg4GrH
 TyfjZNIexbCoQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 20 May 2025 14:08:36 +0200
Subject: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMNwLGgC/x3LTQqAIBBA4avIrBtQ0f6uEi3CphoiCy0JorsnL
 T8e74FIgSlCKx4IlDjy7jNUIcAtg58JecwGLbWVVkscw4bJGVwvzydOfFPEoaxVpawzRjaQzyP
 QH/LY9e/7AfOzWshlAAAA
X-Change-ID: 20250520-drm-vc4-kunit-fixes-a681715c4409
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZQfsFVX5UD/XSRwAU4E/sTwO70gFfISTPfGjtIaP3xg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBk6BcdSl9wz29U2I+F104yYpTzrasNk/razpm+uqJasE
 UzRKvrYMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYy+Sdjwwmu+rmmJksnPyr9
 +4rX+GOn99R3Xx++0N2/NiX8xNmDr9S0lvx8LR5aE+UoO1+/nmlKGGOtjLqvrJ7YY8vnG1X8PP8
 cYhScfEBKb4vS9fzSWX9WpIuXZeRPffvpXYDQrlQR55hZL7cCAA==
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

Commit 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
removed a kunit-managed function to get a drm_modeset_acquire_ctx.

It converted the vc4_pv_muxing_test_init() function, used by
drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid(). However,
during that conversion, it went from being kzalloc'd to being allocated
on the stack.

vc4_pv_muxing_test_init() then uses that context to allocate a
drm_atomic_state using drm_kunit_helper_atomic_state_alloc(), which
stores a pointer to the locking context in the allocated state.

However, since vc4_pv_muxing_test_init() is a test init function, the
context is then cleared when we leave the function, and before executing
the test. We're then running the test with a dangling pointer, which
then leads to various crashes.

Rework the context initialization and state allocation to move them to
drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid().

Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Closes: https://lore.kernel.org/r/Z_95jWM2YMTGy3pi@arm.com/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 38 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..a79b152f8b97add449cffc9674abec0df95239e3 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -18,11 +18,10 @@
 
 #include "vc4_mock.h"
 
 struct pv_muxing_priv {
 	struct vc4_dev *vc4;
-	struct drm_atomic_state *state;
 };
 
 static bool check_fifo_conflict(struct kunit *test,
 				const struct drm_atomic_state *state)
 {
@@ -675,14 +674,22 @@ KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
 
 static void drm_vc4_test_pv_muxing(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
 	const struct pv_muxing_priv *priv = test->priv;
-	struct drm_atomic_state *state = priv->state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_device *drm;
 	unsigned int i;
 	int ret;
 
+	drm_modeset_acquire_init(&ctx, 0);
+
+	drm = &priv->vc4->base;
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
 		KUNIT_ASSERT_EQ(test, ret, 0);
@@ -698,56 +705,59 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		KUNIT_EXPECT_TRUE(test, check_channel_for_encoder(test, state, enc_type,
 								  params->check_fn));
 	}
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 }
 
 static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
 	const struct pv_muxing_priv *priv = test->priv;
-	struct drm_atomic_state *state = priv->state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_device *drm;
 	unsigned int i;
 	int ret;
 
+	drm_modeset_acquire_init(&ctx, 0);
+
+	drm = &priv->vc4->base;
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
 	KUNIT_EXPECT_LT(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 }
 
 static int vc4_pv_muxing_test_init(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
-	struct drm_modeset_acquire_ctx ctx;
 	struct pv_muxing_priv *priv;
-	struct drm_device *drm;
 	struct vc4_dev *vc4;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv = priv;
 
 	vc4 = params->mock_fn(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 	priv->vc4 = vc4;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	drm = &vc4->base;
-	priv->state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->state);
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-
 	return 0;
 }
 
 static struct kunit_case vc4_pv_muxing_tests[] = {
 	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250520-drm-vc4-kunit-fixes-a681715c4409

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

