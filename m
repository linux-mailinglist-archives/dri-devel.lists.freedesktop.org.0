Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACEA5E613
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674110E7BE;
	Wed, 12 Mar 2025 21:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFcKNjro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8370910E7BA;
 Wed, 12 Mar 2025 21:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813514; x=1773349514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6Jqkcd7JO7jsVFnJfwMKDJgKSh70pSmMQMs65H4+GY=;
 b=cFcKNjrouu2g4Ny/rZd9O4q3mOD5+vK8yCf6CgHnF4kf22HCnXkHNKfB
 wWUHuT02pXnsPmXjPh0lW2GtVjTMbvDTbUxYLg35ELw8BfnqqDlGDNh1z
 Owrr0IjlLBiY3O2YsUy9P2q0UOTgLKKpdSwnQKccdgWYnUFHODN0qk927
 cyJUqWW3F9yW9c7/qW5b1edQsS2G7t5Fv9zdL9qfqR5hHyYtR6RtopCn5
 60NsMejvX7RUXiBAafRXxaCrpGRRxMQTf4S/3DCAdZs/RlDavrBSK4yXN
 vX3obfDzPs45CvdThhAmam+FqkABRyLiBwLtazMTW7LU6SFBHXj2R3I09 w==;
X-CSE-ConnectionGUID: 8wfU3FX8RVK9ugUluwByQw==
X-CSE-MsgGUID: 6e/EwF/IRLurXRoamJeidg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562178"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:14 -0700
X-CSE-ConnectionGUID: 9FFMdKkOQNmnoq1pKRBFyw==
X-CSE-MsgGUID: lJEaqiefRkKiB1sbuaowRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791107"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 07/19] drm/pagemap: Get rid of the struct
 drm_pagemap_zdd::device_private_page_owner field
Date: Wed, 12 Mar 2025 22:04:04 +0100
Message-ID: <20250312210416.3120-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Now that there is always a valid page pointer, we can deduce the owner
from the page.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 8a0bdf38fc65..d1efcd78a023 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -62,7 +62,6 @@
  * @refcount: Reference count for the zdd
  * @devmem_allocation: device memory allocation
  * @dpagemap: Pointer to the struct drm_pagemap.
- * @device_private_page_owner: Device private pages owner
  *
  * This structure serves as a generic wrapper installed in
  * page->zone_device_data. It provides infrastructure for looking up a device
@@ -75,13 +74,11 @@ struct drm_pagemap_zdd {
 	struct kref refcount;
 	struct drm_pagemap_devmem *devmem_allocation;
 	struct drm_pagemap *dpagemap;
-	void *device_private_page_owner;
 };
 
 /**
  * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
  * @dpagemap: Pointer to the struct drm_pagemap.
- * @device_private_page_owner: Device private pages owner
  *
  * This function allocates and initializes a new zdd structure. It sets up the
  * reference count and initializes the destroy work.
@@ -89,7 +86,7 @@ struct drm_pagemap_zdd {
  * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
  */
 static struct drm_pagemap_zdd *
-drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
+drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap)
 {
 	struct drm_pagemap_zdd *zdd;
 
@@ -99,7 +96,6 @@ drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_ow
 
 	kref_init(&zdd->refcount);
 	zdd->devmem_allocation = NULL;
-	zdd->device_private_page_owner = device_private_page_owner;
 	zdd->dpagemap = dpagemap;
 
 	return zdd;
@@ -344,7 +340,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap);
 	if (!zdd) {
 		err = -ENOMEM;
 		goto err_free;
@@ -628,8 +624,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
 /**
  * __drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM (internal)
  * @vas: Pointer to the VM area structure
- * @device_private_page_owner: Device private pages owner
- * @page: Pointer to the page for fault handling (can be NULL)
+ * @page: Pointer to the page for fault handling.
  * @fault_addr: Fault address
  * @size: Size of migration
  *
@@ -641,14 +636,13 @@ EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
  * 0 on success, negative error code on failure.
  */
 static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
-					void *device_private_page_owner,
 					struct page *page,
 					unsigned long fault_addr,
 					unsigned long size)
 {
 	struct migrate_vma migrate = {
 		.vma		= vas,
-		.pgmap_owner	= device_private_page_owner,
+		.pgmap_owner	= page->pgmap->owner,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
@@ -774,7 +768,6 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 	int err;
 
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
-					   zdd->device_private_page_owner,
 					   vmf->page, vmf->address,
 					   zdd->devmem_allocation->size);
 
-- 
2.48.1

