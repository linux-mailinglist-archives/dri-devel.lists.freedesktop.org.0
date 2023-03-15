Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE56BAE3C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2DD10E998;
	Wed, 15 Mar 2023 10:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2FC10E998;
 Wed, 15 Mar 2023 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678877694; x=1710413694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/wKaIrauiD9CoNHLotOobGfK/yv1jAnNwmzi6lGpK4=;
 b=WXEZkPBswCTigvHibOsTt5kMTkTSMFt4gOrScWYEF89vYOIqigQ8ZyTv
 ziguMD6T89y6URc4MjTCObvDm9/lFeoyinLhNFOaxPNCCaQt2DTRxRAtP
 ui8FRo8/nwTviUthKeuK80UlnktaiqImMZ5+Y5MX/TKI75/EY5XpZq6Ny
 9jEMY+Sjm24L5L1zjZTT9fKKdbWHpHAyGAnWYUeV02O97QfI09FWKXBhv
 WoeapaBlUPgYP6UiC5t6Km52pUqsBS9xlGO3fO/2fhsVcZHOfSL2S5tdJ
 dmqYYf5N8v6ZtehZSBJyc7N4GDaRNOcZCVkH4Lvye0o4CeuAeRiQRc1OP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335156828"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="335156828"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="1008800550"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="1008800550"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:54:52 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Clarify seemingly unaccounted obj refcount inc
Date: Wed, 15 Mar 2023 11:54:46 +0100
Message-Id: <20230315105446.5858-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a comment why there is a obj refcount inc before installing
the vm_ops for the mmap call. Also remove the invalid older comment
as drm API(drm_gem_prime_mmap()) will hold an obj reference before
calling this driver mmap callback so we can't have 0-refcnted
object here.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index d3c1dee16af2..0bc8c3818443 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -952,9 +952,10 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 						  vma_pages(vma));
 	if (node && drm_vma_node_is_allowed(node, priv)) {
 		/*
-		 * Skip 0-refcnted objects as it is in the process of being
-		 * destroyed and will be invalid when the vma manager lock
-		 * is released.
+		 * When we install vm_ops for mmap we are too late for
+		 * the vm_ops->open() which increases the ref_count of
+		 * this obj and then it gets decreased by the vm_ops->close().
+		 * To balance this increase the obj ref_count here.
 		 */
 		if (!node->driver_private) {
 			mmo = container_of(node, struct i915_mmap_offset, vma_node);
-- 
2.39.0

