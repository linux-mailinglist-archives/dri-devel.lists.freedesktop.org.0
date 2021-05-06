Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9B375904
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A916ECDA;
	Thu,  6 May 2021 17:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B266ECC0;
 Thu,  6 May 2021 17:13:06 +0000 (UTC)
IronPort-SDR: FwnQUnCSDaz70RA9L3KcQCxtgPrFMzl9zG1K4p37SOX94706bke8h6aEb/Zp6KXO/sd3yiBhLk
 ag1LPFtos9Iw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198613110"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198613110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:04 -0700
IronPort-SDR: vkvsd2Jd38iBQq/qwwC0u+j2t9h5TfBlMwBUz1ds8EJ9HFj4+SRU55FVVkohNRJDo3kvO8LaaV
 nGlkS2ZtM30g==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="622533953"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 2/5] drm/doc/rfc: i915 new parallel submission uAPI plan
Date: Thu,  6 May 2021 10:30:46 -0700
Message-Id: <20210506173049.72503-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506173049.72503-1-matthew.brost@intel.com>
References: <20210506173049.72503-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tony.ye@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, carl.zhang@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add entry fpr i915 new parallel submission uAPI plan.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
CC: Carl Zhang <carl.zhang@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 56 +++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index fa6780a11c86..e3455b33edfe 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -13,7 +13,8 @@ i915 with the DRM scheduler is:
 	  modparam enable_guc
 	* Lots of rework will need to be done to integrate with DRM scheduler so
 	  no need to nit pick everything in the code, it just should be
-	  functional and not regress execlists
+	  functional, no major coding style / layering errors, and not regress
+	  execlists
 	* Update IGTs / selftests as needed to work with GuC submission
 	* Enable CI on supported platforms for a baseline
 	* Rework / get CI heathly for GuC submission in place as needed
@@ -67,4 +68,55 @@ levels too.
 
 New parallel submission uAPI
 ============================
-Details to come in a following patch.
+The existing bonding uAPI is completely broken with GuC submission because
+whether a submission is a single context submit or parallel submit isn't known
+until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
+contexts in parallel with the GuC the context must be explictly registered with
+N contexts and all N contexts must be submitted in a single command to the GuC.
+This interfaces doesn't support dynamically changing between N contexts as the
+bonding uAPI does. Hence the need for a new parallel submission interface. Also
+the legacy bonding uAPI is quite confusing and not intuitive at all.
+
+The new parallel submission uAPI consists of 3 parts:
+
+* Export engines logical mapping
+* A 'set_parallel' extension to configure contexts for parallel
+  submission
+* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
+
+Export engines logical mapping
+------------------------------
+Certain use cases require BBs to be placed on engine instances in logical order
+(e.g. split-frame on gen11+). The logical mapping of engine instances can change
+based on fusing. Rather than making UMDs be aware of fusing, simply expose the
+logical mapping with the existing query engine info IOCTL. Also the GuC
+submission interface currently only supports submitting multiple contexts to
+engines in logical order.
+
+A single bit will be added to drm_i915_engine_info.flags indicating that the
+logical instance has been returned and a new field,
+drm_i915_engine_info.logical_instance, returns the logical instance.
+
+A 'set_parallel' extension to configure contexts for parallel submission
+------------------------------------------------------------------------
+The 'set_parallel' extension configures N contexts for parallel submission. It
+is setup step that should be called before using any of the contexts. See
+I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
+similar existing examples. Once the N contexts are configured for parallel
+submission the execbuf2 IOCTL can be called submiting 1-N BBs in a single IOCTL.
+Although submitting less than N BBs is allowed it is not recommended as that
+will likely leave parts of the hardware reserved and idle. Initially only
+support GuC submission. Execlist support can be added later if needed.
+
+Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
+i915_context_engines_parallel_submit to the uAPI to implement this extension.
+
+Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
+-------------------------------------------------------------------
+Contexts that have been configured with the 'set_parallel' extension are allowed
+to submit 1-N BBs in a single execbuf2 IOCTL. The BBs are either the last N
+objects in the drm_i915_gem_exec_object2 list or the first N if
+I915_EXEC_BATCH_FIRST is set.
+
+Add field 6 bit wide field to drm_i915_gem_exec_object2.flags which indicates
+the number of BBs - 1 included in the IOCTL.
-- 
2.28.0

