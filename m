Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38287C4F167
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BFF10E616;
	Tue, 11 Nov 2025 16:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axofQLN+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937AD10E11C;
 Tue, 11 Nov 2025 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879483; x=1794415483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iRO9eYVSDzq9uEgYGxM59AZtuc8lrGG4W1ib7p4S/RE=;
 b=axofQLN+SCoGbwGU88cWb0htJquuy94qepBKaDANRVGsjUGmAsehEMEd
 qFuuHFPhaNvW3NyY32ncEzc0uOEE6/0WL78zFs0kz6j7JFaCvDG1ivR9S
 mMvPD5L4yVpT+rRz8yTctHlpRhiVKzeUjOjctyIqV1fWAjAE3rN7QhRzT
 H9aV+xJQzn+Ooahk/6fx9TT/gCBTW7T3JuuEKksK4n/RsX9DTSk5HBY/3
 KSjnP1RWzaJfbKyKGtsZpgDf1/LZMa/TpTgIvdCn7rku2p83C/i2nYEOL
 dfuAITzVg+WstEBPd1yLCJQIgO0UoEz4thD71yxtkOZK7i4zND9uNnNSP w==;
X-CSE-ConnectionGUID: Grw1N2mVQGWXoSz9IOdg2g==
X-CSE-MsgGUID: Q0Fm1oPkROWyMIwtRWGj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244633"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:42 -0800
X-CSE-ConnectionGUID: OBteevwRR6u/dyXj5xYd/A==
X-CSE-MsgGUID: wEprcx4uSjSKGH3B7DRKHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646761"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:39 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 03/17] drm/pagemap: Add a refcounted drm_pagemap
 backpointer to struct drm_pagemap_zdd
Date: Tue, 11 Nov 2025 17:43:53 +0100
Message-ID: <20251111164408.113070-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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
index 4b8692f0b2a2..173b3ecb07d5 100644
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

