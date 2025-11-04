Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEBC307DB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964DE10E5AB;
	Tue,  4 Nov 2025 10:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ewyRSUYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8169C10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:25:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso3366017f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762251948; x=1762856748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhBQ8vjBwEIJBmvGBsGuhFhSJEVfR25GCo3phCvZG9I=;
 b=ewyRSUYQQB27RsGgMKGMZXnksRbik0tU6WMU2SOPCzfBaFZhrFLps2qNepvYVVuirf
 IpnOZHPYJQKD+vrVMhvasz467LnkVxgz4bDCBwReS7SstsrCaUdYRUOtoMCJURvs4HUX
 7Um2JqIvfB7dBBg6kZl4/bPKa7Lm6W0wNYhDMvlDAotBSYujpmRLKR2knKgr/O8wzr16
 RZC9hMoaaK9ey3oWExz+Cq5fT3eh2MXpX6ZBROh8kcIxP5o0v+G9GrQA8EWkovlBfhHC
 0GelPvk2DkkosnT/Gq/71Xgu25weq6ke55B7lo/0xnGL4pGczciZPyf8h57QzN9v2fel
 NGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762251948; x=1762856748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhBQ8vjBwEIJBmvGBsGuhFhSJEVfR25GCo3phCvZG9I=;
 b=Z0YOSxI/mVWrZTyXBjK8Y8pyFeICwC4sPlaYSnhRNiN9ezDHWjv3NU1WtjFZLtrSOi
 atAfKLzhhbG22QYzJqFIH+WbPp6NywGeipfx63MVaDwAM4EL8Mng08OYKkZbjBgmF01W
 ZPYRuyhQAQGTMPuvMwa9MulkqbCplfuIWYFoxaYCp+szqIMwyq7P2TdlQUadyAb5bLN9
 C7xqeST+BBCnzMlCyBYY/n8VIivLDRRoyw8oiyiUOTAgsLHGev606MNcR7fE+kHmb8aa
 DT5+IAtfQFRXdoi3443IISvhcUhgpXwcEnHbUwNj4hqeBlD6QmUqqQCSk0nTSUQ2jbZd
 Fehw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMUTZe+rPSlObD6MRae9DbGaoII8+8vFyGPod+intWqESfShOZzB/BagNEmVHDbr+vdHK83rQIKf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyy0j4MblOqqWt1Yf0HbI+0lZhMpi/smL26HoQXmQ6DaMVRGYr
 MLbYN5WrEcM0ZJL6wA86+gzZHkYmFe8YGFrLow8gvW8AY1+NXyKOs9TD
X-Gm-Gg: ASbGncvHQkt3fMMaJrKSI4rTxLwLWyMr+zxm3kXIP9IcCwp3nXLVlZT77UhxZSzIHX+
 w6NeAdXePnS9Zmlxwd5efRcC12+LeQqMejtTnznK32a8r1Jznm5mANANBxXxd0oBv5d+f/NzM5U
 ERqKnByXzf3TGEHjuEahTLUItvMbk+3bkMId12ZFTWcTwbKYGepKl1W6wzCyo2jAdHvrLvaesIB
 WgrkRESwXl2UNX1lILBHXUkC31LdQnIo5nZE4zZQXIMebGQvQhyDZplE0UPDzNxzXtOi1BnP3d3
 NR9WNpJqpSELbeWLzygXndQDN+MgKYoPHlDveVS7Zt0yHilQkdazKb/Mp/VBEriHVpXpDBLLwWz
 ji+ab9kBbkeH41TsH1ZlXogwZKS7fvUpXLfepqUknVknewMttE1xcESIdvdAQCGNoZwTYnla0+2
 L1BpAUOqao
X-Google-Smtp-Source: AGHT+IH+9hXN3zecAOt94R0UMzn3AXAI06qnGLK2FptskRb06g7/FXm0009aQA/07/l5sYYgqXvRtg==
X-Received: by 2002:a05:6000:2c0b:b0:428:5860:48c0 with SMTP id
 ffacd0b85a97d-429bd672650mr11506975f8f.7.1762251947818; 
 Tue, 04 Nov 2025 02:25:47 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f98d9sm3798796f8f.32.2025.11.04.02.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 02:25:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: quic_jesszhan@quicinc.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 quic_abhinavk@quicinc.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 2/2] drm/tests: Handle EDEADLK in set_up_atomic_state()
Date: Tue,  4 Nov 2025 11:25:22 +0100
Message-ID: <20251104102535.12212-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104102535.12212-1-jose.exposito89@gmail.com>
References: <20251104102535.12212-1-jose.exposito89@gmail.com>
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
the drm_validate_modeset test [1]:

    # drm_test_check_connector_changed_modeset: EXPECTATION FAILED at
    # drivers/gpu/drm/tests/drm_atomic_state_test.c:162
    Expected ret == 0, but
        ret == -35 (0xffffffffffffffdd)

Change the set_up_atomic_state() helper function to return on error and
restart the atomic sequence when the returned error is EDEADLK.

[1] https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/2106744096/test_x86_64/11762450343/artifacts/jobwatch/logs/recipes/19797909/tasks/204139142/results/945095586/logs/dmesg.log
Fixes: 73d934d7b6e3 ("drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()")
Closes: https://datawarehouse.cki-project.org/issue/4004
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Added Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
index 1e857d86574c..bc27f65b2823 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -156,24 +156,29 @@ static int set_up_atomic_state(struct kunit *test,
 
 	if (connector) {
 		conn_state = drm_atomic_get_connector_state(state, connector);
-		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+		if (IS_ERR(conn_state))
+			return PTR_ERR(conn_state);
 
 		ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
-		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			return ret;
 	}
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, &drm_atomic_test_mode);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	crtc_state->enable = true;
 	crtc_state->active = true;
 
 	if (connector) {
 		ret = drm_atomic_commit(state);
-		KUNIT_ASSERT_EQ(test, ret, 0);
+		if (ret)
+			return ret;
 	} else {
 		// dummy connector mask
 		crtc_state->connector_mask = DRM_TEST_CONN_0;
@@ -206,7 +211,13 @@ static void drm_test_check_connector_changed_modeset(struct kunit *test)
 	drm_modeset_acquire_init(&ctx, 0);
 
 	// first modeset to enable
+retry_set_up:
 	ret = set_up_atomic_state(test, priv, old_conn, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_set_up;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
@@ -277,7 +288,13 @@ static void drm_test_check_valid_clones(struct kunit *test)
 
 	drm_modeset_acquire_init(&ctx, 0);
 
+retry_set_up:
 	ret = set_up_atomic_state(test, priv, NULL, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_set_up;
+	}
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
-- 
2.51.1

