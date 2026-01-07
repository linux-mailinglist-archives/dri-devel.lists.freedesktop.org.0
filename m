Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B6CFF714
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD110E64B;
	Wed,  7 Jan 2026 18:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dq63Hz+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C83110E1E9;
 Wed,  7 Jan 2026 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810442; x=1799346442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VDMvbRpkPPR4cGwb597+R71XEeJ8dRm6osY1tYEjn8U=;
 b=dq63Hz+sFaM2IWxe5VLWcENheY/1LCxJhAlX1+0+S8YV62er9LRhcLLI
 8gdlK2Ip7p1uG5LlA3kOrleKbswIwL+KnIGeF3BC96qNvAfyRpsqIjVTT
 lU5v0rnog8Z+rDfIpiPDGL7sPhD1ia7tTUzOb6jAu+cIEuoYv+H4XSwPu
 K0sW3dpqDixptL4q78r2fvTpe7qhN2seRmrt0i8nkpiwtLS/m8jf8jsav
 Q04VDx4gJ/ksMoEFh0Gr9CanvQhl01flCjVi/YDfcWcqrYiwFY6gBom7b
 opPqA4OAcT8IHf+wIihawuvZTy6Nl5rTDtmuam+Gnhk8g1jm0CMABWUp2 g==;
X-CSE-ConnectionGUID: WLkGSTIZT5ueibPsE+u8cA==
X-CSE-MsgGUID: UK0S/wNgRNeQLJsICtI+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56747389"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56747389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:21 -0800
X-CSE-ConnectionGUID: OeFPbD11QcGHjnt16gWaOw==
X-CSE-MsgGUID: N/5GQlJQSdeBfYy0ADYu1A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/pagemap: Disable device-to-device migration
Date: Wed,  7 Jan 2026 10:27:16 -0800
Message-Id: <20260107182716.2236607-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182716.2236607-1-matthew.brost@intel.com>
References: <20260107182716.2236607-1-matthew.brost@intel.com>
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

Device-to-device migration is causing xe_exec_system_allocator --r
*race*no* to intermittently fail with engine resets and a kernel hang on
a page lock. This should work but is clearly buggy somewhere. Disable
device-to-device migration in the interim until the issue can be
root-caused.

The only downside of disabling device-to-device migration is that memory
will bounce through system memory during migration. However, this path
should be rare, as it only occurs when madvise attributes are changed or
atomics are used.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: ec265e1f1cfc ("drm/pagemap: Support source migration over interconnect")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index aa43a8475100..03ee39a761a4 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -480,8 +480,18 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.start		= start,
 		.end		= end,
 		.pgmap_owner	= pagemap->owner,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
-		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		/*
+		 * FIXME: MIGRATE_VMA_SELECT_DEVICE_PRIVATE intermittently
+		 * causes 'xe_exec_system_allocator --r *race*no*' to trigger aa
+		 * engine reset and a hard hang due to getting stuck on a folio
+		 * lock. This should work and needs to be root-caused. The only
+		 * downside of not selecting MIGRATE_VMA_SELECT_DEVICE_PRIVATE
+		 * is that device-to-device migrations won’t work; instead,
+		 * memory will bounce through system memory. This path should be
+		 * rare and only occur when the madvise attributes of memory are
+		 * changed or atomics are being used.
+		 */
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
-- 
2.34.1

