Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9CE512A69
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 06:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D12210E406;
	Thu, 28 Apr 2022 04:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4BD10E2E8;
 Thu, 28 Apr 2022 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651119583; x=1682655583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElNx9L4neu04h6EgZ01wRx2Zr1kBiAYHTV8+xLIMzQY=;
 b=ALKnqJLocotCVRRcAffzXyJ2rkZbPijCKRWzF5KRAVItVjnsQGmjQdx2
 oujUg2Bnt8P2niv2Nr7RRXGzSQs/ST2kKSRxzdB0/7FMbwtoEfUS1hes/
 2X21AqL31j6bQ57u+9ne6KAD2euAHI4hVbnVz0o1e9/MiSP0DzT7N5kW1
 tU1Vpyp9TsWfIYSZX1xEqYimLXmpwpQTZ+tJXRuugAo03w2PEC8zsLidy
 ZHHM2A3WxtukPAWHbsl86YKi3SaCG30Am9n5XOKZlhTa9/pziwjNXFneO
 H5SFhn3wUfQZPoacXQ7eVN6ZBE0OgD/WaN8tB1h9vFTFJS1nVrCMfVXgy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326645781"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326645781"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559403043"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915/xehp: Add compute engine ABI
Date: Wed, 27 Apr 2022 21:19:25 -0700
Message-Id: <20220428041926.1483683-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428041926.1483683-1-matthew.d.roper@intel.com>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're now ready to start exposing compute engines to userspace.

v2:
 - Move kerneldoc for other engine classes to a separate patch.  (Andi)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Szymon Morek <szymon.morek@intel.com>
UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14395
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 2 +-
 drivers/gpu/drm/i915/i915_drm_client.c      | 1 +
 drivers/gpu/drm/i915/i915_drm_client.h      | 2 +-
 include/uapi/drm/i915_drm.h                 | 9 +++++++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 0f6cd96b459f..46a174f8aa00 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -47,7 +47,7 @@ static const u8 uabi_classes[] = {
 	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
 	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
 	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
-	/* TODO: Add COMPUTE_CLASS mapping once ABI is available */
+	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
 };
 
 static int engine_cmp(void *priv, const struct list_head *A,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 475a6f824cad..18d38cb59923 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -81,6 +81,7 @@ static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_COPY] = "copy",
 	[I915_ENGINE_CLASS_VIDEO] = "video",
 	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
+	[I915_ENGINE_CLASS_COMPUTE] = "compute",
 };
 
 static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 5f5b02b01ba0..f796c5e8e060 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -13,7 +13,7 @@
 
 #include "gt/intel_engine_types.h"
 
-#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_VIDEO_ENHANCE
+#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
 struct drm_i915_private;
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index ec000fc6c879..a2def7b27009 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -203,6 +203,15 @@ enum drm_i915_gem_engine_class {
 	 */
 	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
 
+	/**
+	 * @I915_ENGINE_CLASS_COMPUTE:
+	 *
+	 * Compute engines support a subset of the instructions available
+	 * on render engines:  compute engines support Compute (GPGPU) and
+	 * programmable media workloads, but do not support the 3D pipeline.
+	 */
+	I915_ENGINE_CLASS_COMPUTE	= 4,
+
 	/* Values in this enum should be kept compact. */
 
 	/**
-- 
2.35.1

