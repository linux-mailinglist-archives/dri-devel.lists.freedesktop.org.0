Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75E99CABB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 14:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1A10E44A;
	Mon, 14 Oct 2024 12:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC1110E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:52:55 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XRxtG08jBz10N3n;
 Mon, 14 Oct 2024 20:51:02 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 41375180AE9;
 Mon, 14 Oct 2024 20:52:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 14 Oct
 2024 20:52:51 +0800
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
Subject: [PATCH v2 2/4] drm/connector: hdmi: Fix memory leak in
 drm_display_mode_from_cea_vic()
Date: Mon, 14 Oct 2024 20:52:02 +0800
Message-ID: <20241014125204.1294934-3-ruanjinjie@huawei.com>
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

modprobe drm_connector_test and then rmmod drm_connector_test,
the following memory leak occurs.

The `mode` allocated in drm_mode_duplicate() called by
drm_display_mode_from_cea_vic() is not freed, which cause the memory leak:

	unreferenced object 0xffffff80cb0ee400 (size 128):
	  comm "kunit_try_catch", pid 1948, jiffies 4294950339
	  hex dump (first 32 bytes):
	    14 44 02 00 80 07 d8 07 04 08 98 08 00 00 38 04  .D............8.
	    3c 04 41 04 65 04 00 00 05 00 00 00 00 00 00 00  <.A.e...........
	  backtrace (crc 90e9585c):
	    [<00000000ec42e3d7>] kmemleak_alloc+0x34/0x40
	    [<00000000d0ef055a>] __kmalloc_cache_noprof+0x26c/0x2f4
	    [<00000000c2062161>] drm_mode_duplicate+0x44/0x19c
	    [<00000000f96c74aa>] drm_display_mode_from_cea_vic+0x88/0x98
	    [<00000000d8f2c8b4>] 0xffffffdc982a4868
	    [<000000005d164dbc>] kunit_try_run_case+0x13c/0x3ac
	    [<000000006fb23398>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<000000006ea56ca0>] kthread+0x2e8/0x374
	    [<000000000676063f>] ret_from_fork+0x10/0x20
	......

Free `mode` by using drm_kunit_helper_display_mode_from_cea_vic()
to fix it.

Cc: stable@vger.kernel.org
Fixes: abb6f74973e2 ("drm/tests: Add HDMI TDMS character rate tests")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Fix it with new introduced helper instead of drm_mode_destroy().
- Update the commit message.
---
 drivers/gpu/drm/tests/drm_connector_test.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 15e36a8db685..e12b39dc4fe7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -996,7 +996,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1017,7 +1017,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc(struct kunit *test)
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1038,7 +1038,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1(struct kunit *t
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	rate = drm_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
@@ -1056,7 +1056,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc(struct kunit *test)
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1077,7 +1077,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1(struct kunit *t
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 1);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	rate = drm_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
@@ -1095,7 +1095,7 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb_double(struct kunit *test)
 	unsigned long long rate;
 	struct drm_device *drm = &priv->drm;
 
-	mode = drm_display_mode_from_cea_vic(drm, 6);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 6);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_TRUE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1118,7 +1118,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv420_valid(struct kunit
 	unsigned long long rate;
 	unsigned int vic = *(unsigned int *)test->param_value;
 
-	mode = drm_display_mode_from_cea_vic(drm, vic);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, vic);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1155,7 +1155,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc(struct kuni
 		drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
 	unsigned long long rate;
 
-	mode = drm_display_mode_from_cea_vic(drm, vic);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, vic);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1180,7 +1180,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc(struct kuni
 		drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
 	unsigned long long rate;
 
-	mode = drm_display_mode_from_cea_vic(drm, vic);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, vic);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1203,7 +1203,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc(struct kunit
 	struct drm_device *drm = &priv->drm;
 	unsigned long long rate;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1225,7 +1225,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc(struct kuni
 	struct drm_device *drm = &priv->drm;
 	unsigned long long rate;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1247,7 +1247,7 @@ static void drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc(struct kuni
 	struct drm_device *drm = &priv->drm;
 	unsigned long long rate;
 
-	mode = drm_display_mode_from_cea_vic(drm, 16);
+	mode = drm_kunit_helper_display_mode_from_cea_vic(test, drm, 16);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
-- 
2.34.1

