Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05B375905
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787176ECDD;
	Thu,  6 May 2021 17:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE776ECC0;
 Thu,  6 May 2021 17:13:06 +0000 (UTC)
IronPort-SDR: ATD1KuMwL9Mebz0fGuPtxc7g0MSnsBQjrkrWwEQxr2Gv/Ghd1HKobkUHY7DI2bbbrdTPi792fQ
 bszcD4hUIZbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198613103"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198613103"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:04 -0700
IronPort-SDR: 9rfXXkPDbQq7RU0fixbnkqVwzWDyAIfQFPb7JVHKksFrdIL3Fpx8L4DSerMGZFhhcYATqzItYo
 Tdg/p5+a1EOg==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="622533950"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 1/5] drm/doc/rfc: i915 GuC submission / DRM scheduler
 integration plan
Date: Thu,  6 May 2021 10:30:45 -0700
Message-Id: <20210506173049.72503-2-matthew.brost@intel.com>
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

Add entry for i915 GuC submission / DRM scheduler integration plan.
Follow up patch with details of new parallel submission uAPI to come.

Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 70 ++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst          |  4 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
new file mode 100644
index 000000000000..fa6780a11c86
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -0,0 +1,70 @@
+=========================================
+I915 GuC Submission/DRM Scheduler Section
+=========================================
+
+Upstream plan
+=============
+For upstream the overall plan for landing GuC submission and integrating the
+i915 with the DRM scheduler is:
+
+* Merge basic GuC submission
+	* Basic submission support for all gen11+ platforms
+	* Not enabled by default on any current platforms but can be enabled via
+	  modparam enable_guc
+	* Lots of rework will need to be done to integrate with DRM scheduler so
+	  no need to nit pick everything in the code, it just should be
+	  functional and not regress execlists
+	* Update IGTs / selftests as needed to work with GuC submission
+	* Enable CI on supported platforms for a baseline
+	* Rework / get CI heathly for GuC submission in place as needed
+* Merge new parallel submission uAPI
+	* Bonding uAPI completely incompatible with GuC submission
+	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
+	  which configures contexts N wide
+	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
+	  a context in a single execbuf IOCTL and the batches run on the GPU in
+	  paralllel
+	* Initially only for GuC submission but execlists can be supported if
+	  needed
+* Convert the i915 to use the DRM scheduler
+	* GuC submission backend fully integrated with DRM scheduler
+		* All request queues removed from backend (e.g. all backpressure
+		  handled in DRM scheduler)
+		* Resets / cancels hook in DRM scheduler
+		* Watchdog hooks into DRM scheduler
+		* Lots of complexity of the GuC backend can be pulled out once
+		  integrated with DRM scheduler (e.g. state machine gets
+		  simplier, locking gets simplier, etc...)
+	* Execlist backend will do the minimum required to hook in the DRM
+	  scheduler so it can live next to the fully integrated GuC backend
+		* Legacy interface
+		* Features like timeslicing / preemption / virtual engines would
+		  be difficult to integrate with the DRM scheduler and these
+		  features are not required for GuC submission as the GuC does
+		  these things for us
+		* ROI low on fully integrating into DRM scheduler
+		* Fully integrating would add lots of complexity to DRM
+		  scheduler
+	* Port i915 priority inheritance / boosting feature in DRM scheduler
+	* Remove in-order completion assumptions from DRM scheduler
+	* Pull out i915 priority levels and use DRM priority levels
+	* Optimize DRM scheduler as needed
+
+New uAPI for basic GuC submission
+=================================
+No major changes are required to the uAPI for basic GuC submission. The only
+change is a new scheduler attribute: I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP.
+This attribute indicates the 2k i915 user priority levels are statically mapped
+into 3 levels as follows:
+
+* -1k to -1 Low priority
+* 0 Medium priority
+* 1 to 1k High priority
+
+This is needed because the GuC only has 4 priority bands. The highest priority
+band is reserved with the kernel. This aligns with the DRM scheduler priority
+levels too.
+
+New parallel submission uAPI
+============================
+Details to come in a following patch.
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index a8621f7dab8b..018a8bf317a6 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -15,3 +15,7 @@ host such documentation:
 
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
+
+.. toctree::
+
+    i915_scheduler.rst
-- 
2.28.0

