Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9836B18E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 12:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295986E56A;
	Mon, 26 Apr 2021 10:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D525D6E821;
 Mon, 26 Apr 2021 10:20:35 +0000 (UTC)
IronPort-SDR: mZjQQYNa+TUGmb/eV1WCruJM4YZrYm2oNJeOrA2PSSDltIW7ga9XR7B70tzc1miRXeVTme8lVd
 IlYPrvP0cp7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196370966"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196370966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 03:20:35 -0700
IronPort-SDR: IQUSiC7sdV5S9y82PIvm0r0pJPLACTXmhnLUGwOSrkT9wXrw5c8stsT4BHA3yg/jrWCe43AewI
 rc4qEDKlYdcw==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422613775"
Received: from rgunnin1-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 03:20:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915: Return error value when bo not in LMEM for
 discrete
Date: Mon, 26 Apr 2021 11:18:21 +0100
Message-Id: <20210426101821.42147-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426101821.42147-1-matthew.auld@intel.com>
References: <20210426101821.42147-1-matthew.auld@intel.com>
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
index a10e26380ef3..be9155c95c33 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -63,6 +63,7 @@
 #include "display/intel_vdsc.h"
 #include "display/intel_vrr.h"
 
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
 
 #include "gt/intel_rps.h"
@@ -11269,11 +11270,20 @@ intel_user_framebuffer_create(struct drm_device *dev,
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
