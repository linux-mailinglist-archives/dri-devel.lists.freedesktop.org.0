Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD1D176DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F7D10E23B;
	Tue, 13 Jan 2026 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETvbckT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162CB10E23B;
 Tue, 13 Jan 2026 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768294724; x=1799830724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X0uz5voiQ6/q5E6EMWVLTQsdnY25Kdkh6qQM59mbIFU=;
 b=ETvbckT5r/l4+Ete+5BVbIcMcG6M7S14/oPdFrt1XNYw+Lx/Aa/plRdJ
 t5UKX/A0og4OKkz/BnpnNoiZW2AesZZuDOkRzSx9ZFfzA6bd1lvdMfoT5
 IKG8UaOoIsVA282PwjCLmzrznOSnBROICWT1XIucyO14vGcXyWGZq16Vr
 OAUf/OrcC7b/Q08T38Bcvl3S7Qy0VKdR1M3ocWfyVQ+f5oJLxpM8aMc0z
 cCNbNfYYTiBFc04TQv4p+L7lGgfn3lEB/j8b1NTn+Z1SlH+NKAliXDJ0i
 16N36ivXJrFnowPjrsYRVik/aXpdGB4clDAoo9bpbg1Dc5KBpuAkFSo3P A==;
X-CSE-ConnectionGUID: UYmzjjX2QRqNi2DD7h+pGA==
X-CSE-MsgGUID: LvgYEryISkGrYYFGT4YitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73418128"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73418128"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:58:43 -0800
X-CSE-ConnectionGUID: 4t6dj3MhQI+csz7naSssxg==
X-CSE-MsgGUID: yx2nbwajQkenDY9RIM2Deg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235573029"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 00:58:40 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH v2] drm/i915/bios: Use get_unaligned_* for VBT block size
Date: Tue, 13 Jan 2026 14:25:53 +0530
Message-Id: <20260113085553.2736470-1-kaushlendra.kumar@intel.com>
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

Replace pointer casts with get_unaligned_* helpers for VBT
block size reads. This ensures endianness and alignment
correctness in VBT parsing.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
v2: Fix include ordering, as per review

 drivers/gpu/drm/i915/display/intel_bios.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4b41068e9e35..a4c0f8a605c4 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -27,6 +27,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/firmware.h>
+#include <linux/unaligned.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
@@ -85,9 +86,9 @@ static u32 _get_blocksize(const u8 *block_base)
 {
 	/* The MIPI Sequence Block v3+ has a separate size field. */
 	if (*block_base == BDB_MIPI_SEQUENCE && *(block_base + 3) >= 3)
-		return *((const u32 *)(block_base + 4));
+		return get_unaligned_le32(block_base + 4);
 	else
-		return *((const u16 *)(block_base + 1));
+		return get_unaligned_le16(block_base + 1);
 }
 
 /* Get BDB block size give a pointer to data after Block ID and Block Size. */
-- 
2.34.1

