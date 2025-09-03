Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4BB42CD7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91010E959;
	Wed,  3 Sep 2025 22:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DS8FEgIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E037C10E957;
 Wed,  3 Sep 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938969; x=1788474969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vlDihDHsg3XcpupxrZrq9m5FyjzPQyzETifuwwRAsdo=;
 b=DS8FEgIsSkslFN1kG8RaVqzYqUz3YwhQEghAZxrtPada0eU60uQVxcr2
 Lzq/nRyVtIuk8eUfLfweVt3STbZrp2xNBBGf916Mj7xtXMmCodlxBnqcW
 FhGuIQ/4leZgfAxvDhutQW97toiDbKaytf685BTJ4d9bclupHMCOTVnny
 0vPYW7PwjnfMeCD+CahMVHPBk7QXfsoAxy3YTuGIAUbx2ET9HUaALhkI7
 MoVMt3GCWJIm8oJ2xO8aA7mnWj1IbIrvg3azEkO16QYfjfnjgkWGGNOyV
 rlByH41xsVHygR6dslTXx0ePU59D1LW910D0csSoORMZNdC4GqFsGE/nG A==;
X-CSE-ConnectionGUID: GY8fj9K1SlSHiJHEvg4IQA==
X-CSE-MsgGUID: pNqe+YtBR8+iaTYRYD027g==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76715640"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76715640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:09 -0700
X-CSE-ConnectionGUID: 1b3VxoyaSLqBN8xWMtichA==
X-CSE-MsgGUID: flB5g9r4S1ebOoPmQhFpAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202570684"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while doing bind
Date: Wed,  3 Sep 2025 15:30:58 -0700
Message-ID: <20250903223403.1261824-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
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

If a BO's is_devmem_external flag is set, it means that it is an
imported dmabuf BO that has a backing store in VRAM. Therefore, in
this case, need to iterate over its dma_addr array.

v2:
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)

v3:
- Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
  remove the bo->is_devmem_external check added in v2

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c129048a9a09..ffeb88039808 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -755,6 +755,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+
+	if (bo && bo->is_devmem_external)
+		xe_walk.dma_offset = 0;
+
 	if (!range)
 		xe_bo_assert_held(bo);
 
@@ -765,6 +769,9 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo && bo->is_devmem_external)
+			xe_res_first_dma(bo->dma_addr, xe_vma_bo_offset(vma),
+					 xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.50.1

