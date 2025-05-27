Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC8AC4E6C
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931210E4E4;
	Tue, 27 May 2025 12:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fdUyCAyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D858610E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347892;
 bh=Uajc0TXmqgnkuOfOebILUOgudIxuBQ++KVKDQhgvIZA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fdUyCAyA106iWEXOWQuxRKieSa39mtgXBdv1QkOjECxLWZD1WopF4QQIwubhuvrEl
 ehIDLkzCsHnsaboZAeHe2/7+kJymBaTcVU8mIEbNSWMmEVO3N/ehRkvMRNbDtlTxEG
 VYE1aUie+EPVggayDKyHUSA4gYLYVLIXHtWGj4psJ/qt1r/LceISjMeDVmTM0SzA2+
 aMeLry/lakEipH1cG3uPUs2KKGcMGWMUka9GnOvStW9r3AzC82xUWmNU7wTaNNUiWg
 jdwU2FW3zmDLPf6ze6Hn5ab6ep/+Ow69/UOb1ieBKRlc2c1zhmTGhjRZ5nGoAep4cj
 0caSYLVHvaz3g==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9809B17E37D6;
 Tue, 27 May 2025 14:11:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:21 +0300
Subject: [PATCH v5 13/19] drm/tests: hdmi: Switch to
 drm_atomic_get_new_connector_state() where possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-13-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
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

Replace the calls to drm_atomic_get_connector_state() with
drm_atomic_get_new_connector_state() for cases which do not require
allocating the connector state, e.g. after drm_atomic_check_only() when
the intent is to only read the new connector state.

The rational is to avoid the need to handle the potential EDEADLK error
returned by the former helper, which would require restarting the entire
atomic sequence.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e3e2878d29ea5bfe107a5098d0cbf2653af0bc9b..168fe25529e5861ebee2d8a929f912436c485c60 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -416,7 +416,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_limited_range);
@@ -476,7 +476,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_limited_range);
@@ -535,7 +535,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -597,7 +597,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -660,7 +660,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -722,7 +722,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,

-- 
2.49.0

