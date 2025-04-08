Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE400A7F667
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80810E5F6;
	Tue,  8 Apr 2025 07:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o5+G5drY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBAC10E5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41C385C59F4;
 Tue,  8 Apr 2025 07:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3980C4CEEA;
 Tue,  8 Apr 2025 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097678;
 bh=/Wbv6r/x71/9TjKPjY3ITwX7nItTXEXLOZ+jDR5+yns=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o5+G5drYWrGfZe6gBC97ttkONB4VkJaP87qX5ZoAxAEWIeeBwBku5h96sMrNfd9LN
 4c1lGHccW5NSfsGkXx7HI/OfDqNx2tSUPSyN6LWt6AY57Ia4gXnq5lmQ0kQB2WtqO9
 VY0UPpeKQ83TER4FwkP0EsfhaqelxafAq9ExQIzlUSEGSQBzxFaBe8oPVQzwNJp+ZC
 Xrcn7Ft0P7cqmY9N9DE4XHBVw9i6WS4yWiHDtnu+9nactdhfsDObcT/MU4uCNA8zP1
 BxcxHFxlrP8mZLeDpQSoi5MHtF0c5onYTDGWaDcVAjN37LxjCeidjeZPHl5j/jobQS
 JOn5WT/sXbbtQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:12 +0200
Subject: [PATCH 6/7] drm/tests: modes: Fix drm_display_mode memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-6-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/Wbv6r/x71/9TjKPjY3ITwX7nItTXEXLOZ+jDR5+yns=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlauiZ539Z4mHztL1ncFv5h3OwNDKi+sdg/T/27+N
 ODQkXCmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExEWo7hn96N+OJi3t1FOdt3
 zRMovNZsZV8Q/v230KnPC3Ry7y4L/srIcPbwlcSo0k8ntn7T3HGgvbnp3Wl9WcsCtgb2olUa369
 E8wEA
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
drm_test_modes_analog_tv_mono_576i() test never does however, which
leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: e31538489908 ("drm/tests: Add tests for the new Monochrome value of tv_mode")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_modes_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 7ba646d87856f52f99b0f9bcfed0c31d848c798d..f5b20f92df8be73ad9ef46aedae8b855e637e4dd 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -154,17 +154,21 @@ static void drm_test_modes_analog_tv_pal_576i_inlined(struct kunit *test)
 
 static void drm_test_modes_analog_tv_mono_576i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *mode;
+	int ret;
 
 	mode = drm_analog_tv_mode(priv->drm,
 				  DRM_MODE_TV_MODE_MONOCHROME,
 				  13500 * HZ_PER_KHZ, 720, 576,
 				  true);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
 	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
 
 	/* BT.601 defines hsync_start at 732 for 576i */
 	KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);

-- 
2.49.0

