Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E52790245
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9399E10E1CF;
	Fri,  1 Sep 2023 18:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9174810E1CC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 18:53:05 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RcnGn0dq1zDrwL;
 Fri,  1 Sep 2023 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693594385; bh=dvQjjq2ZmmE8MSse7p04b5ci0EELBqETDMjwKRPxZRM=;
 h=From:Date:Subject:To:Cc:From;
 b=sI5LSsGSDha8Ai79rHZQ20+Q7JN00XjyHswO2f9X+s/2T2SksZs/Gp2pDi9o6Kl1q
 hXfVfStN15NjWabZ8/z+yoRz0pFdtQXgJGXxpzd4/uYtrb7npXkC/rTeE5R1dzqvZ2
 lkH8yAauC2TN6GkJkp+TVFK0PVQTMlWCFKAWdFzo=
X-Riseup-User-ID: 579FE8D4BF4356ED3C76E1BB147EC52B26BA742491D92C803CCD17479A7AED04
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RcnGk1tRVzFph1;
 Fri,  1 Sep 2023 18:53:02 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 01 Sep 2023 15:52:56 -0300
Subject: [PATCH] drm/tests: Zero initialize fourccs_out
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230901-zero-init-fourcc-list-test-v1-1-68bc4cc738c8@riseup.net>
X-B4-Tracking: v=1; b=H4sIAAcz8mQC/x3MTQrCMBBA4auEWXcgP6KtVxEXTZzaAUlkEktpy
 N0N3Tz4Nq9CJmHKcFcVhDbOnGKHGRSEdY5vQn51g9XW6UkbPEgScuSCS/pJCPjhXLBQjw2Tu/i
 rv5EfoQ++Qgvv5/zxbO0PNTC+AmwAAAA=
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fourccs_out array is not initialized. As the
drm_fb_build_fourcc_list() doesn't necessarily change all the array,
and the test compares all of it, the comparison could fail if the
array is not initialized. Zero initialize the array to fix this.

Fixes: 371e0b186a13 ("drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()")
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 79bc9d4bbd71..1a6bd291345d 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1165,7 +1165,7 @@ KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fou
 static void drm_test_fb_build_fourcc_list(struct kunit *test)
 {
 	const struct fb_build_fourcc_list_case *params = test->param_value;
-	u32 fourccs_out[TEST_BUF_SIZE];
+	u32 fourccs_out[TEST_BUF_SIZE] = {0};
 	size_t nfourccs_out;
 	struct drm_device *drm;
 	struct device *dev;

---
base-commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6
change-id: 20230901-zero-init-fourcc-list-test-2c934b6b7eb8

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

