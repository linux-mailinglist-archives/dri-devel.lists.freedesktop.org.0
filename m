Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C6C73308
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6307910E72F;
	Thu, 20 Nov 2025 09:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWWgJZNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24F10E72F;
 Thu, 20 Nov 2025 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763631187; x=1795167187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BFRDqnxKzPbFpAy+HzvLtoetiDD9w+amRW72DoDHlI4=;
 b=JWWgJZNB2Ia4rRC3pd1pDnKVEnYtzodVyos5SdD9BL3L7BgeMvvuSKd2
 eyIx0qZi/kxTgf3yVpGOHU0kYF+fG5j6skl48GOyqzH7vSYu7HQv1krxc
 jYpligg6H9J3YUzMWolPXZctfEcqpBwijdeQpL/y/cC3fmiUX+T5nZ1ZG
 jrqI1xcNGSNvf2MH2OSWA0AFR+XAE7tK+HjouXk4NDHMhvQY3kWxtSOuJ
 fZpPY49UOsi+QnOGy6HQjtne0Pw5qn/+4qjTo8TkymzlEPAHbbf4DQ9EM
 ipyBnMrBcRdOAeIB+i/wH96ZxM2SOzroe2+t6HjObRGmiZPCvigj/Svfx Q==;
X-CSE-ConnectionGUID: Igwp15zkT7S5EKrYmwb2kQ==
X-CSE-MsgGUID: wbQGuorxTuCSvIF1Km94iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="53265098"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="53265098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:33:07 -0800
X-CSE-ConnectionGUID: 0/I9vzHxQKmbcAo5fLLydw==
X-CSE-MsgGUID: ft5GJutNQV2iFbIBDJaDcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="190564869"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 01:33:05 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Arunpravin.PaneerSelvam@amd.com,
 thomas.hellstrom@linux.intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH] drm/buddy: release free_trees array on buddy mm teardown
Date: Thu, 20 Nov 2025 10:30:21 +0100
Message-ID: <20251120093022.276551-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

During initialization of DRM buddy memory manager at drm_buddy_init,
mm->free_trees array is allocated for both clear and dirty RB trees.
During cleanup happening at drm_buddy_fini it is never freed, leading to
following memory leaks observed on xe module load & unload cycles:

    kmemleak_alloc+0x4a/0x90
    __kmalloc_cache_noprof+0x488/0x800
    drm_buddy_init+0xc2/0x330 [drm_buddy]
    __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
    xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
    xe_device_probe+0x326/0x9e0 [xe]
    xe_pci_probe+0x39a/0x610 [xe]
    local_pci_probe+0x47/0xb0
    pci_device_probe+0xf3/0x260
    really_probe+0xf1/0x3c0
    __driver_probe_device+0x8c/0x180
    driver_probe_device+0x24/0xd0
    __driver_attach+0x10f/0x220
    bus_for_each_dev+0x7f/0xe0
    driver_attach+0x1e/0x30
    bus_add_driver+0x151/0x290

Deallocate array for free trees when cleaning up buddy memory manager
in the same way as if going through out_free_tree label.

Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 2f279b46bd2c..8308116058cc 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for_each_free_tree(i)
 		kfree(mm->free_trees[i]);
+	kfree(mm->free_trees);
 	kfree(mm->roots);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
-- 
2.45.2

