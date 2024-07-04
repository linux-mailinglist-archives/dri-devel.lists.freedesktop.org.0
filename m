Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0A9271D0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96EA10EA2C;
	Thu,  4 Jul 2024 08:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNzfHG48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451110EA28;
 Thu,  4 Jul 2024 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720082030; x=1751618030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Thy6zaUqG5YAAIY5KSmHUzdZXZb8avjUYaTT0fJ550=;
 b=DNzfHG48zN7gV/wxbg3iVZjirA5fdB0j8aUVvHOUzy1rYswf0SqVpQTe
 ETeUkVxqg8AbD8KWn40z8lM1vkHv11GISfk1iyQU5ArrO+G47ubs4OT8D
 635GlX/vmizRR/M6eaYRt9G1VemGQ0BuicgymozbObsWWkvrAiofkmmyx
 jAiMcK7M1s3hQ//c7+B03v92l4MX3lMTceNuC432BGfCRJi0El9pBI8PI
 w82luksMR4+NdcZGyLrXUnskFZZERfYbIYMD8bLXxSWF2pg1KR/hH1RB7
 m+DG1xJ5gZdVn/KNhf5fhw4U8qUyvMiOKSnexvWKSyS5qZoyoYkgzpcpD A==;
X-CSE-ConnectionGUID: i0VhDVvERaSi64uO7W2Mvw==
X-CSE-MsgGUID: IsSel1ITQw+Tmes5Ye4foA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17297725"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17297725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:33:50 -0700
X-CSE-ConnectionGUID: vIKCSuXxSM+CsW5S6X/qqg==
X-CSE-MsgGUID: B3ErJcOoStqlyaFXNy3thw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51703502"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:33:49 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 3/4] drm/xe/migrate: Clear CCS when clearing bo on xe2
Date: Thu,  4 Jul 2024 10:18:40 +0200
Message-ID: <20240704081841.30212-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240704081841.30212-1-nirmoy.das@intel.com>
References: <20240704081841.30212-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Clearing bo with uncompress PTE will trigger a CCS clearing as well
for XE2, so skip emit_copy_ccs() when on xe2 when clearing bo.

v2: When clearing BO, CCS clear happens with all command as long
    as PTEs are uncompress.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e0a3f6921572..cc8beed2bf8e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1061,7 +1061,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
+			/* Use uncompressed pte so clear happens in the real memory. */
+			emit_pte(m, bb, clear_L0_pt, clear_vram, false,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
@@ -1070,7 +1071,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
-		if (xe_device_has_flat_ccs(xe)) {
+		/* Clearing BO with uncompress PTE will clear CCS metadata as well on XE2 */
+		if (xe_device_has_flat_ccs(xe) && clear_ccs &&
+		    !(clear_bo_data && GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
-- 
2.42.0

