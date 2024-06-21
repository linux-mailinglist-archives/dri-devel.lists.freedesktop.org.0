Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A574911C92
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AC310EAF2;
	Fri, 21 Jun 2024 07:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJDUSyJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1510EAF4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718954075; x=1750490075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yn32gGIVps1x9tBMGupKS4NW2Y3heciZ/sT0E1Rmt30=;
 b=OJDUSyJVXzju8Knd60wexbMPxy0ygTt3hftUdfOao8RzuydEAMOQ7isS
 DE+5A47vsYu6D0XJSzpuuttwYsjHwtxb2zOAM/OJhcdYkEChpt02LRhbZ
 7Cxf3l6SgXNgyjFfQKbo75w2mAQXPpQXIBs6xkibrlsn9mtN4xPPH6iBo
 OrJUdLwrfqQGZ8QbjSnXaQ1F+lKcy1yAeIowTOcyhjhSUomxUNTlHmoVX
 WWbGlxQ+S6YzViFF6dg0BD58xsnAySHVTGqEJzyfbuPtHKL0xeQLSElGx
 9PjVJQWovjTqWt1YyuIPk+AlllNcCqtBclxGqPL1zHh3mJnh7Nb6gGSC8 A==;
X-CSE-ConnectionGUID: QyUBEADCSJSd6tGJWuCNCQ==
X-CSE-MsgGUID: U2IGYMrcQaCmz/gs7extgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27380950"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="27380950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 00:14:34 -0700
X-CSE-ConnectionGUID: AsXnT/uUT4ufyEG352NSkg==
X-CSE-MsgGUID: NQ5t9pCoTAiBk6VX+QyaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42417225"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa010.jf.intel.com with ESMTP; 21 Jun 2024 00:14:34 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: 
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v1 1/1] drm/xe/bo: Fix fixed placement ggtt pinning code
Date: Fri, 21 Jun 2024 00:14:30 -0700
Message-Id: <20240621071430.912019-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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

When calling xe_bo_create_pin_map_at, use the correct
starting offset provided by caller at xe_ggtt_insert_bo_at.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..cc6101b49c08 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1436,7 +1436,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
-						   start + bo->size, U64_MAX);
+						   start, end);
 		} else {
 			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
 		}

base-commit: cffd77865f476994680892601e09bc2164179907
-- 
2.34.1

