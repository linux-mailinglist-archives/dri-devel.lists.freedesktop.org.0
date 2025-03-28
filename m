Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA9A74E4F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FD910EA6D;
	Fri, 28 Mar 2025 16:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBHi3MZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2740010EA62;
 Fri, 28 Mar 2025 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743178327; x=1774714327;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7Q8mYrS8buhckSKArA0hNNf+PJ1wnGtspVGx3a7jivU=;
 b=OBHi3MZ09R9IbiBk2eZdcpxxRAQdS+/jOKpf/pbz8jbDuEo0Z37/dKRt
 R3YOK+BXSd/5mUlWF7ARumz8vOOur+z3eQiBjx4pPA7zoeuG3l5qzvxEn
 Ir5fAQFgfKMCEQPOVD4+7IDV2lon1YBwn2S5iIRdvcQ5bjhvCJ76Jt7Rn
 TSSei7e5hQ8AUkyKzAmSJGxNsPkefMBhOwEWX48UK2gzWs/jndvE50Ey3
 iYKy4uKOmrac/rajWUiCE4E6TcvXRPai/Ko15+kTDGvMNLnt+oA/Q4TbQ
 RCPwbf7/cbVBZrYVsHCpILuKTXsT/A7Qlh9JK/APBcBmARugm/xObiXyY A==;
X-CSE-ConnectionGUID: tS4GlQzBSkis8pKm/CNtAw==
X-CSE-MsgGUID: kzpirkPyQkW8IdhrdSRXJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55207127"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55207127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:11:09 -0700
X-CSE-ConnectionGUID: PU6ou7w2RbWf+2rrL5AP3g==
X-CSE-MsgGUID: 7w34+dg/QumFbV4NxpRtyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="129624868"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 09:11:07 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 28 Mar 2025 21:26:24 +0530
Subject: [PATCH v11 5/5] drm/i915/display: Indexed 8bit format does not
 support async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-asyn-v11-5-a50d13bfea0d@intel.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
In-Reply-To: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 3b9d3e1620cd882b8a7f9b4c96640e42367248bb..1bcfa5f4fd63442b632655ccaf325a87be78fe21 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -177,7 +177,8 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
 bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
 				u64 modifier)
 {
-	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier))
+	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier) ||
+	    format == DRM_FORMAT_C8)
 		return false;
 
 	return plane->can_async_flip && plane->can_async_flip(modifier);

-- 
2.25.1

