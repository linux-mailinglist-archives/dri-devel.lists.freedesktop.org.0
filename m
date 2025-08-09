Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5087B1F4D2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 15:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038A10E2D3;
	Sat,  9 Aug 2025 13:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kax2AiaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B0E10E1E9;
 Sat,  9 Aug 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754747541; x=1786283541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iX+aI4EV6aIpB48ENfwpl4TWhZJPqVgs0W+CzzXlU1w=;
 b=kax2AiaMp09Abvbp8lxeJVf4phD/yBZ/+qQ8Il2ipjfAVYAymqBqujM4
 c4VGkOSi9G+sCM35h80sZ2w7Si5MCMhlO2oIn9d79EwH3NMFVpw0Girq8
 EPIGyzLljvtf5cHQuXSU85X+BPidX1EDbK5d9iOHZkZeCEVkWXfR52TVj
 oHb8xBU0rCR8I6UA5Qo929N8H8O4effvsaMseOy/cNK9SEkV1VXqvzmOn
 gG4KyEkKTwHAMYGuHKea9zcH4A8CBtMSBIMxg/mjx1ziABvXM2pFDeNVf
 wmQ7tAhPmtmsafvlspoPlaAs5+yjza/2ZIrZY9kP4xqFbU0FhuX2NHg4f Q==;
X-CSE-ConnectionGUID: OStopCwhSnedMzWVsRk99g==
X-CSE-MsgGUID: uZ4oYVY/STCwcwKNHWcuhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68153571"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68153571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:21 -0700
X-CSE-ConnectionGUID: gVHvHxq3SzW2byWIN5LLcw==
X-CSE-MsgGUID: 7NQBfY0hQGygQt3TnI1X/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165903763"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/6] drm/xe: Skip waiting on unarmed fences in
 xe_gt_tlb_invalidation_fence_wait
Date: Sat,  9 Aug 2025 15:51:35 +0200
Message-ID: <20250809135137.259427-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Avoids unnecessary waits when the TLB invalidation fence has not been
armed, simplifying caller logic in cases where the fence status is
uncertain.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index f7f0f2eaf4b5..c6d4398d3429 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -34,7 +34,8 @@ void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fe
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 {
-	dma_fence_wait(&fence->base, false);
+	if (fence->seqno)
+		dma_fence_wait(&fence->base, false);
 }
 
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
-- 
2.50.1

