Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57891ECEA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 04:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC45F10E11D;
	Tue,  2 Jul 2024 02:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QzP7Nmyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0C710E159
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 02:13:00 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b4fec3a1a7so17855486d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 19:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719886379; x=1720491179;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQiqDF0J1z0WTh0NzGT4GaxFsZ9u57+e20bKcmoterU=;
 b=QzP7Nmyn/ZSOylUqxhbZ6K/sBMOm6la+QSHrLxfj9g7NZ8UH3/TbCdzRW/JTXGcwo3
 1HOTiwefQ4scldIHLiXkSrNYYXfnuFQohUTMYtuhkCqXYjaSEZvqi54MfGeZJflu5wCQ
 vgvCBbeQEBfOtMMBRjw00RiJszq57p/8QDxvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719886379; x=1720491179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQiqDF0J1z0WTh0NzGT4GaxFsZ9u57+e20bKcmoterU=;
 b=RwRDiUcJ0IVOw8AE0tGkFFDRQFRW46uDZpysc6nBum4lqZ2f7AzvoWldPRpF6CEYQn
 b2Van5OsTvW09HOfXHKL4rO1wrWm4DxOwkSTd4W2KtjnT+05yhRMZyEGttoy3LGQ47bb
 7Z3xlEFjI2/8/ktXvDGverjk770D4JqaHjWkyDoESkFFhuWam+Oyl6jwKfQMi8FmeYq1
 lyf1zBfZ54vQU5WXPKEsXpU1ej6fxjgvlyDNQc0mUrn5gPTJP0gjKVZat251VVsAjsU6
 ppCG+kpiHMzcR5XGKNdAQ916+2AlIbEZ6KdR8TcSzrtqOSvIavL22qMhJ0/HMlG/pLSg
 S6Jw==
X-Gm-Message-State: AOJu0Yz/Ds48mY6VuLpIGnYzqHez+gRVysY7W62JllCorGUThg1ofOym
 cDH8lHOC4RCWywPkBAalsZc19UtYZSRITfJ3vOJY69Vk4xG7azt0z6bYBvSErHCxh833eEKTE2J
 33/SLIi7ciZ6i9J6rp8l0ZxOtjS3nnPmPnq7IsKAlJvG/3/iQ3MJR/j6nbBRNcKUcgBMTMYdmAC
 BNiUKP3TYkzAzWsDt06U3cjenxH7DXankSKNcTYnwHOJq4mt3t8SaD
X-Google-Smtp-Source: AGHT+IEo3yKtV9oE+5rtYCpx3lMoyvwXwxCaUcqt8cZaxFpSKn/lUkhqs9Oj99+ldDkx5RIfwfyVAQ==
X-Received: by 2002:ad4:5e8e:0:b0:6b5:4be5:e4be with SMTP id
 6a1803df08f44-6b5b719d2b0mr90842856d6.42.1719886379201; 
 Mon, 01 Jul 2024 19:12:59 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5bcf1acc0sm21799366d6.44.2024.07.01.19.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 19:12:59 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 4/4] drm/vmwgfx: Add basic support for external buffers
Date: Mon,  1 Jul 2024 22:11:31 -0400
Message-ID: <20240702021254.1610188-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702021254.1610188-1-zack.rusin@broadcom.com>
References: <20240702021254.1610188-1-zack.rusin@broadcom.com>
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
index 07185c108218..07567d9519ec 100644
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
+	if (obj->import_attach) {
+		dma_buf_vunmap(obj->import_attach->dmabuf, map);
+	} else {
+		drm_gem_ttm_vunmap(obj, map);
+	}
+}
+
+static int vmw_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	int ret;
+
+	if (obj->import_attach) {
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+                * vm_ops pointing to our implementation if the dma-buf backend
+                * doesn't set those fields.
+                */
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

