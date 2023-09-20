Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADF7A72A1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742310E43E;
	Wed, 20 Sep 2023 06:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0DD10E43D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:12:14 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Rr7V548ZmzDqXw;
 Wed, 20 Sep 2023 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695190333; bh=AYKM595r22KWBaNrMHXsQNon8Xc3UNgAEOBZBRbY0d0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GqGZGYRNIBCYf/xCAtuggN7pqynza1KaSPR7BvcDEu+nponuzEzV0C88X0oI+ZAew
 DIHq9tu0TIlSWuxLC9xtjCn61JcNInoPkBRe1e7OrEqofJxONMS3j65IGrraT8OvNG
 unVTYgRErAuqInMpznJaICIXg1hPhvqoO1U9UEcE=
X-Riseup-User-ID: EA07E6326DEDAD1233BEDF144864542EC0F9D4154630546301A2F3A8EC482CE3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rr7V20nyZzJq77;
 Wed, 20 Sep 2023 06:12:09 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 20 Sep 2023 03:11:38 -0300
Subject: [PATCH 3/3] drm/tests: Fix a use-after-free bug in
 __drm_kunit_helper_alloc_drm_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kunit-kasan-fixes-v1-3-1a0fc261832d@riseup.net>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
In-Reply-To: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>
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
Cc: tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In __drm_kunit_helper_alloc_drm_device_with_driver(), a drm_driver is
allocated with kunit_kzalloc. If the dev argument was allocated by
drm_kunit_helper_alloc_device, its deferred actions would access the
already deallocated drm_driver.

To fix that, move the deferred to the top of the resource stack.

==================================================================
BUG: KASAN: slab-use-after-free in devm_drm_dev_init_release+0x54/0xb0
Read of size 8 at addr 0000000063194e28 by task kunit_try_catch/127

CPU: 0 PID: 127 Comm: kunit_try_catch Tainted: G        W        N 6.5.0-rc2-00620-g4f77e58c6017 #35
Stack:
 606c9a22 606c9a22 00000000 606c9a22
 6056b8fe 63033b10 00000000 60040850
 63033a80 60574ca4 60574c4a 63033b10
Call Trace:
 [<600295a2>] show_stack+0x202/0x220
 [<6056b8fe>] ? _printk+0x0/0x78
 [<60040850>] ? um_set_signals+0x0/0x40
 [<60574ca4>] dump_stack_lvl+0x5a/0x6b
 [<60574c4a>] ? dump_stack_lvl+0x0/0x6b
 [<6019d40d>] print_report+0x1bd/0x670
 [<6056b96b>] ? _printk+0x6d/0x78
 [<6056b8fe>] ? _printk+0x0/0x78
 [<6019f0e6>] ? kasan_complete_mode_report_info+0x116/0x180
 [<603d16d4>] ? devm_drm_dev_init_release+0x54/0xb0
 [<6019db14>] kasan_report+0x184/0x1b0
 [<603d16d4>] ? devm_drm_dev_init_release+0x54/0xb0
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6019e7ec>] __asan_load8+0x7c/0x80
 [<603d16d4>] devm_drm_dev_init_release+0x54/0xb0
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<603d1680>] ? devm_drm_dev_init_release+0x0/0xb0
 [<604b0bde>] devm_action_release+0x2e/0x40
 [<604afd60>] devres_release_all+0x100/0x170
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<604a7f7d>] device_release_driver_internal+0x39d/0x510
 [<6027d7f0>] ? sysfs_remove_link+0x0/0x50
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<604a8104>] device_release_driver+0x14/0x20
 [<604a3592>] bus_remove_device+0x1e2/0x200
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6049de5a>] device_del+0x3ba/0x850
 [<6019f790>] ? kasan_quarantine_put+0x0/0x170
 [<60137bad>] ? kfree+0x5d/0x80
 [<6019e7f0>] ? __asan_store8+0x0/0x90
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<604475a0>] ? kunit_action_platform_device_del+0x0/0x20
 [<604ad4b0>] platform_device_del+0x40/0x140
 [<601957f3>] ? __kmem_cache_free+0xc3/0x230
 [<6019e7f0>] ? __asan_store8+0x0/0x90
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<604475a0>] ? kunit_action_platform_device_del+0x0/0x20
 [<604475b0>] kunit_action_platform_device_del+0x10/0x20
 [<6031bf80>] __kunit_action_free+0x30/0x40
 [<6031bf50>] ? __kunit_action_free+0x0/0x40
 [<6031bae4>] kunit_remove_resource+0xf4/0x150
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<60040850>] ? um_set_signals+0x0/0x40
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6031b396>] kunit_cleanup+0xb6/0x140
 [<605848cd>] ? __schedule+0x6bd/0x7a0
 [<6019e7f0>] ? __asan_store8+0x0/0x90
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6031b715>] kunit_try_run_case_cleanup+0x95/0xb0
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<6031b680>] ? kunit_try_run_case_cleanup+0x0/0xb0
 [<6031e240>] kunit_generic_run_threadfn_adapter+0x30/0x60
 [<6008d15e>] kthread+0x28e/0x2e0
 [<6031e210>] ? kunit_generic_run_threadfn_adapter+0x0/0x60
 [<6019e7f0>] ? __asan_store8+0x0/0x90
 [<6008ced0>] ? kthread+0x0/0x2e0
 [<6019e770>] ? __asan_load8+0x0/0x80
 [<600270e6>] new_thread_handler+0x136/0x1a0

