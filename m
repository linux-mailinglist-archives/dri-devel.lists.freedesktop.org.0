Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D52CE9D4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920926EC77;
	Fri,  4 Dec 2020 08:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3186E0E5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 01:23:09 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnFLk4swBzhmDW;
 Fri,  4 Dec 2020 09:22:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 09:23:03 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/hisilicon: Use managed mode-config init
Date: Fri, 4 Dec 2020 09:23:08 +0800
Message-ID: <1607044999-47666-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
References: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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

Using drmm_mode_config_init() sets up managed release of modesetting
resources.
Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 5aea2e9..04fee18 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -82,7 +82,9 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	struct drm_device *dev = &priv->dev;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
 	priv->mode_config_initialized = true;
 
 	dev->mode_config.min_width = 0;
@@ -111,14 +113,6 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	return 0;
 }
 
-static void hibmc_kms_fini(struct hibmc_drm_private *priv)
-{
-	if (priv->mode_config_initialized) {
-		drm_mode_config_cleanup(&priv->dev);
-		priv->mode_config_initialized = false;
-	}
-}
-
 /*
  * It can operate in one of three modes: 0, 1 or Sleep.
  */
@@ -248,7 +242,6 @@ static int hibmc_unload(struct drm_device *dev)
 	drm_atomic_helper_shutdown(dev);
 
 	pci_disable_msi(dev->pdev);
-	hibmc_kms_fini(priv);
 	dev->dev_private = NULL;
 	return 0;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
