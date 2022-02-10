Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A134B0222
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 02:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C504010E6FB;
	Thu, 10 Feb 2022 01:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5A10E233;
 Thu, 10 Feb 2022 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644456382; x=1675992382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFYLaPepw2T34Ec0qGtoebNynt7IRfx+By6ZnIjAJe8=;
 b=ZbU+J1a1R6tZJhMCHnJ8RFc/lE1fQBoKhE/WtfvNsRwbbGS3mu0dRmuw
 e/KygxFEMM3h5/VlCF06t01qOUnfbxWvInhkVEr1GHnduMcIgVC/0VmZL
 xWW9QUTMkRp+AdEJbwvsgNnubHbsmFl0PP5F9oJFS+sJX6JQYC94ZmrPd
 luez/IpaT+hfaTwUfoCYQzSPhaGSh9cQp296f/ehs2uWYujFMSgyfPdbB
 J+KjtK6MN9SxbCLTxbHST1hz7NeEkaj+16PBiSqvl3cvb5pPb69yuXa+p
 01pg2eVJxfUWCvjaEH760udXIFmYAa0NsXwp/p67zdGhm8f2AFAngvCm6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249591583"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="249591583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="773706175"
Received: from sroy1-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.85.186])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:22 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 3/6] drm/i915/gt: Drop invalidate_csb_entries
Date: Wed,  9 Feb 2022 17:26:14 -0800
Message-Id: <20220210012617.1061641-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210012617.1061641-1-michael.cheng@intel.com>
References: <20220210012617.1061641-1-michael.cheng@intel.com>
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

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9bb7c863172f..28f2581d3046 100644
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
+		execlists->csb_size * sizeof(execlists->csb_status[0]));
 
 	/* Once more for luck and our trusty paranoia */
 	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
-- 
2.25.1

