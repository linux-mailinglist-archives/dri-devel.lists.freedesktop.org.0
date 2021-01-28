Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC47307CAA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 18:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8D06E207;
	Thu, 28 Jan 2021 17:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0149D6E207
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 17:37:59 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 28 Jan 2021 09:37:50 -0800
Received: from vertex.localdomain (unknown [10.21.245.107])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 8F1B72057C;
 Thu, 28 Jan 2021 09:37:56 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Fix some memory leaks on errors
Date: Thu, 28 Jan 2021 12:37:56 -0500
Message-ID: <20210128173756.121525-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dan noticed some issues with pci_release_region, this builds upon
that and fixes some other lingering issues. As part of this we
also can stop trying to manually free our managed device;
there's no need for it, it will be cleaned up automatically for us.

Fixes: 8772c0bb58bb ("drm/vmwgfx: Cleanup pci resource allocation")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 22f5a9f8a44b..792feb08398b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -717,7 +717,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		return ret;
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
-		return ret;
+		goto out_no_pci_or_version;
 
 	mutex_init(&dev_priv->cmdbuf_mutex);
 	mutex_init(&dev_priv->release_mutex);
@@ -1014,7 +1014,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(&dev_priv->drm);
 out_no_irq:
-	pci_release_regions(pdev);
 	ttm_object_device_release(&dev_priv->tdev);
 out_err0:
 	for (i = vmw_res_context; i < vmw_res_max; ++i)
@@ -1022,7 +1021,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
 	if (dev_priv->ctx.staged_bindings)
 		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
-	kfree(dev_priv);
+out_no_pci_or_version:
+	pci_release_regions(pdev);
 	return ret;
 }
 
@@ -1060,7 +1060,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_fence_manager_takedown(dev_priv->fman);
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(&dev_priv->drm);
-	pci_release_regions(pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
 	if (dev_priv->ctx.staged_bindings)
@@ -1069,7 +1068,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	for (i = vmw_res_context; i < vmw_res_max; ++i)
 		idr_destroy(&dev_priv->res_idr[i]);
 
-	kfree(dev_priv);
+	pci_release_regions(pdev);
 }
 
 static void vmw_postclose(struct drm_device *dev,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
