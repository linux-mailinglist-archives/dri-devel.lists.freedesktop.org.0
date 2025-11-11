Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2DC4F173
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E613910E614;
	Tue, 11 Nov 2025 16:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC9jm8dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0C10E617;
 Tue, 11 Nov 2025 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879495; x=1794415495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtFEkXwvz2z3GsN35+e3BLExSiOXH+7Asc7KHdJbxFE=;
 b=EC9jm8dtCMcW55ph8dSkK1MZKM33j0lcBEbxJGjjze1erjpz+N0BlogY
 wlVLnK27mZ8lWtOMWx/ipotr1ynyMjWT/X9Kndn8ltldVR2HAhDY+ujcB
 G50lI4z/vSizsNWI3QVYM/DMK2f7yuGRFNMIRF/Ks++vvmFuQaA2mSf1i
 ViIhUg25LbnkJxuXGxDozV2BfxSW5WDH6SvMd2s13hO+QPlDV7/ARr7a3
 wgpd4fvpet5vO+LDfi/EGGBO4e1kyZvW2e/6OH5V482P26f+TNg2JXHm3
 3G8V2cH1LAMM4bge3tduCiyUGYnjmnFSpPDeb0bCAh7ZfcBGb5c7opbtD w==;
X-CSE-ConnectionGUID: XaC2zqkFRjOu8i8x95Av/w==
X-CSE-MsgGUID: plJwFeB4QIKvRCkAbfkzMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244688"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244688"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:55 -0800
X-CSE-ConnectionGUID: 2k5IycXlTP6q/ngEpAzEvg==
X-CSE-MsgGUID: cl+pn+KQSfGPYt4Qwo0EAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646832"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:51 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 07/17] drm/pagemap: Remove the drm_pagemap_create()
 interface
Date: Tue, 11 Nov 2025 17:43:57 +0100
Message-ID: <20251111164408.113070-8-thomas.hellstrom@linux.intel.com>
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
index 50d3963ddbbc..1477a2057a15 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -681,36 +681,6 @@ int drm_pagemap_init(struct drm_pagemap *dpagemap,
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

