Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6DC3079C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2E10E5A9;
	Tue,  4 Nov 2025 10:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OdoUdPzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8D710E5A9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:23:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47112a73785so35158545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762251790; x=1762856590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F20WkVDMnVuGhUdaFvlHMiL1gr9I2eF6DsUKNYkjzsw=;
 b=OdoUdPzqYIDRZ8xH6THPhYezXCC5IiI6QLDHYpkpcWr+Su0/rpCyUR3XYtSP/Ze5ys
 PFA4mF8rVN2uBHCm5NrwU+AeF4DxUo24WlKJkSYZKZBo0T0fEkRtIVXNs5QEKKkXWFoq
 1MIq4oohn6hmdKzlUcNm/21Uzucfmy4z1wH/fBZeC6exgXCW2yZhJDcZSKkHBhoFyjLD
 YlPHBsZ1UAtyKkpU0jhImqepguFFe4xu2M6GCBurwoqjujs6p78R92fDygezUZz4BbUS
 24BkNW35fFiuzvhqOGeUr0169QGEws1DHS2yQhSEgz0DYfIh76xMZ9+oOiEAa9+N2g5h
 VcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762251790; x=1762856590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F20WkVDMnVuGhUdaFvlHMiL1gr9I2eF6DsUKNYkjzsw=;
 b=VmIaPtBIxoH36tFjRBTKsyzyms/EC/29v8cMmPGV+01jssjXR/YJIxm5wKalLrp2hM
 lBMYR1QGxx/v5id7/OwsQuA0zVdUSzpqlKrWvXRQ/3X0L/9f1mfeWDwd1awAidTiicfr
 76AeYDTYAlgNI+oEoc7foCrvpRpimltI5pds4xCMbPyoFq9vRIdRVr4gdM1FzTex+Qd6
 qWKZ/HHp11ZnhY5qoTFoxMrrzMCU8fd/BX4X0VxN40K8nmaUMGGnUEPuGoZx+OX33wL+
 NxMytR6FGxDtXBf3XM2i3jHTu91Zn7F+c8xe+ZuRpW9pZbOsIRi9+7BCB1LdQn40N26j
 wtWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGDHpV/vs2LLwIBLynIXmSR6esv6PPjjLdjEIrwX5mEh6nqrDIKplR0t7XM/CXOU5Jt4aJo3iTN4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEA9R5pRgXPlB806Tjb6GKxje8jVfBW3D/wAX0ny6MpRmLQ6NF
 qCBOLnu+FlnCXwikS4jqHAxQcjrPfU1M8IblTHJf1bwV+vqFzhK1mSys
X-Gm-Gg: ASbGncuiYoOfdgfQ7YxJwGv2NvnL0UUBbYTRb+SGskJ+tLC0fiiQurE38A5si4AKnrI
 Hoe0cXoX68RIIHe92xET3R74SNLF/FsmPhtI3jWCMVuNlY28FSIm+aYHQLkKk1JZTv/wpxikbom
 EPtLmF4xZEjH7aqBuL84nUBd5ABF7tygDBfdqfZYpxuqnJOdCMNFl4GCKHglxvIbs86tl+WFU3N
 pOvH/Rt3T6JFjtlUAEzmsC7WpC0NfYQl9QTXC1xMYG1XyXmi6tI/4gQJhsGkGXgqJNrSnSs1zGO
 e1658paa0YFqJDR9YtynnIr+xuCwQt3d4S9YRBeTKQ3Qv9JcKUu1ZZWLRqTrWto+73m7eAwKy/N
 aYjaKHXdUVmgUihgjYhU9yZtevFycehpP9uOXZ4N3ijUkxtUrBnptz5+PzF483DgtDIu+d0+C1M
 /6xemZX1bH
X-Google-Smtp-Source: AGHT+IGKjhzqQ3l/o85RnxG6GfkFOfaSy80wjqnRvBu8AXnNM14v9fVkT3kLxkcGNgrOpSZ18ecwTg==
X-Received: by 2002:a05:600c:538e:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-47730890e99mr156705115e9.32.1762251790205; 
 Tue, 04 Nov 2025 02:23:10 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755932d9csm14426205e9.3.2025.11.04.02.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 02:23:09 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, cristian.ciocaltea@collabora.com, lumag@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2] drm/tests: hdmi: Handle
 drm_kunit_helper_enable_crtc_connector() returning EDEADLK
Date: Tue,  4 Nov 2025 11:22:35 +0100
Message-ID: <20251104102258.10026-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fedora/CentOS/RHEL CI is reporting intermittent failures while running
the KUnit tests present in drm_hdmi_state_helper_test.c [1].

While the specific test causing the failure change between runs, all of
them are caused by drm_kunit_helper_enable_crtc_connector() returning
-EDEADLK. The error trace always follow this structure:

    # <test name>: ASSERTION FAILED at
    # drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:<line>
    Expected ret == 0, but
        ret == -35 (0xffffffffffffffdd)

As documented, if the drm_kunit_helper_enable_crtc_connector() function
returns -EDEADLK (-35), the entire atomic sequence must be restarted.

Handle this error code for all function calls.

Closes: https://datawarehouse.cki-project.org/issue/4039  [1]
Fixes: 6a5c0ad7e08e ("drm/tests: hdmi_state_helpers: Switch to new helper")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Add Reviewed-by: Maxime Ripard
---
 .../drm/tests/drm_hdmi_state_helper_test.c    | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000..70f9aa702143 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -257,10 +257,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -326,10 +332,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -397,10 +409,16 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -457,10 +475,17 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -518,10 +543,16 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -580,10 +611,17 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -643,10 +681,16 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -705,10 +749,17 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -870,10 +921,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -946,10 +1003,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -1022,10 +1085,16 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1069,10 +1138,16 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1118,10 +1193,16 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1167,10 +1248,16 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1218,10 +1305,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
@@ -1292,10 +1385,16 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1440,10 +1539,16 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1669,10 +1774,17 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	drm_modeset_acquire_init(&ctx, 0);
 
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     mode,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1736,10 +1848,16 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1805,10 +1923,16 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1865,10 +1989,16 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1927,10 +2057,16 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1970,10 +2106,17 @@ static void drm_test_check_disable_connector(struct kunit *test)
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
+
+retry_conn_enable:
 	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
 						     crtc, conn,
 						     preferred,
 						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
-- 
2.51.1

