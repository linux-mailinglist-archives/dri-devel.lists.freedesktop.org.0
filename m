Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD176682E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C6610E6AE;
	Fri, 28 Jul 2023 09:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBBC10E6AA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:06:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D724F62089;
 Fri, 28 Jul 2023 09:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CEFC433C9;
 Fri, 28 Jul 2023 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690535190;
 bh=MvKIveuNi6K1WIrzaSAMwm4uJlnqwFoe8oWd0p7j5MA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oBFsRyrwGGqH8ckpyDai+ft7frs+cAAFnRiTBP9/RrAwHvwInO0PUuFT4btUCqMYx
 8sLGxfWPyLo3+EYguyzLXFP/BdmiAzLZ/aIa5dEziHIPAFQeyJ7bQDtjqrbm0SHre3
 MqkKzHni6r8FBCoxtpmN3z6BUlhsHjLK2cHIRYwsafemDKFsGXvQRq/diJ7IVQwDdU
 lveTJ2F5PnUjvsXOTKBWDX2XL1Kbj7S+KJjtC6VJ9JVBdri+wVsnXQVB80vHWInjp8
 IOYJwOZwpd22oITR4lDD2t0IxqRd1Rwk/QmFJfWTFEKkLfa29aX/gDB3Kn9I9lVbXW
 pueAuAmJO/Y+g==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 28 Jul 2023 11:06:16 +0200
Subject: [PATCH v3 03/11] drm/tests: modes: Remove call to
 drm_kunit_helper_free_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230728-kms-kunit-actions-rework-v3-3-952565ccccfe@kernel.org>
References: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
In-Reply-To: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MvKIveuNi6K1WIrzaSAMwm4uJlnqwFoe8oWd0p7j5MA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmHW7kkXYNmmTxuK4n7Its9i1eJ/efWWO+fLH8zFmSFv
 hHjrjvWUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkoODD8TyzyeFFxSf257B2X
 uNWfwiyLX3rwGyqnp5xtm+W4KdQii+EP5+W/OpEneXrWlmz+EJjkdCHE8g33+turXFiMHj+yWn6
 WCQA=
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
Cc: linux-kselftest@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling drm_kunit_helper_free_device() to clean up the resources
allocated by drm_kunit_helper_alloc_device() is now optional and not
needed in most cases.

Remove it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_modes_test.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index bc4aa2ce78be..1e9f63fbfead 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -36,13 +36,6 @@ static int drm_test_modes_init(struct kunit *test)
 	return 0;
 }
 
-static void drm_test_modes_exit(struct kunit *test)
-{
-	struct drm_test_modes_priv *priv = test->priv;
-
-	drm_kunit_helper_free_device(test, priv->dev);
-}
-
 static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
@@ -148,7 +141,6 @@ static struct kunit_case drm_modes_analog_tv_tests[] = {
 static struct kunit_suite drm_modes_analog_tv_test_suite = {
 	.name = "drm_modes_analog_tv",
 	.init = drm_test_modes_init,
-	.exit = drm_test_modes_exit,
 	.test_cases = drm_modes_analog_tv_tests,
 };
 

-- 
2.41.0

