Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56666A74A41
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 14:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A284610EA13;
	Fri, 28 Mar 2025 13:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWAyZOKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9FA10EA14;
 Fri, 28 Mar 2025 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743166830; x=1774702830;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mdyrTUda0nXNAk2owFXlzWnrSxdCzVqgAhXsKETTEzs=;
 b=UWAyZOKMS6L4u/+tkWXl3I9vZEcskayt7q5KyuNZ6+srYjJxpsz+ZkPP
 u+B1eJBf+gwutsXBEMeatpBInefgYqVIXAMzY2drnXf9LNiQnIvsK3l4k
 vsIeFnj9Y+xLUUGI8ssJV0DLpNjPwkEej9sTAXgXDVqfOq7Q5X5j0KhBy
 ueE5kiyxnc6Jka0wuFqWa6y8bUJaJ0V0IU74sxk8eETZP9Kmqvg2+9wJT
 AnLDq1pxg1DWAZtrD2sPzCZ8Rwn/9FtRp2PO6Zzjp7ktgLlCaxo/EA5y6
 Pjxv7T90JXEbDhw7TOQtNRaloNbpIL3rQ1RhmCcOvmyCJ4DuY9VcIKZlB g==;
X-CSE-ConnectionGUID: VPYctw7fRxC2eAfs43/VZw==
X-CSE-MsgGUID: jdUPiItaSheELNacXaH4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55186662"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55186662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 06:00:30 -0700
X-CSE-ConnectionGUID: Zl7X9F7xSQ6TLpvp2Oha6w==
X-CSE-MsgGUID: L/LTb/LsTVWhup8y9i67KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130296134"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 06:00:28 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 28 Mar 2025 18:15:39 +0530
Subject: [PATCH v11 5/5] drm/i915/display: Indexed 8bit format does not
 support async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-asyn-v11-5-ecc2d33aac69@intel.com>
References: <20250328-asyn-v11-0-ecc2d33aac69@intel.com>
In-Reply-To: <20250328-asyn-v11-0-ecc2d33aac69@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Async flip is not supported with Indexed 8 bit format as it depends on
LUT and can't be updated atomically.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index baa82d58900d38caf1420ce46ff6d1c003d12138..78dbbe5d1f293316dc097ce58275569eeed0b34b 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -177,7 +177,8 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
 bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
 				u64 modifier)
 {
-	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier)) {
+	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier) ||
+	    format == DRM_FORMAT_C8) {
 		drm_dbg_kms(plane->base.dev,
 			    "[PLANE:%d:%s] Planar formats do not support async flips\n",
 			    plane->base.base.id, plane->base.name);

-- 
2.25.1

