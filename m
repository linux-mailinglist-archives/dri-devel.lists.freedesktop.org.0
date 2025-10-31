Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD0C25E4C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D2C10E2E5;
	Fri, 31 Oct 2025 15:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jiQJ2j6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391210EB5C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761925710;
 bh=AiWcLiRGPn6MaK8QL+I10OHS1q/v3IGkm6UgWu8RDS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jiQJ2j6RaUwi3tNOMU4ymXw4aTzfgeVLZPaqSdcEZcFFs90m+zcjjDHiyS2//Mne0
 WfRnBd1nE3fm6GOMMEP4C35z/PNEBfGcP5iMrG/ro7EBNrckAPoF8AIpQin5r0ExBp
 T239PZM+a/vUpBnamPVa0CxMvI2nMo8vghG/8d0fW/UeogqmDcaIWnt+pjatO0EK+V
 PX2rQHPVARM3dtbxu7A8U1s765BzE5HXoRsboZGZpPuhEuPyUcGVTjcG+XP9IlFA8U
 SH600U6EoiSMMCQARINcjrEuLfOFJRTiWLDI49/w168VmdFvI5Ooiy6PgeQVHRJOua
 BlskK54WRc3xw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E5EC17E1402;
 Fri, 31 Oct 2025 16:48:30 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 1/4] drm/panthor: Fix UAF on kernel BO VA nodes
Date: Fri, 31 Oct 2025 16:48:15 +0100
Message-ID: <20251031154818.821054-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031154818.821054-1-boris.brezillon@collabora.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the MMU is down, panthor_vm_unmap_range() might return an error.
We expect the page table to be updated still, and if the MMU is blocked,
the rest of the GPU should be blocked too, so no risk of accessing
physical memory returned to the system (which the current code doesn't
cover for anyway).

Proceed with the rest of the cleanup instead of bailing out and leaving
the va_node inserted in the drm_mm, which leads to UAF when other
adjacent nodes are removed from the drm_mm tree.

Reported-by: Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/issues/57
Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 7e7d2f223cfa..f369cc3e2a5f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -87,7 +87,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
 	struct panthor_vm *vm;
-	int ret;
 
 	if (IS_ERR_OR_NULL(bo))
 		return;
@@ -95,18 +94,11 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 	vm = bo->vm;
 	panthor_kernel_bo_vunmap(bo);
 
-	if (drm_WARN_ON(bo->obj->dev,
-			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
-		goto out_free_bo;
-
-	ret = panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
-	if (ret)
-		goto out_free_bo;
-
+	drm_WARN_ON(bo->obj->dev,
+		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
+	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
 	panthor_vm_free_va(vm, &bo->va_node);
 	drm_gem_object_put(bo->obj);
-
-out_free_bo:
 	panthor_vm_put(vm);
 	kfree(bo);
 }
-- 
2.51.0

