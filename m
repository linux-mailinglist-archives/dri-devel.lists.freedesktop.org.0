Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545574CEE9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655810E20E;
	Mon, 10 Jul 2023 07:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7110E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:48:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8957160EBC;
 Mon, 10 Jul 2023 07:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B71C433C7;
 Mon, 10 Jul 2023 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975281;
 bh=P6AkzZmEIp/9uMOYra9+RhYe8NGkgtrmUDZAyGSGwBY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZS2qTM59an4tTDOc/lHUMdZ9YWW2KcLdikHB/RwLYbQIQxBy9AQttNMyXpYmiTRmE
 u3rLEY8OKJqGnuapdPgZIh5DyBJxyua8mSYSs+q/E2/OWAKDskriPj2RdXjU8I8vg0
 HWX8fdr0XAl2w8iDuEdWuZJbgOhUh1OKO+6aa4Nbx5xqeNh4xDnKHFjicEpg4V16jB
 PwKkz8GlYI3dfNx7J+eU1lCFkc3HMvk92le5597HdkbJST72dqbFePH5z1pGd/l46g
 AXfe8nVNIRjH2MLC3OgJwkTCc1RPddJ9cd3Y8LJFn2ofkX4HeZCsC48XcjIiVulKnQ
 QwfLGwKiSRBzA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:38 +0200
Subject: [PATCH 07/11] drm/vc4: tests: pv-muxing: Remove call to
 drm_kunit_helper_free_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-7-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=mripard@kernel.org;
 h=from:subject:message-id; bh=P6AkzZmEIp/9uMOYra9+RhYe8NGkgtrmUDZAyGSGwBY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt89o+CqzKlOs84+vi93Tq8Zbmjd8ql4+9dVal+01jn1H
 F3Ef6ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEFnxn+GdvJlsnJ/36KTObdzeblH
 jMBOOa8LgHE15u/e+/NyfvlzHDf/9vemerQ1fvuH710F274O3NHnceR1/87xT98Ge51DPHdnYA
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
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index ae0bd0f81698..6c982e72cae8 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -762,7 +762,6 @@ static void vc4_pv_muxing_test_exit(struct kunit *test)
 	drm_modeset_drop_locks(&priv->ctx);
 	drm_modeset_acquire_fini(&priv->ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
 }
 
 static struct kunit_case vc4_pv_muxing_tests[] = {
@@ -873,7 +872,6 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
 }
 
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
@@ -963,7 +961,6 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
 }
 
 static void
@@ -1017,7 +1014,6 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
 }
 
 static struct kunit_case vc5_pv_muxing_bugs_tests[] = {

-- 
2.41.0

