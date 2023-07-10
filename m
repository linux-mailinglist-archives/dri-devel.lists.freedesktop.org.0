Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4374CEEC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD0B10E210;
	Mon, 10 Jul 2023 07:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0D10E210
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:48:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FB7360E9E;
 Mon, 10 Jul 2023 07:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EA1C433C8;
 Mon, 10 Jul 2023 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975284;
 bh=fPdxAPJD7CpD3AfQBHyKw92YCMzAMwqXjaFIYguE02o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=E+/jYc+X+JfKXjXj4itmX1fGoj+DANb8FwUhV7qUTm3rOWT8eoltcsHw0bLOR9Ort
 2ge/7liyze5sejdX6n9qxhJVvrJ9f5LcgtAAd7c2Le5HUcGkNE0Luh2a6E4AJAVmto
 h5Sw9hG8VPXzYznNfAOW8va+jVrz7edAffgEsm5+GFlqJRymyzoKvs3v7kqBvhikzl
 SKzzLK4dBdWV3HzMS4zm5WnhYROdkwyINjQgLncAHsK+q+XGNqNMxEYzt07rEYoVGA
 DiVx3/yIrueyyd8/EuqI4D7Vgzie9oYYtZTzzEvoqf/m5CXx3ukWj89FBirgFP2aDv
 z3lJSdbVJ4MaQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:39 +0200
Subject: [PATCH 08/11] drm/vc4: tests: mock: Use a kunit action to
 unregister DRM device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-8-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fPdxAPJD7CpD3AfQBHyKw92YCMzAMwqXjaFIYguE02o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt8+4s67/9OcVT2x9VX4mPp21o8iVZ+I2s8nJ8cnzpD4u
 Yd3R2VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ3L/K8D/YMUd04udJs8TENs+Wv8
 EoLnZyVTNjzUdBtprnlvfldKQZGV4rbpzvevn4wZ9lORFMJ6btZe99t4llrsKUv04P0rcG+zIDAA==
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

The *_mock_device functions allocate a DRM device that needs to be
released using drm_dev_unregister.

Now that we have a kunit release action API, we can switch to it and
don't require any kind of garbage collection from the caller.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c           | 5 +++++
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index a4bed26af32f..00825ddc52f0 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -186,6 +186,11 @@ static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
 	ret = drm_dev_register(drm, 0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	ret = kunit_add_action_or_reset(test,
+					(kunit_action_t *)drm_dev_unregister,
+					drm);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	return vc4;
 }
 
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 6c982e72cae8..776a7b01608f 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -754,14 +754,11 @@ static int vc4_pv_muxing_test_init(struct kunit *test)
 static void vc4_pv_muxing_test_exit(struct kunit *test)
 {
 	struct pv_muxing_priv *priv = test->priv;
-	struct vc4_dev *vc4 = priv->vc4;
-	struct drm_device *drm = &vc4->base;
 	struct drm_atomic_state *state = priv->state;
 
 	drm_atomic_state_put(state);
 	drm_modeset_drop_locks(&priv->ctx);
 	drm_modeset_acquire_fini(&priv->ctx);
-	drm_dev_unregister(drm);
 }
 
 static struct kunit_case vc4_pv_muxing_tests[] = {
@@ -871,7 +868,6 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	drm_atomic_state_put(state);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	drm_dev_unregister(drm);
 }
 
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
@@ -960,7 +956,6 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	drm_atomic_state_put(state);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	drm_dev_unregister(drm);
 }
 
 static void
@@ -1013,7 +1008,6 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	drm_atomic_state_put(state);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	drm_dev_unregister(drm);
 }
 
 static struct kunit_case vc5_pv_muxing_bugs_tests[] = {

-- 
2.41.0

