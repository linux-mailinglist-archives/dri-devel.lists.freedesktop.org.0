Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21E534351
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382A310ED87;
	Wed, 25 May 2022 18:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF410ECA6;
 Wed, 25 May 2022 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504259; x=1685040259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4J4t1qvB/uMKF0Ub2PlgyHa1foi8UAB5a2WwZGBV24=;
 b=aRtVCwFHttIse/BOj2sGkf7hp3htdZnnDhs1fN/gXUSSA979lpu4QLz2
 f4QFV+4lU20ZZywuYryMikbeEOChR3XZozf5zXT9U2VxzIY3FIsDtYVRf
 rU00uKSBAfC6rmbIuby3lumjHbmQfQ7RcWhrrq8lSXHvN4izhSLVhFPa4
 uP0cx7Oqm6dS9yrj0YjEY3/gjA+Pcmk3wYDAWNKIWgSqIvjbSB6Y2Vlw6
 KGFWwBqgorygmic67tTGU4LySn4jJvg4pl8/+Dy/JlEajeecVnGsn1Pjd
 nQLiVzlejVE3H4UUS4Nq+QfhL+cJ4mCQg7b7KALUu8nccoaOdyuTuKvHl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360296726"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="360296726"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="578465327"
Received: from daithiby-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/10] HAX: force small BAR on dg2
Date: Wed, 25 May 2022 19:43:37 +0100
Message-Id: <20220525184337.491763-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220525184337.491763-1-matthew.auld@intel.com>
References: <20220525184337.491763-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just for CI.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 6c6f8cbd7321..119e53f5d9b1 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -137,6 +137,11 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!io_size)
 		return ERR_PTR(-EIO);
 
+	if (io_size == lmem_size) {
+		drm_info(&i915->drm, "NOTE!! Forcing small BAR for testing\n");
+		io_size = SZ_256M;
+	}
+
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
 						I915_GTT_PAGE_SIZE_4K;
 	mem = intel_memory_region_create(i915,
-- 
2.34.3

