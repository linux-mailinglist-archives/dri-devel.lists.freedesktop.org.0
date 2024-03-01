Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5C86DD97
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0D610EC0E;
	Fri,  1 Mar 2024 08:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3FqT3Jl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140A910EC0D;
 Fri,  1 Mar 2024 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709283117; x=1740819117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQSwVbk0GjfRCtFqTiHg+5ZBLMtKEj3aCARUJiU3eq4=;
 b=k3FqT3JlxUZl9Jo73XiWY9o6ODJ7h3m6uy5bPnp5WWem7oVoVcWePvhv
 bV6MBN+VVmvKRaSM5UXo9WHKwFKQt7ZvqnnXfJLswmYjfGpE1SAGpVY6R
 UVTaWkfwfmLf3mIsF/Hi6SbfuLpCNhKHBV2r8+BA88eUFjf2P6g3abPid
 IU/V6WASJfHj4hIZ/Kgmib51Dn/DWRfi0rNn6L2GdinaE5ZWNPkv89pHL
 sncckdSmAcgrJloFb+/EapPehxhPeG9tuJpLBM2qsoDP35wfJoYQbgnV0
 dFDqr8scWk10GoiuV8sJYWmTVhJSYzlwrScE3nnlSA58b9RlFOQ6Gg9zz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14516480"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14516480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:51:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="38986455"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 01 Mar 2024 00:51:56 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v15 3/9] drm: Add crtc state dump for Adaptive Sync SDP
Date: Fri,  1 Mar 2024 14:14:57 +0530
Message-Id: <20240301084503.2971826-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add crtc state dump for Adaptive Sync SDP to know which
crtc specifically caused the failure.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 .../gpu/drm/i915/display/intel_crtc_state_dump.c    | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h  |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 4bcf446c75f4..1e4618271156 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -51,6 +51,15 @@ intel_dump_infoframe(struct drm_i915_private *i915,
 	hdmi_infoframe_log(KERN_DEBUG, i915->drm.dev, frame);
 }
 
+static void
+intel_dump_dp_as_sdp(struct drm_i915_private *i915,
+		     const struct drm_dp_as_sdp *as_sdp)
+{
+	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "AS_SDP");
+
+	drm_dp_as_sdp_log(&p, as_sdp);
+}
+
 static void
 intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
 		      const struct drm_dp_vsc_sdp *vsc)
@@ -302,6 +311,10 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
 		intel_dump_dp_vsc_sdp(i915, &pipe_config->infoframes.vsc);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
+		intel_dump_dp_as_sdp(i915, &pipe_config->infoframes.as_sdp);
+
 
 	if (pipe_config->has_audio)
 		intel_dump_buffer(i915, "ELD: ", pipe_config->eld,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 860e867586f4..098957cea25b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1338,6 +1338,7 @@ struct intel_crtc_state {
 		union hdmi_infoframe hdmi;
 		union hdmi_infoframe drm;
 		struct drm_dp_vsc_sdp vsc;
+		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
 	u8 eld[MAX_ELD_BYTES];
-- 
2.25.1

