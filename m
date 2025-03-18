Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401FA6761F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D410E499;
	Tue, 18 Mar 2025 14:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R+mSoWHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2542A10E497
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:17:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96D56A46ED5;
 Tue, 18 Mar 2025 14:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFCFC4CEEE;
 Tue, 18 Mar 2025 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742307465;
 bh=oLlD/CohJAeZ7/DwzuOA47geT3BKc+DVQr/5GRHd5pY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=R+mSoWHxO+jVje18cTg9V/eN2SExL8ZuuXAGCO/bt2+3zz65JWyvL/CrC/HyTyw/E
 23qMvclArnrRPtM18Nt5eD+DKptVZAg186EsJC7C+bu6N4TyMqoMyhd95ipfpOsmMW
 q0/7ahbPh1/b47C/8qSTOOAmsXLdE1jhLEPZDZcg5R9o0MQwQNvtV0MOPanaBsKbaW
 OmpXCHYeK2M4Bia5DtGQ4LsizpVGoaceg6/uPxVp9uQDzDFMHq3pUUZScvbiMluCxR
 WsO5knW12HpZmGcIEGLwCAGiig7y70ZbyT/OcAOLsAOFWTdA4H5UhrgGubIbBI/vro
 /17IijKhF0W3g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 18 Mar 2025 15:17:37 +0100
Subject: [PATCH 1/4] drm/vc4: tests: Use return instead of assert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-vc4-kunit-failures-v1-1-779864d9ab37@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oLlD/CohJAeZ7/DwzuOA47geT3BKc+DVQr/5GRHd5pY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOk3G5q2Wq9l8tjd8LeI5/+pH28bPyzyfPtVsyHOXODi6
 k/On26ad0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJPJNnrJVxvpr5a1FHSH1n
 gunZiXfabHveHfVyk05uEBY4aLlY//0B02f5CzJ96kqPisbX/Z+ZwVhnVneo5M9n3V9WESbHEhm
 0BKWmO2+UPvyHO7XHw4H1kbfl3E2XC34eqnnzJSd+hb7Nns0A
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

The vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() assert
that the functions they are calling didn't fail. Since some of them can
return EDEADLK, we can't properly deal with it.

Since both functions are expected to return an int, and all caller check
the return value, let's just properly propagate the errors when they
occur.

Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 36 +++++++++++++++++++----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index e70d7c3076acf168782c48301f3b3dfb9be21f22..f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -73,28 +73,34 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 	int ret;
 
 	encoder = vc4_find_encoder_by_type(drm, type);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+	if (!encoder)
+		return -ENODEV;
 
 	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+	if (!crtc)
+		return -ENODEV;
 
 	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, &default_mode);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	crtc_state->active = true;
 
 	return 0;
 }
@@ -111,28 +117,34 @@ int vc4_mock_atomic_del_output(struct kunit *test,
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 	int ret;
 
 	encoder = vc4_find_encoder_by_type(drm, type);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+	if (!encoder)
+		return -ENODEV;
 
 	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+	if (!crtc)
+		return -ENODEV;
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	crtc_state->active = false;
 
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	return 0;
 }

-- 
2.48.1

