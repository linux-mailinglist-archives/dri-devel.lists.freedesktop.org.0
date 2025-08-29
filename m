Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB1B3B4F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4147210EB65;
	Fri, 29 Aug 2025 07:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FlfAvrOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7C10EB65
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:56:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 302EC40AF9;
 Fri, 29 Aug 2025 07:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18632C4CEF4;
 Fri, 29 Aug 2025 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756454214;
 bh=M8hRM0WTPIusFS1Lfh5YItgZkyX6u8CCRmzhM3QeF6o=;
 h=From:To:Cc:Subject:Date:From;
 b=FlfAvrOPPlLTYqrvpa88K+nllpGYgHrPfVxVrVvjX8ox7Llr8d/Ayff7phgj5d3Xa
 210IqcXX1YUZV0YTPLzt9Akf5yEG9wMOKEo+d1jqLH4slaDKKTh+BY18+SXK2H7k5f
 MeviItnhmRh60jhJSTmcu79zOHhvBGirmV9a0BEO2iv13TVYSSeKUOWWQeb+Zbi0pP
 cSfpT6KP4heRTGHu2uOHgqtYrIQyI7uACk1Ynn2FWZ5dGGeROEnVcli4nCIdm0ZkV7
 4ReHVMA0Eel07fUusrGJC3lE4BJ421AU8x9aQLEhGuA5n9tlZ3o7jMRs9HHiomaLHz
 0RcN1KlnsAOXw==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
Date: Fri, 29 Aug 2025 09:55:39 +0200
Message-ID: <20250829075633.2306-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
it is possible for test_prepare_array() to exceed a stack frame size of
2048 bytes depending on the exact configuration of the kernel.

  drivers/gpu/drm/tests/drm_exec_test.c: In function ‘test_prepare_array’:
  drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2128 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
    171 | }
        | ^
  cc1: all warnings being treated as errors
  make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_exec_test.o] Error 1
  make[6]: *** Waiting for unfinished jobs....

In order to fix this, allocate the GEM objects in test_prepare_array()
with kzalloc(), rather than placing them on the stack.

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Christian König <christian.koenig@amd.com>
Fixes: e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index d6c4dd1194a0..d59ec3baae1d 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -150,14 +150,22 @@ static void test_prepare(struct kunit *test)
 static void test_prepare_array(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj1 = { };
-	struct drm_gem_object gobj2 = { };
-	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
+	struct drm_gem_object *gobj1;
+	struct drm_gem_object *gobj2;
+	struct drm_gem_object *array[] = {
+		(gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL)),
+		(gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL)),
+	};
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
-	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
+	if (!gobj1 || !gobj2) {
+		KUNIT_FAIL(test, "Failed to allocate GEM objects.\n");
+		goto out;
+	}
+
+	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec)
@@ -166,8 +174,12 @@ static void test_prepare_array(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
 
-	drm_gem_private_object_fini(&gobj1);
-	drm_gem_private_object_fini(&gobj2);
+	drm_gem_private_object_fini(gobj1);
+	drm_gem_private_object_fini(gobj2);
+
+out:
+	kfree(gobj1);
+	kfree(gobj2);
 }
 
 static void test_multiple_loops(struct kunit *test)

base-commit: 0b6da6d3a8d5391ff9da2358ac5afd8b7badd943
-- 
2.51.0

