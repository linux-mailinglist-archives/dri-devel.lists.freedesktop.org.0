Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3950E591
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 18:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259010E594;
	Mon, 25 Apr 2022 16:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF7010E721;
 Mon, 25 Apr 2022 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650903820; x=1682439820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WiqaG448040fxl0OCpeirVMM2lL4ffMEzbrGmaahHU8=;
 b=BFSEYTdImH3SjkoNQLEC35Rig9iHCtcWJFYd0YB+USAm2HP2bDaghM7L
 fWZPB+xGr7IigRlxgHy8fwvKB7Lu99e4yX808o5xYMWX4ktMpNLPO9h8Y
 8K8w4ZH7wrsukbRwOPbMRICHIxughrRBbw7E7vFPxID6QyLSJN/BY35X2
 JRrItCNRDXqMoRBMwzRUwKfcJTsp8H8CyKWT8yX0gisRkKO3zzQQixKwu
 qdXR2xKauwgztPHxFME8yIlyVbonON0YExZkjXtsuqv4jan1ZWuRiczto
 8Uk8vvUMARCtEXRhAz+x3YPMh7KSylyxioO1vUB1JhQDy4pbADkvJ2s/l Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290434373"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290434373"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="677290979"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:38 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/i915/gt: Document the eviction of the Flat-CCS
 objects
Date: Mon, 25 Apr 2022 21:54:29 +0530
Message-Id: <20220425162430.28844-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425162430.28844-1-ramalingam.c@intel.com>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture the eviction details for Flat-CCS capable, lmem objects.

v2:
  Fix the Flat-ccs capbility of lmem obj with smem residency
  possibility [Thomas]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 463a6a14b5f9..930e0fd9795f 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -485,16 +485,21 @@ static bool wa_1209644611_applies(int ver, u32 size)
  * And CCS data can be copied in and out of CCS region through
  * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
  *
- * When we exhaust the lmem, if the object's placements support smem, then we can
- * directly decompress the compressed lmem object into smem and start using it
- * from smem itself.
+ * I915 supports Flat-CCS on lmem only objects. When an objects has the smem in
+ * its preference list, on memory pressure, i915 needs to migarte the lmem
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
+ * when we exhaust the lmem, Flat-CCS capable objects' lmem backing memory can
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

