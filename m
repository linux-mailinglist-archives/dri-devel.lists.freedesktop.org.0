Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5CA7F666
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A5610E5F5;
	Tue,  8 Apr 2025 07:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OxqjfCoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E02E10E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D591AA48EA8;
 Tue,  8 Apr 2025 07:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC865C4CEE5;
 Tue,  8 Apr 2025 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097681;
 bh=0zYH8GXeZCdhYRoG6dWvpLAyDo/PjwqMRCxfB3+ZTls=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OxqjfCoHeIzklkN3oG4EVzuqyc9X/pvQAIq/xNsehgw+35KEcE96QHRpS1C7c49JU
 f6vrE3zjpamudNu3rGa1qCx0NEoNO5LhpurfO3AUliIQXj80hRuLM7TVjMu9LlCCeu
 3fhYvFpCfYiT9pM4hF75gP0EgGi6kUsZzrrUJ/GDJPTbBotd7pGDgaSMyQuIiHKY9l
 ntxDpYXuX5o2swJKR1G5HqhEGX2ogxVkApOwowmdBluI/mqyr1Jhnh0lFIjRO9rAzL
 +obSiOlp383JzdXmjIKID8AKHyXyjadJb5gHxW0uD7jeYo7QPIv7Dd2UudFApJW/SO
 Cj3QaqI/NTLsw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:13 +0200
Subject: [PATCH 7/7] drm/tests: probe-helper: Fix drm_display_mode memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-7-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0zYH8GXeZCdhYRoG6dWvpLAyDo/PjwqMRCxfB3+ZTls=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlat09LI9P9u3f9b1z6mwMYrZV/Uf/n778/LvMj7e
 CRvqffGjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExk2glGhrt6G5Zk17iFJfRc
 PjA1tVtnXa/vL8Wjp5zXfv3W+/cuaxUjw17n1h1qgnN1Nv88aHFYY7tOz2PW6scb3zjHBa2Km+h
 dyQgA
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

drm_analog_tv_mode() and its variants return a drm_display_mode that
needs to be destroyed later one. The
drm_test_connector_helper_tv_get_modes_check() test never does however,
which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: 1e4a91db109f ("drm/probe-helper: Provide a TV get_modes helper")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_probe_helper_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index bc09ff38aca18eb06dc476310e1dbf372bc5545c..db0e4f5df275e8473ec916ed7a7cf16db96b81c5 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -96,11 +96,11 @@ drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
 	const struct drm_connector_helper_tv_get_modes_test *params = test->param_value;
 	struct drm_probe_helper_test_priv *priv = test->priv;
 	struct drm_connector *connector = &priv->connector;
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
 	struct drm_display_mode *mode;
-	const struct drm_display_mode *expected;
+	struct drm_display_mode *expected;
 	size_t len;
 	int ret;
 
 	if (params->cmdline) {
 		cmdline->tv_mode_specified = true;
@@ -132,10 +132,13 @@ drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
 		expected = params->expected_modes[0](priv->drm);
 		KUNIT_ASSERT_NOT_NULL(test, expected);
 
 		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
 		KUNIT_EXPECT_TRUE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
+
+		ret = drm_kunit_add_mode_destroy_action(test, expected);
+		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	if (params->num_expected_modes >= 2) {
 		mode = list_next_entry(mode, head);
 		KUNIT_ASSERT_NOT_NULL(test, mode);
@@ -143,10 +146,13 @@ drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
 		expected = params->expected_modes[1](priv->drm);
 		KUNIT_ASSERT_NOT_NULL(test, expected);
 
 		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
 		KUNIT_EXPECT_FALSE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
+
+		ret = drm_kunit_add_mode_destroy_action(test, expected);
+		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	mutex_unlock(&priv->drm->mode_config.mutex);
 }
 

-- 
2.49.0

