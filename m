Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2099CAB9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 14:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310B710E3D8;
	Mon, 14 Oct 2024 12:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E210E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:52:55 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XRxqX2Q7kz1HKsX;
 Mon, 14 Oct 2024 20:48:40 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 903AD1400DA;
 Mon, 14 Oct 2024 20:52:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 14 Oct
 2024 20:52:50 +0800
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
Subject: [PATCH v2 1/4] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
Date: Mon, 14 Oct 2024 20:52:01 +0800
Message-ID: <20241014125204.1294934-2-ruanjinjie@huawei.com>
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

As Maxime suggested, add a new helper
drm_kunit_helper_display_mode_from_cea_vic(), it can replace
the direct call of drm_display_mode_from_cea_vic(), and it will
help solving the `mode` memory leaks.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 40 +++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           |  6 ++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index aa62719dab0e..dc70bafcd394 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -311,6 +311,46 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_create_crtc);
 
+static void kunit_action_drm_mode_destroy(void *ptr)
+{
+	struct drm_display_mode *mode = ptr;
+
+	drm_mode_destroy(NULL, mode);
+}
+
+/**
+ * drm_kunit_helper_display_mode_from_cea_vic() - return a mode for CEA VIC
+						  for a KUnit test
+ * @test: The test context object
+ * @dev: DRM device
+ * @video_code: CEA VIC of the mode
+ *
+ * Creates a new mode matching the specified CEA VIC for a KUnit test.
+ *
+ * Resources will be cleaned up automatically.
+ *
+ * Returns: A new drm_display_mode on success or NULL on failure
+ */
+struct drm_display_mode *
+drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
+					   struct drm_device *dev,
+					   u8 video_code)
+{
+	struct drm_display_mode *mode;
+	int ret;
+
+	mode = drm_display_mode_from_cea_vic(dev, video_code);
+
+	ret = kunit_add_action_or_reset(test,
+					kunit_action_drm_mode_destroy,
+					mode);
+	if (ret)
+		return NULL;
+
+	return mode;
+}
+EXPORT_SYMBOL_GPL(drm_kunit_helper_display_mode_from_cea_vic);
+
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_DESCRIPTION("KUnit test suite helper functions");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index e7cc17ee4934..1e7fd4be550c 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -4,6 +4,7 @@
 #define DRM_KUNIT_HELPERS_H_
 
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 
 #include <linux/device.h>
 
@@ -120,4 +121,9 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 			     const struct drm_crtc_funcs *funcs,
 			     const struct drm_crtc_helper_funcs *helper_funcs);
 
+struct drm_display_mode *
+drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
+					   struct drm_device *dev,
+					   u8 video_code);
+
 #endif // DRM_KUNIT_HELPERS_H_
-- 
2.34.1

