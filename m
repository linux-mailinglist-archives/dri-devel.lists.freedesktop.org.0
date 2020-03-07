Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C017CD49
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 10:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99E46E124;
	Sat,  7 Mar 2020 09:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069DC6E124
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 09:37:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20477063-1500050 
 for multiple; Sat, 07 Mar 2020 09:37:04 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Make drm_pci_agp_init legacy
Date: Sat,  7 Mar 2020 09:37:02 +0000
Message-Id: <20200307093702.2269-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pull the drm_pci_agp_init() underneath the legacy ifdeffry alongside its
only caller.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/drm_pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 5218475ad7e7..81aa21561982 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -166,6 +166,18 @@ int drm_irq_by_busid(struct drm_device *dev, void *data,
 	return drm_pci_irq_by_busid(dev, p);
 }
 
+void drm_pci_agp_destroy(struct drm_device *dev)
+{
+	if (dev->agp) {
+		arch_phys_wc_del(dev->agp->agp_mtrr);
+		drm_legacy_agp_clear(dev);
+		kfree(dev->agp);
+		dev->agp = NULL;
+	}
+}
+
+#ifdef CONFIG_DRM_LEGACY
+
 static void drm_pci_agp_init(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
@@ -180,18 +192,6 @@ static void drm_pci_agp_init(struct drm_device *dev)
 	}
 }
 
-void drm_pci_agp_destroy(struct drm_device *dev)
-{
-	if (dev->agp) {
-		arch_phys_wc_del(dev->agp->agp_mtrr);
-		drm_legacy_agp_clear(dev);
-		kfree(dev->agp);
-		dev->agp = NULL;
-	}
-}
-
-#ifdef CONFIG_DRM_LEGACY
-
 static int drm_get_pci_dev(struct pci_dev *pdev,
 			   const struct pci_device_id *ent,
 			   struct drm_driver *driver)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
