Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8AA7B75F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 07:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0010E313;
	Fri,  4 Apr 2025 05:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAxBlRhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165E10E308;
 Fri,  4 Apr 2025 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743744826; x=1775280826;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=n4Lcw+o2tFGVugwxTR3rGGz0X1EHJ8/82iNTtwvQg+Q=;
 b=nAxBlRhyEQ21DPDdIQvnV1JFToXorg7Tg7OGoTfaDKjHVUBhSS60PMSe
 ZZAzop0hnoKmFoSlDeliMyTzFTi6VtWmFG6u9Ss61Ze3vFQya7P3K4n/U
 MNDdRT+rCANrt+TxyOHvJk5gPnqy0peod6VrevB4mJ5ijeSynEBUY0FSI
 rEHSZMNwJYgo69M4OgBIJP2cMmjblyszZWBbFRFaCMM4L6K2SdZNxCaw5
 +ag2FcZa0jJ5UNyhInJ1pfypftdSU0ECkmhR8ybb+77wPw7CUDbhUUgVD
 cFqzKOpZffw7azageTx6OUCBobcsh3iQWMmaveY4Ea3AVBIogF76Gv/HJ Q==;
X-CSE-ConnectionGUID: 7Hv5hViLQSySIFTQrzqAdg==
X-CSE-MsgGUID: xNceAYb0RZ2vX2+mIP9RGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44893418"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="44893418"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 22:33:45 -0700
X-CSE-ConnectionGUID: tQzB2ughRgKmymIFfVwXyQ==
X-CSE-MsgGUID: yAPdhHjdQUyoUBPlpHhV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="126992661"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 22:33:41 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 04 Apr 2025 10:48:57 +0530
Subject: [PATCH RESEND v12 5/5] drm/i915/display: Indexed 8bit format does
 not support async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-asyn-v12-5-9e2396596036@intel.com>
References: <20250404-asyn-v12-0-9e2396596036@intel.com>
In-Reply-To: <20250404-asyn-v12-0-9e2396596036@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 20250219093211.4059187-1-arun.r.murthy@intel.com, 
 20250311085422.2573860-1-santhosh.reddy.guddati@intel.com, 
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

Note: This may change the alignment for C8 framebuffers on some
platforms.

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

