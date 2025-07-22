Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C36B0D75D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 12:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507E10E651;
	Tue, 22 Jul 2025 10:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="mIZarsTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AAEA10E656
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uq
 UFJbVekLDgeDQMYnUJjp+Rm3wS/RISllxNOdae4fI=; b=mIZarsTk1luWEGAP3v
 qIz/ZI3HKhbnvOAoLrZMbRfsxxqO7lYse8P+gQQJieIwLOZSDRPC3dqqAXp8KbU3
 sDNWIjw21MkZhC+eQ6UsHH0mYPiTI7NbTUu7wW13as31FMEyeXMDsxi75Na8u7eE
 O5A/oYJ36Hnczj519mKV1sxl0=
Received: from localhost.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgCH93_5Z39o5HhiAA--.9828S2;
 Tue, 22 Jul 2025 18:29:13 +0800 (CST)
From: oushixiong1025@163.com
To: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/udl: add noblocking dirtyfb support
Date: Tue, 22 Jul 2025 18:29:12 +0800
Message-Id: <20250722102912.2256895-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCH93_5Z39o5HhiAA--.9828S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrW3Gw43ZrWkCF48Zr4Utwb_yoWfGF4DpF
 s8XasIyrWjqF4Fgrn7Gr48AFy3Gw1Ik3ykG3yxCanakF15KryUXFyrAFyv9F15Jr43GFnx
 XF9rKFyqkFWUJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j05l8UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQWSD2h-YTh75QABsU
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY]
The DIRTYFB IOCTL is blocking by default. In multi-GPU setups, this
may rate-limit the Primary GPU if the UDL handles damage too slowly.
For example, in a cloud virtual desktop environment, when a USB
DisplayLink device is connected to the client, the primary screen's
refresh rate may significantly degrade. This occurs because the DIRTYFB
operations must first be transmitted over the network (to the remote host)
before the actual USB display commands can be executed.

[HOW]
Add non-blocking DIRTYFB support for UDL as an optional feature.
Move udl_handle_damage() to a dedicated kthread, and try to merge damage regions
before processing to prevent display content from lagging behind the latest
data too much.

In my cloud desktop system environment, the udl_handle_damage() takes up to
dozens of milliseconds. After using this optional feature, the desktop display
becomes smoother and more responsive.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c     |   4 +
 drivers/gpu/drm/udl/udl_drv.h     |  16 ++++
 drivers/gpu/drm/udl/udl_main.c    |  41 ++++++++++
 drivers/gpu/drm/udl/udl_modeset.c | 132 ++++++++++++++++++++++++++++++
 4 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1506094..c2fc4b3 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -17,6 +17,10 @@
 
 #include "udl_drv.h"
 
