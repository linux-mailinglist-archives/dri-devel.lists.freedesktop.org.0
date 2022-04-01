Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE94EFBE8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112A10E0FD;
	Fri,  1 Apr 2022 20:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DE210E0F4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:56:07 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 5512A28A546;
 Fri,  1 Apr 2022 21:56:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1648846565; bh=klNZi8K4qy22qgGHhlckTAOQ2hPHpUShIBvUo1JJcCI=;
 h=From:To:Cc:Subject:Date:From;
 b=WTyY+O5q9fEutlpPumiqwtaasBhIihYwH1GcsyXVdOdJxVvwK1ZVUXeK5yR0XRO3O
 Dd8/UvRhGjnZuhAY44cBH0jcBuUDq2GakkFYteuQtlE2qcZIFDxo02j0H85FdNOxD3
 KAodcu+OqILfNnkvKodBifbWzrYjt7S/+/p+ChHLyFDxzAeezvhabNXD1JMEuMZ1S/
 Wec2X+15nmtpzG8GUzMqAASLa1/pCIpQOJ+/qqP1gLTK5BpTqqIF08ObLHS3oHVIZK
 fpDMamVSn1BzZ/Gp8QR9Z+E6iInevDjzEd1muG6QDPyy9oFWZU55FRzpLQNEFCRkn1
 Dbk7JAFakdNMg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vmwgfx: Add debugfs entries for ttm placements
Date: Fri,  1 Apr 2022 16:56:00 -0400
Message-Id: <20220401205602.1172975-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Add a few debugfs entries for every used TTM placement that vmwgfx is
using. This allows basic tracking of memory usage inside vmwgfx, e.g.
'cat /sys/kernel/debug/dri/0/mob_ttm' will display mob memory usage.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 97 +++++++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 791f9a5f3868..6d675855f065 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1632,6 +1632,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto out_unload;
 
 	vmw_debugfs_gem_init(vmw);
+	vmw_ttm_debugfs_init(vmw);
 
 	return 0;
 out_unload:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index be19aa6e1f13..eabe3e8e9cf9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1085,6 +1085,7 @@ vmw_bo_sg_table(struct ttm_buffer_object *bo);
 extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
 				      unsigned long bo_size,
 				      struct ttm_buffer_object **bo_p);
+void vmw_ttm_debugfs_init(struct vmw_private *vdev);
 
 extern void vmw_piter_start(struct vmw_piter *viter,
 			    const struct vmw_sg_table *vsgt,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index b84ecc6d6611..355414595e52 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -677,3 +677,98 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
 		*bo_p = bo;
 	return ret;
 }
+
+#if defined(CONFIG_DEBUG_FS)
+
+static int vmw_ttm_vram_table_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
+							    TTM_PL_VRAM);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+static int vmw_ttm_page_pool_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+
+	return ttm_pool_debugfs(&vdev->bdev.pool, m);
+}
+
+static int vmw_ttm_mob_table_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
+							    VMW_PL_MOB);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+static int vmw_ttm_gmr_table_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
+							    VMW_PL_GMR);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+static int vmw_ttm_system_table_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
+							    TTM_PL_SYSTEM);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+static int vmw_ttm_system_mob_table_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
+							    VMW_PL_SYSTEM);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_vram_table);
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_mob_table);
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_gmr_table);
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_table);
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_mob_table);
+DEFINE_SHOW_ATTRIBUTE(vmw_ttm_page_pool);
+
+#endif
+
+void vmw_ttm_debugfs_init(struct vmw_private *vdev)
+{
+#if defined(CONFIG_DEBUG_FS)
+	struct drm_device *drm = &vdev->drm;
+	struct drm_minor *minor = drm->primary;
+	struct dentry *root = minor->debugfs_root;
+
+	debugfs_create_file("vram_ttm", 0444, root, vdev,
+			    &vmw_ttm_vram_table_fops);
+	debugfs_create_file("mob_ttm", 0444, root, vdev,
+			    &vmw_ttm_mob_table_fops);
+	debugfs_create_file("gmr_ttm", 0444, root, vdev,
+			    &vmw_ttm_gmr_table_fops);
+	debugfs_create_file("system_ttm", 0444, root, vdev,
+			    &vmw_ttm_system_table_fops);
+	debugfs_create_file("system_mob_ttm", 0444, root, vdev,
+			    &vmw_ttm_system_mob_table_fops);
+	debugfs_create_file("ttm_page_pool", 0444, root, vdev,
+			    &vmw_ttm_page_pool_fops);
+#endif
+}
-- 
2.32.0

