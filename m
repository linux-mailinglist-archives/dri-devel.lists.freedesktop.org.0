Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0667938DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E416F10E5BF;
	Wed,  6 Sep 2023 09:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2E610E5BB;
 Wed,  6 Sep 2023 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993866; x=1725529866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2v7fN+XcDSkA4NN9Pr2ciUbL136NUAuenaU8hGnjDBk=;
 b=Qli/C/SQXaxm8aRq0ACJVeidnO9gZskFnercD6Xx9fP4hOagaEd8Pmhf
 G+3uzdUHTvCTf/OooVthfpIQvog1Cgdb57ZiAyHd/FD1YyoldB3OMYntx
 ZbRlJBfVkGUifupPiox3tYM0eubD7NxOtRw4tAdvpVllxqzJlbVPkozH/
 w/1uGLivcqh/SdfnQtTymNK1Cfc6k6fKQ1tG59kOS8YB+Fba3Q3mXCE/J
 ihVEAWUSlKnckkmWDARaTY1u5Fx42k0Lcq6mAryg4JhnIavVrbkzfmOAT
 IIbXDum89xKPEtUn2ZVGcHbplTlsV8ljLfiDlF0jeLTmo/RL4IAQL9qSj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357331476"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="357331476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806948086"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806948086"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/tests: helpers: Avoid a driver uaf
Date: Wed,  6 Sep 2023 11:50:37 +0200
Message-ID: <20230906095039.3320-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
References: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when using __drm_kunit_helper_alloc_drm_device() the driver may be
dereferenced by device-managed resources up until the device is
freed, which is typically later than the kunit-managed resource code
frees it. Fix this by simply make the driver device-managed as well.

v2:
- Update commit message, add Fixes: tag and Cc stable.

Related KASAN message:
[55272.551542] ==================================================================
[55272.551551] BUG: KASAN: slab-use-after-free in drm_dev_put.part.0+0xd4/0xe0 [drm]
[55272.551603] Read of size 8 at addr ffff888127502828 by task kunit_try_catch/10353

[55272.551612] CPU: 4 PID: 10353 Comm: kunit_try_catch Tainted: G     U           N 6.5.0-rc7+ #155
[55272.551620] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
[55272.551626] Call Trace:
[55272.551629]  <TASK>
[55272.551633]  dump_stack_lvl+0x57/0x90
[55272.551639]  print_report+0xcf/0x630
[55272.551645]  ? _raw_spin_lock_irqsave+0x5f/0x70
[55272.551652]  ? drm_dev_put.part.0+0xd4/0xe0 [drm]
[55272.551694]  kasan_report+0xd7/0x110
[55272.551699]  ? drm_dev_put.part.0+0xd4/0xe0 [drm]
[55272.551742]  drm_dev_put.part.0+0xd4/0xe0 [drm]
[55272.551783]  devres_release_all+0x15d/0x1f0
[55272.551790]  ? __pfx_devres_release_all+0x10/0x10
[55272.551797]  device_unbind_cleanup+0x16/0x1a0
[55272.551802]  device_release_driver_internal+0x3e5/0x540
[55272.551808]  ? kobject_put+0x5d/0x4b0
[55272.551814]  bus_remove_device+0x1f1/0x3f0
[55272.551819]  device_del+0x342/0x910
[55272.551826]  ? __pfx_device_del+0x10/0x10
[55272.551830]  ? lock_release+0x339/0x5e0
[55272.551836]  ? kunit_remove_resource+0x128/0x290 [kunit]
[55272.551845]  ? __pfx_lock_release+0x10/0x10
[55272.551851]  platform_device_del.part.0+0x1f/0x1e0
[55272.551856]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[55272.551863]  kunit_remove_resource+0x195/0x290 [kunit]
[55272.551871]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[55272.551877]  kunit_cleanup+0x78/0x120 [kunit]
[55272.551885]  ? __kthread_parkme+0xc1/0x1f0
[55272.551891]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
[55272.551900]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
[55272.551909]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
[55272.551919]  kthread+0x2e7/0x3c0
[55272.551924]  ? __pfx_kthread+0x10/0x10
[55272.551929]  ret_from_fork+0x2d/0x70
[55272.551935]  ? __pfx_kthread+0x10/0x10
[55272.551940]  ret_from_fork_asm+0x1b/0x30
[55272.551948]  </TASK>

[55272.551953] Allocated by task 10351:
[55272.551956]  kasan_save_stack+0x1c/0x40
[55272.551962]  kasan_set_track+0x21/0x30
[55272.551966]  __kasan_kmalloc+0x8b/0x90
[55272.551970]  __kmalloc+0x5e/0x160
[55272.551976]  kunit_kmalloc_array+0x1c/0x50 [kunit]
[55272.551984]  drm_exec_test_init+0xfa/0x2c0 [drm_exec_test]
[55272.551991]  kunit_try_run_case+0xdd/0x250 [kunit]
[55272.551999]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
[55272.552008]  kthread+0x2e7/0x3c0
[55272.552012]  ret_from_fork+0x2d/0x70
[55272.552017]  ret_from_fork_asm+0x1b/0x30

[55272.552024] Freed by task 10353:
[55272.552027]  kasan_save_stack+0x1c/0x40
[55272.552032]  kasan_set_track+0x21/0x30
[55272.552036]  kasan_save_free_info+0x27/0x40
[55272.552041]  __kasan_slab_free+0x106/0x180
[55272.552046]  slab_free_freelist_hook+0xb3/0x160
[55272.552051]  __kmem_cache_free+0xb2/0x290
[55272.552056]  kunit_remove_resource+0x195/0x290 [kunit]
[55272.552064]  kunit_cleanup+0x78/0x120 [kunit]
[55272.552072]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
[55272.552080]  kthread+0x2e7/0x3c0
[55272.552085]  ret_from_fork+0x2d/0x70
[55272.552089]  ret_from_fork_asm+0x1b/0x30

[55272.552096] The buggy address belongs to the object at ffff888127502800
                which belongs to the cache kmalloc-512 of size 512
[55272.552105] The buggy address is located 40 bytes inside of
                freed 512-byte region [ffff888127502800, ffff888127502a00)

[55272.552115] The buggy address belongs to the physical page:
[55272.552119] page:00000000af6c70ff refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x127500
[55272.552127] head:00000000af6c70ff order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[55272.552133] anon flags: 0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[55272.552141] page_type: 0xffffffff()
[55272.552145] raw: 0017ffffc0010200 ffff888100042c80 0000000000000000 dead000000000001
[55272.552152] raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
[55272.552157] page dumped because: kasan: bad access detected

[55272.552163] Memory state around the buggy address:
[55272.552167]  ffff888127502700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[55272.552173]  ffff888127502780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[55272.552178] >ffff888127502800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[55272.552184]                                   ^
[55272.552187]  ffff888127502880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[55272.552193]  ffff888127502900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[55272.552198] ==================================================================
[55272.552203] Disabling lock debugging due to kernel taint

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.3+
Fixes: d98780310719 ("drm/tests: helpers: Allow to pass a custom drm_driver")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_kunit_helpers.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 514c8a7a32f0..ba483c87f0e7 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -3,6 +3,8 @@
 #ifndef DRM_KUNIT_HELPERS_H_
 #define DRM_KUNIT_HELPERS_H_
 
+#include <linux/device.h>
+
 #include <kunit/test.h>
 
 struct drm_device;
@@ -51,7 +53,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
 {
 	struct drm_driver *driver;
 
-	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
+	driver = devm_kzalloc(dev, sizeof(*driver), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, driver);
 
 	driver->driver_features = features;
-- 
2.41.0

