Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DD1EF9C1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA916E8F3;
	Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E121B6E8EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D46A7AAE8;
 Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 03/14] drm/mgag200: Use pcim_enable_device()
Date: Fri,  5 Jun 2020 15:57:52 +0200
Message-Id: <20200605135803.19811-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the managed function simplifies the error handling. After
unloading the driver, the PCI device should now get disabled as
well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 00ddea7d7d270..140ae86082c8e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -52,15 +52,13 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
 
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
 	dev = drm_dev_alloc(&driver, &pdev->dev);
-	if (IS_ERR(dev)) {
-		ret = PTR_ERR(dev);
-		goto err_pci_disable_device;
-	}
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
 
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
@@ -81,8 +79,6 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	mgag200_driver_unload(dev);
 err_drm_dev_put:
 	drm_dev_put(dev);
-err_pci_disable_device:
-	pci_disable_device(pdev);
 	return ret;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
