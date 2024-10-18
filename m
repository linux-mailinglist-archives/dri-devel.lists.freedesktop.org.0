Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755539A3AFE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1D10E8D3;
	Fri, 18 Oct 2024 10:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198D10E8D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:11:02 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XVL5V3Nhyz1T8sv;
 Fri, 18 Oct 2024 18:09:02 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 854F81800D5;
 Fri, 18 Oct 2024 18:10:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Oct
 2024 18:10:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <ruanjinjie@huawei.com>, <quic_jjohnson@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ttm/tests: Fix memory leak in ttm_bo_kunit_init()
Date: Fri, 18 Oct 2024 18:10:18 +0800
Message-ID: <20241018101018.706555-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

The struct file allocated in drm_gem_object_init() is not freed
by ttm_bo_kunit_init(), which cause the folling memory leak.

	unreferenced object 0xffffff80cb18d500 (size 360):
	  comm "kunit_try_catch", pid 2149, jiffies 4295089512
	  hex dump (first 32 bytes):
	    01 00 00 00 00 00 00 00 00 00 00 00 ad 4e ad de  .............N..
	    ff ff ff ff 00 00 00 00 ff ff ff ff ff ff ff ff  ................
	  backtrace (crc ddf6bd5e):
	    [<000000002be7594b>] kmemleak_alloc+0x34/0x40
	    [<000000001b27be1f>] kmem_cache_alloc_noprof+0x254/0x2d8
	    [<00000000405acfaa>] alloc_empty_file+0x68/0x170
	    [<00000000dbe51815>] alloc_file_pseudo+0x108/0x1a0
	    [<00000000949320a0>] __shmem_file_setup+0x1b4/0x25c
	    [<000000009db3a347>] shmem_file_setup+0x30/0x3c
	    [<0000000093e9ae86>] drm_gem_object_init+0x34/0x78
	    [<000000007a24c4bb>] ttm_bo_kunit_init+0x1c0/0x3d8 [ttm_kunit_helpers]
	    [<00000000ab75e6de>] 0xffffffe699023b24
	    [<00000000cfb8042e>] kunit_try_run_case+0x13c/0x3ac
	    [<0000000003bffcc3>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<000000003f986493>] kthread+0x2e8/0x374
	    [<00000000ac1ed701>] ret_from_fork+0x10/0x20
	......

Add kunit_action_obj_fput() to fput it automatically.

Cc: stable@vger.kernel.org
Fixes: 9afc1e0aa485 ("drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 9ff216ec58ef..5e1e5fe41bb9 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <linux/file.h>
+
 #include <drm/ttm/ttm_tt.h>
 
 #include "ttm_kunit_helpers.h"
@@ -168,6 +170,14 @@ int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
 
+static void kunit_action_obj_fput(void *ptr)
+{
+	struct drm_gem_object *obj = ptr;
+
+	if (obj->filp)
+		fput(obj->filp);
+}
+
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size,
@@ -188,6 +198,9 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	err = drm_gem_object_init(devs->drm, &bo->base, size);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
+	err = kunit_add_action_or_reset(test, kunit_action_obj_fput, &bo->base);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
 	bo->bdev = devs->ttm_dev;
 	bo->destroy = dummy_ttm_bo_destroy;
 
-- 
2.34.1

