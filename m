Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBE51275A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A810F822;
	Wed, 27 Apr 2022 23:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E89E10E6A8;
 Wed, 27 Apr 2022 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100873; x=1682636873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dr6RzPQTLcFgeteKkg2fEvYdVvXVCQCCLv4Mrji2CyQ=;
 b=P99r2MR58AXkAXQACvx7e/Id6PAKQ9EgZXiRjxk+91zlQ+fRCLzMJSu5
 GvrK08alriUJAKHzuzMelQXEqAcQAT5pdmadCGkAsWuangNlIHgfrq3OC
 /s7uWV+jPYQnxekV72D0XpiTJUJx5UBJIuKJ05oFhNsuLd3FFSogvpUs5
 KrhTUF9XcG7Y0cksBgfwHO3g7uS0JY4jKMn0uPKkiclheyAYDNcVJbJ5p
 3QqJcVgEtMIYo+seq9nUFYBXqxQZrIH78jHdCYgmEa0s4hnAOSYq5jkj1
 h4YgdpBNs9gTN0XYQ/bi3DxfMsg7GYV48yvN9LXbAXhO91pN9P0GdteLg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912014"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495685"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/xehp: Drop GETPARAM lookups of
 I915_PARAM_[SUB]SLICE_MASK
Date: Wed, 27 Apr 2022 16:07:44 -0700
Message-Id: <20220427230747.906625-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427230747.906625-1-matthew.d.roper@intel.com>
References: <20220427230747.906625-1-matthew.d.roper@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Slice/subslice/EU information should be obtained via the topology
queries provided by the I915_QUERY interface; let's turn off support for
the old GETPARAM lookups on Xe_HP and beyond where we can't return
meaningful values.

The slice mask lookup is meaningless since Xe_HP doesn't support
traditional slices (and we make no attempt to return the various new
units like gslices, cslices, mslices, etc.) here.

The subslice mask lookup is even more problematic; given the distinct
masks for geometry vs compute purposes, the combined mask returned here
is likely not what userspace would want to act upon anyway.  The value
is also limited to 32-bits by the nature of the GETPARAM ioctl which is
sufficient for the initial Xe_HP platforms, but is unable to convey the
larger masks that will be needed on other upcoming platforms.  Finally,
the value returned here becomes even less meaningful when used on
multi-tile platforms where each tile will have its own masks.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index c12a0adefda5..ac9767c56619 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -148,11 +148,19 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = intel_engines_has_context_isolation(i915);
 		break;
 	case I915_PARAM_SLICE_MASK:
+		/* Not supported from Xe_HP onward; use topology queries */
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+			return -EINVAL;
+
 		value = sseu->slice_mask;
 		if (!value)
 			return -ENODEV;
 		break;
 	case I915_PARAM_SUBSLICE_MASK:
+		/* Not supported from Xe_HP onward; use topology queries */
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+			return -EINVAL;
+
 		/* Only copy bits from the first slice */
 		memcpy(&value, sseu->subslice_mask,
 		       min(sseu->ss_stride, (u8)sizeof(value)));
-- 
2.35.1

