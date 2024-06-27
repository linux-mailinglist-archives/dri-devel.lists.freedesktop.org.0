Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D34919EBB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 07:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A912910EA13;
	Thu, 27 Jun 2024 05:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EjdnO981";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422DA10E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:35:00 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-80d68861bf9so2032034241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719466499; x=1720071299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESy+lGrdWjrR7OFRT/EOjwnttSGup7Gl7GEsiGzd194=;
 b=EjdnO981PyZzgQSsNYlO/YI5weLyWalKi4z4aYIXCv/bfRi2tpu/4rmczUjNla/Ez6
 yLp6mhYJxL5IOAHDG9aZm1inKPchXBP89bPgqwiIBZbEB2fjLWgsOEgSD9tkSNWCuLat
 cJs1S199OJXthufFDKdvNYfOWxDmjxl5dGC1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719466499; x=1720071299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESy+lGrdWjrR7OFRT/EOjwnttSGup7Gl7GEsiGzd194=;
 b=sTxdG8DJXsReJc/1dVIlFhAfg58QcQ9oGiDy4FuJK10gE5erT7CWRT+bors11o0H1s
 R5pDdrLuhCZDJuWTSM2/a6DgIjgBArDZojxXkSViYrMlaY2rFLOCC1oW6YBlzQPgPrq7
 uM6Rvfj17wNlORJ3o10gB32kkWP5jvGHCGtK+/ZdrXxrP4eOlBolBkL5IJsY1YVk5Cxg
 yNBRxfyeMXTuw5LVu1llG3aF6kzJx4+2wjOuROz20CUebPzXdzImrGhCOslmgID4h/HK
 B8O1FIAusRUaaHhlNyL+12QSSUkEbwDv+Yb0nGelE5xtUepYu4ykztvGHkOgcKC+Hndo
 OkqQ==
X-Gm-Message-State: AOJu0YzwDdcoaI/JcvIrX+R9a9vs8KyqvScwLAPP849OmyZOP6ryXYYW
 XNJPY82FEfUnOWIhGS2nwgye749xbLktAtw+aoGv85r+uOXfDBYVWBQ4yCX+p9diLOcyejiXWoa
 ESt1p5denCZs1t3GfyZEDEOPyBVnIvxQ6PTihLV3OjWt3qJonvApfwNj5h3tGql/fq86j73nVzF
 iv/ZBptL/lVk8J4jnstY+azI2LT54nfdyWdjy7aoPUGQgXB7xd4nOX
X-Google-Smtp-Source: AGHT+IGiZR64EaupFysalPUIPoUqVOXUyU7Xg79S6pOt8pdcPZ8BumZRWAJfyS6vEEDZsTXESG4cHQ==
X-Received: by 2002:a05:6122:45a9:b0:4ef:530b:9d56 with SMTP id
 71dfb90a1353d-4ef6d80805emr12258619e0c.6.1719466498733; 
 Wed, 26 Jun 2024 22:34:58 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44641eebfa0sm2716971cf.48.2024.06.26.22.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 22:34:58 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 4/4] drm/vmwgfx: Add basic support for external buffers
Date: Thu, 27 Jun 2024 01:34:52 -0400
Message-Id: <20240627053452.2908605-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627053452.2908605-1-zack.rusin@broadcom.com>
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
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
2.40.1

