Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E54C0C52
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 06:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E2610E984;
	Wed, 23 Feb 2022 05:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5542010E966;
 Wed, 23 Feb 2022 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645595945; x=1677131945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AD5IB1Lfku9eRUR3ytYZ4pov3SYDjYyCciBQj20OH0o=;
 b=BlogS+2TQZmZaZChSQKRkRtt9kopL2hwqrrJug3QxXs/llHMsHbPTc1f
 JLgMOarf8+aopr/ok8qPWAhhrd0JrH5ppZLCzJc8sPLQEys+DCR0Jh+mJ
 r8yUTpn/7cLuzpXFE14CJ3TBHzEKf2BPKHmQ7caNCRkpOoe9SJPcUffNQ
 D02FN+njApOEedKLF+8SH8Zc5HEa77halGTuzwUNVCtXvDYniTm1YPmko
 j2r4DVEcwQdnua6d6IvEdfmZK0Q/sPkzw7nEtusgWxBYYpzwqAbTdzEPT
 fmtmSwv3Lfx8zzK73q7sAfN1TDYzEGf3AMBOpmCsU2oa+jAAgRWCjhEix Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312606225"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="312606225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="706908152"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:04 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Tue, 22 Feb 2022 21:58:55 -0800
Message-Id: <20220223055900.415627-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223055900.415627-1-michael.cheng@intel.com>
References: <20220223055900.415627-1-michael.cheng@intel.com>
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
		    dcache. Thanks Tvrtko for the suggestion.

v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index c3e6e615bf09..f7b17e0d57f0 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -28,6 +28,7 @@
  * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
 
+#include <linux/cacheflush.h>
 #include <linux/cc_platform.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
@@ -174,6 +175,11 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+
+#elif defined(CONFIG_ARM64)
+	void *end = addr + length;
+	dcache_clean_inval_poc((unsigned long)addr, (unsigned long)end);
+
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
-- 
2.25.1

