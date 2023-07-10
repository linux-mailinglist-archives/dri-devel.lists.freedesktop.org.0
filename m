Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C716674CEE4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EAC10E204;
	Mon, 10 Jul 2023 07:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94910E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:47:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEAD960EBF;
 Mon, 10 Jul 2023 07:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52F9C433C7;
 Mon, 10 Jul 2023 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975273;
 bh=b3jsj7BIiDtYO4ydj4H5h/qkxK67fbZ/H7CaIS33J9o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mqTyuIWhmfTWFYsc4wzr5/nJCuQaTk4tTZ+B5HbgmzhawJBR6NKKVUXq3aCRP3fgq
 RuWQt4FFlpOKA8m1QddpC57zLgj9bPwr+jIGlV7dOrDPT+qUBhOEeEQ8R/YSdJYGAc
 MKKa4F1mXQ6ix8BXPE178SlBFB2pp7dv7NLzlL2P1NIJ+wzrjGrJk+87UPwueGIHBf
 XyRvV6etN21B/ygNKYWl7aFznehnPxURt1kz7vkEsnjcwRIxsES4wjJYiRxXfy5dYb
 DUxcpZQqxJggjALzcuhj+fZR1vmqtSJKgeJMbi6LrSj15javuXgIdhuoDFNfXyu808
 P2iTGc9PMinYg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:35 +0200
Subject: [PATCH 04/11] drm/tests: probe-helper: Remove call to
 drm_kunit_helper_free_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-4-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=mripard@kernel.org;
 h=from:subject:message-id; bh=b3jsj7BIiDtYO4ydj4H5h/qkxK67fbZ/H7CaIS33J9o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt88QWvBp8qITl77lqIh4fby8j19FcOKMhIkiMoK9svff
 dmgc6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEQgoZ/qmcDn27zKIkYr2g07Zoba
 lNJ3bvnfH6qEJYyfprx+ZulTrC8Fd4F6fM8zQ2dcOl95zm61swu964crF1cl1ix/2fG+ee7OICAA==
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling drm_kunit_helper_free_device() to clean up the resources
allocated by drm_kunit_helper_alloc_device() is now optional and not
needed in most cases.

Remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_probe_helper_test.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 0ee65828623e..1a2044070a6c 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -60,13 +60,6 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	return 0;
 }
 
-static void drm_probe_helper_test_exit(struct kunit *test)
-{
-	struct drm_probe_helper_test_priv *priv = test->priv;
-
-	drm_kunit_helper_free_device(test, priv->dev);
-}
-
 typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device *);
 
 struct drm_connector_helper_tv_get_modes_test {
@@ -208,7 +201,6 @@ static struct kunit_case drm_test_connector_helper_tv_get_modes_tests[] = {
 static struct kunit_suite drm_test_connector_helper_tv_get_modes_suite = {
 	.name = "drm_connector_helper_tv_get_modes",
 	.init = drm_probe_helper_test_init,
-	.exit = drm_probe_helper_test_exit,
 	.test_cases = drm_test_connector_helper_tv_get_modes_tests,
 };
 

-- 
2.41.0

