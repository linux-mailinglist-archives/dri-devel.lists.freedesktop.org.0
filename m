Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E02DBD1C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D678F89FCC;
	Wed, 16 Dec 2020 08:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7BC6E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:48:58 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CwGjb2W9Kz7GgC;
 Tue, 15 Dec 2020 19:48:19 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 19:48:45 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 1/2] drm/irq: Add the new api to enable pci msi
Date: Tue, 15 Dec 2020 19:48:52 +0800
Message-ID: <1608032933-50187-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608032933-50187-1-git-send-email-tiantao6@hisilicon.com>
References: <1608032933-50187-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new api devm_drm_msi_install() to register interrupts,
no need to call pci_disable_msi() when the drm module is removed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_irq.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_irq.h     |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 803af4b..da58b2c 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -246,6 +246,39 @@ int devm_drm_irq_install(struct drm_device *dev, int irq)
 }
 EXPORT_SYMBOL(devm_drm_irq_install);
 
+static void devm_drm_msi_uninstall(void *data)
+{
+	struct drm_device *dev = (struct drm_device *)data;
+
+	pci_disable_msi(dev->pdev);
+}
+
+/**
+ * devm_drm_msi_install - install IRQ handler
+ * @dev: DRM device
+ *
+ * devm_drm_msi_install is a  help function of pci_enable_msi.
+ *
+ * if the driver uses devm_drm_msi_install, there is no need
+ * to call pci_disable_msi when the drm module get unloaded,
+ * as this will done automagically.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int devm_drm_msi_install(struct drm_device *dev)
+{
+	int ret;
+
+	ret = pci_enable_msi(dev->pdev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev->dev,
+					devm_drm_msi_uninstall, dev);
+}
+EXPORT_SYMBOL(devm_drm_msi_install);
+
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 int drm_legacy_irq_control(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
index 631b22f..c8dff45 100644
--- a/include/drm/drm_irq.h
+++ b/include/drm/drm_irq.h
@@ -29,4 +29,5 @@ struct drm_device;
 int drm_irq_install(struct drm_device *dev, int irq);
 int drm_irq_uninstall(struct drm_device *dev);
 int devm_drm_irq_install(struct drm_device *dev, int irq);
+int devm_drm_msi_install(struct drm_device *dev);
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
