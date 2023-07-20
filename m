Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DA75ACB0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBFE10E5AA;
	Thu, 20 Jul 2023 11:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D622A10E5AA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:15:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24D6D61A22;
 Thu, 20 Jul 2023 11:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11272C433C8;
 Thu, 20 Jul 2023 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689851758;
 bh=/rkNjrxerN0rrN6VUl+VmzclsPanUGawK+BoOr9yqMg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=O8ku5xZOj45PrctUd2XegxQhPy1mG9fVcUNBMBjoGEBdUh8u4DOpmf8bicCWQIBtQ
 4tIHgHKK6IfNunA2aYGMvMsaY73KpDI/CYldneB3s3lnrZihTpShKs6WcoWAEtVO6s
 8N00iNyfXWWgifqzlvim9hv/0D2WV1L8vgvGkBveIXNUhhpGd4TyUrR9DgTOoavLGD
 /C2sHgA1hRtrRdAmBjFlFKHTn3j4XQzMF1HvaMQZ4xL7QG61JpTER939YIRJ7O+dX6
 KFG7vSybXmJ4iG357J8nC8mEnC6YBnsNnCUXblQNPSyGWeHFaH2jnSikqcuvD3/y+T
 bl6xf2pehay9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 20 Jul 2023 13:15:46 +0200
Subject: [PATCH v2 01/11] drm/tests: helpers: Switch to kunit actions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230720-kms-kunit-actions-rework-v2-1-175017bd56ab@kernel.org>
References: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/rkNjrxerN0rrN6VUl+VmzclsPanUGawK+BoOr9yqMg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCk7xTOqRM/cfHv0Ztw5hlTmmjvMJxQN3t1QPPXx1zfRR
 SLrLufu6ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE7m9gZHi/6fO9X4/qlT1D
 Z3R8XXZ6gbRnrVm25M+UkxM+lV7ekt/KyPBu12zLcpMVk/K+qrKsleG8/PLfhvlOSjtmJilkfb4
 SrsgDAA==
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 4df47071dc88..5856beb7f7d7 100644
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
@@ -49,12 +49,27 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test)
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
 
+	ret = kunit_add_action_or_reset(test,
+					(kunit_action_t *)platform_device_del,
+					pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	return &pdev->dev;
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
@@ -70,8 +85,13 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
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

