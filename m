Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D674CEE3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81D10E20A;
	Mon, 10 Jul 2023 07:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B5F10E216
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:47:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7FEF60EB8;
 Mon, 10 Jul 2023 07:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDD4C433C7;
 Mon, 10 Jul 2023 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975270;
 bh=ESA0y0NXrSvpPjbIAHKbdqC7HnGx+32+DeIPn5Bsru4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pZ8Q6H+eqITfqMayWd+SJ0YWIwM4w+0mClw1EjmaLdSoGIF4WWFyAqqybxUf16tGL
 6ArmiNLhhAvBnhA8KtdGLVXTeXwIJ25f8ULMi3Y8W6pK9y5z+56cFeVjZfsEQiy0SE
 Yr0+8mzB2CcGtiivAC7EshSeDxDbzbUxcPE0UAN9KgSdrTl/YAQd+Gsuj0ds83+maq
 u3G9fr7haXi6pwAcpINt5BAnNXFXuvCU0vz1wRFgsWpe2CYNBtbrKM/nWYULgmKIn6
 TkWqg/+GddLjaxHZ+UJQU0qrF2i6kWdO/iyRbJLnczGq7R4w0CqYhNDv3vVtZp7iJX
 PB3P+60woanCw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:34 +0200
Subject: [PATCH 03/11] drm/tests: modes: Remove call to
 drm_kunit_helper_free_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-3-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ESA0y0NXrSvpPjbIAHKbdqC7HnGx+32+DeIPn5Bsru4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt8/QyzP82jNtlwaXx53+bdniGR/XtlXOtZRqFtvEeuLw
 TuONHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIQx0jw4euqxNvu9sfSxa+tvqr3L
 RmxVYhsZWt3PPevvxWaniIZy/D/zwrwxO2j/elGTbHNnveMNMJV2BfclB32109zbke0//s5wUA
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

