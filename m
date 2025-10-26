Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8DC0AED8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0F10E2FE;
	Sun, 26 Oct 2025 17:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAzqUQkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896D10E32E;
 Sun, 26 Oct 2025 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761499863; x=1793035863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fifbrxXIC5cS3/HSVW3Hz+1c9zA/vYZoEBCNFAeuS8s=;
 b=eAzqUQkj/BuV3zKDlzUJJdxKqzSNSbublbXHP+H9eOVvscrUUlIBQ7Gc
 p1QI/4gyPr7o56jPTwFoXsmMW+94GuJFsc0tjPdp78aCMmJBX1QQNVx2E
 Sf1KbNUw3NWUF1DlQxEvXdhPP+HsJPcbQBtm1k6AEDlsF/INgGAqBoh+f
 OCMhWGmCWf/hRw13QwXERvy8FSW1boRAsTpy3Y/3m+SzilTjpaCAbshFt
 MmqHSgtwHtV+opJZnEJQMDdDjjNkLu5CY8bCuHJu34JU24+0i8JIPn5/K
 EaHJJyOe5z5kU5U4s1WWrzfgRjgyE0WMYnlbIiZjSNyZJXtMgUVtSKjkn Q==;
X-CSE-ConnectionGUID: +NBW6Z/bQ0WZYopVnvz4gQ==
X-CSE-MsgGUID: 5/Azjj/ZRru6PQe46g8oAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63629676"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="63629676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 10:31:03 -0700
X-CSE-ConnectionGUID: I7TZ7N69Rl6HWg1CFpTSqQ==
X-CSE-MsgGUID: xOXce8AVQbSfNYdkWfaptg==
X-ExtLoop1: 1
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 10:31:01 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/10] drm/i915/display: Enable/disable casf
Date: Sun, 26 Oct 2025 22:56:26 +0530
Message-Id: <20251026172628.2705365-10-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251026172628.2705365-1-nemesa.garg@intel.com>
References: <20251026172628.2705365-1-nemesa.garg@intel.com>
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

Call intel_casf_enable and intel_casf_disable
in atomic commit path to enable and disable casf.
Call intel_casf_update_strength to only update
the desired strength value.

v2: Introduce casf_enable here.[Ankit]
v3: Use is_disabling in casf_disabling.[Ankit]
v4: Swap old_state and new_state param.[Ankit]
v5: In disable fn move win_sz after sharpness_ctl.
v6: Rebase and update commit message.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c82439150eb9..94fff7c5f8dc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -980,6 +980,24 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
 		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
 }
 
+static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
+				const struct intel_crtc_state *old_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
+}
+
+static bool intel_casf_disabling(const struct intel_crtc_state *old_crtc_state,
+				 const struct intel_crtc_state *new_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_disabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -1135,6 +1153,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	if (hsw_ips_pre_update(state, crtc))
@@ -6735,6 +6756,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
+	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+		intel_casf_enable(new_crtc_state);
+	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
+		intel_casf_update_strength(new_crtc_state);
+
 	intel_fbc_update(state, crtc);
 
 	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
-- 
2.25.1

