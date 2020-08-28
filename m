Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BE256646
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00DC6EB92;
	Sat, 29 Aug 2020 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7E66E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 16:12:16 +0000 (UTC)
IronPort-SDR: 8e4/a1RWWROJncmaM+q7oO/e9phrYYnz+o/oajj5+RYkIR3DiJfVZDrV5/cCuH6AkA3Wob8oLv
 ZyaFYLNt0uzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="144366274"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="144366274"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:12:15 -0700
IronPort-SDR: 7uGZ+Phx7vPs4qTtXb1wKBAPnde1Fjh3Bdb+SYl7w5lX+RLSkMAfVYApOGWzt+EW2eln3HXxTZ
 ovDOOeyUZhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="324061620"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2020 09:12:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 88A84166; Fri, 28 Aug 2020 19:12:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v1] iommu/vt-d: Move intel_iommu_gfx_mapped to Intel IOMMU
 header
Date: Fri, 28 Aug 2020 19:12:11 +0300
Message-Id: <20200828161212.71294-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Static analyzer is not happy about intel_iommu_gfx_mapped declaration:

.../drivers/iommu/intel/iommu.c:364:5: warning: symbol 'intel_iommu_gfx_mapped' was not declared. Should it be static?

Move its declaration to Intel IOMMU header file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/intel-gtt.h     | 5 +----
 include/linux/intel-iommu.h | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index 71d81923e6b0..abfefaaf897a 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -5,6 +5,7 @@
 #define	_DRM_INTEL_GTT_H
 
 #include <linux/agp_backend.h>
+#include <linux/intel-iommu.h>
 #include <linux/kernel.h>
 
 void intel_gtt_get(u64 *gtt_total,
@@ -33,8 +34,4 @@ void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries);
 /* flag for GFDT type */
 #define AGP_USER_CACHED_MEMORY_GFDT (1 << 3)
 
-#ifdef CONFIG_INTEL_IOMMU
-extern int intel_iommu_gfx_mapped;
-#endif
-
 #endif
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 64fa5c56c825..fbd3bb64649b 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -794,6 +794,7 @@ extern int iommu_calculate_max_sagaw(struct intel_iommu *iommu);
 extern int dmar_disabled;
 extern int intel_iommu_enabled;
 extern int intel_iommu_tboot_noforce;
+extern int intel_iommu_gfx_mapped;
 #else
 static inline int iommu_calculate_agaw(struct intel_iommu *iommu)
 {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
