Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FACCCB6B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9316710EA2D;
	Thu, 18 Dec 2025 16:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgrZO7QD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E42310EA2D;
 Thu, 18 Dec 2025 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074901; x=1797610901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bs9mXk0rtwNWDuNi68h10uGmvhrB6TZgN6t4JDFdmV4=;
 b=BgrZO7QDKK7qnLI6RCC1nnXYOBOKmgXfuJq2gLVInsBiTq2HVXYcrhGa
 54020FVFY0FmRN6KkPqKNSaLr+ztRo3I8MrFGmoql16sG99i37GMSK/EJ
 ypiA8BGt/kpSf849SixA8YmiGmFTn8zDdiVmqTtvzTFVPsOj6kWwJRYX6
 linkMY8HmyPaWFzqY9GbnkMBq7J0MEku9QvT56ChTbQ2EKJ5cFDR/+Q1z
 gvLtEYGuHwHv0ZSredifo32BIVVgHQM7WtAf4aOq2owY0lzgooz5Sh0Pn
 GmVPqq8mJ+HL6tC29PAQOKWQYLVyoC80Tpwb6RHXwkFFuiFS6DK38EiNo A==;
X-CSE-ConnectionGUID: R8fk6mjZSbGydQ8dZmWrew==
X-CSE-MsgGUID: INZm3VwyQtmcCe6bzq29Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607551"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:21:40 -0800
X-CSE-ConnectionGUID: v1vh1Xs7QgCEgjGSeM+KCw==
X-CSE-MsgGUID: HlQ5krzdQte3ZyCTLg6oYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705543"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:21:37 -0800
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
Subject: [PATCH v5 02/24] drm/pagemap: Remove some dead code
Date: Thu, 18 Dec 2025 17:20:39 +0100
Message-ID: <20251218162101.605379-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

