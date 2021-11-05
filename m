Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DE44693E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF66ECFA;
	Fri,  5 Nov 2021 19:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72B6EC81
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 19:40:44 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 5 Nov 2021 12:40:38 -0700
Received: from vmware.com (unknown [10.21.244.23])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id AFCEF205D2;
 Fri,  5 Nov 2021 12:40:43 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/6] drm/vmwgfx: Release ttm memory if probe fails
Date: Fri, 5 Nov 2021 15:38:43 -0400
Message-ID: <20211105193845.258816-3-zackr@vmware.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105193845.258816-1-zackr@vmware.com>
References: <20211105193845.258816-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
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
Cc: Martin Krastev <krastevm@vmware.com>
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
2.32.0

