Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBAC0BC99
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 05:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C422410E353;
	Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsgaPc7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08D10E343;
 Mon, 27 Oct 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761540518; x=1793076518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpNpP4igbgJE1ENVyl0vrsAZY8ZQDHHa5vxQ6v2GkUA=;
 b=ZsgaPc7YzKUbOuldKcp8/t0dc1HG9xqyBE24aouNstOWm0SJKLdrvlTp
 Csa9j7oJ/xZVIqt5pQhHy/WnOkJiXr9tKDdVjfNQwv4tFmBv4GuWkO9WH
 GwVlMPhOQmdsrEtUQtmb7Uw7r/E5jm3wekMAVTtnZ7FeRGRGwVbs+lh5F
 pRUmEtX+tBlOQzG1f78aSfOniglxMcP/lRnqv5HduJXdBKIl6UsYknWwg
 r4HhEfjXErjo8QDuoIvSR/rXXDpTjwhVk3YJGe4JVcWw0Ot6tnauaEfYh
 9URc0AUUGXZxumhaoJ5rRnX7MA4BvVyaaE0anhkv+SXV84HJOtTVe30EP g==;
X-CSE-ConnectionGUID: f/cZugjDQgGeDhbA06gbmA==
X-CSE-MsgGUID: 3uxM+/2IS7yxQasXc8amPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63515636"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63515636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:38 -0700
X-CSE-ConnectionGUID: Lko4oLJ9S+Kh+PdIAj6/MA==
X-CSE-MsgGUID: ktT8FzxXTZGiGU51hjHpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="188993000"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 8/8] drm/xe/pt: Add an additional check for dmabuf BOs while
 doing bind
Date: Sun, 26 Oct 2025 21:44:20 -0700
Message-ID: <20251027044712.1676175-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
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

If a BO's dma_data.dma_addr pointer is valid, it means that it is
an imported dmabuf BO that has a backing store in VRAM. Therefore,
in this case, we need to iterate over its dma_addr array.

v2:
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)

v3:
- Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
  remove the bo->is_devmem_external check added in v2

v4:
- Drop is_devmem_external and instead rely on bo->dma_data.dma_addr
  to check for imported VRAM BOs (Matt)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..18f959247e8d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -759,6 +759,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+
+	if (bo && bo->dma_data.dma_addr)
+		xe_walk.dma_offset = 0;
+
 	if (!range)
 		xe_bo_assert_held(bo);
 
@@ -769,6 +773,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo && bo->dma_data.dma_addr)
+			xe_res_first_dma(bo->dma_data.dma_addr,
+					 xe_vma_bo_offset(vma),
+					 xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.50.1

