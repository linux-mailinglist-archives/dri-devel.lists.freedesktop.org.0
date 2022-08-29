Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A235A4040
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 02:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539110EFF0;
	Mon, 29 Aug 2022 00:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1611410EFED;
 Mon, 29 Aug 2022 00:10:04 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MG9mq0vbVzDrgM;
 Mon, 29 Aug 2022 00:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661731803; bh=GqYqpPbeOc3SjjOOqv4u8JdDVfsfn7HITY3mPh8GK74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XQrhd3DI9Tkvfi8b9btJi+1qblNzmjU/J90LnnOjNkYHIVcFC9YLimZRj2spMurmT
 SWv7xUcXsozflAa6GubJQmFUWdPk8erbKrzKsjoyvrqGrgyxv5wHCH4OE4BUE3FSr2
 ZFYs5u7UAwMZ8CzDzs+yfJBeQLqmG5VvxwdJiE+M=
X-Riseup-User-ID: 917F8FFE9CD523F10637D9A466C228627F64C6493909752F6C5CE9D789C5504D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MG9mk0Nkdz5vkC;
 Mon, 29 Aug 2022 00:09:57 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/4] tests: DRM selftests: switch to KUnit
Date: Sun, 28 Aug 2022 21:09:20 -0300
Message-Id: <20220829000920.38185-5-isabbasso@riseup.net>
In-Reply-To: <20220829000920.38185-1-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
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
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 magalilemes00@gmail.com, maira.canal@usp.br, dlatypov@google.com,
 n@nfraprado.net, rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, davidgow@google.com,
 tales.aparecida@gmail.com, skhan@linuxfoundation.org, andrealmeid@riseup.net,
 Isabella Basso <isabbasso@riseup.net>, brendanhiggins@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the DRM selftests are now using KUnit [1], update IGT tests as well.

[1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 tests/drm_buddy.c    |  7 ++++---
 tests/drm_mm.c       |  7 ++++---
 tests/kms_selftest.c | 12 +++++++++---
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 06876e0c..74c06dce 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -6,9 +6,10 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct \
+		      drm_buddy) using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+	igt_kunit("drm_buddy_test", NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 2052b115..75fc6682 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -24,9 +24,10 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)\
+		     using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
+	igt_kunit("drm_mm_test", NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index abc4bfe9..bbf24c2b 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -24,9 +24,15 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
+IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests using KUnit");
 
-igt_main
+igt_simple_main
 {
-	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
+	igt_kunit("drm_cmdline_parser_test", NULL);
+	igt_kunit("drm_damage_helper_test", NULL);
+	igt_kunit("drm_dp_mst_helper_test", NULL);
+	igt_kunit("drm_format_helper_test", NULL);
+	igt_kunit("drm_format_test", NULL);
+	igt_kunit("drm_framebuffer_test", NULL);
+	igt_kunit("drm_plane_helper_test", NULL);
 }
-- 
2.37.2

