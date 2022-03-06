Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96F4CEE65
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 00:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DFF10E07E;
	Sun,  6 Mar 2022 23:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8104410E065;
 Sun,  6 Mar 2022 23:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646608922; x=1678144922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8V6exDaevPi/CmwwDLk6Z04+KvYzaYnMO2AbmI7T3g=;
 b=AM80WyZGHf9UnovMJm6ZoXwZX5hZV18Ppg6/kP9To06DospXq9h4q2Ze
 Mu4zvZTib6c4vmFmUH3hyx/rzkk57+K6CqImbd6Os2hl7ip4XKKH/2n8l
 9p8vEpbBNqXVyQZUIKB3vUA8bXlWczQ+SZGeIA9Ss17OQwhCz8PQ3Ef71
 8EbOUE9uz9Ki9rWVVnuEteuWbCL0MbWqSXbEG6rNh+fRaU814awsqrkzF
 B7x0X76d1bzn0/rnXahmPhT/kIfh3mP1KmfI/XNZGm1SAxhBeVhIJK/Ss
 ptOKyeXyBrm9FqQUwuADymu6kLFn6HzZxKYBmSwgzEXS4SiL1syjiAl2k A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="234222281"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="234222281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:22:01 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="536896008"
Received: from jpdefuri-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.153.86])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:22:01 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v7 2/2] drm/i915/uapi: Add query for hwconfig blob
Date: Sun,  6 Mar 2022 15:21:57 -0800
Message-Id: <20220306232157.1174335-3-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306232157.1174335-1-jordan.l.justen@intel.com>
References: <20220306232157.1174335-1-jordan.l.justen@intel.com>
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

In this interface i915 is returning a blob of data which it receives
from the guc software. This blob provides some useful data about the
hardware for drivers. The format of this blob will be documented in
the Programmer Reference Manuals when released.

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
index 2dfbc22857a3..b5ca00cb6cf6 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	return total_length;
 }
 
+static int query_hwconfig_blob(struct drm_i915_private *i915,
+			       struct drm_i915_query_item *query_item)
+{
+	struct intel_gt *gt = to_gt(i915);
+	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
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
index 05c3642aaece..071ffd9d51f1 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2691,6 +2691,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
 #define DRM_I915_QUERY_MEMORY_REGIONS   4
+#define DRM_I915_QUERY_HWCONFIG_BLOB	5
 /* Must be kept compact -- no holes and well documented */
 
 	/**
-- 
2.34.1

