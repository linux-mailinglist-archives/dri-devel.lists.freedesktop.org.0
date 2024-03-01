Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9586DDA0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31910EC1A;
	Fri,  1 Mar 2024 08:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghGQMWJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C6B10EC1A;
 Fri,  1 Mar 2024 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709283126; x=1740819126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpclgKnTmt+A29jp97EmlgpIl5Fc/6jynRS93nRPgIE=;
 b=ghGQMWJ+VuIFi4NzRmdrQQYJUED9IetG+3nq9bIiZ1AzbQLsc3ZgSfZB
 ccHtFjnSOGGWQIHxLqA4CxQA2hikCk36C2nnAD/eVXe9M76B6+13nhFRj
 qGHTOM7pB7tSMXCUtdMocixmRV7slRgwAx68ELFknq50KejEBiVCHEPFH
 KnPZ0AfBgf1G7tEH2BLN0jiWzrtXplbMjzGFkRz07lkjWuG+7x2+jLMpx
 0xUbXuYBfBXV6/BshtNeUbHvQIg8YUqYzVTw3tW9XvGYknIT58FKjhwoP
 2U+3fwVO+/ro3m6kmjOeBtjNzcZHQhOnNi+K/BqYB0XgvxEm4SoCMJ3kc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14516492"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14516492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="38986493"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 01 Mar 2024 00:52:04 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v15 7/9] drm/i915/display: Add state checker for Adaptive Sync
 SDP
Date: Fri,  1 Mar 2024 14:15:01 +0530
Message-Id: <20240301084503.2971826-8-mitulkumar.ajitkumar.golani@intel.com>
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

Enable infoframe and add state checker for Adaptive Sync
SDP enablement.

--v1:
- crtc_state->infoframes.enable, to add on correct place holder.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ab2f52d21bad..88158f06bf82 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4791,6 +4791,17 @@ intel_compare_dp_vsc_sdp(const struct drm_dp_vsc_sdp *a,
 		a->content_type == b->content_type;
 }
 
+static bool
+intel_compare_dp_as_sdp(const struct drm_dp_as_sdp *a,
+			const struct drm_dp_as_sdp *b)
+{
+	return a->vtotal == b->vtotal &&
+		a->target_rr == b->target_rr &&
+		a->duration_incr_ms == b->duration_incr_ms &&
+		a->duration_decr_ms == b->duration_decr_ms &&
+		a->mode == b->mode;
+}
+
 static bool
 intel_compare_buffer(const u8 *a, const u8 *b, size_t len)
 {
@@ -4846,6 +4857,30 @@ pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *i915,
 	drm_dp_vsc_sdp_log(&p, b);
 }
 
+static void
+pipe_config_dp_as_sdp_mismatch(struct drm_i915_private *i915,
+			       bool fastset, const char *name,
+			       const struct drm_dp_as_sdp *a,
+			       const struct drm_dp_as_sdp *b)
+{
+	struct drm_printer p;
+
+	if (fastset) {
+		p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
+
+		drm_printf(&p, "fastset requirement not met in %s dp sdp\n", name);
+	} else {
+		p = drm_err_printer(&i915->drm, NULL);
+
+		drm_printf(&p, "mismatch in %s dp sdp\n", name);
+	}
+
+	drm_printf(&p, "expected:\n");
+	drm_dp_as_sdp_log(&p, a);
+	drm_printf(&p, "found:\n");
+	drm_dp_as_sdp_log(&p, b);
+}
+
 /* Returns the length up to and including the last differing byte */
 static size_t
 memcmp_diff_len(const u8 *a, const u8 *b, size_t len)
@@ -5099,6 +5134,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	} \
 } while (0)
 
+#define PIPE_CONF_CHECK_DP_AS_SDP(name) do { \
+	if (!intel_compare_dp_as_sdp(&current_config->infoframes.name, \
+				      &pipe_config->infoframes.name)) { \
+		pipe_config_dp_as_sdp_mismatch(dev_priv, fastset, __stringify(name), \
+						&current_config->infoframes.name, \
+						&pipe_config->infoframes.name); \
+		ret = false; \
+	} \
+} while (0)
+
 #define PIPE_CONF_CHECK_BUFFER(name, len) do { \
 	BUILD_BUG_ON(sizeof(current_config->name) != (len)); \
 	BUILD_BUG_ON(sizeof(pipe_config->name) != (len)); \
@@ -5280,6 +5325,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_INFOFRAME(hdmi);
 	PIPE_CONF_CHECK_INFOFRAME(drm);
 	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
+	PIPE_CONF_CHECK_DP_AS_SDP(as_sdp);
 
 	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
 	PIPE_CONF_CHECK_I(master_transcoder);
-- 
2.25.1

