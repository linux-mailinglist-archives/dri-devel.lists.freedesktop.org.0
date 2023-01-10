Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D6664492
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602910E5D9;
	Tue, 10 Jan 2023 15:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC82010E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 15:25:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-05 (Coremail) with SMTP id zQCowADHzu5Ag71jnJENDA--.30343S2;
 Tue, 10 Jan 2023 23:24:49 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and
 alloc_ordered_workqueue()
Date: Tue, 10 Jan 2023 23:24:47 +0800
Message-Id: <20230110152447.5611-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHzu5Ag71jnJENDA--.30343S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1fWw18ArWkGFW8JF13Arb_yoW5trWUpF
 s5AFW5CrZ5trZFgrWayw1DuFy3Gan2gF1Iyw1Ivw1a9a15t34DZ3ZYyFyjv343GrWkJF4Y
 yFZxtFWkuF1jyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUym14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUq38nUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drmm_alloc_workqueue() and drmm_alloc_ordered_workqueue(), the helpers
that provide managed workqueue cleanup. The workqueue will be destroyed
with the final reference of the DRM device.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/drm_managed.c | 66 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  8 +++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4cf214de50c4..d3bd6247eec9 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -271,6 +271,13 @@ static void drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 
+static void drmm_destroy_workqueue(struct drm_device *dev, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+
 /**
  * drmm_mutex_init - &drm_device-managed mutex_init()
  * @dev: DRM device
@@ -289,3 +296,62 @@ int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
 	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
 }
 EXPORT_SYMBOL(drmm_mutex_init);
+
+/**
+ * drmm_alloc_workqueue - &drm_device-managed alloc_workqueue()
+ * @dev: DRM device
+ * @wq: workqueue to be allocated
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of alloc_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+int drmm_alloc_workqueue(struct drm_device *dev,
+			  struct workqueue_struct *wq, const char *fmt,
+			  unsigned int flags, int max_active, ...)
+{
+	va_list args;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+
+	if (!wq)
+		return -ENOMEM;
+
+	return drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+}
+EXPORT_SYMBOL(drmm_alloc_workqueue);
+
+/**
+ * drmm_alloc_ordered_workqueue - &drm_device-managed
+ * alloc_ordered_workqueue()
+ * @dev: DRM device
+ * @wq: workqueue to be allocated
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of alloc_ordered_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+int drmm_alloc_ordered_workqueue(struct drm_device *dev,
+				  struct workqueue_struct *wq,
+				  const char *fmt, unsigned int flags, ...)
+{
+	va_list args;
+
+	va_start(args, flags);
+	wq = alloc_ordered_workqueue(fmt, flags, args);
+	va_end(args);
+
+	if (!wq)
+		return -ENOMEM;
+
+	return drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+}
+EXPORT_SYMBOL(drmm_alloc_ordered_workqueue);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 359883942612..68cecc14e1af 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -107,4 +107,12 @@ void drmm_kfree(struct drm_device *dev, void *data);
 
 int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
 
+int drmm_alloc_workqueue(struct drm_device *dev,
+			  struct workqueue_struct *wq, const char *fmt,
+			  unsigned int flags, int max_active, ...);
+
+int drmm_alloc_ordered_workqueue(struct drm_device *dev,
+				  struct workqueue_struct *wq,
+				  const char *fmt, unsigned int flags, ...);
+
 #endif
-- 
2.25.1

