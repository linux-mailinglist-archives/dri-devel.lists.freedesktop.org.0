Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DEAAA1C0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF0810E55E;
	Mon,  5 May 2025 22:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pGB+BLCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2310E55D;
 Mon,  5 May 2025 22:51:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD3EB4A226;
 Mon,  5 May 2025 22:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11700C4CEE4;
 Mon,  5 May 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485490;
 bh=2ceJD08yP8wgB+0CCl0SfGxjXpS17on4ocWe/k5HT0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pGB+BLCZjylOvlxmaKInG9Ty+JxrugtN8I0B7vS1qgkR86Uj2GDGnToWxPuIJf94R
 55qYtqAyccpWj5YUB8s5ggGSF10bRrrC6+z4VdRlVl+E7+/mQZjkc6yiY+CkwAj3Uc
 9d//JNQW7TG+MH7O619XDXYRtIUGZPIYrqOzc1ro6dNnv8PITMKpal++7UM6C7W+yJ
 WKMYcHnF8xlia9Z1kIr8y/jzylSyX8Q9LeVOD868LE3g9AhD3s3yDTIdqardSwezXJ
 3p8NV1zqcMKIhego+yH0m4uCz3jYYPKRyMmL9vwzpLPGSgHNxNtuS3s4feCsFIZ+XU
 4uY/HQZwBspiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 343/486] drm/xe: Stop ignoring errors from
 xe_ttm_stolen_mgr_init()
Date: Mon,  5 May 2025 18:36:59 -0400
Message-Id: <20250505223922.2682012-343-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

[ Upstream commit ff57025c358603555f1e0ae0d50282a460433594 ]

Make sure to differentiate normal behavior, e.g. there's no stolen, from
allocation errors or failure to initialize lower layers.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213192909.996148-5-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_device.c         |  4 +++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bb85208cf1a94..5c37bed3c948f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -694,7 +694,9 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
-	xe_ttm_stolen_mgr_init(xe);
+	err = xe_ttm_stolen_mgr_init(xe);
+	if (err)
+		return err;
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f7113cf6109d5..ef84fa757b26f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -201,17 +201,16 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 #endif
 }
 
-void xe_ttm_stolen_mgr_init(struct xe_device *xe)
+int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
-	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_ttm_stolen_mgr *mgr;
 	u64 stolen_size, io_size;
 	int err;
 
-	if (!mgr) {
-		drm_dbg_kms(&xe->drm, "Stolen mgr init failed\n");
-		return;
-	}
+	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		return -ENOMEM;
 
 	if (IS_SRIOV_VF(xe))
 		stolen_size = 0;
@@ -224,7 +223,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (!stolen_size) {
 		drm_dbg_kms(&xe->drm, "No stolen memory support\n");
-		return;
+		return 0;
 	}
 
 	/*
@@ -240,7 +239,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 				     io_size, PAGE_SIZE);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
-		return;
+		return err;
 	}
 
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
@@ -248,6 +247,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (io_size)
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
+
+	return 0;
 }
 
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 1777245ff8101..8e877d1e839bd 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -12,7 +12,7 @@ struct ttm_resource;
 struct xe_bo;
 struct xe_device;
 
-void xe_ttm_stolen_mgr_init(struct xe_device *xe);
+int xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
 bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
-- 
2.39.5

