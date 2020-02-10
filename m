Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB666157392
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 12:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA6B6EC0F;
	Mon, 10 Feb 2020 11:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81076E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581334679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=fpH5V3Jnvj+HddIqGCU1VUNzWmBVK6MoKZ6REuCkUs8=;
 b=hpKOCwuinU6Kd43ASLtqBEIWOW19j5586O8uwfiSXvddbENfv3tZJe8vJ6zH4/CD9tyMK3
 B3RnmA5AhJgUz5moXWwPtV1htFADltxT84chSqugtabULSInq0GLUH56xsc8bjSinbgTjR
 YeodeAPZYRwCDkpOVlZH1oZ4+C/+qrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-2TI-8XQiP-2NdEXXde9fuQ-1; Mon, 10 Feb 2020 06:37:58 -0500
X-MC-Unique: 2TI-8XQiP-2NdEXXde9fuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1261D8017CC;
 Mon, 10 Feb 2020 11:37:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F05010013A7;
 Mon, 10 Feb 2020 11:37:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3F1A59CAF; Mon, 10 Feb 2020 12:37:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/qxl: add drm_driver.release callback.
Date: Mon, 10 Feb 2020 12:37:52 +0100
Message-Id: <20200210113753.5614-3-kraxel@redhat.com>
In-Reply-To: <20200210113753.5614-1-kraxel@redhat.com>
References: <20200210113753.5614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1d601f57a6ba..4fda3f9b29f4 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modeset_helper.h>
@@ -132,21 +133,30 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return ret;
 }
 
+static void qxl_drm_release(struct drm_device *dev)
+{
+	struct qxl_device *qdev = dev->dev_private;
+
+	/*
+	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
+	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
+	 * non-trivial though.
+	 */
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
 
@@ -279,6 +289,8 @@ static struct drm_driver qxl_driver = {
 	.major = 0,
 	.minor = 1,
 	.patchlevel = 0,
+
+	.release = qxl_drm_release,
 };
 
 static int __init qxl_init(void)
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
