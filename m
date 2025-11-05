Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B8C34847
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFDA10E6D7;
	Wed,  5 Nov 2025 08:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="F0qdPWZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 636 seconds by postgrey-1.36 at gabe;
 Wed, 05 Nov 2025 08:41:46 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12410E6D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D4
 gIXUhipj0yGP5qt0R8CsZJghJ3C1a01ZBrksuDTcI=; b=F0qdPWZdl9pJjyfJqP
 rdRDyT0Pf5D92AvjmBDYQza2OA2C491uPk14OnYPx17eQj1yQXNVMT/tXSm7Pojq
 5Fn17y/R1Pi4P6+bic2+nAkdaA7qHh9Jwo613MW9kFtQFFgbm1n3eLM+XSbVVWfZ
 eeyeVrB9iFvQgQ/dORRsmxxME=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wDXjwIuCwtpxglOBw--.41821S2; 
 Wed, 05 Nov 2025 16:30:40 +0800 (CST)
From: oushixiong1025@163.com
To: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/udl: Increase get urb timeout for modeset
Date: Wed,  5 Nov 2025 16:30:37 +0800
Message-Id: <20251105083037.237925-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXjwIuCwtpxglOBw--.41821S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWkXF1kZF4fKrWUXr18Zrb_yoWrCr4DpF
 4UJ3yjyrWUAF4jgF1UtF4kAw43J3W3Ka97K3yxC39a93WDKry5Jas5AryYgFyDJry7GF1a
 grn2vrWY9F4UCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0pB-UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXA78D2kLChsbMAAAs5
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
There is a situation where udl_handle_damage() was running successfully
but the screen was black. it was because udl_crtc_helper_atomic_enable() failed,
and there were no error messages.

[HOW]
The priority for mode settings needs to be higher than damage handle, requiring
a higher success rate than ordinary operations.
Increase get urb timeout for modeset.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.h      |  5 ++++-
 drivers/gpu/drm/udl/udl_main.c     |  5 ++---
 drivers/gpu/drm/udl/udl_modeset.c  | 11 +++++++----
 drivers/gpu/drm/udl/udl_transfer.c |  2 +-
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 145bb95ccc48..38b3bdf1ae4a 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -31,6 +31,9 @@ struct drm_mode_create_dumb;
 #define DRIVER_MINOR		0
 #define DRIVER_PATCHLEVEL	1
 
+#define GET_URB_TIMEOUT	HZ
+#define MODESET_GET_URB_TIMEOUT	(HZ*2)
+
 struct udl_device;
 
 struct urb_node {
@@ -72,7 +75,7 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 int udl_modeset_init(struct udl_device *udl);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
-struct urb *udl_get_urb(struct udl_device *udl);
+struct urb *udl_get_urb(struct udl_device *udl, long timeout);
 
 int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
 void udl_sync_pending_urbs(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index bc58991a6f14..891996f0f74b 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -285,13 +285,12 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 	return unode->urb;
 }
 
-#define GET_URB_TIMEOUT	HZ
-struct urb *udl_get_urb(struct udl_device *udl)
+struct urb *udl_get_urb(struct udl_device *udl, long timeout)
 {
 	struct urb *urb;
 
 	spin_lock_irq(&udl->urbs.lock);
-	urb = udl_get_urb_locked(udl, GET_URB_TIMEOUT);
+	urb = udl_get_urb_locked(udl, timeout);
 	spin_unlock_irq(&udl->urbs.lock);
 	return urb;
 }
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 231e829bd709..6adca5e3e471 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -217,7 +218,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	urb = udl_get_urb(udl);
+	urb = udl_get_urb(udl, GET_URB_TIMEOUT);
 	if (!urb)
 		return -ENOMEM;
 	cmd = urb->transfer_buffer;
@@ -341,9 +342,11 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(udl);
-	if (!urb)
+	urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
+	if (!urb) {
+		DRM_ERROR("Udl get urb failed when enabling crtc");
 		goto out;
+	}
 
 	buf = (char *)urb->transfer_buffer;
 	buf = udl_vidreg_lock(buf);
@@ -374,7 +377,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(udl);
+	urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
 	if (!urb)
 		goto out;
 
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 7d670b3a5293..858b47522d78 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -202,7 +202,7 @@ int udl_render_hline(struct udl_device *udl, int log_bpp, struct urb **urb_ptr,
 			int ret = udl_submit_urb(udl, urb, len);
 			if (ret)
 				return ret;
-			urb = udl_get_urb(udl);
+			urb = udl_get_urb(udl, GET_URB_TIMEOUT);
 			if (!urb)
 				return -EAGAIN;
 			*urb_ptr = urb;
-- 
2.25.1