Allocated by task 126:
 save_stack_trace+0x5b/0x70
 stack_trace_save+0x7a/0xa0
 kasan_set_track+0x6c/0xa0
 kasan_save_alloc_info+0x26/0x30
 __kasan_kmalloc+0x91/0xa0
 __kmalloc+0xb9/0x110
 kunit_kmalloc_array+0x23/0x60
 drm_test_fb_build_fourcc_list+0x8b/0x390
 kunit_try_run_case+0xab/0x140
 kunit_generic_run_threadfn_adapter+0x30/0x60
 kthread+0x28e/0x2e0
 new_thread_handler+0x136/0x1a0

Freed by task 127:
 save_stack_trace+0x5b/0x70
 stack_trace_save+0x7a/0xa0
 kasan_set_track+0x6c/0xa0
 kasan_save_free_info+0x30/0x50
 ____kasan_slab_free+0x12c/0x190
 __kasan_slab_free+0x18/0x20
 __kmem_cache_free+0xc3/0x230
 kfree+0x5d/0x80
 __kunit_action_free+0x30/0x40
 kunit_remove_resource+0xf4/0x150
 kunit_cleanup+0xb6/0x140
 kunit_try_run_case_cleanup+0x95/0xb0
 kunit_generic_run_threadfn_adapter+0x30/0x60
 kthread+0x28e/0x2e0
 new_thread_handler+0x136/0x1a0

The buggy address belongs to the object at 0000000063194e00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 40 bytes inside of
 freed 256-byte region [0000000063194e00, 0000000063194f00)

The buggy address belongs to the physical page:
page:00000000d99927cc refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3194
flags: 0x200(slab|zone=0)
page_type: 0xffffffff()
raw: 0000000000000200 0000000062401900 0000000000000122 0000000000000000
raw: 0000000000000000 0000000080080008 00000001ffffffff
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 0000000063194d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 0000000063194d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>0000000063194e00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 0000000063194e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 0000000063194f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 3150dbc647ee..655cedf7ab13 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -129,6 +129,7 @@ __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
 						const struct drm_driver *driver)
 {
 	struct drm_device *drm;
+	struct platform_device *pdev = to_platform_device(dev);
 	void *container;
 	int ret;
 
@@ -143,6 +144,21 @@ __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = kunit_move_action_to_top_or_reset(test,
+						kunit_action_platform_driver_unregister,
+						&fake_platform_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_move_action_to_top_or_reset(test,
+						kunit_action_platform_device_put,
+						pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_move_action_to_top_or_reset(test,
+						kunit_action_platform_device_del,
+						pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	return drm;
 }
 EXPORT_SYMBOL_GPL(__drm_kunit_helper_alloc_drm_device_with_driver);

-- 
2.41.0

