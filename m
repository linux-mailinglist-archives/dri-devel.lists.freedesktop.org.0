Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40636C150
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6476E91F;
	Tue, 27 Apr 2021 08:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC46E91F;
 Tue, 27 Apr 2021 08:54:43 +0000 (UTC)
IronPort-SDR: 2lMT1nnHg/I/oinzEqVNKCLIi7lYbTloh4txJxYdF74Y02dso/NVuAH7dp1p3+87wXrcWlMjk5
 ulRTri6yJpvA==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260428707"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="260428707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:43 -0700
IronPort-SDR: b9io+M0Gu71zN+wQABdCQYxo5UbSPaHHIsU7GoLHjns0LxCaDkeWKpCW2a6+0l2wDNmpKF02LV
 IMGfqueoGkcA==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="422978863"
Received: from galinart-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.239])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/i915: Return error value when bo not in LMEM for
 discrete
Date: Tue, 27 Apr 2021 09:54:17 +0100
Message-Id: <20210427085417.120246-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210427085417.120246-1-matthew.auld@intel.com>
References: <20210427085417.120246-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Return EREMOTE value when frame buffer object is not backed by LMEM
for discrete. If Local memory is supported by hardware the framebuffer
backing gem objects should be from local memory.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e246e5cf7586..6280ba7f4c17 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -63,6 +63,7 @@
 #include "display/intel_vdsc.h"
 #include "display/intel_vrr.h"
 
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
 
 #include "gt/intel_rps.h"
@@ -11278,11 +11279,20 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	struct drm_i915_gem_object *obj;
 	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
+	struct drm_i915_private *i915;
 
 	obj = i915_gem_object_lookup(filp, mode_cmd.handles[0]);
 	if (!obj)
 		return ERR_PTR(-ENOENT);
 
+	/* object is backed with LMEM for discrete */
+	i915 = to_i915(obj->base.dev);
+	if (HAS_LMEM(i915) && !i915_gem_object_is_lmem(obj)) {
+		/* object is "remote", not in local memory */
+		i915_gem_object_put(obj);
+		return ERR_PTR(-EREMOTE);
+	}
+
 	fb = intel_framebuffer_create(obj, &mode_cmd);
 	i915_gem_object_put(obj);
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
