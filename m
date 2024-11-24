Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8F9D7072
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F07610E4D0;
	Sun, 24 Nov 2024 13:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TCaQmJjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A610E4D7;
 Sun, 24 Nov 2024 13:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 966605C543F;
 Sun, 24 Nov 2024 13:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C8C4CED1;
 Sun, 24 Nov 2024 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455245;
 bh=YWcXZRQ2PKExhrtCcwa9G+/k0ID6VBR1cc2YfPNI5Es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TCaQmJjru9Iry2OB7/K71pN6HLmfPoDRd5ZQUkme8Qk4wDKVZv9ZRaAshZCrHM9BV
 H1DcJ+bW3h6wKl5xVfUIp9FE9mJDkbeDwhUrj5TNj5e4sXUmACGqg+7Cq/vXM9haxZ
 mgqcl5STZy39GdZYfUfbrPkVEPzWxhkRL50JQ2sDjRIfDKPJ2WiVsr40wCY4jzx8U8
 Szwvm3beQTVOz03mOv4mBZt5Q1c/fpdPSf+eO3+/wIygt9OviCWhsgSR4T+R12J4oi
 G6EDrLSf4kdFQUpAvO3rL6RmPVu1Fip8MrhBJOKK252GDeeeiXVufRa0Zt48JItdqv
 fs88lU2/cuNUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 024/107] drm/xe/ptl: L3bank mask is not available
 on the media GT
Date: Sun, 24 Nov 2024 08:28:44 -0500
Message-ID: <20241124133301.3341829-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

[ Upstream commit 9ab440a9d0426cf7842240891cc457155db1a97e ]

On PTL platforms with media version 30.00, the fuse registers for
reporting L3 bank availability to the GT just read out as ~0 and do not
provide proper values.  Xe does not use the L3 bank mask for anything
internally; it only passes the mask through to userspace via the GT
topology query.

Since we don't have any way to get the real L3 bank mask, we don't want
to pass garbage to userspace.  Passing a zeroed mask or a copy of the
primary GT's L3 bank mask would also be inaccurate and likely to cause
confusion for userspace.  The best approach is to simply not include L3
in the list of masks returned by the topology query in cases where we
aren't able to provide a meaningful value.  This won't change the
behavior for any existing platforms (where we can always obtain L3 masks
successfully for all GTs), it will only prevent us from mis-reporting
bad information on upcoming platform(s).

There's a good chance this will become a formal workaround in the
future, but for now we don't have a lineage number so "no_media_l3" is
used in place of a lineage as the OOB workaround descriptor.

v2:
 - Re-calculate query size to properly match data returned. (Gustavo)
 - Update kerneldoc to clarify that the L3bank mask may not be included
   in the query results if the hardware doesn't make it available.
   (Gustavo)

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Acked-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241007154143.2021124-2-matthew.d.roper@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++
 drivers/gpu/drm/xe/xe_query.c       | 42 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
 include/uapi/drm/xe_drm.h           |  4 ++-
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede7..3e113422b88de 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -5,6 +5,7 @@
 
 #include "xe_gt_topology.h"
 
+#include <generated/xe_wa_oob.h>
 #include <linux/bitmap.h>
 #include <linux/compiler.h>
 
@@ -12,6 +13,7 @@
 #include "xe_assert.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
+#include "xe_wa.h"
 
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
@@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
 
+	/*
+	 * PTL platforms with media version 30.00 do not provide proper values
+	 * for the media GT's L3 bank registers.  Skip the readout since we
+	 * don't have any way to obtain real values.
+	 *
+	 * This may get re-described as an official workaround in the future,
+	 * but there's no tracking number assigned yet so we use a custom
+	 * OOB workaround descriptor.
+	 */
+	if (XE_WA(gt, no_media_l3))
+		return;
+
 	if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 848da8e68c7a8..1c96375bd7df7 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
+#include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
@@ -23,6 +24,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -458,12 +460,23 @@ static int query_hwconfig(struct xe_device *xe,
 
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
-	return xe->info.gt_count *
-		(4 * sizeof(struct drm_xe_query_topology_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
+	struct xe_gt *gt;
+	size_t query_size = 0;
+	int id;
+
+	for_each_gt(gt, xe, id) {
+		query_size += 3 * sizeof(struct drm_xe_query_topology_mask) +
+			sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
+			sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
+			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
+
+		/* L3bank mask may not be available for some GTs */
+		if (!XE_WA(gt, no_media_l3))
+			query_size += sizeof(struct drm_xe_query_topology_mask) +
+				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
+	}
+
+	return query_size;
 }
 
 static int copy_mask(void __user **ptr,
@@ -516,11 +529,18 @@ static int query_gt_topology(struct xe_device *xe,
 		if (err)
 			return err;
 
-		topo.type = DRM_XE_TOPO_L3_BANK;
-		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
-				sizeof(gt->fuse_topo.l3_bank_mask));
-		if (err)
-			return err;
+		/*
+		 * If the kernel doesn't have a way to obtain a correct L3bank
+		 * mask, then it's better to omit L3 from the query rather than
+		 * reporting bogus or zeroed information to userspace.
+		 */
+		if (!XE_WA(gt, no_media_l3)) {
+			topo.type = DRM_XE_TOPO_L3_BANK;
+			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
+					sizeof(gt->fuse_topo.l3_bank_mask));
+			if (err)
+				return err;
+		}
 
 		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
 			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca50601466..0154fbe154e9a 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -37,3 +37,4 @@
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
+no_media_l3	MEDIA_VERSION(3000)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e9..c4182e95a6195 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
  *    means 32 DSS are available for compute.
- *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This type
+ *    may be omitted if the driver is unable to query the mask from the
+ *    hardware.
  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
-- 
2.43.0

