Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AF91C709
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF69710E0AE;
	Fri, 28 Jun 2024 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aOhYfdSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BE010ED40
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:07:36 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3d565deea08so558049b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719605256; x=1720210056;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESy+lGrdWjrR7OFRT/EOjwnttSGup7Gl7GEsiGzd194=;
 b=aOhYfdSGvF+8mieCS+d775JA8am4CS6UWbsE1J96omXDpzFivNmN0mJgkBCdSjMcWB
 GrGZguRYc/w1UxM0RzOiSz9PimVSlO2QfXbe8nyuAjdvFi+x9pv2oljAWxaaUSlMSoOX
 692NeJAi23Nu9apOUv0dq5TrMpQU7IOG933Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719605256; x=1720210056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESy+lGrdWjrR7OFRT/EOjwnttSGup7Gl7GEsiGzd194=;
 b=ForekxU2XsJYoL/2oMHXwbjiauQsr+pjHC04MqVJAwW7hIC3bIZzCCCcW50zde1zHI
 O1/RB4YrEUbLc0urtaimy5IwrtimuxCSajGExdoJNkyM/LFm6z7N5EGcSbpCACxhKBIR
 zHyJazXW8d5BydSyC5qJEfAOBk7B388O7/cR0VGuJJD0AG1kUxQldGol7rsMElYXTH9z
 ieHKEi5rGs4cKgoezC+7VG1cvzN091SlN0Ggl9T4XaIcSVBd54rOX1A3Yhszer7P17C8
 GCJSX9Jy5CjIqSX4R2KnNIq6GaNkRU7oPIDfT6Zd4JwNqNIMKXalFXPn/tQ1SW9EYzNe
 pA5A==
X-Gm-Message-State: AOJu0YxwVV+sh3Xr3+kGS6zBx/Pz5uqoOQFsrgqieEW9O6FEUpNtTkCL
 V5LQgEEfqSSDC0hNj7eBBebkQ3T+lYOB5/a+ZHwyt3UF/HwQeDDAosxnTvvSInHoxtqhLdaoPxC
 8JHWv9mMSJT+XA45bhufLlsg8Ovw/4McTYtBbvhv996eReY1eaUZ5UU3cbFHQRLrKG+LDz/ozrN
 yLjRSb3bC8/z+Ilt2aYvBudXK5skM30vCMETDormfe6HXV2F9V0/i4
X-Google-Smtp-Source: AGHT+IFCaaI+sakr+/B2GFUAzB0n4uIrynht4H2h/M4rqRO+kmZJibQyB43y7xDRTuP7jFIP7Sy8+g==
X-Received: by 2002:a05:6808:bc9:b0:3d2:1f3f:a3fd with SMTP id
 5614622812f47-3d545a52d48mr22357567b6e.40.1719605255643; 
 Fri, 28 Jun 2024 13:07:35 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465140bf35sm9972351cf.37.2024.06.28.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:07:35 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 4/4] drm/vmwgfx: Add basic support for external buffers
Date: Fri, 28 Jun 2024 16:07:29 -0400
Message-Id: <20240628200729.754669-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628200729.754669-1-zack.rusin@broadcom.com>
References: <20240628200729.754669-1-zack.rusin@broadcom.com>
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

