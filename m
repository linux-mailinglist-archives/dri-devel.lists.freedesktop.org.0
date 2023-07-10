Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F274CEE2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB6C10E208;
	Mon, 10 Jul 2023 07:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F8A10E204
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:47:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF23760EB8;
 Mon, 10 Jul 2023 07:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7DCC433C9;
 Mon, 10 Jul 2023 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975266;
 bh=xWovrJZer1W7AjsxvLVKMJnE5oarV1IwKSg4Wq6t9kE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ALd6PxwN7gs9AOQ9IIcA1aTr9WugCcwY4yNHmfKBr7AlYy2CXaas4ntrMpr3VvqrY
 Ev6RA+QI46zmOkcRfm9/Ufn1GovH4i4TG0azF5RpYqvjwFZPyS9kvDhtgs++3t4vhp
 wTwbsNY0jI+6IpilfVp52Rs3W6LCH1eWLelgxR4BjlVTrSbrgvPCNkQiYW4FaHX4JZ
 e6+xCv3EvNTAG3aMqhVcwueVPxzSo4R/x0qoskZikJeY02iaINN3KVF7xU3BSx8I1S
 d+2crBXnTAmkFJMToplXDK8ZHrmdXyQ/W/qynntvl/dpilgb8vvUlHpI+5PJEVr969
 e26T+DDC6c2Iw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:33 +0200
Subject: [PATCH 02/11] drm/tests: client-modeset: Remove call to
 drm_kunit_helper_free_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-2-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xWovrJZer1W7AjsxvLVKMJnE5oarV1IwKSg4Wq6t9kE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt89YqvEpYsXW57qTdpsVTH83WfZV7lfpqr3TT15sn3U5
 5PfN1o5SFgYxLgZZMUWWGGHzJXGnZr3uZOObBzOHlQlkCAMXpwBMRNyA4Z+2/jkvG/6/V1Njchce+M
 pz+NFy3ug3Czo39604d2L146tLGBmeXvN4qTC/PSDz77GiPJEt3dIXBS8pOHzttj+Y9O/6+Ve8AA==
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
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 416a279b6dae..7516f6cb36e4 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -82,13 +82,6 @@ static int drm_client_modeset_test_init(struct kunit *test)
 	return 0;
 }
 
-static void drm_client_modeset_test_exit(struct kunit *test)
-{
-	struct drm_client_modeset_test_priv *priv = test->priv;
-
-	drm_kunit_helper_free_device(test, priv->dev);
-}
-
 static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 {
 	struct drm_client_modeset_test_priv *priv = test->priv;
@@ -188,7 +181,6 @@ static struct kunit_case drm_test_pick_cmdline_tests[] = {
 static struct kunit_suite drm_test_pick_cmdline_test_suite = {
 	.name = "drm_test_pick_cmdline",
 	.init = drm_client_modeset_test_init,
-	.exit = drm_client_modeset_test_exit,
 	.test_cases = drm_test_pick_cmdline_tests
 };
 

-- 
2.41.0

