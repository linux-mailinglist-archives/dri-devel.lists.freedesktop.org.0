Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFDA7F663
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F9910E5F1;
	Tue,  8 Apr 2025 07:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mhh/mKKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4610E5F0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BA184A0C1;
 Tue,  8 Apr 2025 07:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86341C4CEE5;
 Tue,  8 Apr 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097669;
 bh=RnnIZ34b3oTsJIkOQPflExxRv0VozyVKDB6J0hBGD/E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Mhh/mKKVp0dArmRRWV3G8QETtoGLkQ6q/uxYGj27hdnWhLchZmWJFQwGdJA5F8I/U
 yktWCg25dTx6xO13xCVuvgs+2NvlpO5M82RofsA6O9uifM1IV9hqplHkhm15qR1FCT
 dz9KZCBm7J5jwQHf7OLIAwZCAVgAOz3QgcwVBYXUsX3LX8W3Dr6hueXf1SjfDOMDON
 Baf15i6xnx4kmYpZL+pjvNzS8pR9jarNwNVl3FRPwOLzkczau+pQyQPFLXDC33Ue2P
 qUXSWNXyM3ElQmU7qrD5wCOO5l3j+aP0htsmp8hiLWeQSpg7GFtm2iREWOpTsm+l4r
 fTEKZt2i+gXLA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:09 +0200
Subject: [PATCH 3/7] drm/tests: modeset: Fix drm_display_mode memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-3-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RnnIZ34b3oTsJIkOQPflExxRv0VozyVKDB6J0hBGD/E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpa3itVESvOsmrP0+TvuL15qZ2aenKzVuo1ZLr49+
 vpTu5VWHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhItBDDP/vl52IFt/5K1ZSu
 U9/5w+Oe+pGcd7k2bl+y7c+HZUUIujEy/Hj8Tuv4nx0z34jzyM696Xj3spLxR4PLy+bXZ/35lbz
 gMBcA
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
needs to be destroyed later one. The drm_test_pick_cmdline_named() test
never does however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: fedcaf726f54 ("drm/modes: Properly generate a drm_display_mode from a named mode")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 3e9518d7b8b7eb92f1be3ce376d850cbab638d10..b2fdb1a774fe69c4e14b718324d7380f900bd548 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -130,11 +130,12 @@ static void drm_test_pick_cmdline_named(struct kunit *test)
 	const struct drm_connector_pick_cmdline_mode_test *params = test->param_value;
 	struct drm_client_modeset_test_priv *priv = test->priv;
 	struct drm_device *drm = priv->drm;
 	struct drm_connector *connector = &priv->connector;
 	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
-	const struct drm_display_mode *expected_mode, *mode;
+	const struct drm_display_mode *mode;
+	struct drm_display_mode *expected_mode;
 	const char *cmdline = params->cmdline;
 	int ret;
 
 	KUNIT_ASSERT_TRUE(test,
 			  drm_mode_parse_command_line_for_connector(cmdline,
@@ -150,10 +151,13 @@ static void drm_test_pick_cmdline_named(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	expected_mode = params->func(drm);
 	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, expected_mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
 static const
 struct drm_connector_pick_cmdline_mode_test drm_connector_pick_cmdline_mode_tests[] = {

-- 
2.49.0

