Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F14B155E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 19:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791510E961;
	Thu, 10 Feb 2022 18:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5110E95E;
 Thu, 10 Feb 2022 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644518212; x=1676054212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faWa0zkc3IIPb1B1W8H3JVxgoY3eN/wvxr92/FnXeH8=;
 b=FkV0EVovNOWg06wW17D/6r4FX9xCi590Gr6ofkkc0Q4WG9J1fIfz5CXo
 eJVat3aVeO9OY84tswNghyBzXRaknSuCsvaCHlXbwEPWkCicUQZzg/DtR
 EKTUwVOlit4m7CTaGTeFCURPB6P2N1KTDg13i9XMuvqWS5/Ml1tiM0gE/
 JTmvFkfhVZlykHEe57apGmqf1rOoAwEhbiqc1TH5Bzkf3QTU6Jvh4vA4z
 YYJ/6rSEN2ICHK91sMM920dvqYYTIUigfmB771MjZtl5DIZDaE9MNijEZ
 D7qKmmi5tYykZFk5v6J0h7zivl1AbT+K4kLREOliq1viHLQPp/arTZmnH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229528162"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="229528162"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="526616757"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:40 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Date: Thu, 10 Feb 2022 10:36:31 -0800
Message-Id: <20220210183636.1187973-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210183636.1187973-1-michael.cheng@intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
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

v5 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 66597e411764..2e233f53331e 100644
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

