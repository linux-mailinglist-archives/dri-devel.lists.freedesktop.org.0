Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA9375907
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792366ECC7;
	Thu,  6 May 2021 17:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865B6E7D7;
 Thu,  6 May 2021 17:13:18 +0000 (UTC)
IronPort-SDR: 4L9wleS4R0pZsOPvhTtCwIZJ9AVF6ylWq21QFYC4WHk4Xr/Z+36y1nIUeoN8WU6zlas+zs1Hre
 enHvRQScDrfg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219414876"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="219414876"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:05 -0700
IronPort-SDR: SJdw9adacxvnQhawxrGBKw0gFFHM2AAuarKIFt2X5q+FB66bqnaJol7hYl1xz/JhDo//LpwgvC
 a58OkvlFwJ4g==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="622533971"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 5/5] drm/i915: Update execbuf IOCTL to accept N BBs
Date: Thu,  6 May 2021 10:30:49 -0700
Message-Id: <20210506173049.72503-6-matthew.brost@intel.com>
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

Add I915_EXEC_NUMBER_BB_* to drm_i915_gem_execbuffer2.flags which allows
submitting N BBs per IOCTL.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
CC: Carl Zhang <carl.zhang@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/i915_drm.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 0175b12b33b8..d3072cad4a7e 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1291,7 +1291,26 @@ struct drm_i915_gem_execbuffer2 {
  */
 #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
 
-#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
+/*
+ * Number of BB in execbuf2 IOCTL - 1, used to submit more than BB in a single
+ * execbuf2 IOCTL.
+ *
+ * Return -EINVAL if more than 1 BB (value 0) is specified if
+ * I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT hasn't been called on the gem
+ * context first. Also returns -EINVAL if gem context has been setup with
+ * I915_PARALLEL_NO_PREEMPT_MID_BATCH and the number BBs not equal to the total
+ * number hardware contexts in the gem context.
+ */
+#define I915_EXEC_NUMBER_BB_LSB		(22)
+#define I915_EXEC_NUMBER_BB_MASK	(0x3f << I915_EXEC_NUMBER_BB_LSB)
+#define I915_EXEC_NUMBER_BB_MSB		(27)
+#define i915_execbuffer2_set_number_bb(eb2, num_bb) \
+	(eb2).flags = ((eb2).flags & ~I915_EXEC_NUMBER_BB_MASK) | \
+	(((num_bb - 1) << I915_EXEC_NUMBER_BB_LSB) & I915_EXEC_NUMBER_BB_MASK)
+#define i915_execbuffer2_get_number_bb(eb2) \
+	((((eb2).flags & I915_EXEC_NUMBER_BB_MASK) >> I915_EXEC_NUMBER_BB_LSB) + 1)
+
+#define __I915_EXEC_UNKNOWN_FLAGS (-(1 << (I915_EXEC_NUMBER_BB_MSB + 1)))
 
 #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
 #define i915_execbuffer2_set_context_id(eb2, context) \
-- 
2.28.0

