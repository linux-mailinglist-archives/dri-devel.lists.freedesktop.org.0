Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E6B30FBB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9D910EA7C;
	Fri, 22 Aug 2025 07:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvohIZPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D010EA76;
 Fri, 22 Aug 2025 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755846010; x=1787382010;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bYfztuFj+cBsEPLwzghG5h/SB1j93fA9NrWb8Eqccio=;
 b=JvohIZPAaOAIS8EKu1giij/e72GqK0LihiBF2T9BRRy3iPYieEytlWPV
 3QZpa/ZtTe1DNAJI5UVEeEX8RbPNuRHtlKcDHiQJlWmjqoBUTp2czbLdU
 IjORRY+CJOs6+pWpGZJfmP5VhIGVAVWdG6DHgKc+K2vGza/QluBhhfl2a
 1nWZXcrSkrCkHLFYNe0FhNCT9kpbXYDDhDRCQND5alAI09bPj0MfGQp7X
 oqCLPgk5bL1K+yBEIFrd703hr+g+hoTLV7yEZeiOEnosCNsPIJfI2+xUp
 npcf5Hjk2KVCt6dJmiZZPSP+iljIG0xyM4byo8EnTciJYGTBPNJhrMprf Q==;
X-CSE-ConnectionGUID: u2PF/hOqRl6id9aV5uLurA==
X-CSE-MsgGUID: 5KO7HganTxea8IAcpLqvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68751646"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68751646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:00:10 -0700
X-CSE-ConnectionGUID: 2MdvZXcxRPS0Pu6IKQm72Q==
X-CSE-MsgGUID: 2bVltB6dQ8a1KOPn3U26Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192301173"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 22 Aug 2025 00:00:06 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 22 Aug 2025 12:30:04 +0530
Subject: [PATCH v3 4/4] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-atomic-v3-4-13a0e8f2c581@intel.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
In-Reply-To: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
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
index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..5e23f4fc747bd01fa05eba63661bf7279b083317 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5950,6 +5950,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		drm_dbg_kms(display->drm,
 			    "[CRTC:%d:%s] modeset required\n",
 			    crtc->base.base.id, crtc->base.name);
+		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
 		return -EINVAL;
 	}
 
@@ -6019,6 +6020,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		drm_dbg_kms(display->drm,
 			    "[CRTC:%d:%s] modeset required\n",
 			    crtc->base.base.id, crtc->base.name);
+		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
 		return -EINVAL;
 	}
 
@@ -6061,6 +6063,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 				    plane->base.base.id, plane->base.name,
 				    &new_plane_state->hw.fb->format->format,
 				    new_plane_state->hw.fb->modifier);
+			state->base.error_code->failure_flags =
+				DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED;
 			return -EINVAL;
 		}
 

-- 
2.25.1

