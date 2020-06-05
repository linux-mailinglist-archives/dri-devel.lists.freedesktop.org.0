Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35A1EF9C3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9B6E8F9;
	Fri,  5 Jun 2020 13:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FBC6E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D8EBACC5;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 05/14] drm/mgag200: Lookup VRAM PCI BAR start and length only
 once
Date: Fri,  5 Jun 2020 15:57:54 +0200
Message-Id: <20200605135803.19811-6-tzimmermann@suse.de>
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

The MM setup code on mgag200 reads PCI BAR 0's start and length
several times. Reusing these values makes the code more readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index a683642fe4682..73e30901e0631 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -33,16 +33,18 @@
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
+	resource_size_t start, len;
 	int ret;
 
-	arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
-				   pci_resource_len(dev->pdev, 0));
+	/* BAR 0 is VRAM */
+	start = pci_resource_start(dev->pdev, 0);
+	len = pci_resource_len(dev->pdev, 0);
 
-	mdev->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
-					 pci_resource_len(dev->pdev, 0));
+	arch_io_reserve_memtype_wc(start, len);
 
-	mdev->vram = ioremap(pci_resource_start(dev->pdev, 0),
-			     pci_resource_len(dev->pdev, 0));
+	mdev->fb_mtrr = arch_phys_wc_add(start, len);
+
+	mdev->vram = ioremap(start, len);
 	if (!mdev->vram) {
 		ret = -ENOMEM;
 		goto err_arch_phys_wc_del;
@@ -54,8 +56,7 @@ int mgag200_mm_init(struct mga_device *mdev)
 
 err_arch_phys_wc_del:
 	arch_phys_wc_del(mdev->fb_mtrr);
-	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-				pci_resource_len(dev->pdev, 0));
+	arch_io_free_memtype_wc(start, len);
 	return ret;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
