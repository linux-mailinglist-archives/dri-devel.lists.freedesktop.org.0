Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A7765C0B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 21:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E64E10E5E7;
	Thu, 27 Jul 2023 19:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1210E5E7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:24:03 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4RBgg558K6z9tLm;
 Thu, 27 Jul 2023 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690485843; bh=eOxqa2V9o4gHXVlmb9wzrxiTWOYbReeagoqfkWheIR8=;
 h=From:To:Cc:Subject:Date:From;
 b=BbDrs8jeT1VPkgwT3XCBs3dfdy8pCuU9TQMjk+ZYp/94OSFgHgnn/UIjnu2jgQfLp
 6wCw1QDAOd/NrTn67xlI2bCtOBxdxvnPsbvVYg29eBj94EvMQqjxIFuUKgxaBRsxfB
 KbE/t92JLq6GJXwW6Qc9axzSw4B9lM2fXhwyr+4o=
X-Riseup-User-ID: FBBECCE3EE40BF4E306028A26387644AEA4B23415E7EEDCFFEAD983D68A926BB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RBgg021cLzFqjL;
 Thu, 27 Jul 2023 19:23:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
Date: Thu, 27 Jul 2023 16:22:59 -0300
Message-ID: <20230727192259.237935-1-arthurgrillo@riseup.net>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 tales.aparecida@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 boris.brezillon@collabora.com, dakr@redhat.com, alexander.deucher@amd.com,
 andrealmeid@riseup.net, christian.koenig@amd.com
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
---
 drivers/gpu/drm/tests/drm_exec_test.c | 36 +++++++++++++++++++++------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 727ac267682e..df31f89a7945 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -12,11 +12,31 @@
 
 #include <drm/drm_exec.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include "../lib/drm_random.h"
 
-static struct drm_device dev;
+static struct device *dev;
+static struct drm_device *drm;
+
+static int test_init(struct kunit *test)
+{
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,
+						  DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	return 0;
+}
+
+static void test_exit(struct kunit *test)
+{
+	drm_kunit_helper_free_device(test, dev);
+}
 
 static void sanitycheck(struct kunit *test)
 {
@@ -33,7 +53,7 @@ static void test_lock(struct kunit *test)
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -52,7 +72,7 @@ static void test_lock_unlock(struct kunit *test)
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -78,7 +98,7 @@ static void test_duplicates(struct kunit *test)
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
 	drm_exec_until_all_locked(&exec) {
@@ -106,7 +126,7 @@ static void test_prepare(struct kunit *test)
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
@@ -127,8 +147,8 @@ static void test_prepare_array(struct kunit *test)
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
-	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(drm, &gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec)
@@ -150,6 +170,8 @@ static struct kunit_case drm_exec_tests[] = {
 
 static struct kunit_suite drm_exec_test_suite = {
 	.name = "drm_exec",
+	.init = test_init,
+	.exit = test_exit,
 	.test_cases = drm_exec_tests,
 };
 
-- 
2.41.0

