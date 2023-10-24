Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA17D4E5D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 12:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDA010E340;
	Tue, 24 Oct 2023 10:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91BA10E341
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 10:56:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4088862AEE;
 Tue, 24 Oct 2023 10:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5FC433CB;
 Tue, 24 Oct 2023 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698145006;
 bh=heR0XMkP4GxDgyXiuSsDhkHHWQvnGNCavSnBiQyZj0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=k9FmDhwCNtp4yUPduqR3raLjxsqEaFBQozNNgmctHz9Oq41YgY9U+QndS87ThLR5+
 5nWQCvxMJ2YIuxriT3JpO7OkQUdtMakdwmVeCRgp9EavtIk2lmhP1mK10c9oX9yiIB
 bhFev1yGviKzD4l4uN0Tu7gZVYIPIlyXx9TkBMgPVOuXq8jifh8YthiT/9P683AS9u
 DLOMcuEsAyj4bf+h7q9RQhPSd8TT5EFQPq42Nmu3ybWorkDOSVqgifWfR9UGu9m+eG
 wzTcTbnu2/oMkIwsLf5KKy6Qz2n8aW+kwrm7vO396XAGDuZuAOdi9n5/+hrumAfTwy
 wW2XtWTKkzsfw==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vc4: tests: Fix UAF in the mock helpers
Date: Tue, 24 Oct 2023 12:56:40 +0200
Message-ID: <20231024105640.352752-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4 mock helpers allocate the CRTC, encoders and connectors using a
call to kunit_kzalloc(), but the DRM device they are attache to survives
for longer than the test itself which leads to use-after-frees reported
by KASAN.

Switch to drmm_kzalloc to tie the lifetime of these objects to the main
DRM device.

Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
Closes: https://lore.kernel.org/all/CA+G9fYvJA2HGqzR9LGgq63v0SKaUejHAE6f7+z9cwWN-ourJ_g@mail.gmail.com/
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   | 2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
index 5d12d7beef0e..ade3309ae042 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
@@ -26,7 +26,7 @@ struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
 	struct vc4_crtc *vc4_crtc;
 	int ret;
 
-	dummy_crtc = kunit_kzalloc(test, sizeof(*dummy_crtc), GFP_KERNEL);
+	dummy_crtc = drmm_kzalloc(drm, sizeof(*dummy_crtc), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, dummy_crtc);
 
 	vc4_crtc = &dummy_crtc->crtc;
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index 6e11fcc9ef45..e70d7c3076ac 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -32,7 +32,7 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
 	struct drm_encoder *enc;
 	int ret;
 
-	dummy_output = kunit_kzalloc(test, sizeof(*dummy_output), GFP_KERNEL);
+	dummy_output = drmm_kzalloc(drm, sizeof(*dummy_output), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
 	dummy_output->encoder.type = vc4_encoder_type;
 
-- 
2.41.0

