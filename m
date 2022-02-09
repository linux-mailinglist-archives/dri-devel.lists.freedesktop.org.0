Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91984AEA52
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 07:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C1410E2A3;
	Wed,  9 Feb 2022 06:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4341410E364;
 Wed,  9 Feb 2022 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644388229; x=1675924229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7JI3XGPrNkGttUQ6fNaRPKqI6ykmG6E2jJC1U5YtLM=;
 b=edCQ6McyqdhQxMHO+Y547tcjLuDCXIqGAL361jtRKsm0iGivzzEXIIhm
 Sn36PphwN7NwHB18Kzbzlx0cgUguLo2FVx8bdjiwi1FgrTuImu7HX91q7
 kfRwSgybPNwH93Pm4/kI78SO3igCgYBbK7vR6L1LkXNHGSBs0PyOfJ+yR
 w2eZtBHPg8KZL9vDmofqAbkGvow3YvUL4byKYnOPu5uuESOyy2/xGLKNr
 lzzULCIa7Udp4+7twrF+4qOS5nY1KkwNhL17aBhqAo92MYO1puUC+8N9Q
 qisVHSjhksvcU2RF/jzHyLhV7EGbvnxtNoXx1ySx93uprW/FeLdYWN4A3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248893154"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="248893154"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:30:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="585460758"
Received: from cdrhee-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.78.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:30:27 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Tue,  8 Feb 2022 22:30:18 -0800
Message-Id: <20220209063023.914205-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209063023.914205-1-michael.cheng@intel.com>
References: <20220209063023.914205-1-michael.cheng@intel.com>
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

Add arm64 support for drm_clflush_virt_range. dcache_clean_inval_poc
performs a flush by first performing a clean, follow by an invalidation
operation.

v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
		    dcache.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe959..94b3cc3fd482 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -39,6 +39,10 @@
 /* A small bounce buffer that fits on the stack. */
 #define MEMCPY_BOUNCE_SIZE 128
 
+#if defined(CONFIG_ARM64)
+#include <asm/cacheflush.h>
+#endif
+
 #if defined(CONFIG_X86)
 #include <asm/smp.h>
 
@@ -176,6 +180,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+
+#elif defined(CONFIG_ARM64)
+	void *end = addr + length;
+	dcache_clean_inval_poc((unsigned long)addr, (unsigned long)end);
 #else
 	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
-- 
2.25.1

