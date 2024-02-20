Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212C85C822
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E24D10E590;
	Tue, 20 Feb 2024 21:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRKeqxzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186FE10E591;
 Tue, 20 Feb 2024 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463925; x=1739999925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gBnaGbJo0sRP2VZ06cwHjp0SVMzCO2+iZdo+YwfDFqk=;
 b=DRKeqxzr89/5aNAS4CCtBGNTVyY4Z6L+qvcjc4AC/BgNj82wmVX0SLU7
 XKLu8ucZM1LTz2u9FkN1YHQmLyK3Cd0R9XCxxLA+jQ1UlQ7HyPod2XONz
 xTp2vt2EvmrOv0BYk1M76Hy/jo9XMrIZBncUQf1H5JzYRdUyRv6zU7dEH
 4fHgw4j1L+buDJuAGuGkBoWK7QPS8ko5rs+T5Awb3c0OAnC4njz7QaAWX
 C7FDkNpNyKVavO1EOkON+UiDuLgJeGI8OjILhqlRuhUgOZrqwS0Xfb55a
 toZdPoelMOoZLYX/d7VrAkT5b38VkgajV5AgveY6eq4ohazhza08nztLP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738672"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061629"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:43 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 16/21] drm/i915/dp: Allocate/free DP tunnel BW in the
 encoder enable/disable hooks
Date: Tue, 20 Feb 2024 23:18:36 +0200
Message-Id: <20240220211841.448846-17-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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

Allocate and free the DP tunnel BW required by a stream while
enabling/disabling the stream during a modeset.

v2:
- Move the allocation up from encoder hooks to
  intel_atomic_commit_tail().

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v1)
---
 drivers/gpu/drm/i915/display/intel_ddi.c     | 1 +
 drivers/gpu/drm/i915/display/intel_display.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea4415902044..ed7301808604d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -54,6 +54,7 @@
 #include "intel_dp_aux.h"
 #include "intel_dp_link_training.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpio_phy.h"
 #include "intel_dsi.h"
 #include "intel_fdi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 20647c97e86fa..445efe0087cde 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7123,6 +7123,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_commit_modeset_disables(state);
 
+	intel_dp_tunnel_atomic_alloc_bw(state);
+
 	/* FIXME: Eventually get rid of our crtc->config pointer */
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 		crtc->config = new_crtc_state;
-- 
2.39.2

