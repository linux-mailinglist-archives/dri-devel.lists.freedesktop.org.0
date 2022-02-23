Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2F4C0C54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 06:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEE010E9D5;
	Wed, 23 Feb 2022 05:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205D10E982;
 Wed, 23 Feb 2022 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645595945; x=1677131945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8vIf7sa7yICWcKP24qDwtxYsPUxfyHbl+rLppbIwDO4=;
 b=l/xLpfHRO/rW3WzYfVzNv/gnsW31fEymmbK1Ri8Z0mf+aAHwfOSo/znZ
 VbVI15+SdANFfWmCGtCEcqE6wct9T7LFOafjzsaawOWGQNosOL/O2xr1q
 JqXxYHeyya+KAZ1KuuB781rAEap1W7F0le/u6BFtzS9J1pipcvx1F7xYT
 GYURH7oFlDW8bcKS50PRg4L9OZ0gEBathSLzpwHfIQvgwB4484JHp98wD
 dQZhLjmoy49/lnASceI+brv7drZubBnvBx9IXkhYDSpMBpcUc246ImzBl
 DNha0O44xtyPWh0md0EigGUGnS7o+CBGRcGmoME0HR/S+PikpshtbxssV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312606227"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="312606227"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="706908159"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:05 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 3/6] drm/i915/gt: Drop invalidate_csb_entries
Date: Tue, 22 Feb 2022 21:58:57 -0800
Message-Id: <20220223055900.415627-4-michael.cheng@intel.com>
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

Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
This allows for one less function call, and prevent complier errors when
building for non-x86 architectures.

v2(Michael Cheng): Drop invalidate_csb_entries function and directly
		   invoke drm_clflush_virt_range. Thanks to Tvrtko for the
		   sugguestion.

v3(Michael Cheng): Use correct parameters for drm_clflush_virt_range.
		   Thanks to Tvrtko for pointing this out.

v4(Michael Cheng): Simplify &execlists->csb_status[0] to
		   execlists->csb_status. Thanks to Matt Roper for the
		   suggestion.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/i915/gt/intel_execlists_submission.c    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 961d795220a3..e5e73a1b2e4e 100644
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
@@ -2783,8 +2777,9 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
 
 	/* Check that the GPU does indeed update the CSB entries! */
 	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
-	invalidate_csb_entries(&execlists->csb_status[0],
-			       &execlists->csb_status[reset_value]);
+	drm_clflush_virt_range(execlists->csb_status,
+			       execlists->csb_size *
+			       sizeof(execlists->csb_status));
 
 	/* Once more for luck and our trusty paranoia */
 	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
-- 
2.25.1

