Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BA426F97
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A986E0FB;
	Fri,  8 Oct 2021 17:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B16E0F8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 17:31:52 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 8 Oct 2021 10:31:47 -0700
Received: from vmware.com (unknown [10.21.244.180])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id B7FA320512;
 Fri,  8 Oct 2021 10:31:51 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
CC: Zack Rusin <zackr@vmware.com>, Martin Krastev <krastevm@vmware.com>
Subject: [PATCH 2/5] drm/vmwgfx: Release ttm memory if probe fails
Date: Fri, 8 Oct 2021 13:31:43 -0400
Message-ID: <20211008173146.645127-3-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008173146.645127-1-zackr@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm mem global state was leaking if the vmwgfx driver load failed.

In case of a driver load failure we have to make sure we also release
the ttm mem global state.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index ab9a1750e1df..8d0b083ba267 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1617,34 +1617,40 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	vmw = devm_drm_dev_alloc(&pdev->dev, &driver,
 				 struct vmw_private, drm);
-	if (IS_ERR(vmw))
-		return PTR_ERR(vmw);
+	if (IS_ERR(vmw)) {
+		ret = PTR_ERR(vmw);
+		goto out_error;
+	}
 
 	pci_set_drvdata(pdev, &vmw->drm);
 
 	ret = ttm_mem_global_init(&ttm_mem_glob, &pdev->dev);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	ret = vmw_driver_load(vmw, ent->device);
 	if (ret)
-		return ret;
+		goto out_release;
 
 	ret = drm_dev_register(&vmw->drm, 0);
-	if (ret) {
-		vmw_driver_unload(&vmw->drm);
-		return ret;
-	}
+	if (ret)
+		goto out_unload;
 
 	return 0;
+out_unload:
+	vmw_driver_unload(&vmw->drm);
+out_release:
+	ttm_mem_global_release(&ttm_mem_glob);
+out_error:
+	return ret;
 }
 
 static int __init vmwgfx_init(void)
-- 
2.30.2

