Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EA3FF878
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 02:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165B26E833;
	Fri,  3 Sep 2021 00:53:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BA56E831;
 Fri,  3 Sep 2021 00:53:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="219299532"
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="219299532"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 17:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="521455391"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2021 17:53:33 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/i915/uapi: Add query for hwconfig table
Date: Thu,  2 Sep 2021 17:53:33 -0700
Message-Id: <20210903005333.3627255-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903005333.3627255-1-John.C.Harrison@Intel.com>
References: <20210903005333.3627255-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

GuC contains a consolidated table with a bunch of information about the
current device.

Previously, this information was spread and hardcoded to all the components
including GuC, i915 and various UMDs. The goal here is to consolidate
the data into GuC in a way that all interested components can grab the
very latest and synchronized information using a simple query.

As per most of the other queries, this one can be called twice.
Once with item.length=0 to determine the exact buffer size, then
allocate the user memory and call it again for to retrieve the
table data. For example:
  struct drm_i915_query_item item = {
    .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
  };
  query.items_ptr = (int64_t) &item;
  query.num_items = 1;

  ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));

  if (item.length <= 0)
    return -ENOENT;

  data = malloc(item.length);
  item.data_ptr = (int64_t) &data;
  ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));

  // Parse the data as appropriate...

The returned array is a simple and flexible KLV (Key/Length/Value)
formatted table. For example, it could be just:
  enum device_attr {
     ATTR_SOME_VALUE = 0,
     ATTR_SOME_MASK  = 1,
  };

  static const u32 hwconfig[] = {
      ATTR_SOME_VALUE,
      1,             // Value Length in DWords
      8,             // Value

      ATTR_SOME_MASK,
      3,
      0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
  };

The attribute ids are defined in a hardware spec.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 5e2b909827f4..96989a37453c 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -477,12 +477,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	return total_length;
 }
 
+static int query_hwconfig_table(struct drm_i915_private *i915,
+				struct drm_i915_query_item *query_item)
+{
+	struct intel_gt *gt = &i915->gt;
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
+	query_hwconfig_table,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index bde5860b3686..a1281f35b190 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2499,6 +2499,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
 #define DRM_I915_QUERY_MEMORY_REGIONS   4
+#define DRM_I915_QUERY_HWCONFIG_TABLE   5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
-- 
2.25.1

