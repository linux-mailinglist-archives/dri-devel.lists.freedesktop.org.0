Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DFBCCF989
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E68E10EF30;
	Fri, 19 Dec 2025 11:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iETT+zav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7656510EF30;
 Fri, 19 Dec 2025 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144076; x=1797680076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZCRredA+mN0v6G+4rwwpIWo/pWKZ043bOyfQAYzxrM=;
 b=iETT+zavzNp+KnpuHRBLrP0INTf6mJ9jugA+7v5ph8Dyg0hzsMqxr/Gu
 Jjtmo9JOXLItD0QG0yDoEy1bYwsk1i/ztPISRkfWr5c7oEga6CEys6FNz
 n0joyLbMScSWLcwi6lzDhLnt7Rxp307daJjGMffgt8km6ZJOr8eabwgtK
 P9u7iMdqCfadx5LjIh9r+bWEMTzkIy6QlffLY7ikaeJzbmdbvhXCdbk+S
 xKQeRqYsL8LeUKmeRVSsnn/CzAE1yoVmZZ4HRyW6UzT0dUp+GZE8j5Imt
 yimzuir54igQ10Me1o+qi159z+DwHPke3HmEfUAhPnYkczGcJIe4Mxpsm w==;
X-CSE-ConnectionGUID: k/yklLWyTFmAWZFjbfly4g==
X-CSE-MsgGUID: yoUTnZYMRTKDP2b+N+q4sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224523"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:35 -0800
X-CSE-ConnectionGUID: k2Q7gyDgQZmLq1fULyy9hg==
X-CSE-MsgGUID: YS738+u2QR+YjIlPohLvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005658"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 09/24] drm/pagemap: Remove the drm_pagemap_create()
 interface
Date: Fri, 19 Dec 2025 12:33:05 +0100
Message-ID: <20251219113320.183860-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

With the drm_pagemap_init() interface, drm_pagemap_create() is not
used anymore.

v2:
- Slightly more verbose commit message. (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 9b3a061fc6e8..5dd9fd30dc7f 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -686,36 +686,6 @@ int drm_pagemap_init(struct drm_pagemap *dpagemap,
 }
 EXPORT_SYMBOL(drm_pagemap_init);
 
-/**
- * drm_pagemap_create() - Create a struct drm_pagemap.
- * @drm: Pointer to a struct drm_device providing the device-private memory.
- * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
- * @ops: Pointer to the struct drm_pagemap_ops.
- *
- * Allocate and initialize a struct drm_pagemap.
- *
- * Return: A refcounted pointer to a struct drm_pagemap on success.
- * Error pointer on error.
- */
-struct drm_pagemap *
-drm_pagemap_create(struct drm_device *drm,
-		   struct dev_pagemap *pagemap,
-		   const struct drm_pagemap_ops *ops)
-{
-	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
-	int err;
-
-	if (!dpagemap)
-		return ERR_PTR(-ENOMEM);
-
-	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
-	if (err)
-		return ERR_PTR(err);
-
-	return dpagemap;
-}
-EXPORT_SYMBOL(drm_pagemap_create);
-
 /**
  * drm_pagemap_put() - Put a struct drm_pagemap reference
  * @dpagemap: Pointer to a struct drm_pagemap object.
-- 
2.51.1

