Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A8DBD7D30
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13510E552;
	Tue, 14 Oct 2025 07:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1Y8Cj5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BB610E556;
 Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426040; x=1791962040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=El6NYrXPZJg2JthYHW5V9bH56p5bvPHuTCM1ObR1r+c=;
 b=P1Y8Cj5IogElRnDIdhPMMg2luWGZ3yL7QaSXOptDyQN4ohJFoNbgrBxZ
 Xi2ANO0iC+XJ0nYMfWGtiTlB2tn4fJWgFV5hqYZzZfk7jdMeA46Gw+T7M
 eJO8NIvlVZYcHtdgr3yLo5Nek+DVyi+2MxGm6vRfUEdW7HpR0T+8+QDqI
 sq4gw80gaHaZ1tKLelp1EUKH2pm74SES1pdZKsntQPytctIIZmnrwmUIr
 QE+c44646yAp0OAx4Mcy3Y3hcKEw3aFdT78rp7khOR1JHUyJDLiXUkdle
 +YT4DDGwrVqSBw8O1a14R8qufrIT4NC2cW1iv3RoBFPs8GBih0JVO7UuB Q==;
X-CSE-ConnectionGUID: zSnn666qRGqrQiqzBmJMSA==
X-CSE-MsgGUID: 33aHEPThQu2t1uv7MqhARQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257155"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:59 -0700
X-CSE-ConnectionGUID: QuIWljbRRoa26hMH3wExPA==
X-CSE-MsgGUID: 6uDrOax0QDiuA8AXvcj37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369878"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC 8/8] drm/xe/pt: Add an additional check for dmabuf BOs while
 doing bind
Date: Tue, 14 Oct 2025 00:08:58 -0700
Message-ID: <20251014071243.811884-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..5cc3775a3a12 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -759,6 +759,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+
+	if (bo && bo->is_devmem_external)
+		xe_walk.dma_offset = 0;
+
 	if (!range)
 		xe_bo_assert_held(bo);
 
@@ -769,6 +773,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
+		else if (bo && bo->is_devmem_external)
+			xe_res_first_dma(bo->dma_data.dma_addr,
+					 xe_vma_bo_offset(vma),
+					 xe_vma_size(vma), &curs);
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-- 
2.50.1

