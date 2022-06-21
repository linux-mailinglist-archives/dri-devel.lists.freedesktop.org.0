Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D9553019
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE0610FE3F;
	Tue, 21 Jun 2022 10:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A19910FDF9;
 Tue, 21 Jun 2022 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808422; x=1687344422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bY2x4Zz2O+LBM0US9V2QcIb64Gqi8kU1ncs8pLllAVk=;
 b=HkAJ/vj9w6qqhjoUBPKJ7Vr1yxLrjhFbYYO+v9JgzeRaoWrc3NV6da7L
 iwjOPeXVE2Yr2Tz/ca2SCOnzPFo51U807Btywqs/GZsjefO0Ue17r5vx/
 C5tSCYa5yXuSoYD+slbnKms+JDQkeDbymedKylzkAc136mNToxhVeh9J0
 i33YVohheJa6eEp0plGFyDs6UTOC/bFo6zJfEThl/xeKEnmlCGemle0fq
 YuPz0YtW7rm3ME8XslAnIJ/KJXzncpL2Pc3ZbSK6xcGQEMLi1zAlWt3S1
 RlZtwCukkxtEUHj1S8lz49p4Cy/dwv/DCJTI/jnhGw0hooIGhB/R3QIiU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121970"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:47:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327156"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:47:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/12] HAX: force small BAR on dg2
Date: Tue, 21 Jun 2022 11:44:34 +0100
Message-Id: <20220621104434.190962-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
index 82c3d2d0f0e0..62c3f8185852 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -138,6 +138,11 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
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
2.36.1

