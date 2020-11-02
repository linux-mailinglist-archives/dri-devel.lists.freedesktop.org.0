Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161172A2BC3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877176EB31;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8B389EB8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:37:36 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPsrB6q2VzhZ0C;
 Mon,  2 Nov 2020 20:37:30 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 20:37:29 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/irq: Modify the return value type of drm_irq_uninstall
Date: Mon, 2 Nov 2020 20:38:05 +0800
Message-ID: <1604320685-14995-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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

There is no driver to use the return value of drm_irq_uninstal,
so modify the return value type of drm_irq_uninstal to void.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_irq.c | 13 ++++++-------
 include/drm/drm_irq.h     |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 7537a3d..45e6471 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -166,14 +166,14 @@ EXPORT_SYMBOL(drm_irq_install);
  * Returns:
  * Zero on success or a negative error code on failure.
  */
-int drm_irq_uninstall(struct drm_device *dev)
+void drm_irq_uninstall(struct drm_device *dev)
 {
 	unsigned long irqflags;
 	bool irq_enabled;
 	int i;
 
 	if (!dev->irq_enabled || !dev)
-		return 0;
+		return;
 
 	irq_enabled = dev->irq_enabled;
 	dev->irq_enabled = false;
@@ -200,8 +200,8 @@ int drm_irq_uninstall(struct drm_device *dev)
 		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 	}
 
-	if (!irq_enabled)
-		return -EINVAL;
+	if (!drm_WARN_ON(dev, !irq_enabled))
+		return;
 
 	DRM_DEBUG("irq=%d\n", dev->irq);
 
@@ -213,7 +213,6 @@ int drm_irq_uninstall(struct drm_device *dev)
 
 	free_irq(dev->irq, dev);
 
-	return 0;
 }
 EXPORT_SYMBOL(drm_irq_uninstall);
 
@@ -250,10 +249,10 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 		return ret;
 	case DRM_UNINST_HANDLER:
 		mutex_lock(&dev->struct_mutex);
-		ret = drm_irq_uninstall(dev);
+		drm_irq_uninstall(dev);
 		mutex_unlock(&dev->struct_mutex);
 
-		return ret;
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
index d77f6e6..d9f6ec0 100644
--- a/include/drm/drm_irq.h
+++ b/include/drm/drm_irq.h
@@ -27,6 +27,6 @@
 struct drm_device;
 
 int drm_irq_install(struct drm_device *dev, int irq);
-int drm_irq_uninstall(struct drm_device *dev);
+void drm_irq_uninstall(struct drm_device *dev);
 
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
