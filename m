Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A12C6293
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4A6EB7D;
	Fri, 27 Nov 2020 10:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63E6E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 12:02:13 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Chbvr1Vr9z74Dm;
 Thu, 26 Nov 2020 20:01:44 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 20:02:00 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
Subject: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
Date: Thu, 26 Nov 2020 20:02:19 +0800
Message-ID: <1606392140-57954-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606392140-57954-1-git-send-email-tiantao6@hisilicon.com>
References: <1606392140-57954-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new api devm_drm_irq_install() to register interrupts,
no need to call drm_irq_uninstall() when the drm module is removed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_irq.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_irq.h     |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 09d6e9e..983ad6b 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -214,6 +214,40 @@ int drm_irq_uninstall(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_irq_uninstall);
 
+static void devm_drm_irq_uninstall(void *data)
+{
+	drm_irq_uninstall(data);
+}
+
+/**
+ * devm_drm_irq_install - install IRQ handler
+ * @dev: DRM device
+ * @irq: IRQ number to install the handler for
+ *
+ * devm_drm_irq_install is the help function of drm_irq_install,
+ * when the driver uses devm_drm_irq_install, there is no need
+ * to call drm_irq_uninstall when the drm module is uninstalled,
+ * and this will done automagically.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int devm_drm_irq_install(struct drm_device *dev, int irq)
+{
+	int ret;
+
+	ret = drm_irq_install(dev, irq);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action(dev->dev, devm_drm_irq_uninstall, dev);
+	if (ret)
+		devm_drm_irq_uninstall(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_drm_irq_install);
+
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 int drm_legacy_irq_control(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
index d77f6e6..631b22f 100644
--- a/include/drm/drm_irq.h
+++ b/include/drm/drm_irq.h
@@ -28,5 +28,5 @@ struct drm_device;
 
 int drm_irq_install(struct drm_device *dev, int irq);
 int drm_irq_uninstall(struct drm_device *dev);
-
+int devm_drm_irq_install(struct drm_device *dev, int irq);
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
