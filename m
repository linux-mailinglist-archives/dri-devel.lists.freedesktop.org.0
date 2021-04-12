Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C35BF88
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F86E25B;
	Mon, 12 Apr 2021 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299FD6E25B;
 Mon, 12 Apr 2021 09:09:30 +0000 (UTC)
IronPort-SDR: KUrlgUkSOhx1eLWPDE8PwkknHqyP8RfI9dw16slOt7+slHZHI9rI/moGU1o4UI6YVR0OBZdVr6
 75hhBFX+regA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709716"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709716"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:29 -0700
IronPort-SDR: 6x7+ih+bTMVnjAbWj4LjK1YPQ4ceHnlKDKXDR2s4HYoBvqKXxl+10tw48cMNBUNr7bQlkLaVQo
 SEYBbp4+qZCw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712656"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/19] drm/i915: Return error value when bo not in LMEM for
 discrete
Date: Mon, 12 Apr 2021 10:05:15 +0100
Message-Id: <20210412090526.30547-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Return EREMOTE value when frame buffer object is not backed by LMEM
for discrete. If Local memory is supported by hardware the framebuffer
backing gem objects should be from local memory.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 411b46c012f8..57b06d8728af 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -63,6 +63,7 @@
 #include "display/intel_vdsc.h"
 #include "display/intel_vrr.h"
 
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
 
 #include "gt/intel_rps.h"
@@ -11279,11 +11280,20 @@ intel_user_framebuffer_create(struct drm_device *dev,
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
