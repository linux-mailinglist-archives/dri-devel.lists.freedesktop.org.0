Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462099CABC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 14:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374CD10E44E;
	Mon, 14 Oct 2024 12:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E01D10E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:52:59 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XRxvZ41mjzQrhc;
 Mon, 14 Oct 2024 20:52:10 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id CF98A1400D8;
 Mon, 14 Oct 2024 20:52:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 14 Oct
 2024 20:52:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <mcanal@igalia.com>, <ruanjinjie@huawei.com>, <quic_jjohnson@quicinc.com>,
 <skhan@linuxfoundation.org>, <davidgow@google.com>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] drm/ttm/tests: Fix memory leak in
 ttm_tt_simple_create()
Date: Mon, 14 Oct 2024 20:52:03 +0800
Message-ID: <20241014125204.1294934-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014125204.1294934-1-ruanjinjie@huawei.com>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

modprobe ttm_device_test and then rmmod ttm_device_test, the fllowing
memory leaks occurs:

The ttm->pages allocated in ttm_tt_init() is not freed after calling
ttm_tt_simple_create(), which cause the memory leak:

	unreferenced object 0xffffff80caf27750 (size 8):
	  comm "kunit_try_catch", pid 2242, jiffies 4295055735
	  hex dump (first 8 bytes):
	    c0 1e 3d c3 fe ff ff ff                          ..=.....
	  backtrace (crc 3d11615a):
	    [<000000007f57312a>] kmemleak_alloc+0x34/0x40
	    [<000000008c6c4c7e>] __kmalloc_node_noprof+0x304/0x3e4
	    [<00000000679c1182>] __kvmalloc_node_noprof+0x1c/0x144
	    [<000000006aed0a3d>] ttm_tt_init+0x138/0x28c [ttm]
	    [<000000005c331998>] drm_gem_shmem_free+0x60/0x534 [drm_shmem_helper]
	    [<0000000022b4f375>] kunit_try_run_case+0x13c/0x3ac
	    [<00000000c525d725>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<000000002db94a1f>] kthread+0x2e8/0x374
	    [<000000002c457ad7>] ret_from_fork+0x10/0x20
	......

Fix it by calling ttm_tt_fini() in the exit function.

Cc: stable@vger.kernel.org
Fixes: e6f7c641fae3 ("drm/ttm/tests: Add tests for ttm_tt")
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Add Reviewed-by.
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index b91c13f46225..9ff216ec58ef 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -54,6 +54,7 @@ static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo, u32 pag
 
 static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
+	ttm_tt_fini(ttm);
 	kfree(ttm);
 }
 
-- 
2.34.1

