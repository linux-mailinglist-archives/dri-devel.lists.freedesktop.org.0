Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E44B8F47
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885F110E6FD;
	Wed, 16 Feb 2022 17:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A80D10E361;
 Wed, 16 Feb 2022 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033043; x=1676569043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hJ83QGaxBll4KHVbR8AWnRDK/3q3BMqHk88WODjd1rw=;
 b=B/bx/WxnSjNl597yp2wtZtnyEIBCIKlQJYiMNHDZzxqru8nahNBY+Vsm
 iQFzfceaZwPZ9eu9NaKrN/Q41CQrwz33JgyAe/PF93ffNSfaaL0/Gxha0
 2V4AYad/lwnwvAuP+g/1+K9fVRCPdxRy/GD/WJkH1tgxqYylrgEqC0fFL
 omscNow1qLZx2Q0lN9zig3QkDdfIPnvZI2JxG0pxLB1m8Sh6lz6oRkbzb
 IatPuXxn2RlaEq+tUrRAHeROyw0qCWueSnG0BxlvQJNRMXLduewbSXXQP
 mQfcERcKAc/haPUe5YuZZxm7KNKZcS+88TchHUEJJgBeYoOFbem+knWUG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337120785"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="337120785"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:37:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="704401373"
Received: from robfarrx-mobl6.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.139])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:37:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: fixup the mock_bo
Date: Wed, 16 Feb 2022 17:37:03 +0000
Message-Id: <20220216173703.1750589-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When running the mock selftests we currently blow up with:

<6> [299.836278] i915: Running i915_gem_huge_page_mock_selftests/igt_mock_memory_region_huge_pages
<1> [299.836356] BUG: kernel NULL pointer dereference, address: 00000000000000c8
<1> [299.836361] #PF: supervisor read access in kernel mode
<1> [299.836364] #PF: error_code(0x0000) - not-present page
<6> [299.836367] PGD 0 P4D 0
<4> [299.836369] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4> [299.836372] CPU: 1 PID: 1429 Comm: i915_selftest Tainted: G     U            5.17.0-rc4-CI-CI_DRM_11227+ #1
<4> [299.836376] Hardware name: Intel(R) Client Systems NUC11TNHi5/NUC11TNBi5, BIOS TNTGL357.0042.2020.1221.1743 12/21/2020
<4> [299.836380] RIP: 0010:ttm_resource_init+0x57/0x90 [ttm]
<4> [299.836392] RSP: 0018:ffffc90001e4f680 EFLAGS: 00010203
<4> [299.836395] RAX: 0000000000000000 RBX: ffffc90001e4f708 RCX: 0000000000000000
<4> [299.836398] RDX: ffff888116172528 RSI: ffffc90001e4f6f8 RDI: 0000000000000000
<4> [299.836401] RBP: ffffc90001e4f6f8 R08: 00000000000001b0 R09: ffff888116172528
<4> [299.836403] R10: 0000000000000001 R11: 00000000a4cb2e51 R12: ffffc90001e4fa90
<4> [299.836406] R13: ffff888116172528 R14: ffff888130d7f4b0 R15: ffff888130d7f400
<4> [299.836409] FS:  00007ff241684500(0000) GS:ffff88849fe80000(0000) knlGS:0000000000000000
<4> [299.836412] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [299.836416] CR2: 00000000000000c8 CR3: 0000000107b80001 CR4: 0000000000770ee0
<4> [299.836418] PKRU: 55555554
<4> [299.836420] Call Trace:
<4> [299.836422]  <TASK>
<4> [299.836423]  i915_ttm_buddy_man_alloc+0x68/0x240 [i915]

ttm_resource_init() now needs to access the bo->bdev, and also wants to
store the bo reference. Try to keep both working. The mock_bo is a hack
so we can interface directly with the ttm managers alloc() and free() hooks for
our mock testing, without invoking other TTM features like eviction,
moves, etc.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5123
Fixes: 0e05fc49c358 ("drm/ttm: add common accounting to the resource mgr v3")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index f2b888c16958..30c7e0d1624c 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -200,11 +200,13 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	int ret;
 
 	mock_bo.base.size = size;
+	mock_bo.bdev = &mem->i915->bdev;
 	place.flags = flags;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
+	res->bo = NULL; /* Rather blow up, then some uaf */
 	return ret ? ERR_PTR(ret) : res;
 }
 
@@ -219,6 +221,11 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 				    struct ttm_resource *res)
 {
 	struct ttm_resource_manager *man = mem->region_private;
+	struct ttm_buffer_object mock_bo = {};
+
+	mock_bo.base.size = res->num_pages << PAGE_SHIFT;
+	mock_bo.bdev = &mem->i915->bdev;
+	res->bo = &mock_bo;
 
 	man->func->free(man, res);
 }
-- 
2.34.1

