Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E99D1BEC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706910E589;
	Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L//5PpjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FF510E56A;
 Mon, 18 Nov 2024 23:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973045; x=1763509045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JQ2v4LblLT+fySLDRUZtov1VGz24hLhWMPLpO5qV7M=;
 b=L//5PpjMoh5Z1YnuWpM2t9/gRsa+otX72/eCmCjDpAHdR0cZDNoVsKur
 xMp0nOYFH7Q0QWSN3oNjmc8VKzL7IHmZhWO0GWVxCiYFaCAkDDgGgM1bY
 NS6mZqO8/Yeg1UoSa0TKUc9TNbfgSjSSjy7iNmVy6DSM63C3L4ZP8Z77x
 Sn1zdS0G4D6eeXJ4YVJ59crJdbbRcpVcaMrZYZmlahLXIRgMpPcJ+dvOU
 EU1Fc3Q/wpfRzm87h1E7t4tFrDD9xkerGQE/iBYz4kZMshOyu9RDquUmw
 OPqFoIyRV3BOZ4o9hQqW7YGk8GEKtWdsvoYpiydA4XvOo3cyFtGF5NZEU Q==;
X-CSE-ConnectionGUID: u8x4zbPhT5WURgn0hiuVjA==
X-CSE-MsgGUID: 7Mjhz9S4RpGmV1qlSOOUIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878903"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:25 -0800
X-CSE-ConnectionGUID: UzH9G9ajT8+AP5GqCMyEBw==
X-CSE-MsgGUID: vNlK+HXTSR2th8L40QMryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 09/29] FIXME: drm/xe: Add pad to ring and indirect state
Date: Mon, 18 Nov 2024 15:37:37 -0800
Message-Id: <20241118233757.2374041-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Unsure why, but without this intermittent hangs occur on GuC context
switching.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e3c1773191bd..9633e5e700f6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -929,7 +929,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, ring_size,
+	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, SZ_32K,
 						    ttm_bo_type_kernel,
 						    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						    XE_BO_FLAG_GGTT |
@@ -943,8 +943,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
-		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm,
-							   LRC_INDIRECT_RING_STATE_SIZE,
+		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm, SZ_8K,
 							   ttm_bo_type_kernel,
 							   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 							   XE_BO_FLAG_GGTT |
-- 
2.34.1

