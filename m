Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE5767580
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1073010E772;
	Fri, 28 Jul 2023 18:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082A810E76E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:34:14 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RCGW93GKqzDqTF;
 Fri, 28 Jul 2023 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690569253; bh=wlFZcK3TBqhwRXzhL05h/VIuKymnU45WIwzCjH/lpIA=;
 h=From:To:Cc:Subject:Date:From;
 b=kdc+FqM0Q1jcuQvehTBsHKl2JlbisRJ073npoRHkXbItUv38CpT1ttKNCqg3v5Qa7
 3yhNatZl1V3pgdWWvpCd+UPMGKFpaJDW0WZgOMhQqdJKFKSlplGZaWUvQ5AI4uK/jL
 n9KIF9HfkpiWSIU8D1U0IQ+bOGtFDyrSQb3k5uZM=
X-Riseup-User-ID: 343E434DC07507BBB5FDC902A1B9FA66BEB0652A4351145296E477DEBF70FDD2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RCGW425X8zFqjL;
 Fri, 28 Jul 2023 18:34:08 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/tests: Alloc drm_device on drm_exec tests
Date: Fri, 28 Jul 2023 15:34:00 -0300
Message-ID: <20230728183400.306193-1-arthurgrillo@riseup.net>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 tales.aparecida@gmail.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 arthurgrillo@riseup.net, mairacanal@riseup.net, boris.brezillon@collabora.com,
 dakr@redhat.com, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_exec tests where crashing[0] because of a null dereference. This
is caused by a new access of the `driver` attribute of `struct
drm_driver` on drm_gem_private_object_init(). Alloc the drm_device to
fix that.

[0]
[15:05:24] ================== drm_exec (6 subtests) ===================
[15:05:24] [PASSED] sanitycheck
^CERROR:root:Build interruption occurred. Cleaning console.
[15:05:50] [ERROR] Test: drm_exec: missing expected subtest!
[15:05:50] BUG: kernel NULL pointer dereference, address: 00000000000000b0
[15:05:50] #PF: supervisor read access in kernel mode
[15:05:50] #PF: error_code(0x0000) - not-present page
[15:05:50] PGD 0 P4D 0
[15:05:50] Oops: 0000 [#1] PREEMPT NOPTI
[15:05:50] CPU: 0 PID: 23 Comm: kunit_try_catch Tainted: G                 N 6.4.0-rc7-02032-ge6303f323b1a #69
[15:05:50] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
[15:05:50] RIP: 0010:drm_gem_private_object_init+0x60/0xc0

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Tested-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v1->v2: https://lore.kernel.org/all/20230727192259.237935-1-arthurgrillo@riseup.net/
	- s/test_init/drm_exec_test_init/ (Maíra)
	- s/test_exit/drm_exec_test_exit/ (Maíra)
	- Use test->priv intead of global variables (Maíra and Maxime)

---
 drivers/gpu/drm/tests/drm_exec_test.c | 52 +++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 727ac267682e..f02a93601203 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -12,11 +12,42 @@
 
 #include <drm/drm_exec.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include "../lib/drm_random.h"
 
-static struct drm_device dev;
+struct drm_exec_priv {
+	struct device *dev;
+	struct drm_device *drm;
+};
+
+static int drm_exec_test_init(struct kunit *test)
+{
+	struct drm_exec_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	test->priv = priv;
+
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev, sizeof(*priv->drm), 0,
+							DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	return 0;
+}
+
+static void drm_exec_test_exit(struct kunit *test)
+{
+	struct drm_exec_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+}
 
 static void sanitycheck(struct kunit *test)
 {
@@ -29,11 +60,12 @@ static void sanitycheck(struct kunit *test)
 
 static void test_lock(struct kunit *test)
 {
+	struct drm_exec_priv *priv = test->priv;
 	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -48,11 +80,12 @@ static void test_lock(struct kunit *test)
 
 static void test_lock_unlock(struct kunit *test)
 {
+	struct drm_exec_priv *priv = test->priv;
 	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -74,11 +107,12 @@ static void test_lock_unlock(struct kunit *test)
 
 static void test_duplicates(struct kunit *test)
 {
+	struct drm_exec_priv *priv = test->priv;
 	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
 	drm_exec_until_all_locked(&exec) {
@@ -102,11 +136,12 @@ static void test_duplicates(struct kunit *test)
 
 static void test_prepare(struct kunit *test)
 {
+	struct drm_exec_priv *priv = test->priv;
 	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -121,14 +156,15 @@ static void test_prepare(struct kunit *test)
 
 static void test_prepare_array(struct kunit *test)
 {
+	struct drm_exec_priv *priv = test->priv;
 	struct drm_gem_object gobj1 = { };
 	struct drm_gem_object gobj2 = { };
 	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
-	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec)
@@ -150,6 +186,8 @@ static struct kunit_case drm_exec_tests[] = {
 
 static struct kunit_suite drm_exec_test_suite = {
 	.name = "drm_exec",
+	.init = drm_exec_test_init,
+	.exit = drm_exec_test_exit,
 	.test_cases = drm_exec_tests,
 };
 
-- 
2.41.0

