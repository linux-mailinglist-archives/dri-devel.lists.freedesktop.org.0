Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBBBFF451
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 07:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0606F10E869;
	Thu, 23 Oct 2025 05:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JaJM8rw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357E410E869
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:46:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-475c696ab72so2607025e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761198385; x=1761803185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwnxFDhqj/zOYumjR/NIec/9OkBezJdyMG3IFuZVCHs=;
 b=JaJM8rw1FwY0Hau1Kj+FdVhsM64jZqdB/Cm8yAUbYfcY/0rRFHJ/Tp09xXEgX7E6d+
 oButmNNztk6msmOh8hDnNmXPv9zC/UxudLMXah5U02zwkANnhzFEFA7kX8LQIQuQoExK
 Z6VKHfoz85LmiNNzVQmyGTlfLdcJLVRJrhUcPJCnmCalm+OQMTXx2+oxZ8q2YdVoJ4/r
 2OJiTFY+LGmqGX94in9/wTmT+2aTgaGgNWxtdQ8bHCxqZ6oD//qGJGSxngD6oCvhOL4P
 56g0AkCgRV7PWHipVv18NnPY8YVT/53PnmnzEZMYgOuCyxuN0gsuCYkVdC+IsrpGkE+d
 U+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761198385; x=1761803185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwnxFDhqj/zOYumjR/NIec/9OkBezJdyMG3IFuZVCHs=;
 b=I0PyucKDav8k94DYtiU65onGsRiafrlUVfSoNyxQKxa7qiW72YqEKWsC/6jZEooXdw
 /f2668rD2m2ZOWMUiD+0re1mU5cRUqcZ4R/22nhwC9hPj+4zGfLGXYewL28GLM6YZYZz
 NE1XIRkgEmM92CJVQvML2eoDlJjVx4SHrzwdwEB+gz5Gq/KdFf5vPTdvwcode+U12ceE
 zfVePaa4O8i+kSS1XxNVa2jGoRbLJgaRFr532gkymXwMNlUvZJ3oMkISRYFZk68LVxxw
 KARNhaJAbAQt2Zxl1RJOcE3KXb2ZKK2mSGuI7gEqH6vzTP20QL/ojDnTkHSAwMtXajPB
 x4lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/hOugwENRnDBpVK8XkFhtZaeSkCF+g2j3elTUwzdeJGp2Apb9ZFiIArU+GASXDDNsTHcLbkOtRvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwexdTJun2a4di8FVerJrPdr9152FAPAq4gaf4vJcrmKOdWY/GW
 vl9zrQZv3POuc1BRRT6eZXPcLet0qVhz5k+5TcXnU1/VXn/qCmAftToR
X-Gm-Gg: ASbGncvwW9fJVAu884IDZD4KxuxDvakzyjhcdsAmrEC7I0RyAWJuY+bXRL8ph+kVs9I
 MeEeyfNFcGl99oCz0h4eqfXPL8eKD4IKNLaksdKvxUvdvHBY3GjGAHYwpTCguZZOckiC/hc3T7A
 qVnnhqE6PLxMrT4HOftJ1jy2x6rjyb9w6/t60f+NBYIlx2M4Z6BxZJP8Uz0MykbJm514Qpvuxe2
 Yl04+AF+a2asUFgZyuupd9SlgXTz+UsyUnnrv7+IAYtgKBV5uqbDAZmHql1wNvPQ7clkPvgVSBA
 7IS90FEE8K6dZUEnX97ZcR+YIFKH+33nJyKfvNaKpAVNjYtltEo76ljG3X4qE6aiNxBmICF2JZu
 AR6Txr5Orzimcr8ScJmPlJVSag2fn4eCU2wLYtvVW7CMbbBeN7U4NSt3/mTp8raSsyyGk4GOa9X
 iz5Grk2LSeEQ==
X-Google-Smtp-Source: AGHT+IHQc98eHStc6B7n1NtnALjErZ0PHeJrg9rNrymTkb6GNxWx6MBsyxvF0dpH1vuKnppid6VE9Q==
X-Received: by 2002:a05:600c:548c:b0:46d:5189:3583 with SMTP id
 5b1f17b1804b1-471177bad0dmr162359495e9.0.1761198384454; 
 Wed, 22 Oct 2025 22:46:24 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496cf3b51sm50414785e9.9.2025.10.22.22.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 22:46:23 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: quic_jesszhan@quicinc.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 quic_abhinavk@quicinc.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] drm/tests: Handle EDEADLK in set_up_atomic_state()
Date: Thu, 23 Oct 2025 07:46:06 +0200
Message-ID: <20251023054614.6267-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023054614.6267-1-jose.exposito89@gmail.com>
References: <20251023054614.6267-1-jose.exposito89@gmail.com>
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
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
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
2.51.0

