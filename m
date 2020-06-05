Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3211EF9C7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233886E8FC;
	Fri,  5 Jun 2020 13:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7DE6E8F3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 940A5AD3A;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 09/14] drm/mgag200: Prefix global names in mgag200_drv.c with
 mgag200_
Date: Fri,  5 Jun 2020 15:57:58 +0200
Message-Id: <20200605135803.19811-10-tzimmermann@suse.de>
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

The naming of global symbols in mgag200_drv.c is inconsistent. Fix
that by prefixing all names with mgag200_.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 670e12d57dea8..ad74e02d8f251 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,7 +27,7 @@ module_param_named(modeset, mgag200_modeset, int, 0400);
 
 DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
 
-static struct drm_driver driver = {
+static struct drm_driver mgag200_driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops = &mgag200_driver_fops,
 	.name = DRIVER_NAME,
@@ -43,7 +43,7 @@ static struct drm_driver driver = {
  * PCI driver
  */
 
-static const struct pci_device_id pciidlist[] = {
+static const struct pci_device_id mgag200_pciidlist[] = {
 	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
 		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
 	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_B },
@@ -56,10 +56,10 @@ static const struct pci_device_id pciidlist[] = {
 	{0,}
 };
 
-MODULE_DEVICE_TABLE(pci, pciidlist);
+MODULE_DEVICE_TABLE(pci, mgag200_pciidlist);
 
-
-static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+static int
+mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct drm_device *dev;
 	int ret;
@@ -70,7 +70,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&driver, &pdev->dev);
+	dev = drm_dev_alloc(&mgag200_driver, &pdev->dev);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
@@ -96,7 +96,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return ret;
 }
 
-static void mga_pci_remove(struct pci_dev *pdev)
+static void mgag200_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
@@ -107,9 +107,9 @@ static void mga_pci_remove(struct pci_dev *pdev)
 
 static struct pci_driver mgag200_pci_driver = {
 	.name = DRIVER_NAME,
-	.id_table = pciidlist,
-	.probe = mga_pci_probe,
-	.remove = mga_pci_remove,
+	.id_table = mgag200_pciidlist,
+	.probe = mgag200_pci_probe,
+	.remove = mgag200_pci_remove,
 };
 
 static int __init mgag200_init(void)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
