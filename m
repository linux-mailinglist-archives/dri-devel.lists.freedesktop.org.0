Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFA952607
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 00:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808E210E2F9;
	Wed, 14 Aug 2024 22:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="f2wG1fO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAD710E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 22:57:46 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70d1d6369acso985682b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723676264; x=1724281064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1WA6OJsUfM5bnY/jahH78a+IR1L7pRYtw366D5gB/ec=;
 b=f2wG1fO0mWZJ3g5lt6Em04h/j6XjxMVD8t4uAuMSBCLr9Cn9muvnhwIsggaDBQSwrP
 Xl1KGFmxtWK6ENiTc5RG0PzzwuDbpUCLvvDMJ5PRKPtuVYCXf8lA01xXz5W5yFnpLU73
 De/iQhNO/LXBeq3BhPH5ocKY+26fR7Vxp8F3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723676264; x=1724281064;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1WA6OJsUfM5bnY/jahH78a+IR1L7pRYtw366D5gB/ec=;
 b=Yo9FNL1x7PFqj5mjrcTqGcV0l0h4kPc4JBCJX6XTMMUYmGkJtcpxa0V2frEgAESJeM
 OP0k9t3/omGjUOD/oA5+ydtOYvnM2Ex9RFx9sR4HieUrrGkTtOND5Vc0eQ4UuF4MM4fA
 /rD4jfKCgRuYHhiN+YqeB1OVlqOWI1YItgSAlwxMgL+d0KdeDp6p5jqadm6TKrEpk1OL
 Vn9PltKJ4zIPRMTNrb92xh2554RH5ituIpMK+C9aUxWPQZDLDr8WYjepL7Ajhua/tpdk
 JI2uMqzMZlYMOaBAxtF38bsQqj4dVDEVf7V/A0PtA9Utt9KfJUQ7joQxHazcWnbOoHtl
 mzzQ==
X-Gm-Message-State: AOJu0Yza7bmpLjVfGpAdrGDyy6DoM6rW0Zm6heUeHIT5iiY8p8nYkY+O
 E8GJxl60jieyfzWmFGZ0Dyftt7iSX+1ctnY8jTGw51d3tUlvRPb8DA7HOkSj4VXNAN1dbV9rYYF
 l1oZzOicx68tUKF0I/5uO1x269FqJkfpEyLveNqVLi/GTBd3pftkV6Ro5EATd0XGsmcQ6ByTrnE
 giZys8q0aKwvxbRRoMojDfsyJVb5enPJx6rfU2KA6eqMaIHJlKx4yORl66ow==
X-Google-Smtp-Source: AGHT+IE/l+Cop+ENkCBnTGX3LBUTF5ih2LNA1WqM+YVs+it1EsQw0wBemH+mBulOR2K3CutgnV/Q5Q==
X-Received: by 2002:a05:6a20:394c:b0:1c6:8c89:88c9 with SMTP id
 adf61e73a8af0-1c8f86df9d1mr1624688637.18.1723676264310; 
 Wed, 14 Aug 2024 15:57:44 -0700 (PDT)
Received: from mombasawalam-Precision-5820-Tower.eng.vmware.com ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b6365aa5sm60633a12.76.2024.08.14.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 15:57:43 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Add debugfs file for displaying buffer information
Date: Wed, 14 Aug 2024 15:57:29 -0700
Message-Id: <20240814225729.816100-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Information about userspace allocated buffers can already be seen with
debugfs file vmwgfx_gem_info.
Add a debugfs file vmwgfx_buffer_info that also displays information about
vmwgfx buffers allocated by the kernel.
Also display name of the original process that allocated the buffer object
in both of these files.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c  | 120 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |   8 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c |  51 ------------
 4 files changed, 131 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index f42ebc4a7c22..2d6922ada481 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -31,6 +31,7 @@
 #include "vmwgfx_resource_priv.h"
 
 #include <drm/ttm/ttm_placement.h>
+#include <linux/debugfs.h>
 
 static void vmw_bo_release(struct vmw_bo *vbo)
 {
@@ -436,6 +437,8 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 		ttm_bo_pin(&vmw_bo->tbo);
 	ttm_bo_unreserve(&vmw_bo->tbo);
 
+	get_task_comm(vmw_bo->origin_comm, current);
+
 	return 0;
 }
 
@@ -878,3 +881,120 @@ struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo)
 		surf = vmw_res_to_srf(res);
 	return surf;
 }
