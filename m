Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA99393CE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A310E292;
	Mon, 22 Jul 2024 18:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cz0U7c54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594C10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:43:27 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b5d3113168so27364146d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721673806; x=1722278606;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSlw2AHTwry2OBzvgYyscA8XuYc9F1NsOVa6CuSK7aw=;
 b=cz0U7c54953Qfnm5jfWENLEoTqcfkIZFadWfMyLL3tuvqEWWIg/sWnLYibQ+6bDL5S
 0fWMZQ7yHJDojuOmRz8gpHsgj8XgkUVaT3/r0mQoToawFh5oSQbxLrU8KuZXtKkoTT4b
 29yV0AM/k5wlds7d/JXL+nChLZKnHtr/u5VcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721673806; x=1722278606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSlw2AHTwry2OBzvgYyscA8XuYc9F1NsOVa6CuSK7aw=;
 b=npYmIdz+fTgbwe8XOBOd9yLEXxYNc4IAAfc2uHdqxUEumAPPvHn7AHUbMhCP6Qs9O1
 YQCj2fU5LQ5c7EJ92sAJE/6iHk5NqeJMdjZOJ0ZPfldnKrdaoFJWVfLtsfj36rreviV0
 haqJzN/G+CkLCNTMLYUJZhB2aUf/PsPnPDYGSUgYmeWrPDZD0Z7616ptxuTEbWEx+DiW
 Oxw5aBUNiv369ThzM8LKpAS5zmpJ15Fua6F6OcxrFD8/irkzeadv/vA7lFfQzgXktDOw
 AN7iC9NrEEWo353PxYXame8oqUMKRooiYL/fagLIGGbbs7+BqsVo3fV3OpGPM0Hknipv
 IeXw==
X-Gm-Message-State: AOJu0Yx3bZGnA6dd/yP4dPwohOZ+7HktxsVMmCTLfsepwKq65NZdw4Hu
 H4fD4cw29dp/gJRhS2OHMlByjqaZ0YWhFJbmEI+NCt/TH3VebJnXAMYPuWHSn+gZi9ax/1grqpK
 xDoB/aTg2dEUu6cenBB/kW3EGEj1yf0E8UQyKCiLofsB+Jf+hGAr2jcI+RpqQwo42+bSRsKdTBZ
 InzgWz6fEu5naKWxSle2jT0tWjFzJzfB7m3DjoMKm9PVV+lK3Nmw==
X-Google-Smtp-Source: AGHT+IFVeq7V/P8oTVR/x2cETSmFZpO+yKYsg/BOPHPPsGdHy2uEVMxL3su71xxukiyhv3h5kR3+9g==
X-Received: by 2002:a05:6214:d0c:b0:6b4:f644:9d87 with SMTP id
 6a1803df08f44-6b981a608d0mr9472226d6.21.1721673806171; 
 Mon, 22 Jul 2024 11:43:26 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acafdb01sm38261466d6.129.2024.07.22.11.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 11:43:25 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v5 4/4] drm/vmwgfx: Add basic support for external buffers
Date: Mon, 22 Jul 2024 14:41:16 -0400
Message-ID: <20240722184313.181318-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722184313.181318-1-zack.rusin@broadcom.com>
References: <20240722184313.181318-1-zack.rusin@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make vmwgfx go through the dma-buf interface to map/unmap imported
buffers. The driver used to try to directly manipulate external
buffers, assuming that everything that was coming to it had to live
in cpu accessible memory. While technically true because what's in the
vms is controlled by us, it's semantically completely broken.

Fix importing of external buffers by forwarding all memory access
requests to the importer.

Tested by the vmw_prime basic_vgem test.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 62 +++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 07185c108218..b9857f37ca1a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
- * Copyright 2021-2023 VMware, Inc.
+ * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -78,6 +79,59 @@ static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw_tt->dma_ttm.num_pages);
 }
 
+static int vmw_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(obj);
+	int ret;
+
+	if (obj->import_attach) {
+		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
+		if (!ret) {
+			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
+				dma_buf_vunmap(obj->import_attach->dmabuf, map);
+				return -EIO;
+			}
+		}
+	} else {
+		ret = ttm_bo_vmap(bo, map);
+	}
+
+	return ret;
+}
+
+static void vmw_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	if (obj->import_attach)
+		dma_buf_vunmap(obj->import_attach->dmabuf, map);
+	else
+		drm_gem_ttm_vunmap(obj, map);
+}
+
+static int vmw_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	int ret;
+
+	if (obj->import_attach) {
+		/*
+		 * Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
+	return drm_gem_ttm_mmap(obj, vma);
+}
+
 static const struct vm_operations_struct vmw_vm_ops = {
 	.pfn_mkwrite = vmw_bo_vm_mkwrite,
 	.page_mkwrite = vmw_bo_vm_mkwrite,
@@ -94,9 +148,9 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
 	.pin = vmw_gem_object_pin,
 	.unpin = vmw_gem_object_unpin,
 	.get_sg_table = vmw_gem_object_get_sg_table,
-	.vmap = drm_gem_ttm_vmap,
-	.vunmap = drm_gem_ttm_vunmap,
-	.mmap = drm_gem_ttm_mmap,
+	.vmap = vmw_gem_vmap,
+	.vunmap = vmw_gem_vunmap,
+	.mmap = vmw_gem_mmap,
 	.vm_ops = &vmw_vm_ops,
 };
 
-- 
2.43.0

