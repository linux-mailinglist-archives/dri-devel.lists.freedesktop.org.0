Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3B43DF765
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF566E92C;
	Tue,  3 Aug 2021 22:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4236E23F;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745902"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745902"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512709"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/46] drm/i915: Expose logical engine instance to user
Date: Tue,  3 Aug 2021 15:29:11 -0700
Message-Id: <20210803222943.27686-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose logical engine instance to user via query engine info IOCTL. This
is required for split-frame workloads as these needs to be placed on
engines in a logically contiguous order. The logical mapping can change
based on fusing. Rather than having user have knowledge of the fusing we
simply just expose the logical mapping with the existing query engine
info IOCTL.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 2 ++
 include/uapi/drm/i915_drm.h       | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index e49da36c62fb..8a72923fbdba 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
 	for_each_uabi_engine(engine, i915) {
 		info.engine.engine_class = engine->uabi_class;
 		info.engine.engine_instance = engine->uabi_instance;
+		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
 		info.capabilities = engine->uabi_capabilities;
+		info.logical_instance = ilog2(engine->logical_mask);
 
 		if (copy_to_user(info_ptr, &info, sizeof(info)))
 			return -EFAULT;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7f13d241417f..ef72e07fe08c 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2706,14 +2706,20 @@ struct drm_i915_engine_info {
 
 	/** @flags: Engine flags. */
 	__u64 flags;
+#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
 
 	/** @capabilities: Capabilities of this engine. */
 	__u64 capabilities;
 #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
 #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
 
+	/** @logical_instance: Logical instance of engine */
+	__u16 logical_instance;
+
 	/** @rsvd1: Reserved fields. */
-	__u64 rsvd1[4];
+	__u16 rsvd1[3];
+	/** @rsvd2: Reserved fields. */
+	__u64 rsvd2[3];
 };
 
 /**
-- 
2.28.0

