Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386CAD3224
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9124F10E4CB;
	Tue, 10 Jun 2025 09:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eU2iLa13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11C410E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:33:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B6C760007;
 Tue, 10 Jun 2025 09:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5097C4CEED;
 Tue, 10 Jun 2025 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749548034;
 bh=f82rGVWrjBouF2BTswBLqRANHumddvbr8a+wkNyzR4k=;
 h=From:To:Cc:Subject:Date:From;
 b=eU2iLa13FDxPa1xFykinwvwxfaaK0xrlfoF5ZFZZtDWwD5aAJ80Sf+DgZKIuF4X6O
 QoEcXA55nhnY9jk4zQqe/eHGWCpbwp/CMjB0r1RyzBgbuJOITJIwaP5CPrZbnpNqEw
 Thm55C8JLKvQJP/iDKEZ7G7uxyKKCXG15Zf4Hv4BDSGp3ZZ2ifi8VopUXSiSqma1Cm
 9UwsYghqz5vZGkAbI72NNK8xU2mT9rj+NOWoInx02fxL5MWJILGBw7+ykKGrf7eMa6
 vRA2+VWBESdd3Pjf5iozQPdDa+rfcMaFuOsTALp8+9HDQ2uhFkM09ib/zzPqDAMCvy
 I8pKgAPP/o+Dw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/test: reduce stack size in drm_exec_test
Date: Tue, 10 Jun 2025 11:33:46 +0200
Message-Id: <20250610093350.2645965-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

test_prepare_array() is one of the functions that uses more than
a kilobyte of stack on 64-bit machines, though it stays under
the usual warning limit of 2KB:

drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 1304 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

In order to eventually lower that limit, change the two large
drm_gem_object objects to be statically allocated. This works here
because the tests are always called sequentially, and it is simpler than
using kzalloc().

Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index d6c4dd1194a0..f2ac06a07707 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -18,6 +18,8 @@
 
 #include "../lib/drm_random.h"
 
+static struct drm_gem_object gobj, gobj2;
+
 struct drm_exec_priv {
 	struct device *dev;
 	struct drm_device *drm;
@@ -54,7 +56,6 @@ static void sanitycheck(struct kunit *test)
 static void test_lock(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -74,7 +75,6 @@ static void test_lock(struct kunit *test)
 static void test_lock_unlock(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -101,7 +101,6 @@ static void test_lock_unlock(struct kunit *test)
 static void test_duplicates(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -128,7 +127,6 @@ static void test_duplicates(struct kunit *test)
 static void test_prepare(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -150,13 +148,11 @@ static void test_prepare(struct kunit *test)
 static void test_prepare_array(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj1 = { };
-	struct drm_gem_object gobj2 = { };
-	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
+	struct drm_gem_object *array[] = { &gobj, &gobj2 };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
@@ -166,7 +162,7 @@ static void test_prepare_array(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
 
-	drm_gem_private_object_fini(&gobj1);
+	drm_gem_private_object_fini(&gobj);
 	drm_gem_private_object_fini(&gobj2);
 }
 
-- 
2.39.5

