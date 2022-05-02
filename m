Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05991517178
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9E010EAFA;
	Mon,  2 May 2022 14:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD6110EAE5;
 Mon,  2 May 2022 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651501522; x=1683037522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEaU8Hnu6gEBqEeIu4c5spdZwajT4yqEHVZvMrlOhVg=;
 b=manM31nLmv20KgFdkg1r1VpCEjO/C2ny39ckch+7GGs1dS0vJVzigJbs
 2MvqSU9qP+qrjzs96vPMsDLxL1c7HGBGSLx39D0JekYvn1aBUXSdJEwMu
 s8HAdileH+VjfppdrKF1/pzltysb+DnUe/QO5PibiEky8wSUJ4Mb3tJqS
 JDKspXDoDDmRNsAoxvo5E/bhyl7VH1IuGoofgB/lQJe+/K8zEst+XeKNH
 UIQbzAQf2t/bsMmuUVKXdTaNg0ocybtNPgFn8BJW9y316PmzF5roFRQuw
 IiZnhzGSXt1lQtQZyhZC6bIJuiwD/mCeaMKSXM4WKLCGVuPB9ZtzI6HX9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292403408"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292403408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="516111197"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:20 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/i915/gt: Document the eviction of the Flat-CCS
 objects
Date: Mon,  2 May 2022 19:56:18 +0530
Message-Id: <20220502142618.2704-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220502142618.2704-1-ramalingam.c@intel.com>
References: <20220502142618.2704-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture the eviction details for Flat-CCS capable, lmem objects.

v2:
  Fix the Flat-ccs capbility of lmem obj with smem residency
  possibility [Thomas]
v3:
  Fixed the suggestions [Matt]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index fc6975e55fae..509955885b93 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -485,16 +485,21 @@ static bool wa_1209644611_applies(int ver, u32 size)
  * And CCS data can be copied in and out of CCS region through
  * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
  *
- * When we exhaust the lmem, if the object's placements support smem, then we can
- * directly decompress the compressed lmem object into smem and start using it
- * from smem itself.
+ * I915 supports Flat-CCS on lmem only objects. When an objects has smem in
+ * its preference list, on memory pressure, i915 needs to migrate the lmem
+ * content into smem. If the lmem object is Flat-CCS compressed by userspace,
+ * then i915 needs to decompress it. But I915 lack the required information
+ * for such decompression. Hence I915 supports Flat-CCS only on lmem only objects.
  *
- * But when we need to swapout the compressed lmem object into a smem region
- * though objects' placement doesn't support smem, then we copy the lmem content
- * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
- * When the object is referred, lmem content will be swaped in along with
- * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
- * location.
+ * When we exhaust the lmem, Flat-CCS capable objects' lmem backing memory can
+ * be temporarily evicted to smem, along with the auxiliary CCS state, where
+ * it can be potentially swapped-out at a later point, if required.
+ * If userspace later touches the evicted pages, then we always move
+ * the backing memory back to lmem, which includes restoring the saved CCS state,
+ * and potentially performing any required swap-in.
+ *
+ * For the migration of the lmem objects with smem in placement list, such as
+ * {lmem, smem}, objects are treated as non Flat-CCS capable objects.
  */
 
 static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
-- 
2.20.1

