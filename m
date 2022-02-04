Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD214A9D0E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237810EE10;
	Fri,  4 Feb 2022 16:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6A10E2DB;
 Fri,  4 Feb 2022 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643992641; x=1675528641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0faIJeanSVg4TVsukZep2SH9zNSBXKIPlWiirFMZ1bw=;
 b=GELHw9HnhWbm+J9BPfTLPD6hbiLmGmpU4BMxo5NC6gE3rV8Y/cepRLdK
 fXpeLkOSgM1X0Yqe7PWx4W/uJ7D69Py4xaB8d0KrMzXQoGsRGkXFk/DIg
 e3BsAqASZ6Ef6rmzpaKBN7azVUd6++GtnaH2qCQTFXm/m/02B1OdjcKR5
 Ek+M7GAgpbQN0AGRghqpQJuY7WSFk1GFm/zt/mugcjxAY3/JLtVomu0M1
 9qNtX0bSZzi550zTlKf+QrQ7R1aZrrXimGONWnf/j/BTl1BDTLLRX88tf
 eCGklISM1W2XPiop9IkgVdTJI0LSzNX3CXJhWIw90VJkZxQgd0JpkjzWL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272898338"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="272898338"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="699724224"
Received: from pwaterl-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.197.34])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:18 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/5] drm/i915/gt: Re-work intel_write_status_page
Date: Fri,  4 Feb 2022 08:37:07 -0800
Message-Id: <20220204163711.439403-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204163711.439403-1-michael.cheng@intel.com>
References: <20220204163711.439403-1-michael.cheng@intel.com>
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
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-work intel_write_status_page to use drm_clflush_virt_range. This
will prevent compiler errors when building for non-x86 architectures.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 0e353d8c2bc8..986777c2430d 100644
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

