Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12AEC08FDB
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3B10E26E;
	Sat, 25 Oct 2025 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmF3t1ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8E10E26E;
 Sat, 25 Oct 2025 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393894; x=1792929894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPY49lviVXC5EjpC4e5wsgtHmxtwwnkqcNbcOMeO9G8=;
 b=dmF3t1ngH7wRUgWfoTjhoMBzi/S6gpakR5lxiFh4flQ8qmWfUxwjJOvO
 YBA7gukE+xqCKKTLpH2LsFyi+VyWtAB39YkJ3+EWsIGhmUpvNcouBc9k1
 J9v/EM7ywkruxBKQWg/cHVGneQhG1BHomvQlw1uBbrVmPicyyswbon2mV
 36EgFQEFcarxspiDrnDcg4ayvglNEXc3j9+QOkBXJoRR0z9rONlRjgtQH
 HZ+mDsg8AyvcGV3BJeQviF+cQwsPj7DL1sG/CmR1fA9YByF4Lfsdiujuv
 Vb13y6RAFNaImSe33M3K/7TS4eI8qBJ6o0QqkKTD4/lDRWNTPiyErE3U2 w==;
X-CSE-ConnectionGUID: Jr5NdPpSSsil4O8d/08Tjg==
X-CSE-MsgGUID: 0NucTygbQJ+l51fwmnqdpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590379"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:54 -0700
X-CSE-ConnectionGUID: KhonGPxjR2KoeqSuvjlL6g==
X-CSE-MsgGUID: dWP5Iy1lQTyeoINuosqQMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023720"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 06/15] drm/pagemap: Remove the drm_pagemap_create() interface
Date: Sat, 25 Oct 2025 14:04:03 +0200
Message-ID: <20251025120412.12262-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

It is not used anymore.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 5ca5b2b53bc1..5a40f67201da 100644
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
2.51.0

