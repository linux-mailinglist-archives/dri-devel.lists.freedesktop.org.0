Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C5CB2C40
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7510E6EC;
	Wed, 10 Dec 2025 11:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4Pla5nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AF010E6D9;
 Wed, 10 Dec 2025 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364910; x=1796900910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YUBMSdYT9fqbROZVnWsUT0LTaEYYeCIQYFFobd5BGAM=;
 b=j4Pla5nNb9i/hLwWLfSDKg8LtBA+Yauksihc57AbecJT4NyXBc/o4uG4
 bKMMWUj7R7h898RZUPyC+Ocg2xoDn4esQ27R9ZFRyQUtFEvzXAvif2VWO
 kehbxfigYKAfNJ851DxBtszqURwoOWqnPmcT3j/hE4OWr+CSyAUdEtutk
 iAQGw1pi7NueL8ly68VHGry1Y7bs7t+2CPG5wr/bejx8HF/VyUcJoCfjP
 vuSc2Jgt2ngmf33bISDbKP0oBkP9/hvJZiyrDr31v8ojI0pJv9CVNlgch
 9C5tNsBUNSPiWU+os0VwyiufpqV2SXBYjTXJQ/mYeIRn7NZOWaCw6XQ7o w==;
X-CSE-ConnectionGUID: 62t90HTkScW3Glqgw+8wdQ==
X-CSE-MsgGUID: b6f6KpYSTw6jLtIw7I7rUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221759"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:30 -0800
X-CSE-ConnectionGUID: dA9T+PPEQYij0W80e1/+4w==
X-CSE-MsgGUID: uwoBtsLkQcil/E8St0e2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196486972"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:27 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 04/22] drm/pagemap: Add a refcounted drm_pagemap
 backpointer to struct drm_pagemap_zdd
Date: Wed, 10 Dec 2025 12:07:24 +0100
Message-ID: <20251210110742.107575-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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

To be able to keep track of drm_pagemap usage, add a refcounted
backpointer to struct drm_pagemap_zdd. This will keep the drm_pagemap
reference count from dropping to zero as long as there are drm_pagemap
pages present in a CPU address space.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index e82a38df72a6..21b9d3225160 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -62,6 +62,7 @@
  *
  * @refcount: Reference count for the zdd
  * @devmem_allocation: device memory allocation
+ * @dpagemap: Refcounted pointer to the underlying struct drm_pagemap.
  * @device_private_page_owner: Device private pages owner
  *
  * This structure serves as a generic wrapper installed in
@@ -74,11 +75,13 @@
 struct drm_pagemap_zdd {
 	struct kref refcount;
 	struct drm_pagemap_devmem *devmem_allocation;
+	struct drm_pagemap *dpagemap;
 	void *device_private_page_owner;
 };
 
 /**
  * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
+ * @dpagemap: Pointer to the underlying struct drm_pagemap.
  * @device_private_page_owner: Device private pages owner
  *
  * This function allocates and initializes a new zdd structure. It sets up the
@@ -87,7 +90,7 @@ struct drm_pagemap_zdd {
  * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
  */
 static struct drm_pagemap_zdd *
-drm_pagemap_zdd_alloc(void *device_private_page_owner)
+drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
 {
 	struct drm_pagemap_zdd *zdd;
 
@@ -98,6 +101,7 @@ drm_pagemap_zdd_alloc(void *device_private_page_owner)
 	kref_init(&zdd->refcount);
 	zdd->devmem_allocation = NULL;
 	zdd->device_private_page_owner = device_private_page_owner;
+	zdd->dpagemap = drm_pagemap_get(dpagemap);
 
 	return zdd;
 }
@@ -127,6 +131,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
 	struct drm_pagemap_zdd *zdd =
 		container_of(ref, struct drm_pagemap_zdd, refcount);
 	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
+	struct drm_pagemap *dpagemap = zdd->dpagemap;
 
 	if (devmem) {
 		complete_all(&devmem->detached);
@@ -134,6 +139,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
 			devmem->ops->devmem_release(devmem);
 	}
 	kfree(zdd);
+	drm_pagemap_put(dpagemap);
 }
 
 /**
@@ -366,7 +372,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
 	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
-	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
+	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
 	if (!zdd) {
 		err = -ENOMEM;
 		goto err_free;
-- 
2.51.1