+int udl_noblocking_damage;
+MODULE_PARM_DESC(noblocking_damage, "Noblocking damage (1 = enabled, 0 = disabled(default))");
+module_param_named(noblocking_damage, udl_noblocking_damage, int, 0444);
+
 static int udl_usb_suspend(struct usb_interface *interface,
 			   pm_message_t message)
 {
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 282ebd6..6ed4346 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -21,6 +21,8 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_plane.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
 
 struct drm_mode_create_dumb;
 
@@ -34,6 +36,13 @@ struct drm_mode_create_dumb;
 
 struct udl_device;
 
+struct damage_work_node {
+	struct drm_framebuffer *fb;
+	struct drm_rect *clip;
+
+	struct list_head list;
+};
+
 struct urb_node {
 	struct list_head entry;
 	struct udl_device *dev;
@@ -74,10 +83,17 @@ struct udl_device {
 	int sku_pixel_limit;
 
 	struct urb_list urbs;
+
+
+	struct list_head	damage_queue;
+	spinlock_t		damage_lock;
+	struct work_struct	damage_work;
 };
 
 #define to_udl(x) container_of(x, struct udl_device, drm)
 
+extern int udl_noblocking_damage;
+
 static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 {
 	return interface_to_usbdev(to_usb_interface(udl->drm.dev));
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce..3de1a06 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <drm/drm.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -348,10 +349,50 @@ err:
 	return ret;
 }
 
+static void udl_free_damage_queue(struct drm_device *dev)
+{
+	struct udl_device *udl = to_udl(dev);
+	struct list_head *entry, *tmp;
+	struct drm_gem_object *obj;
+	unsigned long flags;
+	int i;
+
+	if (!udl_noblocking_damage)
+		return;
+
+	udl_noblocking_damage = false;
+
+	spin_lock_irqsave(&udl->damage_lock, flags);
+
+	list_for_each_safe(entry, tmp, &udl->damage_queue) {
+		struct damage_work_node *damage;
+
+		damage = list_entry(entry, struct damage_work_node, list);
+		if (damage == NULL)
+			continue;
+		list_del(&damage->list);
+
+		for (i = 0; i < damage->fb->format->num_planes; ++i) {
+			obj = drm_gem_fb_get_obj(damage->fb, i);
+			if (obj)
+				drm_gem_object_put(obj);
+		}
+
+		drm_framebuffer_put(damage->fb);
+
+		kfree(damage->clip);
+		kfree(damage);
+	}
+
+	spin_unlock_irqrestore(&udl->damage_lock, flags);
+}
+
+
 int udl_drop_usb(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
 
+	udl_free_damage_queue(dev);
 	udl_free_urb_list(dev);
 	put_device(udl->dmadev);
 	udl->dmadev = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 5a15399..a4a4c4b 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -261,6 +261,124 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static void udl_damage_work_func(struct work_struct *work)
+{
+	struct udl_device *udl = container_of(work, struct udl_device, damage_work);
+	struct drm_gem_object *obj;
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+
+	if (!list_empty(&udl->damage_queue)) {
+		struct damage_work_node *damage;
+
+		spin_lock_irqsave(&udl->damage_lock, flags);
+
+		damage = list_first_entry(&udl->damage_queue,
+					  struct damage_work_node, list);
+		list_del(&damage->list);
+		spin_unlock_irqrestore(&udl->damage_lock, flags);
+
+		if (damage->clip && damage->fb) {
+			struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+
+			ret = drm_gem_fb_vmap(damage->fb, map, NULL);
+			if (ret) {
+				DRM_ERROR("vmap damage fb error %d\n", ret);
+				goto free;
+			}
+
+			udl_handle_damage(damage->fb, &map[0], damage->clip);
+			drm_gem_fb_vunmap(damage->fb, map);
+
+free:
+			for (i = 0; i < damage->fb->format->num_planes; ++i) {
+				obj = drm_gem_fb_get_obj(damage->fb, i);
+				if (obj)
+					drm_gem_object_put(obj);
+			}
+
+			drm_framebuffer_put(damage->fb);
+
+			kfree(damage->clip);
+			kfree(damage);
+		}
+	}
+}
+
+void udl_damage_merged(const struct drm_rect *rect, struct drm_rect *dst_rect)
+{
+	dst_rect->x1 = min(dst_rect->x1, rect->x1);
+	dst_rect->y1 = min(dst_rect->y1, rect->y1);
+	dst_rect->x2 = max(dst_rect->x2, rect->x2);
+	dst_rect->y2 = max(dst_rect->y2, rect->y2);
+}
+
+static void udl_queue_damage_work(struct udl_device *udl, struct drm_framebuffer *fb,
+				  const struct drm_rect *clip)
+{
+	struct list_head *entry, *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&udl->damage_lock, flags);
+
+	/* Just merge the damage if the same framebuffer damage is already queued */
+	list_for_each_safe(entry, tmp, &udl->damage_queue) {
+		struct damage_work_node *dirty_work;
+
+		dirty_work = list_entry(entry, struct damage_work_node, list);
+		if (dirty_work == NULL)
+			continue;
+
+		if (dirty_work->fb == fb) {
+			/* Merged clips */
+			udl_damage_merged(clip, dirty_work->clip);
+			spin_unlock_irqrestore(&udl->damage_lock, flags);
+
+			return;
+		}
+	}
+
+	struct damage_work_node *new_work;
+	struct drm_rect *new_damage;
+
+	new_work = kzalloc(sizeof(*new_work), GFP_KERNEL);
+	if (!new_work)
+		goto err;
+
+	new_damage = kzalloc(sizeof(*new_damage), GFP_KERNEL);
+	if (!new_damage)
+		goto free_work;
+
+	memcpy(new_damage, clip, sizeof(*clip));
+
+	new_work->fb = fb;
+	new_work->clip = new_damage;
+	drm_framebuffer_get(fb);
+
+	struct drm_gem_object *obj;
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (obj)
+			drm_gem_object_get(obj);
+	}
+
+	/* Queue a new damage request */
+	list_add_tail(&new_work->list, &udl->damage_queue);
+	spin_unlock_irqrestore(&udl->damage_lock, flags);
+
+	schedule_work(&udl->damage_work);
+
+	return;
+
+free_work:
+	kfree(new_work);
+err:
+	spin_unlock_irqrestore(&udl->damage_lock, flags);
+}
+
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
@@ -276,6 +394,14 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (!fb)
 		return; /* no framebuffer; plane is disabled */
 
+	if (udl_noblocking_damage) {
+		struct udl_device *udl = to_udl(dev);
+
+		drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage);
+		udl_queue_damage_work(udl, fb, &damage);
+		return;
+	}
+
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return;
@@ -600,5 +726,11 @@ int udl_modeset_init(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
+	if (udl_noblocking_damage) {
+		INIT_LIST_HEAD(&udl->damage_queue);
+		spin_lock_init(&udl->damage_lock);
+		INIT_WORK(&udl->damage_work, udl_damage_work_func);
+	}
+
 	return 0;
 }
-- 
2.43.0

