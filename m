Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB7467741
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9147F73F18;
	Fri,  3 Dec 2021 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC973F47;
 Fri,  3 Dec 2021 12:25:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="297761384"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297761384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:24:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="746699389"
Received: from ashunt-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.106])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:24:58 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/i915/migrate: don't check the scratch page
Date: Fri,  3 Dec 2021 12:24:19 +0000
Message-Id: <20211203122426.2859679-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122426.2859679-1-matthew.auld@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
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
Cc: bob.beckett@collabora.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The scratch page might not be allocated in LMEM(like on DG2), so instead
of using that as the deciding factor for where the paging structures
live, let's just query the pt before mapping it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 765c6d48fe52..2d3188a398dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -13,7 +13,6 @@
 
 struct insert_pte_data {
 	u64 offset;
-	bool is_lmem;
 };
 
 #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
@@ -41,7 +40,7 @@ static void insert_pte(struct i915_address_space *vm,
 	struct insert_pte_data *d = data;
 
 	vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
-			d->is_lmem ? PTE_LM : 0);
+			i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
 	d->offset += PAGE_SIZE;
 }
 
@@ -135,7 +134,6 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 			goto err_vm;
 
 		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
-		d.is_lmem = i915_gem_object_is_lmem(vm->vm.scratch[0]);
 		vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
 	}
 
-- 
2.31.1

