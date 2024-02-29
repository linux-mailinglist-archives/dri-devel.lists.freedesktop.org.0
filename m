Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064386C752
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240810E44D;
	Thu, 29 Feb 2024 10:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMdt1CAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C710E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203890; x=1740739890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3WQSRqxLw18WBzronQSjlGB4MOiOcScjwnOgzxObU0M=;
 b=ZMdt1CAk7cZUNsNuoPloxdRlRmu+rALWw4m4+mldJmW2D08LISk1R9Cs
 UqnYYTVQkPqu2/onHHPYcRzetv4A8GsFXFo5ppAmQk7t4wIhF5Q3IfG5N
 KIgDqCTpfRNif0X6zFMIJl5hDl/eVQN7Nn3d9IHD0ew7SOD9ot2o56YPo
 z9nfV/jbNPOs0Pls2i5Ym5qwedlK2621x6EO6w+LTbm6qRDdeB4EmXs/c
 KxDbPqF+zuE28p5u2U3w0juUXdrSx2kFYHEr/TPj6jaevjvfuC17toMGQ
 IvSzg6eRRFz4wRnPxMno+0bz15aGI2A1rnVU7qAwL6roX4SV0dy1RsIJ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7486695"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7486695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38824197"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:51:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
Date: Thu, 29 Feb 2024 10:51:13 +0000
Message-ID: <20240229105112.250077-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
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

The drm_buddy minimum page-size requirements should be distinct from the
CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
least 4K.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 include/drm/drm_buddy.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 5ebdd6f8f36e..f999568d69c1 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -102,7 +102,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 	if (size < chunk_size)
 		return -EINVAL;
 
-	if (chunk_size < PAGE_SIZE)
+	if (chunk_size < SZ_4K)
 		return -EINVAL;
 
 	if (!is_power_of_2(chunk_size))
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index a5b39fc01003..19ed661a32f3 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -53,8 +53,8 @@ struct drm_buddy_block {
 	struct list_head tmp_link;
 };
 
-/* Order-zero must be at least PAGE_SIZE */
-#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
+/* Order-zero must be at least SZ_4K */
+#define DRM_BUDDY_MAX_ORDER (63 - 12)
 
 /*
  * Binary Buddy System.
@@ -82,7 +82,7 @@ struct drm_buddy {
 	unsigned int n_roots;
 	unsigned int max_order;
 
-	/* Must be at least PAGE_SIZE */
+	/* Must be at least SZ_4K */
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
-- 
2.43.2

