Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B742AF90
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CCE6E9F6;
	Tue, 12 Oct 2021 22:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643446E9EF;
 Tue, 12 Oct 2021 22:13:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288157300"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="288157300"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 15:13:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="591933373"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 15:13:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/uapi: Add comment clarifying purpose of
 I915_TILING_* values
Date: Tue, 12 Oct 2021 15:12:45 -0700
Message-Id: <20211012221245.2609670-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The I915_TILING_* values in our uapi header are intended solely for use
with the old get_tiling/set_tiling ioctls that operate on hardware
de-tiling fences; all other uapi communication about tiling types is
done via framebuffer modifiers rather than with these old values.

On newer Intel platforms detiling fences no longer exist so the old
get_tiling/set_tiling ioctls are no longer usable and will always return
-EOPNOTSUPP.  This means there's no reason to add new tiling types (such
as the Tile4 format introduced by Xe_HP) to the uapi header here.  Any
kernel-internal code that needs to represent tiling format should either
rely on framebuffer modifiers (as the display code does) or use some
kind of non-uapi enum (as the GEM blt selftest now does).

References: https://patchwork.freedesktop.org/patch/456656/?series=95308
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/uapi/drm/i915_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index aa2a7eccfb94..9b8e61163c39 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1522,6 +1522,12 @@ struct drm_i915_gem_caching {
 #define I915_TILING_NONE	0
 #define I915_TILING_X		1
 #define I915_TILING_Y		2
+/*
+ * Do not add new tiling types here.  The I915_TILING_* values are for
+ * de-tiling fence registers that no longer exist on modern platforms.  Although
+ * the hardware may support new types of tiling in general (e.g., Tile4), we
+ * do not need to add them to the uapi that is specific to now-defunct ioctls.
+ */
 #define I915_TILING_LAST	I915_TILING_Y
 
 #define I915_BIT_6_SWIZZLE_NONE		0
-- 
2.33.0

