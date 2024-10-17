Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E29A1AB6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 08:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F76B10E79E;
	Thu, 17 Oct 2024 06:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067C310E7A2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 06:32:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XTdHY0PyPzcpQH;
 Thu, 17 Oct 2024 14:30:17 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 3F3A81800D2;
 Thu, 17 Oct 2024 14:32:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Oct
 2024 14:32:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <quic_jjohnson@quicinc.com>, <mcanal@igalia.com>, <ruanjinjie@huawei.com>,
 <davidgow@google.com>, <skhan@linuxfoundation.org>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] drm/tests: hdmi: Fix memory leaks in
 drm_display_mode_from_cea_vic()
Date: Thu, 17 Oct 2024 14:31:25 +0800
Message-ID: <20241017063125.3080347-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017063125.3080347-1-ruanjinjie@huawei.com>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
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

modprobe drm_hdmi_state_helper_test and then rmmod it, the following
memory leak occurs.

The `mode` allocated in drm_mode_duplicate() called by
drm_display_mode_from_cea_vic() is not freed, which cause the memory leak:

	unreferenced object 0xffffff80ccd18100 (size 128):
	  comm "kunit_try_catch", pid 1851, jiffies 4295059695
	  hex dump (first 32 bytes):
	    57 62 00 00 80 02 90 02 f0 02 20 03 00 00 e0 01  Wb........ .....
	    ea 01 ec 01 0d 02 00 00 0a 00 00 00 00 00 00 00  ................
	  backtrace (crc c2f1aa95):
	    [<000000000f10b11b>] kmemleak_alloc+0x34/0x40
	    [<000000001cd4cf73>] __kmalloc_cache_noprof+0x26c/0x2f4
	    [<00000000f1f3cffa>] drm_mode_duplicate+0x44/0x19c
	    [<000000008cbeef13>] drm_display_mode_from_cea_vic+0x88/0x98
	    [<0000000019daaacf>] 0xffffffedc11ae69c
	    [<000000000aad0f85>] kunit_try_run_case+0x13c/0x3ac
	    [<00000000a9210bac>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<000000000a0b2e9e>] kthread+0x2e8/0x374
	    [<00000000bd668858>] ret_from_fork+0x10/0x20
	......

Free `mode` by using drm_kunit_display_mode_from_cea_vic()
to fix it.

Cc: stable@vger.kernel.org
Fixes: 4af70f19e559 ("drm/tests: Add RGB Quantization tests")
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Update the commit message.
- Add Acked-by.
v2:
- Fix it with new introduced helper instead of drm_mode_destroy().
- Update the commit message.
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 34ee95d41f29..294773342e71 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -441,7 +441,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
@@ -555,7 +555,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
@@ -671,7 +671,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
@@ -1263,7 +1263,7 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	/*
-- 
2.34.1

