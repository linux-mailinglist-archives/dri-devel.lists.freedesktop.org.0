Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8B512A61
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 06:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F030810E328;
	Thu, 28 Apr 2022 04:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873810E2E8;
 Thu, 28 Apr 2022 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651119583; x=1682655583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I6a3I0TBnnyW7OqUh6QcWJ7fsKcv/7muMhOOQfbq5lg=;
 b=XuItMU8+WHhUbErLKxyqELFg10ffiM10Ue2+DDPvMDS/9T8A/pKPAVKT
 xYkDZKo+keeFC5CI8yQOz3cSfJ01/kr/mswtreaMr44RPyrgsKo8SfSQH
 zclojxfo1uiYIrDGRB7Ehfwx6cDFiB5pPCnPlGkmARAjn4/jqx8EHMbii
 QXi71XsNKKBJ3/ZVDKZ/+GArdq1ObCUQZ7eu1IZWk1S7BZOdpgZCEMMVL
 aczr9ectcM7Y5jBnK0nupP3cOgspAjz3DA78OjSL74tP5DmDr/UwKzG+B
 VaMs689JyBKFMIiw95RjMMIqks3JYQZi3QtTxj+NcmvVYWbvVMVforM6Y g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326645778"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326645778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559403037"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/i915/uapi: Add kerneldoc for engine class enum
Date: Wed, 27 Apr 2022 21:19:23 -0700
Message-Id: <20220428041926.1483683-2-matthew.d.roper@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll be adding a new type of engine soon.  Let's document the existing
engine classes first to help make it clear what each type of engine is
used for.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/uapi/drm/i915_drm.h | 53 ++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 35ca528803fd..ec000fc6c879 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -154,21 +154,62 @@ enum i915_mocs_table_index {
 	I915_MOCS_CACHED,
 };
 
-/*
+/**
+ * enum drm_i915_gem_engine_class - uapi engine type enumeration
+ *
  * Different engines serve different roles, and there may be more than one
- * engine serving each role. enum drm_i915_gem_engine_class provides a
- * classification of the role of the engine, which may be used when requesting
- * operations to be performed on a certain subset of engines, or for providing
- * information about that group.
+ * engine serving each role.  This enum provides a classification of the role
+ * of the engine, which may be used when requesting operations to be performed
+ * on a certain subset of engines, or for providing information about that
+ * group.
  */
 enum drm_i915_gem_engine_class {
+	/**
+	 * @I915_ENGINE_CLASS_RENDER:
+	 *
+	 * Render engines support instructions used for 3D, Compute (GPGPU),
+	 * and programmable media workloads.  These instructions fetch data and
+	 * dispatch individual work items to threads that operate in parallel.
+	 * The threads run small programs (called "kernels" or "shaders") on
+	 * the GPU's execution units (EUs).
+	 */
 	I915_ENGINE_CLASS_RENDER	= 0,
+
+	/**
+	 * @I915_ENGINE_CLASS_COPY:
+	 *
+	 * Copy engines (also referred to as "blitters") support instructions
+	 * that move blocks of data from one location in memory to another,
+	 * or that fill a specified location of memory with fixed data.
+	 * Copy engines can perform pre-defined logical or bitwise operations
+	 * on the source, destination, or pattern data.
+	 */
 	I915_ENGINE_CLASS_COPY		= 1,
+
+	/**
+	 * @I915_ENGINE_CLASS_VIDEO:
+	 *
+	 * Video engines (also referred to as "bit stream decode" (BSD) or
+	 * "vdbox") support instructions that perform fixed-function media
+	 * decode and encode.
+	 */
 	I915_ENGINE_CLASS_VIDEO		= 2,
+
+	/**
+	 * @I915_ENGINE_CLASS_VIDEO_ENHANCE:
+	 *
+	 * Video enhancement engines (also referred to as "vebox") support
+	 * instructions related to image enhancement.
+	 */
 	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
 
-	/* should be kept compact */
+	/* Values in this enum should be kept compact. */
 
+	/**
+	 * @I915_ENGINE_CLASS_INVALID:
+	 *
+	 * Placeholder value to represent an invalid engine class assignment.
+	 */
 	I915_ENGINE_CLASS_INVALID	= -1
 };
 
-- 
2.35.1

