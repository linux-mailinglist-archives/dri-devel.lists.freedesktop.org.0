Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BCCACDCD
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFDE10E3BC;
	Mon,  8 Dec 2025 10:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCLSKjDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0912610E3BC;
 Mon,  8 Dec 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765189642; x=1796725642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkySkSjU1SBFo79I0lrvRHAyMklZpIocPvhHQylXSRQ=;
 b=hCLSKjDEDAQ66SAOMJWTR/8o+bh6XRwJfVgI+M68ZSLwNJ+HB7fJmpj8
 0Gfh7tXty8LbzZG80PccmxsXCrAbmw1SCl8igDhszks27gETfS7DU/pgT
 x57TMg/QaafG5RtYItY0t0t6avQAjzNpNlch1EY5+gh/7gKLCcVJIiZxb
 13Hz30UtVx1fiWabEKNReJm3lZNkPEl/EhavW8m3A3rZQPvPlvFVmaKWw
 0OQ4fgErx9F93us6IFbEww+EsHe+YFU6SCMnWzzIpTdeDnT8rjT0x1Z5o
 zh7Q+VrSoYMgf+Wce1gbOP9ntTtITheLJWBO85C7Qos9s0TTrGKaIineQ A==;
X-CSE-ConnectionGUID: /VHxA2+HRhiWt1MFY5iWbg==
X-CSE-MsgGUID: fA39LxXnSZ+RfdiMZllx4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78593853"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="78593853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 02:27:22 -0800
X-CSE-ConnectionGUID: cseS0z+ySqSn+C6iH7hTkA==
X-CSE-MsgGUID: HhPgtypqQJiXyOMALWn7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="194956187"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 02:27:20 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm teardown
Date: Mon,  8 Dec 2025 11:27:14 +0100
Message-ID: <20251208102714.4008260-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251208102714.4008260-1-michal.grzelak@intel.com>
References: <20251208102714.4008260-1-michal.grzelak@intel.com>
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

Fixes: d4cd665c98c1 ("drm/buddy: Separate clear and dirty free block trees")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

