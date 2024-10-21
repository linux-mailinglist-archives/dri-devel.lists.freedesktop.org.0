Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5269A59E2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D484C10E403;
	Mon, 21 Oct 2024 05:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kddZtKhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82E10E2B4;
 Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489568; x=1761025568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F/EwoI+BvPXjVFIzZu/y+MNj+V6sPmr35F9RA9m36Ag=;
 b=kddZtKhNLAMiodknJucik5XxEw8sMLR47HFMz/NSa+M+vS8ZWpduXGcA
 1X+ExsWNKiyXpNZoZBVO1n/WMdrG5VEVbAb2doU2uGYTsVfAf3Hb91MSo
 DHLyrzg72J7K4DHNzg9EzOAl6BE6ytZCutmqBWZj9klcqq5RAaahw4S0+
 CvpSpvzZgNzRu97CXBMQamakHi2rC2iXUluupSEzY0VEQibyLExF9lA4t
 uPd71T4Af+lmFsqrtETa48DJXiZmzS0iqqtlpCZI0jolDD+AK3Mx5XE70
 s1RibWmLFLgsOUgIaiNIgzPDxw75ck9EER3mekWnYbD8FUf73za+lFnt0 A==;
X-CSE-ConnectionGUID: OBqQIRs6QwGw5/3Z9Od0Gg==
X-CSE-MsgGUID: BuvTmF8eQCOo+kHkZEtijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345944"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345944"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:07 -0700
X-CSE-ConnectionGUID: 6MjquqNLSuW1nSLkZ7q0fg==
X-CSE-MsgGUID: LJfOjRWMQCKxIuiVGBtMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180220"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:06 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v2 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while updating PTEs
Date: Sun, 20 Oct 2024 22:21:33 -0700
Message-ID: <20241021052236.1820329-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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
imported dmabuf BO that has a backing store in VRAM. Therefore, we
need to add XE_PPGTT_PTE_DM to the PTE flags as part of vm_bind.

v2:
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f27f579f4d85..cfa11acbf525 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -660,10 +660,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
 	}
 
-	if (is_devmem) {
+	if (is_devmem || bo->is_devmem_external)
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
+
+	if (is_devmem)
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
-	}
 
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
@@ -677,6 +678,9 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo->is_devmem_external)
+			xe_res_first_dma(bo->dma_addr, xe_vma_bo_offset(vma),
+					xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.45.1

