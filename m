Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2D158C31
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 10:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21D36E4AD;
	Tue, 11 Feb 2020 09:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B46E4AD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581414939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=DCZ/HZY+BrMbXg5FbkPEvwFRllXttN9dTdmpwAbOBrg=;
 b=TKRGq80Sy2gqyspsZYAbXRhFIKW0hOzjJkiHrtp2x6x/7aH9mYPSSjhLGF7DKx3lhuRPck
 QKLALgd0QGbtlUrQyFRtIHIE8q2yngdAIhnLUVvGyvS5KOsFzLxmWL2BhhuCLgcmP9+M31
 FloDElBNiZpYVO8rm+KLH3mJdrlYZfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-R89z60rxNr6iUvaiwZOc3w-1; Tue, 11 Feb 2020 04:55:35 -0500
X-MC-Unique: R89z60rxNr6iUvaiwZOc3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604CD8017DF;
 Tue, 11 Feb 2020 09:55:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC5760BF1;
 Tue, 11 Feb 2020 09:55:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 537C616E15; Tue, 11 Feb 2020 10:55:29 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/bochs: add drm_driver.release callback.
Date: Tue, 11 Feb 2020 10:55:29 +0100
Message-Id: <20200211095529.30449-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call bochs_unload via drm_driver.release to make sure we release stuff
when it is safe to do so.  Use drm_dev_{enter,exit,unplug} to avoid
touching hardware after device removal.  Tidy up here and there.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
 drivers/gpu/drm/bochs/bochs_hw.c  | 24 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 10460878414e..addb0568c1af 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -23,7 +23,6 @@ static void bochs_unload(struct drm_device *dev)
 
 	bochs_kms_fini(bochs);
 	bochs_mm_fini(bochs);
-	bochs_hw_fini(dev);
 	kfree(bochs);
 	dev->dev_private = NULL;
 }
@@ -69,6 +68,7 @@ static struct drm_driver bochs_driver = {
 	.major			= 1,
 	.minor			= 0,
 	DRM_GEM_VRAM_DRIVER,
+	.release                = bochs_unload,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -148,9 +148,9 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
-	drm_dev_unregister(dev);
-	bochs_unload(dev);
+	bochs_hw_fini(dev);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index b615b7dfdd9d..952199cc0462 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -4,6 +4,7 @@
 
 #include <linux/pci.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 
 #include "bochs.h"
@@ -194,6 +195,8 @@ void bochs_hw_fini(struct drm_device *dev)
 {
 	struct bochs_device *bochs = dev->dev_private;
 
+	/* TODO: shot down existing vram mappings */
+
 	if (bochs->mmio)
 		iounmap(bochs->mmio);
 	if (bochs->ioports)
@@ -207,6 +210,11 @@ void bochs_hw_fini(struct drm_device *dev)
 void bochs_hw_setmode(struct bochs_device *bochs,
 		      struct drm_display_mode *mode)
 {
+	int idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
+
 	bochs->xres = mode->hdisplay;
 	bochs->yres = mode->vdisplay;
 	bochs->bpp = 32;
@@ -232,11 +240,18 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
 			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
+
+	drm_dev_exit(idx);
 }
 
 void bochs_hw_setformat(struct bochs_device *bochs,
 			const struct drm_format_info *format)
 {
+	int idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
+
 	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
 			 (format->format >>  0) & 0xff,
 			 (format->format >>  8) & 0xff,
@@ -256,13 +271,18 @@ void bochs_hw_setformat(struct bochs_device *bochs,
 			  __func__, format->format);
 		break;
 	}
+
+	drm_dev_exit(idx);
 }
 
 void bochs_hw_setbase(struct bochs_device *bochs,
 		      int x, int y, int stride, u64 addr)
 {
 	unsigned long offset;
-	unsigned int vx, vy, vwidth;
+	unsigned int vx, vy, vwidth, idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
 
 	bochs->stride = stride;
 	offset = (unsigned long)addr +
@@ -277,4 +297,6 @@ void bochs_hw_setbase(struct bochs_device *bochs,
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
+
+	drm_dev_exit(idx);
 }
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
