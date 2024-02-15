Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F9856B70
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEA010E41C;
	Thu, 15 Feb 2024 17:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVhiXsVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2706310E349;
 Thu, 15 Feb 2024 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708019208; x=1739555208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=buAiuefRHwWbEFIpK0sT1GYX6pLKRgPn9ZYVE986lHk=;
 b=HVhiXsVMDPlzpiiQtE4ecjxkY7kwjIKrVtUYAeBilBEHrMJIs+Egao8V
 jODvsJcYnr2bnZued9dIX8i1gr8PZNSKq7bdP9JsWhPRikyHYttvvKdEN
 mSuuEDP7UzbmC+Z2/L9pk34f9LnmGx+oSz3KwdDra/zAj5LaFAg+7+hzl
 65bLvrqGst+tiJ7MZV5JgDKTQZjIujErs4A/kRGrucdNV9piFSBOO8iQU
 U29DVc3XiRK6kOlIqI6OIsexyROypsIcg4Y7TX1+YW6SdK/LTuNfW8w0f
 9/9xg7aQxbcFxSUhYEiuhZbpjv2u/3Aw1xSSbK8QXIv5gWyTcCvA+Stya g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13514005"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13514005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3892094"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 3/6] drm/buddy: check range allocation matches alignment
Date: Thu, 15 Feb 2024 17:44:34 +0000
Message-ID: <20240215174431.285069-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/drm_buddy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d09540d4065b..ee9913016626 100644
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

