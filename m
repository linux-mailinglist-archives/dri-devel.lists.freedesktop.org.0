Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298C93509E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55A910EA17;
	Thu, 18 Jul 2024 16:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CHHnY9+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5310EA33
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:22:45 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-661369ff30aso9271017b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721319765; x=1721924565;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSlw2AHTwry2OBzvgYyscA8XuYc9F1NsOVa6CuSK7aw=;
 b=CHHnY9+3alDXc0faOKhHUaG5WiGD7ouiBy/ktT6gWYx00tXgAUctPtsHzFMicxYNmK
 VvJ5cpXwJwTvWgvt56G5lZrQU1se0J8bxCqyp8R3FzYggTpjrGdKRQ62LsqFAGfcNU0r
 Ul76jGt9FGQYB1HG3CttDHNL35pXMoTEsxd8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721319765; x=1721924565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSlw2AHTwry2OBzvgYyscA8XuYc9F1NsOVa6CuSK7aw=;
 b=Ze43awz1SPChhc352ZyxDhQvbV2MARuZPCsPFF/xeRFk4qa8GUz04XAaNum5G1TOsR
 4SayBqxp/R3PNM1xBRsGBF8wExcGnbiLD8t1mD9mePDXYiS8i5pplk2muJa8rlAdn+c6
 6TKEn3pAqgUy6+41KrG2VDporsOwzwPsgM1gQFchT876wiPt3iiUz7HA44pfq/J7Y40M
 EiCj+qX8R5gpx4rZhoFMitmSU8fegnBSyrpVeNP40VsDx2c/0l+nei2sGjGn/XJut527
 BSK77eTRvkT7lGN1+pyzH+6uj01VIr/yaRzjL56poxzCNVd7flwdY5niYwyaH+0eOTEq
 OHHw==
X-Gm-Message-State: AOJu0YxDj5GUQjKYnThDAPpCB6k4NGi33qMXmIy8pavM22Zh1XHwkB9y
 FYLzOGvbhwRobTyz6B27/DBUBIGkIIKyvm3+pPlZMhuJ1zEAVona4Fo7sp/O2od83pMcbAjkjK5
 /qAjZlkKnoYRdtGNqZ8D1nRmxIyn+PKYrZ9JCEr4wXkZalKv1SRDmy/VM8fkaLsnhqZs2/XNxQZ
 RPwDo+PSkNYJ8kQ6+myyCC/TRbc1z98cdBjeY1ecun2GD/uUhCZg==
X-Google-Smtp-Source: AGHT+IHpf+WSDTVkHxPcnkwesMozKR0eHD2a9kCwlFqsrUYaRdIHHE5ZkMYVkqlMPFaDG6qOm+BhCg==
X-Received: by 2002:a05:690c:2c93:b0:64b:9f5f:67b2 with SMTP id
 00721157ae682-66603510ff7mr34412107b3.31.1721319764767; 
 Thu, 18 Jul 2024 09:22:44 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1938f8ae8sm39988285a.70.2024.07.18.09.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:22:44 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 4/4] drm/vmwgfx: Add basic support for external buffers
Date: Thu, 18 Jul 2024 12:21:44 -0400
Message-ID: <20240718162239.13085-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718162239.13085-1-zack.rusin@broadcom.com>
References: <20240718162239.13085-1-zack.rusin@broadcom.com>
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

