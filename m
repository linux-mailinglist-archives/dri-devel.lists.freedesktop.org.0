Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E392F29BF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32C46E114;
	Tue, 12 Jan 2021 08:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC386E0EA;
 Tue, 12 Jan 2021 08:10:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF825B7D5;
 Tue, 12 Jan 2021 08:10:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 5/6] drm/radeon: Store PCI controller in struct
 radeon_device.hose
Date: Tue, 12 Jan 2021 09:10:34 +0100
Message-Id: <20210112081035.6882-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
References: <20210112081035.6882-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moves struct drm_device.hose into struct radeon_device. The field in
struct DRM device is only for legacy drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon.h     | 3 +++
 drivers/gpu/drm/radeon/radeon_drv.c | 4 ----
 drivers/gpu/drm/radeon/radeon_kms.c | 4 ++++
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 6bcb851d7e22..f09989bdce98 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2313,6 +2313,9 @@ struct radeon_device {
 	struct device			*dev;
 	struct drm_device		*ddev;
 	struct pci_dev			*pdev;
+#ifdef __alpha__
+	struct pci_controller		*hose;
+#endif
 	struct rw_semaphore		exclusive_lock;
 	/* ASIC */
 	union radeon_asic_config	config;
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 8193a2e9c415..efeb115ae70e 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -342,10 +342,6 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free;
 
-#ifdef __alpha__
-	dev->hose = pdev->sysdata;
-#endif
-
 	pci_set_drvdata(pdev, dev);
 
 	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 7c360d31ab6a..2479d6ab7a36 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -115,6 +115,10 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	}
 	dev->dev_private = (void *)rdev;
 
+#ifdef __alpha__
+	rdev->hose = pdev->sysdata;
+#endif
+
 	/* update BUS flag */
 	if (pci_find_capability(pdev, PCI_CAP_ID_AGP)) {
 		flags |= RADEON_IS_AGP;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 35b715f82ed8..e8c66d10478f 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -324,7 +324,7 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 		 * access, as done in ttm_bo_vm_fault().
 		 */
 		mem->bus.offset = (mem->bus.offset & 0x0ffffffffUL) +
-			rdev->ddev->hose->dense_mem_base;
+			rdev->hose->dense_mem_base;
 #endif
 		break;
 	default:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
