Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288E12BD38
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2019 11:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE36E144;
	Sat, 28 Dec 2019 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5523589336
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 01:15:11 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 46379DA1013776CDDABC;
 Sat, 28 Dec 2019 08:59:22 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Sat, 28 Dec 2019 08:59:13 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>
Subject: [PATCH] drm/hisilicon: Checked the resolution is valid before
 connector
Date: Sat, 28 Dec 2019 08:59:24 +0800
Message-ID: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 28 Dec 2019 10:07:14 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the previous version, the callback function mode_valid of
drm_connector_helper_funcs directly returned MODE_OK. Now we will
ensure that the resolution is correct and return MODE_OK, otherwise
return MODE_NOMODE.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 41 ++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 6d98fdc..3d08210 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -11,22 +11,59 @@
  *	Jianhua Li <lijianhua@huawei.com>
  */
 
+#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_print.h>
 
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
+static const struct hibmc_resolution {
+	int w;
+	int h;
+} hibmc_modetables[] = {
+	{640, 480}, {800, 600}, {1024, 768}, {1152, 864}, {1280, 768},
+	{1280, 720}, {1280, 960}, {1280, 1024}, {1440, 900}, {1600, 900},
+	{1600, 1200}, {1920, 1080}, {1920, 1200}
+};
+
+static int hibmc_valid_mode(int w, int h)
+{
+	int size = sizeof(hibmc_modetables) / sizeof(struct hibmc_resolution);
+	int i;
+
+	for (i = 0; i < size; i++) {
+		if (hibmc_modetables[i].w == w && hibmc_modetables[i].h == h)
+			return 0;
+	}
+
+	return -1;
+}
+
 static int hibmc_connector_get_modes(struct drm_connector *connector)
 {
-	return drm_add_modes_noedid(connector, 800, 600);
+	int count;
+
+	drm_connector_update_edid_property(connector, NULL);
+	count = drm_add_modes_noedid(connector, 1920, 1200);
+	drm_set_preferred_mode(connector, 1024, 768);
+
+	return count;
 }
 
 static enum drm_mode_status hibmc_connector_mode_valid(struct drm_connector *connector,
 				      struct drm_display_mode *mode)
 {
-	return MODE_OK;
+	int vrefresh = drm_mode_vrefresh(mode);
+
+	if (vrefresh < 59 || vrefresh > 61)
+		return MODE_NOMODE;
+	else if (hibmc_valid_mode(mode->hdisplay, mode->vdisplay) != 0)
+		return MODE_NOMODE;
+	else
+		return MODE_OK;
 }
 
 static const struct drm_connector_helper_funcs
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
