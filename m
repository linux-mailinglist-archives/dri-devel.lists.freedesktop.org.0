Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DA2A3EAD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE26EC50;
	Tue,  3 Nov 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158E6E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:56:41 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQBF03mq6z15Qnf;
 Tue,  3 Nov 2020 08:56:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 08:56:37 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Add the new api to install irq
Date: Tue, 3 Nov 2020 08:57:13 +0800
Message-ID: <1604365033-60277-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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

Add new api devm_drm_irq_install() to register interrupts,
no need to call drm_irq_uninstall() when the drm module is removed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
 include/drm/drm_drv.h     |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cd162d4..f4a15b5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
@@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *parent,
 	return ret;
 }
 
+static void devm_drm_dev_irq_uninstall(void *data)
+{
+	drm_irq_uninstall(data);
+}
+
+int devm_drm_irq_install(struct device *parent,
+			 struct drm_device *dev, int irq)
+{
+	int ret;
+
+	ret = drm_irq_install(dev, irq);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action(parent, devm_drm_dev_irq_uninstall, &irq);
+	if (ret)
+		devm_drm_dev_irq_uninstall(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_drm_irq_install);
+
 void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 			   size_t size, size_t offset)
 {
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0230762..fec1776 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -513,7 +513,8 @@ struct drm_driver {
 
 void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 			   size_t size, size_t offset);
-
+int devm_drm_irq_install(struct device *parent, struct drm_device *dev,
+			 int irq);
 /**
  * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
  * @parent: Parent device object
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
