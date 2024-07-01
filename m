Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E791E430
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 17:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA02B10E46D;
	Mon,  1 Jul 2024 15:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfyB9mGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C596710E46B;
 Mon,  1 Jul 2024 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719847968; x=1751383968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jIaRGhvMWC9ufrpJaoIGyqXL+AVJyFNpk8bCpCdGlxY=;
 b=DfyB9mGjApt6oQfTgq7rAGKnlmP8SO81gO2gExZwYETtQnqDphauEDzv
 zMB+Mf3OzRC4XIwgnraOqoeCEgnud7zqUKRsGB/k4ydxTQXF6ePtkg0P3
 DAaG97BXzJ/T0C1r1gROtu/4ODGn6IN/EZDvp3089tiYZ+rZsSvkj5l1K
 emX9VwSO9zn+ADtiIqxJ6GQITjjNj3Bh9REyn+AWngHgGgkWSHojqUSK/
 h+Vee2NVEf9hNxBd6iTfsS9ofqfUt193iKue4fEym6J71E6d8bh8XUGw9
 U9Jc2MDkYq3URRz/j6CHpafGnVwK3JhyyJ8nxEhZnSwumB6Yw4lJDHwkf Q==;
X-CSE-ConnectionGUID: VpZO45PmSyGi70+zzjBTqg==
X-CSE-MsgGUID: 7Pm4jLfuSpaTCdEEPReXjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34527123"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34527123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:48 -0700
X-CSE-ConnectionGUID: VHWU+VTMTJ2Z/81Wk9vt/g==
X-CSE-MsgGUID: fY3qF4vTR3yEZUP6E5HZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="49912436"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:44 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 3/4] drm/xe/migrate: Clear CCS when clearing bo with
 XE_FAST_COLOR_BLT
Date: Mon,  1 Jul 2024 17:17:37 +0200
Message-ID: <20240701151738.6749-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240701151738.6749-1-nirmoy.das@intel.com>
References: <20240701151738.6749-1-nirmoy.das@intel.com>
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

XE_FAST_COLOR_BLT will clear out CCS meta data when clearing bo with
uncompress PTE, so skip emit_copy_ccs() when XE_FAST_COLOR_BLT is used
to clear out a bo.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e0a3f6921572..140afd4b1231 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -971,6 +971,13 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
 		return XY_FAST_COLOR_BLT_DW;
 }
 
+static bool can_fast_color_blt_cmd_clear_ccs(struct xe_gt *gt)
+{
+	/* On XE2 XY_FAST_COLOR_BLT can clear CCS with uncompress pte */
+	return (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000) &&
+		emit_clear_cmd_len(gt) == XY_FAST_COLOR_BLT_DW;
+}
+
 static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 		       u32 size, u32 pitch, bool is_vram)
 {
@@ -1061,7 +1068,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
+			/* Use uncompressed pte so clear happens in the real memory. */
+			emit_pte(m, bb, clear_L0_pt, clear_vram, false,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
@@ -1070,7 +1078,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
-		if (xe_device_has_flat_ccs(xe)) {
+		/* XY_FAST_COLOR_BLT on uncompress PTE will clear CCS metadata as well */
+		if (xe_device_has_flat_ccs(xe) && clear_ccs && !(clear_bo_data &&
+		    can_fast_color_blt_cmd_clear_ccs(gt))) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
-- 
2.42.0

