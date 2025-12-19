Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE1CCF962
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4410EF20;
	Fri, 19 Dec 2025 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByJfEGly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C77210EF20;
 Fri, 19 Dec 2025 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144048; x=1797680048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXEK69drRSBtpGpjYQ9EakW+nzZjmLR8nYKgaQerjYc=;
 b=ByJfEGlys8PTVQRHdhYhQZZcQV5AUmp9WRdDGmozgGCxtLAhz29DLX7Z
 mRryAG/BClm5H2YfUi4Vwh7VxyzmJzb9M0s4dZPPtIOx4IHhRg21CYIly
 3FY8Zsyw1IguKqiX2HiV0N6BLu3yVBbVDtzlV17/Wcp51GtTaDJ9/zIyk
 GYVxBQXqqHVlVR71tfB2QPF2XvH4phji3UTB+m7gLCwmqSPa7ME67LmzV
 9hqlx+MlHk1DW0U575Y6kd29hr45EQG8cv/ndpFsJFwpV5BdveuQhOva7
 Jp+Kgnag+AWEctvU82+1ZmRRfCjbsnb//RTu1XikmI3XeBr61hH7NjgnA A==;
X-CSE-ConnectionGUID: USSr6ecNRvK1wMRtLMVZ0g==
X-CSE-MsgGUID: pClvYCfISCeliF3b+DrxKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224469"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:08 -0800
X-CSE-ConnectionGUID: DvoqQFCgSRWdPGB6NF14Dw==
X-CSE-MsgGUID: DszuCLvTRsKo7SFtZxj7XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005582"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 02/24] drm/pagemap: Remove some dead code
Date: Fri, 19 Dec 2025 12:32:58 +0100
Message-ID: <20251219113320.183860-3-thomas.hellstrom@linux.intel.com>
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

The page pointer can't be NULL.

v5:
- New patch. (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 37d7cfbbb3e8..4cf8f54e5a27 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -702,19 +702,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (!migrate.cpages)
 		goto err_free;
 
-	if (!page) {
-		for (i = 0; i < npages; ++i) {
-			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
-				continue;
-
-			page = migrate_pfn_to_page(migrate.src[i]);
-			break;
-		}
-
-		if (!page)
-			goto err_finalize;
-	}
-	zdd = page->zone_device_data;
 	ops = zdd->devmem_allocation->ops;
 	dev = zdd->devmem_allocation->dev;
 
-- 
2.51.1

