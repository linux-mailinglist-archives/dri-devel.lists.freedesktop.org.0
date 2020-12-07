Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A462D2613
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95866E97B;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C028989C1E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:04:56 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqHS72cyNzhnjR;
 Mon,  7 Dec 2020 17:04:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 17:04:52 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed mode-config
 init
Date: Mon, 7 Dec 2020 17:05:05 +0800
Message-ID: <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 14 +++-----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  1 -
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 3687753..7f01213 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -96,8 +96,9 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	struct drm_device *dev = &priv->dev;
 	int ret;
 
-	drm_mode_config_init(dev);
-	priv->mode_config_initialized = true;
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -125,14 +126,6 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
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
@@ -262,7 +255,6 @@ static int hibmc_unload(struct drm_device *dev)
 	drm_atomic_helper_shutdown(dev);
 
 	pci_disable_msi(dev->pdev);
-	hibmc_kms_fini(priv);
 	dev->dev_private = NULL;
 	return 0;
 }
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index a49c10e..7d263f4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -42,7 +42,6 @@ struct hibmc_drm_private {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct hibmc_connector connector;
-	bool mode_config_initialized;
 };
 
 static inline struct hibmc_connector *to_hibmc_connector(struct drm_connector *connector)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
