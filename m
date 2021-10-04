Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB284219BF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5C26E237;
	Mon,  4 Oct 2021 22:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD268891D5;
 Mon,  4 Oct 2021 22:11:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="212721056"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="212721056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735522"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 18/26] drm/i915/doc: Update parallel submit doc to point to
 i915_drm.h
Date: Mon,  4 Oct 2021 15:06:29 -0700
Message-Id: <20211004220637.14746-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update parallel submit doc to point to i915_drm.h

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 Documentation/gpu/rfc/i915_parallel_execbuf.h | 122 ------------------
 Documentation/gpu/rfc/i915_scheduler.rst      |   4 +-
 2 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h

diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
deleted file mode 100644
index 8cbe2c4e0172..000000000000
--- a/Documentation/gpu/rfc/i915_parallel_execbuf.h
+++ /dev/null
@@ -1,122 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
-
-/**
- * struct drm_i915_context_engines_parallel_submit - Configure engine for
- * parallel submission.
- *
- * Setup a slot in the context engine map to allow multiple BBs to be submitted
- * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
- * in parallel. Multiple hardware contexts are created internally in the i915
- * run these BBs. Once a slot is configured for N BBs only N BBs can be
- * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
- * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
- * many BBs there are based on the slot's configuration. The N BBs are the last
- * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
- *
- * The default placement behavior is to create implicit bonds between each
- * context if each context maps to more than 1 physical engine (e.g. context is
- * a virtual engine). Also we only allow contexts of same engine class and these
- * contexts must be in logically contiguous order. Examples of the placement
- * behavior described below. Lastly, the default is to not allow BBs to
- * preempted mid BB rather insert coordinated preemption on all hardware
- * contexts between each set of BBs. Flags may be added in the future to change
- * both of these default behaviors.
- *
- * Returns -EINVAL if hardware context placement configuration is invalid or if
- * the placement configuration isn't supported on the platform / submission
- * interface.
- * Returns -ENODEV if extension isn't supported on the platform / submission
- * interface.
- *
- * .. code-block:: none
- *
- *	Example 1 pseudo code:
- *	CS[X] = generic engine of same class, logical instance X
- *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
- *	set_engines(INVALID)
- *	set_parallel(engine_index=0, width=2, num_siblings=1,
- *		     engines=CS[0],CS[1])
- *
- *	Results in the following valid placement:
- *	CS[0], CS[1]
- *
- *	Example 2 pseudo code:
- *	CS[X] = generic engine of same class, logical instance X
- *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
- *	set_engines(INVALID)
- *	set_parallel(engine_index=0, width=2, num_siblings=2,
- *		     engines=CS[0],CS[2],CS[1],CS[3])
- *
- *	Results in the following valid placements:
- *	CS[0], CS[1]
- *	CS[2], CS[3]
- *
- *	This can also be thought of as 2 virtual engines described by 2-D array
- *	in the engines the field with bonds placed between each index of the
- *	virtual engines. e.g. CS[0] is bonded to CS[1], CS[2] is bonded to
- *	CS[3].
- *	VE[0] = CS[0], CS[2]
- *	VE[1] = CS[1], CS[3]
- *
- *	Example 3 pseudo code:
- *	CS[X] = generic engine of same class, logical instance X
- *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
- *	set_engines(INVALID)
- *	set_parallel(engine_index=0, width=2, num_siblings=2,
- *		     engines=CS[0],CS[1],CS[1],CS[3])
- *
- *	Results in the following valid and invalid placements:
- *	CS[0], CS[1]
- *	CS[1], CS[3] - Not logical contiguous, return -EINVAL
- */
-struct drm_i915_context_engines_parallel_submit {
-	/**
-	 * @base: base user extension.
-	 */
-	struct i915_user_extension base;
-
-	/**
-	 * @engine_index: slot for parallel engine
-	 */
-	__u16 engine_index;
-
-	/**
-	 * @width: number of contexts per parallel engine
-	 */
-	__u16 width;
-
-	/**
-	 * @num_siblings: number of siblings per context
-	 */
-	__u16 num_siblings;
-
-	/**
-	 * @mbz16: reserved for future use; must be zero
-	 */
-	__u16 mbz16;
-
-	/**
-	 * @flags: all undefined flags must be zero, currently not defined flags
-	 */
-	__u64 flags;
-
-	/**
-	 * @mbz64: reserved for future use; must be zero
-	 */
-	__u64 mbz64[3];
-
-	/**
-	 * @engines: 2-d array of engine instances to configure parallel engine
-	 *
-	 * length = width (i) * num_siblings (j)
-	 * index = j + i * num_siblings
-	 */
-	struct i915_engine_class_instance engines[0];
-
-} __packed;
-
diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index cbda75065dad..d630f15ab795 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -135,8 +135,8 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
 drm_i915_context_engines_parallel_submit to the uAPI to implement this
 extension.
 
-.. kernel-doc:: Documentation/gpu/rfc/i915_parallel_execbuf.h
-        :functions: drm_i915_context_engines_parallel_submit
+.. kernel-doc:: include/uapi/drm/i915_drm.h
+        :functions: i915_context_engines_parallel_submit
 
 Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
 -------------------------------------------------------------------
-- 
2.32.0

