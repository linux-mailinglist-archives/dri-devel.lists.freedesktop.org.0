Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229529B59FB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 03:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FC010E738;
	Wed, 30 Oct 2024 02:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183010E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 02:35:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XdWRd0Fq9z20qyn;
 Wed, 30 Oct 2024 10:34:37 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 020C81A0188;
 Wed, 30 Oct 2024 10:35:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 30 Oct
 2024 10:35:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <quic_jjohnson@quicinc.com>, <mcanal@igalia.com>,
 <skhan@linuxfoundation.org>, <davidgow@google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
Date: Wed, 30 Oct 2024 10:35:02 +0800
Message-ID: <20241030023504.530425-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030023504.530425-1-ruanjinjie@huawei.com>
References: <20241030023504.530425-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)
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
drm_kunit_display_mode_from_cea_vic(), it can replace the direct call
of drm_display_mode_from_cea_vic(), and it will help solving
the `mode` memory leaks.

Acked-by: Maxime Ripard <mripard@kernel.org>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Return NULL early if drm_display_mode_from_cea_vic() return NULL,
  because it doesn't really make much sense to register a cleanup action
  if we know that it's going to be useless.
v3:
- Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
- Drop the "helper" in the helper name.
- Add Acked-by.
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 42 +++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           |  4 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index aa62719dab0e..04a6b8cc62ac 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
@@ -311,6 +312,47 @@ drm_kunit_helper_create_crtc(struct kunit *test,
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
+ * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC
+					   for a KUnit test
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
+drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device *dev,
+				    u8 video_code)
+{
+	struct drm_display_mode *mode;
+	int ret;
+
+	mode = drm_display_mode_from_cea_vic(dev, video_code);
+	if (!mode)
+		return NULL;
+
+	ret = kunit_add_action_or_reset(test,
+					kunit_action_drm_mode_destroy,
+					mode);
+	if (ret)
+		return NULL;
+
+	return mode;
+}
+EXPORT_SYMBOL_GPL(drm_kunit_display_mode_from_cea_vic);
+
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_DESCRIPTION("KUnit test suite helper functions");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index e7cc17ee4934..afdd46ef04f7 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -120,4 +120,8 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 			     const struct drm_crtc_funcs *funcs,
 			     const struct drm_crtc_helper_funcs *helper_funcs);
 
+struct drm_display_mode *
+drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device *dev,
+				    u8 video_code);
+
 #endif // DRM_KUNIT_HELPERS_H_
-- 
2.34.1

