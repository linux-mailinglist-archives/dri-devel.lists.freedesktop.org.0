Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D099058E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 16:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64F10EA17;
	Fri,  4 Oct 2024 14:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APDKqFGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22E610EA17;
 Fri,  4 Oct 2024 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728051122; x=1759587122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymo5o1IRoPb3BbzgLkzrV2+bpf32BKp7A7TpqxOC1bo=;
 b=APDKqFGp7MUZ+IUcb4fAUb9dpDdaAW5sVhYVTcjtcypTi099aJlZ1Jof
 G6CGDPSZvEJilNgFVwVZBowwKBvfydfKI5LxEdFFSxBKGOsts9S99nOmA
 sskBTle8jAM3tBSTXEnCHwiQz59Of2mdVs4dp4IjxjehaCFt7fXnZ6XHC
 oyF/E+PDuX8kyoeXXXxr+89pHLRqzEyhSNQIwtECpouQbjAkAuo0+ZLBw
 xcimGlzxr12UQzgUqDmLuBCLHQTMYPdWqD73z+ye19B0Zpd3SlRSE9gb0
 bYkqTmB0bvYmcBsnDbBOMln07vGk1NeVfvYoMyV0Gvoptsvt+xgyktbP1 A==;
X-CSE-ConnectionGUID: TZvgpeXZQwOGbEpHx/+Xgw==
X-CSE-MsgGUID: 8eQOTN00Te+cwO7F0JM3SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37877800"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37877800"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:12:01 -0700
X-CSE-ConnectionGUID: 94o1zHSnSKGGrkFgZbUMTw==
X-CSE-MsgGUID: pJ+HAEILQGSXBOJ+2F6lXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74706990"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:12:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe/tests: Fix the shrinker test compiler warnings.
Date: Fri,  4 Oct 2024 16:11:20 +0200
Message-ID: <20241004141121.186177-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

The xe_bo_shrink_kunit test has an uninitialized value and illegal
integer size conversions on 32-bit. Fix.

v2:
- Use div64_u64 to ensure the u64 division compiles everywhere. (Matt Auld)

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
Cc: dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7d3fd720478b..cd811aa2b227 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -7,6 +7,7 @@
 #include <kunit/visibility.h>
 
 #include <linux/iosys-map.h>
+#include <linux/math64.h>
 #include <linux/random.h>
 #include <linux/swap.h>
 
@@ -440,7 +441,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 	LIST_HEAD(bos);
 	struct xe_bo_link *link, *next;
 	struct sysinfo si;
-	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
+	u64 ram, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;
 	unsigned int interrupted = 0, successful = 0, count = 0;
 	struct rnd_state prng;
 	u64 rand_seed;
@@ -469,7 +470,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
 	if (to_alloc > ram_and_swap)
 		purgeable = to_alloc - ram_and_swap;
-	purgeable += purgeable / 5;
+	purgeable += div64_u64(purgeable, 5);
 
 	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
 		   (unsigned long)ram);
-- 
2.46.0

