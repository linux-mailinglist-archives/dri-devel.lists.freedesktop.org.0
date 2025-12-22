Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56824CD4D40
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 07:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D471610E532;
	Mon, 22 Dec 2025 06:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXO4YXvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC2910E0D5;
 Mon, 22 Dec 2025 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766386571; x=1797922571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4o3MLDjhs8HBtUDlk7Uncz4ELgrnioUNF8VonMMMyFE=;
 b=UXO4YXvRtJpShoDdyfS2buzaUgD3IdqNrBtWQed+H1vuxQqO5fZRUJhR
 h8Jnp2f3ZzS1W+lP1dCzUpSmNem7UghtDNFd8gkUpVkwdPSp1u3g5EIh6
 IhjCb0lWg8euafJOMhL/ijWmRt/MPXi7qYuuUeAfZ29oAEe7Emb54oNMZ
 Hv+ivNpAa27GBY1ohN5M0ZwzGHqaXHrsDsK+1JMiGeSnpB6ELuPkgBk/S
 U+AooPRafxjs+XirV+7xRDwlNMGbREiBSE9/hJXPHTsohZ5FSzfMLviur
 ve2J8GextdRhz5oThRTzk0TYbs41x94XoJz3+xOTkfZEaT1410omiRWPc A==;
X-CSE-ConnectionGUID: sRx5pRtJRk+4Wa2Nz7gQnQ==
X-CSE-MsgGUID: s9BSbKERQvKNwqkxWFtQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55814294"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="55814294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:11 -0800
X-CSE-ConnectionGUID: lTKtHT+KSd6k3kO8S8V/HA==
X-CSE-MsgGUID: 4qMI8R2GTCifK27+h+BFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="198688082"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:10 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/buddy: Prevent BUG_ON by validating rounded allocation
Date: Mon, 22 Dec 2025 12:22:40 +0530
Message-ID: <20251222065238.1661415-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
rounded up to the next power-of-two via roundup_pow_of_two().
Similarly, for non-contiguous allocations with large min_block_size,
the size is aligned up via round_up(). Both operations can produce a
rounded size that exceeds mm->size, which later triggers
BUG_ON(order > mm->max_order).

Example scenarios:
- 9G CONTIGUOUS allocation on 10G VRAM memory:
  roundup_pow_of_two(9G) = 16G > 10G
- 9G allocation with 8G min_block_size on 10G VRAM memory:
  round_up(9G, 8G) = 16G > 10G

Fix this by checking the rounded size against mm->size. For
non-contiguous or range allocations where size > mm->size is invalid,
return -EINVAL immediately. For contiguous allocations without range
restrictions, allow the request to fall through to the existing
__alloc_contig_try_harder() fallback.

This ensures invalid user input returns an error or uses the fallback
path instead of hitting BUG_ON.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 2f279b46bd2c..5141348fc6c9 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -1155,6 +1155,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	order = fls(pages) - 1;
 	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
 
+	if (order > mm->max_order || size > mm->size) {
+		if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
+		    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+			return __alloc_contig_try_harder(mm, original_size,
+							 original_min_size, blocks);
+
+		return -EINVAL;
+	}
+
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
 		BUG_ON(order > mm->max_order);
-- 
2.52.0

