Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA90D4C3C5C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03D210E788;
	Fri, 25 Feb 2022 03:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652D310E742;
 Fri, 25 Feb 2022 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645759486; x=1677295486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6C6KQ9GE7a77/LXKfsCOHgoQc/o/FUNlvd6N9yJa18Y=;
 b=m2j1NGTnDgcKIeiIf3WlSGi74g32QyudhdIfIl74n8e0LSnluzDmBJdr
 xMwtEmOtyya6s5ShYBHcfa38ROAcv5WvQFA1HVlw3TMlHBS1yUfyPAwYp
 V4meIo97x2Fr+UUKxEIgACU2zfSMfq8ho+XEKBbmLUwI3jNn1kXT9QubJ
 82Njxrp9CmP6rvRxfAA2aja3G60tu4QdM7OjaV1mRQLsG3KEfGBPB4fLd
 1X5RSxuyxgigSuLwWGSuHPE86lkMFot67uxCXoz8M9DYqABnV60D6NTGj
 nv1tYE6Fcn6DbAJNECZR+NQ5eRTx7Wq7AXV3D5g37+BRxyszxmSxSYKer A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277044509"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="277044509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="638087446"
Received: from slwinche-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.212.150.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:40 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Thu, 24 Feb 2022 19:24:31 -0800
Message-Id: <20220225032436.904942-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225032436.904942-1-michael.cheng@intel.com>
References: <20220225032436.904942-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
performs a flush by first performing a clean, follow by an invalidation
operation.

v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
		    dcache. Thanks Tvrtko for the suggestion.

v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h

v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
		    symbol that could be use by other modules, thus use
		    caches_clean_inval_pou instead. Also this version
	            removes include for cacheflush, since its already
		    included base on architecture type.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index c3e6e615bf09..81c28714f930 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+
+#elif defined(CONFIG_ARM64)
+	void *end = addr + length;
+	caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
+
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
-- 
2.25.1

