Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FB4A8CE7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A86C10E32B;
	Thu,  3 Feb 2022 20:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B971710E185;
 Thu,  3 Feb 2022 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643918649; x=1675454649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jcfV4Y3Qk2yS+drdpAx+57NRVybwdk91R47TfCP4IVQ=;
 b=fYJFAywxlkS4351oil4bQU1Mm3fOkTMxVPfC5NVoouS9gmdTH95MAP3f
 iZxpgbd+pHjw2Ie7XbW+NldY9RWbMSf0I+rXtUQszmg6Mkmp7eK69V8EM
 qlwL8A3TaxeL2mZZGxWGUXw4hT+FBXP/o1MbrJMFhoVyStJpYekd/Hl3h
 822j8PXHxEFn6W/5C0KgmLpOGUauekQKL5JfMa4luDDpRQYEbwi/KuiyL
 VgQZDDoT84Grvwg4Zzkcp+ZCfioiRDhDB7KQWEDT305hH6pIeHVTembG0
 ENf0rU1nl2KUzoBQ8bmjHld+2/YS/DJIwwPyznAj8lgm48FQCkFNvzL3V g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="311545992"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="311545992"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="538894386"
Received: from gearygra-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.lan)
 ([10.212.225.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:08 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/i915/gt: Drop invalidate_csb_entries
Date: Thu,  3 Feb 2022 12:04:01 -0800
Message-Id: <20220203200403.378958-3-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203200403.378958-1-michael.cheng@intel.com>
References: <20220203200403.378958-1-michael.cheng@intel.com>
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

Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
This allows for one less function call, and prevent complier errors when
building for non-x86 architectures.

v2(Michael Cheng): Drop invalidate_csb_entries function and directly
		   invoke drm_clflush_virt_range. Thanks to Tvrtko for the
		   sugguestion.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9bb7c863172f..7500c06562da 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1646,12 +1646,6 @@ cancel_port_requests(struct intel_engine_execlists * const execlists,
 	return inactive;
 }
 
-static void invalidate_csb_entries(const u64 *first, const u64 *last)
-{
-	clflush((void *)first);
-	clflush((void *)last);
-}
-
 /*
  * Starting with Gen12, the status has a new format:
  *
@@ -1999,7 +1993,7 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 	 * the wash as hardware, working or not, will need to do the
 	 * invalidation before.
 	 */
-	invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
+	drm_clflush_virt_range(&buf[0], num_entries * sizeof(buf[0]));
 
 	/*
 	 * We assume that any event reflects a change in context flow
@@ -2783,8 +2777,8 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
 
 	/* Check that the GPU does indeed update the CSB entries! */
 	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
-	invalidate_csb_entries(&execlists->csb_status[0],
-			       &execlists->csb_status[reset_value]);
+	drm_clflush_virt_range(&execlists->csb_status[0],
+				sizeof(&execlists->csb_status[reset_value]));
 
 	/* Once more for luck and our trusty paranoia */
 	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
-- 
2.25.1

