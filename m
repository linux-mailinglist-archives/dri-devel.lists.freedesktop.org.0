Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0134ACA11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ADC10F857;
	Mon,  7 Feb 2022 20:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384F10E610;
 Mon,  7 Feb 2022 20:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644264691; x=1675800691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0faIJeanSVg4TVsukZep2SH9zNSBXKIPlWiirFMZ1bw=;
 b=L80O9Uowp/Gtrsm5BhympltPA3xfgx9vketcIC+dRHh3gDq1Bd/9UGpE
 dDzu+zu/5IkF5QSkbhSZu8Z9TX5JXNNFhNlqtJFH4GLDEV305HvP/ebv/
 HRwBNBFg2VcwgTLE7bA5o5R2OzQQYTMt8kXpfYvfgwN1silw6vpH8osyN
 vwMoyjtaLzC0ebbBpHeZv8kxc0hhhJiyWST7h+lI1r4jHJgHAazFlqgrB
 rSQq76xfo349vLqBbFnmS1orTBhK4HygLkk+5UGTdjB2UEO2o0TmmxQ/l
 RBGmXzMEeshhDu18Y9HOXpJrhplcShUIaYhTHdNZpURzph+m2YVnSEGCt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="229448810"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="229448810"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="770754197"
Received: from vdixit-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.60.7])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:31 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/6] drm/i915/gt: Re-work intel_write_status_page
Date: Mon,  7 Feb 2022 12:11:22 -0800
Message-Id: <20220207201127.648624-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207201127.648624-1-michael.cheng@intel.com>
References: <20220207201127.648624-1-michael.cheng@intel.com>
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

