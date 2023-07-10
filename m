Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26274CEE1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F710E205;
	Mon, 10 Jul 2023 07:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9436510E203
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:47:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1732B60EBA;
 Mon, 10 Jul 2023 07:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1955FC433C7;
 Mon, 10 Jul 2023 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975263;
 bh=2lYoGYtWk31ktlt2bmZpFNtrbTluQtTeAWfgUJXbu8w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BC9eEcKZFIgPUCFoGh862D2q/k94PW3B/ZjOJUm0R+Zu5wU3BnSrA3LxiOk0OXBHR
 ufDfH8FLqYqBrbj7P+bfU9vansFcBLwqYH/ZN4FEVLmFAOmAJbKN6c0NNIwuUMbHAs
 y4Hn3US6ErmTjary5i0AlyEOXkjsV+vYq5XB+0rEgsyjJRPLxJ/XD3RO1+W8pPlSb4
 T9SREwnCAVH4CS3qn6h9lQYLMJxvsSXrocITyuGPHfaYMeD7q5IFRD/jp7At/AVrUD
 Y68ngwjQBARIrTbpv5f8pHgNliTp4txgComMF9+vsbgy9N9T+5Cd3pEu6NfYtnO88/
 KwU+GDIsod59g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:32 +0200
Subject: [PATCH 01/11] drm/tests: helpers: Switch to kunit actions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-1-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2lYoGYtWk31ktlt2bmZpFNtrbTluQtTeAWfgUJXbu8w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt0+fybmcLXMiQ/bv/Dcz3zctP13KrLFq299nnVE/rUUm
 Ljcv6ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEPBIZ/qd+T0/3mTZFKEsn85vzzN
 /5po5ldxSfKaaVX5lmWZGRw87I8ETi6V2mJT7H9v/Yyx/6+wWrf/1z3XXZDzY0CJx5Lzl7DSMA
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 32 +++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 4df47071dc88..38211fea9ae6 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -35,8 +35,8 @@ static struct platform_driver fake_platform_driver = {
  * able to leverage the usual infrastructure and most notably the
  * device-managed resources just like a "real" device.
  *
- * Callers need to make sure drm_kunit_helper_free_device() on the
- * device when done.
+ * Resources will be cleaned up automatically, but the removal can be
+ * forced using @drm_kunit_helper_free_device.
  *
  * Returns:
  * A pointer to the new device, or an ERR_PTR() otherwise.
@@ -49,12 +49,31 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 	ret = platform_driver_register(&fake_platform_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	ret = kunit_add_action_or_reset(test,
+					(kunit_action_t *)platform_driver_unregister,
+					&fake_platform_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
+	ret = kunit_add_action_or_reset(test,
+					(kunit_action_t *)platform_device_put,
+					pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ret = platform_device_add(pdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	kunit_remove_action(test,
+			    (kunit_action_t *)platform_device_put,
+			    pdev);
+
+	ret = kunit_add_action_or_reset(test,
+					(kunit_action_t *)platform_device_unregister,
+					pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	return &pdev->dev;
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
@@ -70,8 +89,13 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 
-	platform_device_unregister(pdev);
-	platform_driver_unregister(&fake_platform_driver);
+	kunit_release_action(test,
+			     (kunit_action_t *)platform_device_unregister,
+			     pdev);
+
+	kunit_release_action(test,
+			     (kunit_action_t *)platform_driver_unregister,
+			     &fake_platform_driver);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 

-- 
2.41.0

