Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A154B008C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B22A10E647;
	Wed,  9 Feb 2022 22:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B300910E63D;
 Wed,  9 Feb 2022 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644446714; x=1675982714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUbSlsflnQ6qLFjMTlTBVFjV37kRTSsxR3Djg6ZqRFM=;
 b=ZHIbHY+Qz4W8k2dxRXou0sim8zJpzv72cko6TU7pHgl/j8SyD/3RPTdu
 1oRKOjCbqOprEwXUn2kPTPI4rb4XON274wkjpaKDogmxGhNn8iD1P2QaT
 IUsZNS0F6HQ0pJkZQAxk4Bby9yJ+0kNxOIsuccKl+f0TvPN6OgbyoHns9
 xzRsayKo9431Z/5LZDeEJ1BFsWFHBXYpKhbg3yahkEX41W0udOqr/4Qun
 3PGnV0byxN6HTAb8tPfa+9ZjsIp0vY78xD7L48SBzo5AMVnuwvmbzQJkz
 vqzbIukzNctUc5kcAXa/2WD5mFkL/8pj03bthZbsv6SSX6wvwntUE31vJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310101179"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="310101179"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="485450916"
Received: from liw3-mobl6.amr.corp.intel.com (HELO localhost)
 ([10.212.169.188])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:13 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 2/4] drm/i915/uapi: Add query for hwconfig blob
Date: Wed,  9 Feb 2022 14:45:05 -0800
Message-Id: <20220209224507.874751-3-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209224507.874751-1-jordan.l.justen@intel.com>
References: <20220209224507.874751-1-jordan.l.justen@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

The DRM_I915_QUERY_HWCONFIG_BLOB query item returns a blob of data
which it receives from the GuC software. This blob provides some
useful data about the hardware for drivers.

Although the blob is not fully documented at this time, the basic
format is an array of u32 values. The array is a simple and flexible
KLV (Key/Length/Value) formatted table. For example, it could be just:
enum device_attr { ATTR_SOME_VALUE = 0, ATTR_SOME_MASK = 1, };

  static const u32 hwconfig[] = {
      ATTR_SOME_VALUE,
      1,             // Value Length in DWords
      8,             // Value

      ATTR_SOME_MASK,
      3,
      0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
  };

The attribute ids and meaning of the values will be documented in the
Programmer Reference Manuals when released.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Jordan Justen <jordan.l.justen@intel.com>
Tested-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 2dfbc22857a3..195524e9a369 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	return total_length;
 }
 
+static int query_hwconfig_blob(struct drm_i915_private *i915,
+			       struct drm_i915_query_item *query_item)
+{
+	struct intel_gt *gt = to_gt(i915);
+	struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
+
+	if (!hwconfig->size || !hwconfig->ptr)
+		return -ENODEV;
+
+	if (query_item->length == 0)
+		return hwconfig->size;
+
+	if (query_item->length < hwconfig->size)
+		return -EINVAL;
+
+	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
+			 hwconfig->ptr, hwconfig->size))
+		return -EFAULT;
+
+	return hwconfig->size;
+}
+
 static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
 					struct drm_i915_query_item *query_item) = {
 	query_topology_info,
 	query_engine_info,
 	query_perf_config,
 	query_memregion_info,
+	query_hwconfig_blob,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 914ebd9290e5..069d2fadfbd9 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
 #define DRM_I915_QUERY_MEMORY_REGIONS   4
+#define DRM_I915_QUERY_HWCONFIG_BLOB	5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
-- 
2.34.1

