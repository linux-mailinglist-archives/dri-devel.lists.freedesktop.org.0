Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84B986CF3F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE23B10E4FD;
	Thu, 29 Feb 2024 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6aCAS2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496B210E537;
 Thu, 29 Feb 2024 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709224336; x=1740760336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G3/UAREinyvvhLjZ3av94lgMfwqqhK6NCHagumrcJV4=;
 b=J6aCAS2pWiw0eJgSq0aUEszm/Ox325WusuAav7OzVyW2U61ezB6P70pO
 mMjsF6E/0Zoi5glLlhTxJkOi9M/kAFZCt4Jy7PKrb3TkW5ttyUOttyxtr
 CLJJE1T3BBeT1ReTTpT+b09aB+TSrE/2Nv49jqsSQfm3Rr1jlF34Ld987
 USx8Y61dwnhu6ld6J8DNvEZlAYpaLlxDbfsZy6On3bYsdNaBDZexKKKBr
 oksS6LN5g4oAA2k5vfSsD1iEeFTfFZY7Xz25k4I+4tpnW2yIPTac/S8LI
 Rg5u02UNSfjKyTkOGrN9wJMdG39PwEzTcuhvM97QTOYLBh4j+Q4dNN7Q7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29137219"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29137219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7754335"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 08:32:10 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v13 2/8] drm: Add crtc state dump for Adaptive Sync SDP
Date: Thu, 29 Feb 2024 21:55:15 +0530
Message-Id: <20240229162521.2943630-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229162521.2943630-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240229162521.2943630-1-mitulkumar.ajitkumar.golani@intel.com>
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

--v2:
- Add correct place holder and name change for AS_SDP_OP_MODE.
- Separate i915 changes from drm changes.
- Remove extra lines.

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
index 8ce986fadd9a..1256730ea276 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1335,6 +1335,7 @@ struct intel_crtc_state {
 		union hdmi_infoframe hdmi;
 		union hdmi_infoframe drm;
 		struct drm_dp_vsc_sdp vsc;
+		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
 	u8 eld[MAX_ELD_BYTES];
-- 
2.25.1

