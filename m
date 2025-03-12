Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BBA5E60B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BDC10E7A9;
	Wed, 12 Mar 2025 21:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZ0F9bqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBCF10E7A9;
 Wed, 12 Mar 2025 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813497; x=1773349497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyD9AP1tNEBR9EtZyXgTn9w2JTabbGJ6HBZQblevDw8=;
 b=lZ0F9bqD2+1i29x0ozg3FCRThxFERMi6B3uPgRSChFXPnq4CrDqoQ/Rk
 zujGemXse3xYMM0EtFALxg9mWG+xK+zep5caLxHRIXjCa5nPax1+3mSsk
 Hb2+3B5JcvnNALGqnfAprCWZ3kVsnF35ezuC599suLQcQEROK2kBeolxa
 F33Qr+VH8uBYAoKpiTg0BFhz+tdwy0q2Nj2X0pXRWP1528DNPXbR2c6O/
 BsT80Zoc4HZq028WJZuKT0ogyXN7dJhtBwRoV8/zFsrFtiv4Gi+rHP1iG
 49pWFfsxNjM5fWqzACO6tiO/Xx4R0bvdDm/X8+QhNPkuftZrQIq86UtLM g==;
X-CSE-ConnectionGUID: g7xeuJSgSbCsG8EC+AHDAw==
X-CSE-MsgGUID: ThFgsfcaTB25eHor+C+MTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562125"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:56 -0700
X-CSE-ConnectionGUID: VT4MA3OIS3eh8ITamcBxhQ==
X-CSE-MsgGUID: ssyW5HIZRNmvqgAUhyX3Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791046"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:53 -0700
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
Subject: [RFC PATCH 02/19] drm/xe/svm: Fix a potential bo UAF
Date: Wed, 12 Mar 2025 22:03:59 +0100
Message-ID: <20250312210416.3120-3-thomas.hellstrom@linux.intel.com>
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

If drm_gpusvm_migrate_to_devmem() succeeds, if a cpu access happens to the
range the bo may be freed before xe_bo_unlock(), causing a UAF.

Since the reference is transferred, use xe_svm_devmem_release() to
release the reference on drm_gpusvm_migrate_to_devmem() failure,
and hold a local reference to protect the UAF.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c305d4c351d7..1a8e17a0005d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -701,11 +701,14 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	list_for_each_entry(block, blocks, link)
 		block->private = vr;
 
+	xe_bo_get(bo);
 	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
 					   &bo->devmem_allocation, ctx);
-	xe_bo_unlock(bo);
 	if (err)
-		xe_bo_put(bo);	/* Creation ref */
+		xe_svm_devmem_release(&bo->devmem_allocation);
+
+	xe_bo_unlock(bo);
+	xe_bo_put(bo);
 
 unlock:
 	mmap_read_unlock(mm);
-- 
2.48.1

