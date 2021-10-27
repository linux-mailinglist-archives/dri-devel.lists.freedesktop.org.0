Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720743D4E1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73486E926;
	Wed, 27 Oct 2021 21:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74696E925;
 Wed, 27 Oct 2021 21:21:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230217465"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="230217465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154343"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:40 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 Tony Ye <tony.ye@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Subject: [PATCH v3 16/17] drm/i915/Flat-CCS: Document on Flat-CCS memory
 compression
Date: Thu, 28 Oct 2021 02:53:38 +0530
Message-Id: <20211027212339.29259-17-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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
index 0bed01750884..ad5a28da1c6a 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -491,6 +491,53 @@ intel_context_migrate_copy(struct intel_context *ce,
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

