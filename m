Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A216CB6984
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360E10E870;
	Thu, 11 Dec 2025 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzK1PvJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6010E84E;
 Thu, 11 Dec 2025 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472407; x=1797008407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cjcYus7KvxZsNwxGLc8EFsNjaSC86wT5WN15fWFRqKU=;
 b=UzK1PvJsWtHKUB9JCWVhyUnso5RYaUGHH7ysQ0yZRQFHmdX0yzYRnePH
 IqPzuRsN3Qeop5L/x5GtoHUGJHFw53nanayr2vtgcXu63rwCEnHS+UFZC
 sVJrEjSTonGd17tdYeJmOb6Z6xNJPkF0pcY+WBTmTU/wvwRA0Bij3rm+8
 oVNDe06Rp1gUfvjaZoKiBTykj6GzaVNAUjuKUdYqCRwcZ9ZWjNl4FfvPn
 r21iuw/OQw86rilJ9Y3a/2qmYSy4S0syShR+cuUJDTsIPoIMtTZSaB4rJ
 5v4Ru/b21IqOWns9SUuvh20HZUr0B309hmP/pzrriu+7zC79Ilf10fEU7 Q==;
X-CSE-ConnectionGUID: 4KXZsqEFSU+OtgAkpbCDpw==
X-CSE-MsgGUID: v8pbXLnQQHukCmqovYTAcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083068"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:07 -0800
X-CSE-ConnectionGUID: gOsn8ezzS6yfYYHAsaO9Xw==
X-CSE-MsgGUID: UoIesyuHT6eothL2Buj3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849571"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 08/22] drm/pagemap: Remove the drm_pagemap_create()
 interface
Date: Thu, 11 Dec 2025 17:58:55 +0100
Message-ID: <20251211165909.219710-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
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
index 8aa024b1c809..5b4337011924 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -682,36 +682,6 @@ int drm_pagemap_init(struct drm_pagemap *dpagemap,
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

