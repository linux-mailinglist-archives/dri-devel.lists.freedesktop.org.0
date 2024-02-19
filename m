Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA585A30E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E302710E361;
	Mon, 19 Feb 2024 12:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwWISvid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A310E361;
 Mon, 19 Feb 2024 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708345204; x=1739881204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7JBRlvt+i6bh1/V8Jw81kJw0o9ZLt0D7L5GHyjg/Bqg=;
 b=jwWISvidh0xmS4TDq3RccbNMSY1FW591LuEp8Jt3U0+i2G07DsacKURI
 mSRZDaFh8aUPF4Y/Pi8YpQ5cpfJY53TVcRTrBcIONbQCYQQr95v+hXqjM
 L/o2g8ACeuzDWR8dGuV6tEC5La4/DHz0lMKr4dTGAguKiwCG9w4z3FptZ
 kJPM3/o2+6HtsbIpuznLSjL2di3dL4zn4FfTlGn4iCMzjuM+m5GZS6YAo
 OOcQw4zqFAD/JUwMmDYay9i2Quzs/DErTzMzeUOtF1u9pvwSqjUEHPqs6
 GB3VoSKLjdivoG1jnc3G/0XHudgGw+J7c3104Cx8jthYiveK07Xs7/KRg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2553153"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2553153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 04:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4730229"
Received: from proe-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.22.52])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 04:20:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/buddy: fix range bias
Date: Mon, 19 Feb 2024 12:18:52 +0000
Message-ID: <20240219121851.25774-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

There is a corner case here where start/end is after/before the block
range we are currently checking. If so we need to be sure that splitting
the block will eventually give use the block size we need. To do that we
should adjust the block range to account for the start/end, and only
continue with the split if the size/alignment will fit the requested
size. Not doing so can result in leaving split blocks unmerged when it
eventually fails.

Fixes: afea229fe102 ("drm: improve drm_buddy_alloc function")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org> # v5.18+
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index c4222b886db7..f3a6ac908f81 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -332,6 +332,7 @@ alloc_range_bias(struct drm_buddy *mm,
 		 u64 start, u64 end,
 		 unsigned int order)
 {
+	u64 req_size = mm->chunk_size << order;
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
 	LIST_HEAD(dfs);
@@ -367,6 +368,15 @@ alloc_range_bias(struct drm_buddy *mm,
 		if (drm_buddy_block_is_allocated(block))
 			continue;
 
+		if (block_start < start || block_end > end) {
+			u64 adjusted_start = max(block_start, start);
+			u64 adjusted_end = min(block_end, end);
+
+			if (round_down(adjusted_end + 1, req_size) <=
+			    round_up(adjusted_start, req_size))
+				continue;
+		}
+
 		if (contains(start, end, block_start, block_end) &&
 		    order == drm_buddy_block_order(block)) {
 			/*
-- 
2.43.0

