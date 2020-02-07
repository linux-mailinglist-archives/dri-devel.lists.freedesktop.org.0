Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D446D155774
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 13:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F24A6EAA4;
	Fri,  7 Feb 2020 12:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281D6EAA4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581077656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=HPolVK3TlmNTaweClvM7JUT5pDu7rY7SbMpa8C96AzI=;
 b=ePK26y1/d8XYyetyinDL+V8WD65yhpFlUSLntguKyXlYURUWCmQ5pQJ5n+CVzrUaKQDKaa
 P7FvuGScBSl7hGQSobhPIyrwETNYBc3Onf1/PXPGizfUoHfMBpwgv++4Spz1sZkWVyKfqO
 h2KTWbxqgw+ALbWML44yWNdIFM/R85g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-HXij-0yAMwaTx6MzNAnnlQ-1; Fri, 07 Feb 2020 07:14:11 -0500
X-MC-Unique: HXij-0yAMwaTx6MzNAnnlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9603B2EE3;
 Fri,  7 Feb 2020 12:14:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89B025DA7E;
 Fri,  7 Feb 2020 12:14:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB5671747D; Fri,  7 Feb 2020 13:14:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: add drm_driver.release callback.
Date: Fri,  7 Feb 2020 13:14:05 +0100
Message-Id: <20200207121405.25895-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move final cleanups to qxl_drm_release() callback.
Add drm_atomic_helper_shutdown() call to qxl_pci_remove().

Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
might trigger qxl commands, so we should do that before
releaseing command rings.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 21 ++++++++++++++-------
 drivers/gpu/drm/qxl/qxl_kms.c |  8 ++++----
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1d601f57a6ba..8044363ba0f2 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modeset_helper.h>
@@ -132,21 +133,25 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return ret;
 }
 
+static void qxl_drm_release(struct drm_device *dev)
+{
+	struct qxl_device *qdev = dev->dev_private;
+
+	qxl_modeset_fini(qdev);
+	qxl_device_fini(qdev);
+	dev->dev_private = NULL;
+	kfree(qdev);
+}
+
 static void
 qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct qxl_device *qdev = dev->dev_private;
 
 	drm_dev_unregister(dev);
-
-	qxl_modeset_fini(qdev);
-	qxl_device_fini(qdev);
+	drm_atomic_helper_shutdown(dev);
 	if (is_vga(pdev))
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
-
-	dev->dev_private = NULL;
-	kfree(qdev);
 	drm_dev_put(dev);
 }
 
@@ -279,6 +284,8 @@ static struct drm_driver qxl_driver = {
 	.major = 0,
 	.minor = 1,
 	.patchlevel = 0,
+
+	.release = qxl_drm_release,
 };
 
 static int __init qxl_init(void)
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index bfc1631093e9..70b20ee4741a 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -299,12 +299,12 @@ void qxl_device_fini(struct qxl_device *qdev)
 {
 	qxl_bo_unref(&qdev->current_release_bo[0]);
 	qxl_bo_unref(&qdev->current_release_bo[1]);
-	flush_work(&qdev->gc_work);
-	qxl_ring_free(qdev->command_ring);
-	qxl_ring_free(qdev->cursor_ring);
-	qxl_ring_free(qdev->release_ring);
 	qxl_gem_fini(qdev);
 	qxl_bo_fini(qdev);
+	flush_work(&qdev->gc_work);
+	qxl_ring_free(qdev->command_ring);
+	qxl_ring_free(qdev->cursor_ring);
+	qxl_ring_free(qdev->release_ring);
 	io_mapping_free(qdev->surface_mapping);
 	io_mapping_free(qdev->vram_mapping);
 	iounmap(qdev->ram_header);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
