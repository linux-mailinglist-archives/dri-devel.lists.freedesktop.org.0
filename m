Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0855BB55
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1539210ED91;
	Mon, 27 Jun 2022 17:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5410ED91;
 Mon, 27 Jun 2022 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656351241; x=1687887241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=69MSIooKxSLSFl+Jsrjcuej66y+sEEaV4Fek0gsuUQw=;
 b=mmY/CiXX6mnluLGS+xJjyw016zGnxlWcTP7+zKaQMhgo33IMFesW7Zfl
 jWRUsF67pKo6hCtQlZP0+zD9ysTUEm/AK4i0oPPVfa0U+WcJo4r0hUpOb
 8OpR639KBT0uQB9QxE4r11ZGh6FJ5k3bbu2ygimEAs6DM2VQ1UpLH1KWB
 YIIAdY/l3mbY3/3n3bCUoOCAkvxPhHnnAlJf2RT/5ZxphHQyqBcrVcSWd
 fT6oW3Z9nxLNI7RKiwjy5TqQ3wLcC5HnUJvKZR4PxPfYTVSFTf66mI57q
 +aAEr7AdPYrow3UjEVzn26sfrx9qpOE0ARwslBj8eKoYfZpROPtTRPEfL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="261930146"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="261930146"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:34:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="836290079"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:33:59 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gt: handle null ptr at sg traversing
Date: Mon, 27 Jun 2022 23:05:39 +0530
Message-Id: <20220627173539.29094-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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

When calculating the starting address for ccs data in smem scatterlist,
handle the NULL pointer returned from sg_next, incase of scatterlist
less than required size..

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 2c35324b5f68..c206fb4f4186 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -669,7 +669,7 @@ calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
 	}
 }
 
-static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
+static int get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
 {
 	u32 len;
 
@@ -684,9 +684,13 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
 		bytes_to_cpy -= len;
 
 		it->sg = __sg_next(it->sg);
+		if (!it->sg)
+			return -EINVAL;
 		it->dma = sg_dma_address(it->sg);
 		it->max = it->dma + sg_dma_len(it->sg);
 	} while (bytes_to_cpy);
+
+	return 0;
 }
 
 int
@@ -745,8 +749,11 @@ intel_context_migrate_copy(struct intel_context *ce,
 		 * Need to fix it.
 		 */
 		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
-		if (ccs_bytes_to_cpy)
-			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
+		if (ccs_bytes_to_cpy) {
+			err = get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
+			if (err)
+				return err;
+		}
 	}
 
 	src_offset = 0;
-- 
2.20.1

