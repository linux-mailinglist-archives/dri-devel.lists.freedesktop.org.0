Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4520E42CC4D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123FD6EB94;
	Wed, 13 Oct 2021 20:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666066EB6C;
 Wed, 13 Oct 2021 20:55:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214690378"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214690378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524782705"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 06/25] drm/i915: Expose logical engine instance to user
Date: Wed, 13 Oct 2021 13:42:12 -0700
Message-Id: <20211013204231.19287-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013204231.19287-1-matthew.brost@intel.com>
References: <20211013204231.19287-1-matthew.brost@intel.com>
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

IGT: https://patchwork.freedesktop.org/patch/445637/?series=92854&rev=1
media UMD: https://github.com/intel/media-driver/pull/1252

v2:
 (Daniel Vetter)
  - Add IGT link, placeholder for media UMD

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 2 ++
 include/uapi/drm/i915_drm.h       | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 5e2b909827f4..51b368be0fc4 100644
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
index aa2a7eccfb94..0179f92e0916 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2775,14 +2775,20 @@ struct drm_i915_engine_info {
 
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
2.32.0

