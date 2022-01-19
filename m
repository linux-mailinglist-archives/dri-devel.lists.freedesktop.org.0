Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805794941E3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2406310E1B5;
	Wed, 19 Jan 2022 20:35:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63210E177;
 Wed, 19 Jan 2022 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642624543; x=1674160543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lddCU8rFW3YNlxHR3xT7eMCRWM3EKACaWB7e0BadotY=;
 b=gLx7S9o/jMjYSN0uKEPZen1y+7V+F4kgYHB21vU/+/kg90GH7k3sAD8W
 XuFD2Ml2G5j/Dv4jLca0qC/A6LnmYoRPJ9MHqivy50G36idme53hawhm8
 E6eMSC6N5UAfjDs/QlHdDwfw4wM/M794qpzu9adTehsZrq9aSMvxmb6Qx
 bEKXGoxh20f9KMxrKSQnla7e0McfMtxfEe/G/V/LDmE+pHIGU3odMsE09
 q54GIZesxqGHJDwuN/wwIY9KCBAyklSKMDwQcUG4N7HdjKvKTYXLGxGMA
 VqD3P1xe33FF2KRooLeKT29q7KzA2oVqtjtpw5MO99ebN34S5TEz/qCjD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245385333"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245385333"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="561188548"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 19 Jan 2022 12:35:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/2] drm/i915/uapi: Add query for hwconfig table
Date: Wed, 19 Jan 2022 12:35:41 -0800
Message-Id: <20220119203541.2410082-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 2dfbc22857a3..609e64d5f395 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	return total_length;
 }
 
+static int query_hwconfig_table(struct drm_i915_private *i915,
+				struct drm_i915_query_item *query_item)
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
+	query_hwconfig_table,
 };
 
 int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 914ebd9290e5..132515199f27 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
 #define DRM_I915_QUERY_MEMORY_REGIONS   4
+#define DRM_I915_QUERY_HWCONFIG_TABLE   5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
-- 
2.25.1

