Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3238833C
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81426E0ED;
	Tue, 18 May 2021 23:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C696E0EA;
 Tue, 18 May 2021 23:40:42 +0000 (UTC)
IronPort-SDR: gd66hm7/gyIznChLmR/VxMqGslqEoHlnj5OWd+eKZ4FiWDi0/HZG/kGB5CGPb/acKHeQyZgKLt
 Woki8HhSup1w==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="286378180"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="286378180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 16:40:40 -0700
IronPort-SDR: GM4emKcj8Xe3Gy7LgykDxxP7L1YHuXBSe9G2S9eHXsqNM/ONbnoOwdZliaX2jkzPAfOHSCn89I
 JWRI4gVHJjgA==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439698312"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 16:40:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC 1/2] drm/doc/rfc: i915 GuC submission / DRM scheduler
Date: Tue, 18 May 2021 16:58:29 -0700
Message-Id: <20210518235830.133834-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210518235830.133834-1-matthew.brost@intel.com>
References: <20210518235830.133834-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tony.ye@intel.com,
	tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
	jason.ekstrand@intel.com, michal.mrozek@intel.com,
	jon.bloomfield@intel.com, karl@freedesktop.org,
	mesa-dev@lists.freedesktop.org, daniel.vetter@intel.com,
	christian.koenig@amd.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add entry for i915 GuC submission / DRM scheduler integration plan.
Follow up patch with details of new parallel submission uAPI to come.

v2:
 (Daniel Vetter)
  - Expand explaination of why bonding isn't supported for GuC
    submission
  - CC some of the DRM scheduler maintainers
  - Add priority inheritance / boosting use case
  - Add reasoning for removing in order assumptions
 (Daniel Stone)
  - Add links to priority spec

Cc: Christian König <christian.koenig@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 85 ++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst          |  4 ++
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
new file mode 100644
index 000000000000..7faa46cde088
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -0,0 +1,85 @@
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
+	  functional, no major coding style / layering errors, and not regress
+	  execlists
+	* Update IGTs / selftests as needed to work with GuC submission
+	* Enable CI on supported platforms for a baseline
+	* Rework / get CI heathly for GuC submission in place as needed
+* Merge new parallel submission uAPI
+	* Bonding uAPI completely incompatible with GuC submission, plus it has
+	  severe design issues in general, which is why we want to retire it no
+	  matter what
+	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
+	  which configures a slot with N contexts 
+	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
+	  a slot in a single execbuf IOCTL and the batches run on the GPU in
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
+		* Used for i915 page flip, may be useful to other DRM drivers as
+		  well
+		* Will be an optional feature in the DRM scheduler
+	* Remove in-order completion assumptions from DRM scheduler
+		* Even when using the DRM scheduler the backends will handle
+		  preemption, timeslicing, etc... so it is possible for jobs to
+		  finish out of order
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
+Spec references:
+----------------
+https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
+https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/chap5.html#devsandqueues-priority
+https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priority-t
+
+New parallel submission uAPI
+============================
+Details to come in a following patch.
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 05670442ca1b..91e93a705230 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -19,3 +19,7 @@ host such documentation:
 .. toctree::
 
     i915_gem_lmem.rst
+
+.. toctree::
+
+    i915_scheduler.rst
-- 
2.28.0

