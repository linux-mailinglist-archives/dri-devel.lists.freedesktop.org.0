Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17AF211CDD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F46EA7A;
	Thu,  2 Jul 2020 07:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576EE6E107
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:08:27 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 843A99133502F6EBF772;
 Thu,  2 Jul 2020 15:08:25 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 15:08:17 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/hisilicon: Use drmm_kzalloc() instead of devm_kzalloc()
Date: Thu, 2 Jul 2020 15:06:42 +0800
Message-ID: <1593673602-49027-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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

using the new API drmm_kzalloc() instead of devm_kzalloc()

v2:
keep the DRM include statements sorted alphabetically.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index a6fd0c2..b557728 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -11,18 +11,18 @@
  *	Jianhua Li <lijianhua@huawei.com>
  */
 
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
 #include <linux/console.h>
 #include <linux/module.h>
-#include <linux/pci.h>
-
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_irq.h>
-#include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
+#include <linux/pci.h>
 
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
@@ -267,7 +267,7 @@ static int hibmc_load(struct drm_device *dev)
 	struct hibmc_drm_private *priv;
 	int ret;
 
-	priv = devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		DRM_ERROR("no memory to allocate for hibmc_drm_private\n");
 		return -ENOMEM;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
