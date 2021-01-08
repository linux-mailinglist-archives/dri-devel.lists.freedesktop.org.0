Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6D2EEEED
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2486E80B;
	Fri,  8 Jan 2021 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD06E7D9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 07:54:14 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBwLx1tyjzMGtV;
 Fri,  8 Jan 2021 15:52:57 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 15:54:07 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>
Subject: [RFC] drm/connector: Set the default callback function for
 drm_connector_funcs
Date: Fri, 8 Jan 2021 15:54:02 +0800
Message-ID: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The member functions of drm_connector_funcs are not specific to each
manufacturer's driver, so drm_connector_funcs is allowed to use default
values, which prevents all drivers from setting the same member
functions for drm_connector_funcs.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_connector.c                  | 7 ++++++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 -
 include/drm/drm_connector.h                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 98b6ec4..356d8a3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -25,6 +25,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_utils.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_sysfs.h>
@@ -216,7 +217,7 @@ void drm_connector_free_work_fn(struct work_struct *work)
  */
 int drm_connector_init(struct drm_device *dev,
 		       struct drm_connector *connector,
-		       const struct drm_connector_funcs *funcs,
+		       struct drm_connector_funcs *funcs,
 		       int connector_type)
 {
 	struct drm_mode_config *config = &dev->mode_config;
@@ -228,6 +229,10 @@ int drm_connector_init(struct drm_device *dev,
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));
 
+	if (!funcs->fill_modes)
+		funcs->fill_modes = &drm_helper_probe_single_connector_modes;
+
+
 	ret = __drm_mode_object_add(dev, &connector->base,
 				    DRM_MODE_OBJECT_CONNECTOR,
 				    false, drm_connector_free);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index c76f996..7d3b662 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -64,7 +64,6 @@ static const struct drm_connector_helper_funcs
 };
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = hibmc_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b27..4810583 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1561,7 +1561,7 @@ struct drm_connector {
 
 int drm_connector_init(struct drm_device *dev,
 		       struct drm_connector *connector,
-		       const struct drm_connector_funcs *funcs,
+		       struct drm_connector_funcs *funcs,
 		       int connector_type);
 int drm_connector_init_with_ddc(struct drm_device *dev,
 				struct drm_connector *connector,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
