Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0DB15E51
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1E410E677;
	Wed, 30 Jul 2025 10:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma3lzg1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB04610E44F;
 Wed, 30 Jul 2025 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871778; x=1785407778;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YFNGTPjePIco4WSqmjTlfkuYapRf2doVSp2QdWVcS/8=;
 b=ma3lzg1wnwgW7yGg+1DCkOzWve4y6asDvCmW7lWnlGHLvAgmg6Cn4dEj
 LsVh2yaArc1olJ6co5NEKm6q73wb7wfs/MFiX+lJdk9nRft/WZjXavPzk
 U7aE4zsd9pMv6SKPrFmyi7VAJIgqpFCMF46Hr8AyqK/c8jx69hipcqMUI
 ugz75Q5TbWjCp2e+v3IS4/bqoiXYueE1r11g1Y7YbD8JLJ/4jg8sTKNb5
 vyv4a/Y89IxYpc2lRJnkdMQGGFjhZ03axJhm5Ru9/mdXWIebuB1kGX9IB
 BHh2f6SrEEhmw5r8+rJSfNkAlc1Ro09lzwQvuP7Y/srVoUi+fSJmULUnV A==;
X-CSE-ConnectionGUID: pwIq03WRTRu5kwoxyOkbjA==
X-CSE-MsgGUID: sHzC3bBwQnuyVyi2ofEUSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81617788"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81617788"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:36:18 -0700
X-CSE-ConnectionGUID: Cse/k/hnTRWVmz/qfHYCCw==
X-CSE-MsgGUID: ZiKYgm94TA2GWI4vxsCi3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162222527"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 03:36:15 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 30 Jul 2025 15:46:39 +0530
Subject: [PATCH v2 4/4] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-atomic-v2-4-cc02ce0263dd@intel.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com, 
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com, 
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

For failures in async flip atomic check/commit path return user readable
error codes in struct drm_atomic_state.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7035c1fc9033b10327be081f26715446687652c4..893e4d0eb4c3d4d2611720bc7f627b11af81ea8b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5944,6 +5944,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		drm_dbg_kms(display->drm,
 			    "[CRTC:%d:%s] modeset required\n",
 			    crtc->base.base.id, crtc->base.name);
+		state->base.error_code = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
 		return -EINVAL;
 	}
 
@@ -5955,6 +5956,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		drm_dbg_kms(display->drm,
 			    "[CRTC:%d:%s] async flip disallowed with joiner\n",
 			    crtc->base.base.id, crtc->base.name);
+		state->base.error_code = DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED;
 		return -EINVAL;
 	}
 
@@ -6013,6 +6015,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		drm_dbg_kms(display->drm,
 			    "[CRTC:%d:%s] modeset required\n",
 			    crtc->base.base.id, crtc->base.name);
+		state->base.error_code = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
 		return -EINVAL;
 	}
 
@@ -6055,6 +6058,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 				    plane->base.base.id, plane->base.name,
 				    &new_plane_state->hw.fb->format->format,
 				    new_plane_state->hw.fb->modifier);
+			state->base.error_code = DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED;
 			return -EINVAL;
 		}
 

-- 
2.25.1

