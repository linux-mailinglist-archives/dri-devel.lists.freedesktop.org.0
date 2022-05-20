Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49EE52F5F7
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 01:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DB310EBBB;
	Fri, 20 May 2022 23:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7824D10E62E;
 Fri, 20 May 2022 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653087859; x=1684623859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NMBpS8XgS5fR8ScCm2bZhzx2Cq3nGut2EY6MfxGX8q0=;
 b=gcdNOmygwhhAOHuPEyXLmlLvcZRDlImZW6M24H0/9POjEaUwwwCcxzmD
 DgPovC1VZ1DhkOL1QmLbfXFM4JYsDlaKECeuHXAfX8qlwK/3QC8+8TdT6
 vliDgCm/qhzVZOocyD8ObQUdwDJWNONnE3CYllzQNT7z0A8GOYP4mGtMF
 8I6YSAFUebXpd3Lk4ta7QPTjlsvMbqvkjjuQHzfZ4+PPF7ZrPW5KG1bYS
 ppjaOVuFImpBpWv987bSGDXax/r7vojwlrjH3AeDJUOopGVPqJQt9g0xH
 SLa1n74vJdy1D0aosbiVgM2DL9RiBPlkZv/3auWAsA+3FpFNBiOgtqEdq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="260348898"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="260348898"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 16:04:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="599482028"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 16:04:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/6] drm/i915/xehp: Drop GETPARAM lookups of
 I915_PARAM_[SUB]SLICE_MASK
Date: Fri, 20 May 2022 16:04:04 -0700
Message-Id: <20220520230408.3787166-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220520230408.3787166-1-matthew.d.roper@intel.com>
References: <20220520230408.3787166-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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
2.35.3