+
+#if defined(CONFIG_DEBUG_FS)
+
+void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m)
+{
+	const char *placement;
+	const char *type;
+
+	switch (bo->tbo.resource->mem_type) {
+	case TTM_PL_SYSTEM:
+		placement = " CPU";
+		break;
+	case VMW_PL_GMR:
+		placement = " GMR";
+		break;
+	case VMW_PL_MOB:
+		placement = " MOB";
+		break;
+	case VMW_PL_SYSTEM:
+		placement = "VCPU";
+		break;
+	case TTM_PL_VRAM:
+		placement = "VRAM";
+		break;
+	default:
+		placement = "None";
+		break;
+	}
+
+	switch (bo->tbo.type) {
+	case ttm_bo_type_device:
+		type = "device";
+		break;
+	case ttm_bo_type_kernel:
+		type = "kernel";
+		break;
+	case ttm_bo_type_sg:
+		type = "sg    ";
+		break;
+	default:
+		type = "none  ";
+		break;
+	}
+
+	if (id)
+		seq_printf(m, "\t\t0x%08x: %12zu bytes %s, type = %s", id,
+		bo->tbo.base.size, placement, type);
+	else
+		seq_printf(m, "\t%12zu bytes, placement = %s, type = %s",
+		bo->tbo.base.size, placement, type);
+	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d, Origin proc: %16s",
+		   bo->tbo.priority,
+		   bo->tbo.pin_count,
+		   kref_read(&bo->tbo.base.refcount),
+		   kref_read(&bo->tbo.kref),
+		   bo->origin_comm);
+	seq_puts(m, "\n");
+}
+
+static void vmw_debugfs_print_ttm_list_info(struct seq_file *m,
+					    struct list_head *ttm_list)
+{
+	struct ttm_resource *res;
+	struct ttm_lru_item *lru, *tmp;
+
+	list_for_each_entry_safe(lru, tmp, ttm_list, link) {
+		struct ttm_buffer_object *tbo;
+		struct vmw_bo *bo;
+
+		if (lru->type != TTM_LRU_RESOURCE)
+			continue;
+		res = container_of(lru, struct ttm_resource, lru);
+		tbo = res->bo;
+		bo = container_of(tbo, struct vmw_bo, tbo);
+		vmw_bo_print_info(0, bo, m);
+	}
+}
+
+static int vmw_debugfs_buffer_info_show(struct seq_file *m, void *unused)
+{
+	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct ttm_device *bdev = &vdev->bdev;
+	struct ttm_resource_manager *man;
+	int man_itr, pr_itr;
+
+	seq_puts(m, "LRU buffers -\n");
+	for (man_itr = 0; man_itr < TTM_NUM_MEM_TYPES; man_itr++) {
+		man = ttm_manager_type(&vdev->bdev, man_itr);
+		if (!man)
+			continue;
+		for (pr_itr = 0; pr_itr < TTM_MAX_BO_PRIORITY; pr_itr++) {
+			spin_lock(&bdev->lru_lock);
+			vmw_debugfs_print_ttm_list_info(m, &man->lru[pr_itr]);
+			spin_unlock(&bdev->lru_lock);
+		}
+	}
+	seq_puts(m, "Pinned buffers -\n");
+	spin_lock(&bdev->lru_lock);
+	vmw_debugfs_print_ttm_list_info(m, &bdev->pinned);
+	spin_unlock(&bdev->lru_lock);
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(vmw_debugfs_buffer_info);
+
+#endif
+
+void vmw_debugfs_buffer_init(struct vmw_private *vdev)
+{
+#if defined(CONFIG_DEBUG_FS)
+	struct drm_minor *minor = vdev->drm.primary;
+	struct dentry *root = minor->debugfs_root;
+
+	debugfs_create_file("vmwgfx_buffer_info", 0444, root, vdev,
+			    &vmw_debugfs_buffer_info_fops);
+#endif
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 62b4342d5f7c..3e197a7b8d53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -97,6 +97,8 @@ struct vmw_bo {
 
 	bool is_dumb;
 	struct vmw_surface *dumb_surface;
+
+	char origin_comm[TASK_COMM_LEN];
 };
 
 void vmw_bo_placement_set(struct vmw_bo *bo, u32 domain, u32 busy_domain);
@@ -146,6 +148,12 @@ int vmw_user_bo_lookup(struct drm_file *filp,
 		       u32 handle,
 		       struct vmw_bo **out);
 
+void vmw_debugfs_buffer_init(struct vmw_private *vdev);
+
+#if defined(CONFIG_DEBUG_FS)
+void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m);
+#endif
+
 /**
  * vmw_bo_adjust_prio - Adjust the buffer object eviction priority
  * according to attached resources
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 50ad3105c16e..be7763158a5a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2011-2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -1682,6 +1683,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_fbdev_ttm_setup(&vmw->drm,  0);
 
 	vmw_debugfs_gem_init(vmw);
+	vmw_debugfs_buffer_init(vmw);
 	vmw_debugfs_resource_managers_init(vmw);
 
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index b9857f37ca1a..08cb0cddf5ef 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -254,57 +254,6 @@ int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
 
 #if defined(CONFIG_DEBUG_FS)
 
-static void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m)
-{
-	const char *placement;
-	const char *type;
-
-	switch (bo->tbo.resource->mem_type) {
-	case TTM_PL_SYSTEM:
-		placement = " CPU";
-		break;
-	case VMW_PL_GMR:
-		placement = " GMR";
-		break;
-	case VMW_PL_MOB:
-		placement = " MOB";
-		break;
-	case VMW_PL_SYSTEM:
-		placement = "VCPU";
-		break;
-	case TTM_PL_VRAM:
-		placement = "VRAM";
-		break;
-	default:
-		placement = "None";
-		break;
-	}
-
-	switch (bo->tbo.type) {
-	case ttm_bo_type_device:
-		type = "device";
-		break;
-	case ttm_bo_type_kernel:
-		type = "kernel";
-		break;
-	case ttm_bo_type_sg:
-		type = "sg    ";
-		break;
-	default:
-		type = "none  ";
-		break;
-	}
-
-	seq_printf(m, "\t\t0x%08x: %12zu bytes %s, type = %s",
-		   id, bo->tbo.base.size, placement, type);
-	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d",
-		   bo->tbo.priority,
-		   bo->tbo.pin_count,
-		   kref_read(&bo->tbo.base.refcount),
-		   kref_read(&bo->tbo.kref));
-	seq_puts(m, "\n");
-}
-
 static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
 {
 	struct vmw_private *vdev = (struct vmw_private *)m->private;
-- 
2.34.1

