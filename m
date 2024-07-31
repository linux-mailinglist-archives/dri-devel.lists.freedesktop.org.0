Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76035943A6A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D916A10E73A;
	Thu,  1 Aug 2024 00:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkMh2Irl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EF610E738;
 Thu,  1 Aug 2024 00:14:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE958CE186D;
 Thu,  1 Aug 2024 00:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C5DC4AF0F;
 Thu,  1 Aug 2024 00:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471267;
 bh=esHJuFnMNtZ9yD6SQgsk+9Gw7KYDFRp6JRZmi4m0PKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lkMh2IrlsrtUm/dft2UmfCd7i7OKe+d1p0VRVWmy4rZrnNotKYGP2dDBVE3wXnDtM
 qg7Jvbcn8nrMpBeS5+7gZcJoPJu8wMTZEbXn6NsoJ5KNS6OL13mlwXZv5QFl8E0H+3
 OLwMMyvKmN+YnFxisc6iufQ1CTEPjkDRTnC83T/g/Rg3WiI2Oer02qrU3tkP8hxxCq
 rymJXGPTwQZKLTLD0pLO3UcpEkbywXbAOkTfgBdx/BM7vqUj/d6Fq2XvOpTTfvg4Wz
 Gjp1IworWe5Ck8MekAP8NrmtA8J5z1GRhqD4cHFeTi/1NtL05FFDXs+NaFe26rgg2j
 rAFturoCogkhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 051/121] drm/xe: reset mmio mappings with devm
Date: Wed, 31 Jul 2024 19:59:49 -0400
Message-ID: <20240801000834.3930818-51-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Matthew Auld <matthew.auld@intel.com>

[ Upstream commit c7117419784f612d59ee565145f722e8b5541fe6 ]

Set our various mmio mappings to NULL. This should make it easier to
catch something rogue trying to mess with mmio after device removal. For
example, we might unmap everything and then start hitting some mmio
address which has already been unmamped by us and then remapped by
something else, causing all kinds of carnage.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240522102143.128069-33-matthew.auld@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_mmio.c   | 35 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5ef9b50a20d01..a1cbdafbff75e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -551,7 +551,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_mmio_probe_tiles(xe);
+	err = xe_mmio_probe_tiles(xe);
+	if (err)
+		return err;
 
 	xe_ttm_sys_mgr_init(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 2ebb2f0d6874e..9d8fafdf51453 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -254,6 +254,21 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
+static void vram_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	int id;
+
+	if (xe->mem.vram.mapping)
+		iounmap(xe->mem.vram.mapping);
+
+	xe->mem.vram.mapping = NULL;
+
+	for_each_tile(tile, xe, id)
+		tile->mem.vram.mapping = NULL;
+}
+
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -330,10 +345,20 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &available_size);
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
 
-void xe_mmio_probe_tiles(struct xe_device *xe)
+static void tiles_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id)
+		tile->mmio.regs = NULL;
+}
+
+int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -384,6 +409,8 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 			regs += tile_mmio_ext_size;
 		}
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
 }
 
 static void mmio_fini(void *arg)
@@ -391,10 +418,6 @@ static void mmio_fini(void *arg)
 	struct xe_device *xe = arg;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
-	xe->mem.vram.mapping = NULL;
 	xe->mmio.regs = NULL;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index a3cd7b3036c73..a929d090bb2f1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,7 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
-void xe_mmio_probe_tiles(struct xe_device *xe);
+int xe_mmio_probe_tiles(struct xe_device *xe);
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
 u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
-- 
2.43.0

