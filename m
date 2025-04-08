Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7BA7F662
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0218510E5F0;
	Tue,  8 Apr 2025 07:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gy0vGJzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F2C10E5F1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 431E543D15;
 Tue,  8 Apr 2025 07:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58274C4CEEA;
 Tue,  8 Apr 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097672;
 bh=F3ezxU5SGoiD8ddVs6HKsPqrpZe4wJCeXDRAqLCrgfE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gy0vGJzC/pEAbHi72fmc/r6c6bIAohnAiPm+1QhM8tia49diFhfTHdkiweferQA99
 lPhNmf1xAMHtcoJ+9LZIQot38+uuf9yC89Tv2hbli2PlkEcUoNHTHf55SgxgKVm8Y+
 ZHokJjpdeWbwX0KTXvFxRBJ9nt6QP78z0U0Qp3jBVKu/oQISiIoaQekER0BklOeVFO
 /TZbTNQkAYXMxxNVPISMBP8+utPAZCvqHn8RlE2oTFv2KHw9Oneh+KxEBxAgZU5tQv
 Tuy/U/bjJyA01AW3EH4a4WsAp1SoK9pMZdA4AsK+16QNFGU0LKAc4AGHVfh1DinN31
 7oZhsQtfTIdrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:10 +0200
Subject: [PATCH 4/7] drm/tests: cmdline: Fix drm_display_mode memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-4-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=mripard@kernel.org;
 h=from:subject:message-id; bh=F3ezxU5SGoiD8ddVs6HKsPqrpZe4wJCeXDRAqLCrgfE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlaI/Io94ij+L+3p8qlxSfMiVZb8Ocm/8nj9Br6wy
 TdvMaeGdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAifhGMDK9THM2LM8+auAq+
 qd7altqqzxO084wxT+NL7zkOcr8V9jEy3Eq6eZ+xMc9w/tEbs7MP1HBE7avI+Nd+7HtAyLSdomt
 TGQE=
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
needs to be destroyed later one. The drm_test_cmdline_tv_options() test
never does however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: e691c9992ae1 ("drm/modes: Introduce the tv_mode property as a command-line option")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 59c8408c453c2ef8f18c7c887b0405418e9e1f99..1cfcb597b088b4d159a5fb10a309338cb73abbe9 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -5,10 +5,11 @@
  */
 
 #include <kunit/test.h>
 
 #include <drm/drm_connector.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
 
 static const struct drm_connector no_connector = {};
 
 static void drm_test_cmdline_force_e_only(struct kunit *test)
@@ -953,12 +954,19 @@ struct drm_cmdline_tv_option_test {
 };
 
 static void drm_test_cmdline_tv_options(struct kunit *test)
 {
 	const struct drm_cmdline_tv_option_test *params = test->param_value;
-	const struct drm_display_mode *expected_mode = params->mode_fn(NULL);
+	struct drm_display_mode *expected_mode;
 	struct drm_cmdline_mode mode = { };
+	int ret;
+
+	expected_mode = params->mode_fn(NULL);
+	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
+
+	ret = drm_kunit_add_mode_destroy_action(test, expected_mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);

-- 
2.49.0

