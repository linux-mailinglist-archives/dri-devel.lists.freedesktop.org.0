Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6365D1C31E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 04:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5BF10E214;
	Wed, 14 Jan 2026 03:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l++VmAaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75010E213;
 Wed, 14 Jan 2026 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768359876; x=1799895876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=54hOa1aigzaT/Ynyvhom+DsVGvswEPHDeqxOl2KkXts=;
 b=l++VmAaENWht9GpBUq/zrgzrKx16IEedIP+n+TVkbb8Ct5s6710wVqLB
 DQLdCqhQPrdZ0/nbcQ9EGSXMtsgKNwtcB0d8brU/nGHwcApCCfbz9L9M2
 NxK2ghK89zoW3gqzqLL116ncV7HOQXFSD/CoHn4wM027ePQZQBsrF6CkH
 f+O12jN/Ggwq2I1+VR5u9LsNClMF5jdDRb+kyjKwnxmb1Nd5w/wb/8DVy
 wMpzWJUOz50yPMVqEVhcTHt18XBcrqzuxOA1IsxEr+lkqMPavgf9auE9t
 1W2TdpCps4jYKY+Rpie0D8vfrUNzdjSUVomidu8oxuFN2lUO9BrvcA/eF Q==;
X-CSE-ConnectionGUID: 6EgEU1oqRiafb1NfuPxq1g==
X-CSE-MsgGUID: z0Yhoc/XRBuUB2opC/3KIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69706002"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="69706002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:04:36 -0800
X-CSE-ConnectionGUID: 6hA0aO+yTqWOd+sf/UVfmA==
X-CSE-MsgGUID: bdyAbgwTSAiDB/8VwjNYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204829332"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 19:04:33 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH v3] drm/i915/bios: Use get_unaligned_* for VBT block size
Date: Wed, 14 Jan 2026 08:31:45 +0530
Message-Id: <20260114030145.3039094-1-kaushlendra.kumar@intel.com>
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
v3: Update all instances in file, not just _get_blocksize

 drivers/gpu/drm/i915/display/intel_bios.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4b41068e9e35..91286fafa52b 100644
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
@@ -1791,9 +1792,9 @@ find_panel_sequence_block(struct intel_display *display,
 
 		current_id = *(data + index);
 		if (sequence->version >= 3)
-			current_size = *((const u32 *)(data + index + 1));
+			current_size = get_unaligned_le32(data + index + 1);
 		else
-			current_size = *((const u16 *)(data + index + 1));
+			current_size = get_unaligned_le16(data + index + 1);
 
 		index += header_size;
 
@@ -1833,7 +1834,7 @@ static int goto_next_sequence(struct intel_display *display,
 			if (index + 4 > total)
 				return 0;
 
-			len = *((const u16 *)(data + index + 2)) + 4;
+			len = get_unaligned_le16(data + index + 2) + 4;
 			break;
 		case MIPI_SEQ_ELEM_DELAY:
 			len = 4;
@@ -1879,7 +1880,7 @@ static int goto_next_sequence_v3(struct intel_display *display,
 	 * includes MIPI_SEQ_ELEM_END byte, excludes the final MIPI_SEQ_END
 	 * byte.
 	 */
-	size_of_sequence = *((const u32 *)(data + index));
+	size_of_sequence = get_unaligned_le32(data + index);
 	index += 4;
 
 	seq_end = index + size_of_sequence;
-- 
2.34.1

