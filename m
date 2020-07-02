Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E676B2135E6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0636EAB6;
	Fri,  3 Jul 2020 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88B46EA81
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:51:31 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CBB0FB43E4E67814F373;
 Thu,  2 Jul 2020 15:51:27 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 15:51:19 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/hisilicon: Use drmm_kzalloc() instead of devm_kzalloc()
Date: Thu, 2 Jul 2020 15:49:43 +0800
Message-ID: <1593676183-28525-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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

v3:
still fixed include statements sorted alphabetically.

v2:
keep the DRM include statements sorted alphabetically.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index a6fd0c2..249c298 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -267,7 +268,7 @@ static int hibmc_load(struct drm_device *dev)
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
