Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6CC4B0218
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 02:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C010E233;
	Thu, 10 Feb 2022 01:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C510E3C4;
 Thu, 10 Feb 2022 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644456381; x=1675992381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTZRO8AL3pt7KalgtHlKIDcizA+L2CcZP0n/RbxAfrs=;
 b=cy2SjyZJsYMsfGZaj9FSGmO8kAkrCzsJ4Tc+kNCycN4oujpf1pQgrXi7
 X81H/D2YPf1M2r7i0gcVN/VcElF2ZD/i5CXOdmWHymOKQueiLS+NyZLSM
 6zStxA2GK5/m750XdYmnjDcZ9GJqGykkF3mbaaSMN3wVtnFPXmz6zi/SO
 FkuTEONYR0FfjMXxk9CmDFjVSlXBuop4W1OUMXGnRpqp1Cp7HPwJLINxa
 5+9AP4ws1sRAFvog/FQIVYIr/UOxtxmxUhJbbNBOtDz1o7SKf4sAAnt5g
 UL2Zi/Xp5Ec3WX/gxSqF7KCcOx3lOuGo57IxOtwtoxpvFjmKDX6d2Xmc7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249591577"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="249591577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="773706166"
Received: from sroy1-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.85.186])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:21 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Wed,  9 Feb 2022 17:26:12 -0800
Message-Id: <20220210012617.1061641-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210012617.1061641-1-michael.cheng@intel.com>
References: <20220210012617.1061641-1-michael.cheng@intel.com>
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
		    dcache.

v3 (Michael Cheng): Remove ifdef for asm/cacheflush.h

v4 (Michael Cheng): Rebase

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 66597e411764..ec8d91b088ff 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -28,6 +28,7 @@
  * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
 
+#include <asm/cacheflush.h>
 #include <linux/cc_platform.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
@@ -174,6 +175,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+
+#elif defined(CONFIG_ARM64)
+	void *end = addr + length;
+	dcache_clean_inval_poc((unsigned long)addr, (unsigned long)end);
 #else
 	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
-- 
2.25.1

