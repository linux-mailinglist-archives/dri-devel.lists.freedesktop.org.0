Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B74FCD25
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF910FB6E;
	Tue, 12 Apr 2022 03:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3BA10FB44
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:35:34 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E02F128BCA8;
 Tue, 12 Apr 2022 04:35:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649734533; bh=Kc1YR85+rTevyEOzlzbztaezisc4i8wryY7gfmkxCmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ecSX3nFTvLvG9KzW83JDFwm5Dhp5xUmbsrwY2IKTTKsvzsH2XtpMCGeZe16rJT74Y
 Why71CEDavkm0HO/gKM+5qZQu6IcWYEbr8ekE4Vd6TLCODqDu9gwV/YiApLLgdjON5
 O1DSZP9Ub5+ylrxuMG8EEyMDSR7qigTjaOREV/qwH6lSq/jDIAe1xNIG4+hIVpODIF
 /B1pS5Ami1q82OgTJDY2eBTIuhutp32UyUvBy66174qlyUGKqSyaiOlu/gJnih/Dpy
 4XzJ+WUaTYnOtRqlyj4+t7dVP6ULZir1p6ngcmcvN2aX0v/yq06JE5KW6Ca32dy3wT
 abNTKYVL4+Vgg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/vmwgfx: Add debugfs entries for various ttm
 resource managers
Date: Mon, 11 Apr 2022 23:35:23 -0400
Message-Id: <20220412033526.369115-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220412033526.369115-1-zack@kde.org>
References: <20220412033526.369115-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Use the newly added TTM's ability to automatically create debugfs entries
for specified placements. This creates debugfs files that can be read to
get information about various TTM resource managers which are used by
vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index decd54b8333d..5c4d999f8cd3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1410,6 +1410,23 @@ static void vmw_remove(struct pci_dev *pdev)
 	vmw_driver_unload(dev);
 }
 
+static void vmw_debugfs_resource_managers_init(struct vmw_private *vmw)
+{
+	struct drm_minor *minor = vmw->drm.primary;
+	struct dentry *root = minor->debugfs_root;
+
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, TTM_PL_SYSTEM),
+					    root, "system_ttm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, TTM_PL_VRAM),
+					    root, "vram_ttm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_GMR),
+					    root, "gmr_ttm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_MOB),
+					    root, "mob_ttm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_SYSTEM),
+					    root, "system_mob_ttm");
+}
+
 static unsigned long
 vmw_get_unmapped_area(struct file *file, unsigned long uaddr,
 		      unsigned long len, unsigned long pgoff,
@@ -1657,6 +1674,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto out_unload;
 
 	vmw_debugfs_gem_init(vmw);
+	vmw_debugfs_resource_managers_init(vmw);
 
 	return 0;
 out_unload:
-- 
2.32.0

