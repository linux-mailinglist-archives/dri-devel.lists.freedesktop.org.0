Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5058AAA012
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387D10E4A9;
	Mon,  5 May 2025 22:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RkMEL8R8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D069510E4A7;
 Mon,  5 May 2025 22:31:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DFFD5C5513;
 Mon,  5 May 2025 22:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A366AC4CEED;
 Mon,  5 May 2025 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484288;
 bh=ZBwHAHoci1CN5jPJYMM0igKKNuqHeRDs1uAY+YiLzuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RkMEL8R8sX8ktq1tB4tHzqGgQtb6Gz+2oSYHZ7cHwFM3KzJeA4N+o+9shuuiaVZkb
 CLlef+sm67iQgt3ByfrYAy75fQSu2P/XMkME3cn/sMcmH5Lt/glVXR7XzYM1OUSklm
 NeUX4Sy26h4WB0vAlbmx8YgK2mij5Oi/3aAuLc812Z8uzP6pEuS7FqMjBGCaJwXmd7
 +N86bWSS0+wW5ZX8fl4UvB0MluSeIof9v18ZvrWQorm3qOcYonhSD/n6lnTWZ2LMeF
 LiiSfT7h5j5O3g2JwdwovM/fsKrNFVEprcI5oWbO1hk0EWKw7AflAIi9h0GkUZ1AF1
 Wd9mG2x7tevvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 436/642] drm/xe: Stop ignoring errors from
 xe_ttm_stolen_mgr_init()
Date: Mon,  5 May 2025 18:10:52 -0400
Message-Id: <20250505221419.2672473-436-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index 4e1839b483a00..e22f29ac96631 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -722,7 +722,9 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
-	xe_ttm_stolen_mgr_init(xe);
+	err = xe_ttm_stolen_mgr_init(xe);
+	if (err)
+		return err;
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d414421f8c131..d9c9d2547aadf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -207,17 +207,16 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
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
@@ -230,7 +229,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (!stolen_size) {
 		drm_dbg_kms(&xe->drm, "No stolen memory support\n");
-		return;
+		return 0;
 	}
 
 	/*
@@ -246,7 +245,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 				     io_size, PAGE_SIZE);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
-		return;
+		return err;
 	}
 
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
@@ -254,6 +253,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
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

