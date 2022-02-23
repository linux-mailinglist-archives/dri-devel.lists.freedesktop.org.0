Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03444C0C53
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 06:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923910E982;
	Wed, 23 Feb 2022 05:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117610E963;
 Wed, 23 Feb 2022 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645595945; x=1677131945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33Qel1iREnwbVOIPxBVs/tDj2KTi68IHE6+FV/bUuM4=;
 b=FSacmA+t/bxVwzNb/OuJvFO0x0etDvZpRPmmQtYHwafjrGiDRFx5wOb0
 XbcUOWV109sfRT81hvEAKOZGcq4JSSEYa3g4rRAjPF2AoSvYriKEbscaD
 mF2Z7SwnNZZ6ImW/q8v7w7p3nwq9/6uh3jOccZRV3mqXfk6JeMiF9Yon9
 75WHLe7+qMB9yANCn4speAeirC8ELVlcH78rOvkZ1lDmluSVR5AD7c793
 9D9VUgj4JkG0wK8gf4JI3tal7ZY2l24xOSlFd8oa7uS5Mumfy9WPsnhnh
 6l5cMnqP53sm4wSru2bD//r2PrRT4viQ1fdweLzZTDrN9dpwj2PsbCp6p w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312606226"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="312606226"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="706908155"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:04 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 2/6] drm/i915/gt: Re-work intel_write_status_page
Date: Tue, 22 Feb 2022 21:58:56 -0800
Message-Id: <20220223055900.415627-3-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223055900.415627-1-michael.cheng@intel.com>
References: <20220223055900.415627-1-michael.cheng@intel.com>
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

Re-work intel_write_status_page to use drm_clflush_virt_range. This
will prevent compiler errors when building for non-x86 architectures.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index be4b1e65442f..818468e0a02e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -4,6 +4,7 @@
 
 #include <asm/cacheflush.h>
 #include <drm/drm_util.h>
+#include <drm/drm_cache.h>
 
 #include <linux/hashtable.h>
 #include <linux/irq_work.h>
@@ -143,15 +144,9 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
 	 * of extra paranoia to try and ensure that the HWS takes the value
 	 * we give and that it doesn't end up trapped inside the CPU!
 	 */
-	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
-		mb();
-		clflush(&engine->status_page.addr[reg]);
-		engine->status_page.addr[reg] = value;
-		clflush(&engine->status_page.addr[reg]);
-		mb();
-	} else {
-		WRITE_ONCE(engine->status_page.addr[reg], value);
-	}
+	drm_clflush_virt_range(&engine->status_page.addr[reg], sizeof(value));
+	WRITE_ONCE(engine->status_page.addr[reg], value);
+	drm_clflush_virt_range(&engine->status_page.addr[reg], sizeof(value));
 }
 
 /*
-- 
2.25.1

