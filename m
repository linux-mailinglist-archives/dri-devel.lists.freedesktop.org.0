Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6A46F02D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03BE10F9E6;
	Thu,  9 Dec 2021 16:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B1891DD;
 Thu,  9 Dec 2021 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064815; x=1670600815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CFoqsd0cKLjWQpbJ9ovJS/u4/21gRck4+jUTqov7OHg=;
 b=dnwlxfz3vGuPGIPQ5+42uwQ3wwCve/fmRQLV2/1Kz0q0O055UygqBAI9
 KF6QYDePi9gm7c8z/IopnNoaPOgX2Qd+te/IphNpCDkaqIYfwJQkCxfBF
 sqPs5PLAWqXmKzKS4SjunN4/v3XBohcOsn0WVbXpK+KibHhlS6fJfojDj
 +pnxLgski8TdeeNVNt73AEAyOTdJgOCWz3wB6Ejfp8D4+ihx8/K3u4kw2
 GkfqNFlOMLG7/y3cBXjHHft0wN8L0YJJAbnyXDy57/3HSuZFCSYSnP62M
 bPZqQabRBk0h4k0rZ7Q4lU++UsG+kI9+ndn/c2hpS+hJMQs4kdYiCYgte Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917212"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917212"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535261"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:31 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 15/16] drm/i915/Flat-CCS: Document on Flat-CCS memory
 compression
Date: Thu,  9 Dec 2021 21:15:32 +0530
Message-Id: <20211209154533.4084-16-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Documents the Flat-CCS feature and kernel handling required along with
modifiers used.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Simon Ser <contact@emersion.fr>
cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: mesa-dev@lists.freedesktop.org
Cc: Tony Ye <tony.ye@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 0fb83d0bec91..2d7ea9b6e8fb 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -595,6 +595,53 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
+/**
+ * DOC: Flat-CCS - Memory compression for Local memory
+ *
+ * On Xe-HP and later devices, we use dedicated compression control state (CCS)
+ * stored in local memory for each surface, to support the 3D and media
+ * compression formats.
+ *
+ * The memory required for the CCS of the entire local memory is 1/256 of the
+ * local memory size. So before the kernel boot, the required memory is reserved
+ * for the CCS data and a secure register will be programmed with the CCS base
+ * address.
+ *
+ * Flat CCS data needs to be cleared when a lmem object is allocated.
+ * And CCS data can be copied in and out of CCS region through
+ * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
+ *
+ * When we exaust the lmem, if the object's placements support smem, then we can
+ * directly decompress the compressed lmem object into smem and start using it
+ * from smem itself.
+ *
+ * But when we need to swapout the compressed lmem object into a smem region
+ * though objects' placement doesn't support smem, then we copy the lmem content
+ * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
+ * When the object is referred, lmem content will be swaped in along with
+ * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
+ * location.
+ *
+ *
+ * Flat-CCS Modifiers for different compression formats
+ * ----------------------------------------------------
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS - used to indicate the buffers of Flat CCS
+ * render compression formats. Though the general layout is same as
+ * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression algorithm is
+ * used. Render compression uses 128 byte compression blocks
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_MC_CCS -used to indicate the buffers of Flat CCS
+ * media compression formats. Though the general layout is same as
+ * I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm is
+ * used. Media compression uses 256 byte compression blocks.
+ *
+ * I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC - used to indicate the buffers of Flat
+ * CCS clear color render compression formats. Unified compression format for
+ * clear color render compression. The genral layout is a tiled layout using
+ * 4Kb tiles i.e Tile4 layout.
+ */
+
 static inline u32 *i915_flush_dw(u32 *cmd, u64 dst, u32 flags)
 {
 	/* Mask the 3 LSB to use the PPGTT address space */
-- 
2.20.1

