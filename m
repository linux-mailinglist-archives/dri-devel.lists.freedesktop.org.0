Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AA1571DC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863926E951;
	Mon, 10 Feb 2020 09:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA396E951
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581327500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=xX7Esd2LjoEl226z40syD0xaVDhvEyrAmaske0/4mxc=;
 b=JDb6pzINuqfO/dbbwmgrp1esh2Lp7ZlrrXps3BddvSVKHGMlWltnqaLDLAK8S6oMEC4XVB
 LpzEPW4i+nwGOWpEOslN2Ib6qdHNa1XrKIxx5wtnjXNH2NAT3ArE6opbBxtqdsB9igcDEr
 tMDwI7VQnfzFsTTpKK54oT0gV5h9EC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412--gqScj6WOSSVCRv19KO4gA-1; Mon, 10 Feb 2020 04:38:06 -0500
X-MC-Unique: -gqScj6WOSSVCRv19KO4gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B898018DE;
 Mon, 10 Feb 2020 09:38:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313D25C1D4;
 Mon, 10 Feb 2020 09:38:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CEF8A1E0; Mon, 10 Feb 2020 10:38:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bochs: add drm_driver.release callback.
Date: Mon, 10 Feb 2020 10:38:01 +0100
Message-Id: <20200210093801.4773-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Call drm_dev_unregister() first in bochs_pci_remove().  Hook
bochs_unload() into the new .release callback, to make sure cleanup
is done when all users are gone.

Add ready bool to state struct and move bochs_hw_fini() call from
bochs_unload() to bochs_pci_remove() to make sure hardware is not
touched after bochs_pci_remove returns.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs.h     |  1 +
 drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
 drivers/gpu/drm/bochs/bochs_hw.c  | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 917767173ee6..f6bce8669274 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -57,6 +57,7 @@ struct bochs_device {
 	unsigned long  fb_base;
 	unsigned long  fb_size;
 	unsigned long  qext_size;
+	bool           ready;
 
 	/* mode */
 	u16 xres;
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 10460878414e..60b5492739ef 100644
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
 
-	drm_atomic_helper_shutdown(dev);
 	drm_dev_unregister(dev);
-	bochs_unload(dev);
+	drm_atomic_helper_shutdown(dev);
+	bochs_hw_fini(dev);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index b615b7dfdd9d..48c1a6a8b026 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -168,6 +168,7 @@ int bochs_hw_init(struct drm_device *dev)
 	}
 	bochs->fb_base = addr;
 	bochs->fb_size = size;
+	bochs->ready = true;
 
 	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
 	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
@@ -194,6 +195,10 @@ void bochs_hw_fini(struct drm_device *dev)
 {
 	struct bochs_device *bochs = dev->dev_private;
 
+	bochs->ready = false;
+
+	/* TODO: shot down existing vram mappings */
+
 	if (bochs->mmio)
 		iounmap(bochs->mmio);
 	if (bochs->ioports)
@@ -207,6 +212,9 @@ void bochs_hw_fini(struct drm_device *dev)
 void bochs_hw_setmode(struct bochs_device *bochs,
 		      struct drm_display_mode *mode)
 {
+	if (!bochs->ready)
+		return;
+
 	bochs->xres = mode->hdisplay;
 	bochs->yres = mode->vdisplay;
 	bochs->bpp = 32;
@@ -237,6 +245,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 void bochs_hw_setformat(struct bochs_device *bochs,
 			const struct drm_format_info *format)
 {
+	if (!bochs->ready)
+		return;
+
 	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
 			 (format->format >>  0) & 0xff,
 			 (format->format >>  8) & 0xff,
@@ -264,6 +275,9 @@ void bochs_hw_setbase(struct bochs_device *bochs,
 	unsigned long offset;
 	unsigned int vx, vy, vwidth;
 
+	if (!bochs->ready)
+		return;
+
 	bochs->stride = stride;
 	offset = (unsigned long)addr +
 		y * bochs->stride +
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
