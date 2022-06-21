Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C9553018
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89F710FE21;
	Tue, 21 Jun 2022 10:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0C10FDF9;
 Tue, 21 Jun 2022 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808421; x=1687344421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3vLZaoa0P/DbYRC4Y3v6GKLw59ZYgD7ppzQcq7tXiUk=;
 b=XYIT2hD5MIuS0kz1Wu1Zf4KU/P3m8+aCYK1aVNa4Cx4B/idCrls7XP6Y
 Sl0L/w5kvtYQZQj1l0fHqmyCnqAlGZX8foL3JRt7Ay9k73T5h6XcR9Dll
 eDiSjuHcJEklKKhOMGMH0xRu3B8JWFrGm28470G141M7uOycDUyFNZMEw
 HC6ihSf3r0LAqs5TBYa2jKQROnDpYWwKgDSX0cpIfDifDVBbBo6hjtkVf
 /bWzw6MigiVzWlkfMaoTt37oSUufIgxe4zZzxgm2eE8kuhwBzolDX8K4A
 wjqB24AlNeJ63guBGG9NwCO99hU7PH9syje9h6OjH0ZuyOSYSOstPuae+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121969"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:47:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327155"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/i915: turn on small BAR support
Date: Tue, 21 Jun 2022 11:44:33 +0100
Message-Id: <20220621104434.190962-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the uAPI in place we should now have enough in place to ensure a
working system on small BAR configurations.

v2: (Nirmoy & Thomas):
  - s/full BAR/Resizable BAR/ which is hopefully more easily
    understood by users.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 2ff448047020..82c3d2d0f0e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -112,12 +112,6 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
 		flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
 
-		/* FIXME: Remove this when we have small-bar enabled */
-		if (pci_resource_len(pdev, 2) < lmem_size) {
-			drm_err(&i915->drm, "System requires small-BAR support, which is currently unsupported on this kernel\n");
-			return ERR_PTR(-EINVAL);
-		}
-
 		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
 			return ERR_PTR(-EIO);
 
@@ -170,6 +164,10 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	drm_info(&i915->drm, "Local memory available: %pa\n",
 		 &lmem_size);
 
+	if (io_size < lmem_size)
+		drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' or similar, if available in the BIOS.\n",
+			 (u64)io_size >> 20);
+
 	return mem;
 
 err_region_put:
-- 
2.36.1

