Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F732ACC2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 02:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCA16E0A6;
	Wed,  3 Mar 2021 01:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57226E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 01:39:04 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DqxS52p2xzlRTn;
 Wed,  3 Mar 2021 09:36:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 09:38:57 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <hdegoede@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/vboxvideo: Use managed VRAM-helper initialization
Date: Wed, 3 Mar 2021 09:39:46 +0800
Message-ID: <1614735587-6621-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

updated to use drmm_vram_helper_init().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/vboxvideo/vbox_ttm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index 0066a3c..fd8a53a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -12,15 +12,13 @@
 
 int vbox_mm_init(struct vbox_private *vbox)
 {
-	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = &vbox->ddev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
+	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
 				       vbox->available_vram_size);
-	if (IS_ERR(vmm)) {
-		ret = PTR_ERR(vmm);
+	if (ret) {
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
@@ -33,5 +31,4 @@ int vbox_mm_init(struct vbox_private *vbox)
 void vbox_mm_fini(struct vbox_private *vbox)
 {
 	arch_phys_wc_del(vbox->fb_mtrr);
-	drm_vram_helper_release_mm(&vbox->ddev);
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
