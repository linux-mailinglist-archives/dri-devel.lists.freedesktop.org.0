Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FC85A310
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04C410E366;
	Mon, 19 Feb 2024 12:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLt3fpKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD410E364;
 Mon, 19 Feb 2024 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708345205; x=1739881205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8q/iKoKJ0/dyQazJupN8Lkk7ELvskljaLFsC4ajg/Xs=;
 b=bLt3fpKU3uuB8ctxJd5g42QKapl0nXPTAWN5j/vbh0q6+OtgGy3k45ri
 0Jz6QLoP/ojAWAdUtGLd9SzpesXrEjHEcLbEIwZPuDHba1qYrAxSE1SP3
 +NlWlAtWpQft25HYFx1ZaXdyGTiwwOuro4pPkBVnLt0sPA2OFA7+XCTE9
 3vK4eVtxcPs/2AT0dWZTLKYPm3OI62i/FOadT0zQEgog53niMtN0/Jfna
 dhWeq6U8rStn3asn33ORbqRiGAef0Dva3zpYMuuG27T28bymgTjGjJu+X
 M+FqUIyCvJXOMM1vOskTsIMs8puOMa5mz6/GN2XmiEK7cGdfSpdTyI8Ls A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2553156"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2553156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 04:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4730238"
Received: from proe-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.22.52])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 04:20:04 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 2/3] drm/buddy: check range allocation matches alignment
Date: Mon, 19 Feb 2024 12:18:53 +0000
Message-ID: <20240219121851.25774-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219121851.25774-4-matthew.auld@intel.com>
References: <20240219121851.25774-4-matthew.auld@intel.com>
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

Likely not a big deal for real users, but for consistency we should
respect the min_page_size here. Main issue is that bias allocations
turns into normal range allocation if the range and size matches
exactly, and in the next patch we want to add some unit tests for this
part of the api.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f3a6ac908f81..5ebdd6f8f36e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -771,8 +771,12 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return -EINVAL;
 
 	/* Actual range allocation */
-	if (start + size == end)
+	if (start + size == end) {
+		if (!IS_ALIGNED(start | end, min_block_size))
+			return -EINVAL;
+
 		return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
+	}
 
 	original_size = size;
 	original_min_size = min_block_size;
-- 
2.43.0

