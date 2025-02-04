Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB513A2729E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367D310E641;
	Tue,  4 Feb 2025 13:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6CA10E640;
 Tue,  4 Feb 2025 13:21:51 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 7/8] drm/xe/vram: Use xe_force_wake guard
 helper
Date: Tue,  4 Feb 2025 14:22:36 +0100
Message-ID: <20250204132238.162608-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vram.c | 45 ++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b1f81dca610dc..9180bb4d29971 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -220,7 +220,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
-	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
@@ -240,33 +239,29 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
-	/* actual size */
-	if (unlikely(xe->info.platform == XE_DG1)) {
-		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
-		*tile_offset = 0;
-	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
-		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
-		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
-	}
-
-	/* minus device usage */
-	if (xe->info.has_flat_ccs) {
-		offset = get_flat_ccs_offset(gt, *tile_size);
-	} else {
-		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
-	}
+	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, gt_to_fw(gt), XE_FW_GT) {
+		/* actual size */
+		if (unlikely(xe->info.platform == XE_DG1)) {
+			*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
+			*tile_offset = 0;
+		} else {
+			reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+			*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+			*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
+		}
 
-	/* remove the tile offset so we have just the available size */
-	*vram_size = offset - *tile_offset;
+		/* minus device usage */
+		if (xe->info.has_flat_ccs) {
+			offset = get_flat_ccs_offset(gt, *tile_size);
+		} else {
+			offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
+		}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		/* remove the tile offset so we have just the available size */
+		*vram_size = offset - *tile_offset;
 
-	return 0;
+		return 0;
+	}
 }
 
 static void vram_fini(void *arg)
-- 
2.47.1

