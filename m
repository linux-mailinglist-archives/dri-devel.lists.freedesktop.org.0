Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1194C3C59
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437110E730;
	Fri, 25 Feb 2022 03:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AAF10E730;
 Fri, 25 Feb 2022 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645759486; x=1677295486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33Qel1iREnwbVOIPxBVs/tDj2KTi68IHE6+FV/bUuM4=;
 b=M0WVdP2aZuak2XLaToeWe+ExWCVRxTsi5uc3PjZ54MLc4fcLN2xvdDBy
 nIeKRi2QTXJliM15zy4qaubeXwLeMI8FgbnPYx+a9cVbanQXAKp2mq2Ca
 BfYPiLdu65sbQv9sK1fkEY5pY6mHprbQajM0iOFGVqM3ZdP92jYBOV99r
 vC354e3oIF4M4mK8rF4i7r/O2YyXV2/IUWHSiWK34ptkmm8EB5YKO1l4f
 SZaPWv78HEvNwgbOQUiA8dnB/g4eENIp+1v1Qf2Eo0FKctwVmpHVCwxUP
 U+2aNJUGoTUni8HhxEbf8MVeuxENg3kLmnR9TKO2oVpeLl+ZLpe0OTeis g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277044510"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="277044510"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="638087450"
Received: from slwinche-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.212.150.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:41 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 2/6] drm/i915/gt: Re-work intel_write_status_page
Date: Thu, 24 Feb 2022 19:24:32 -0800
Message-Id: <20220225032436.904942-3-michael.cheng@intel.com>
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

