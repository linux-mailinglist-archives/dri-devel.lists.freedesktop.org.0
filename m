Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC38B117C2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1410E9CA;
	Fri, 25 Jul 2025 05:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQTHd4wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AEF10E9C9;
 Fri, 25 Jul 2025 05:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419915; x=1784955915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhDnF8ClwyNGQAT4np6L7twh7tr8OmNjrj8ha/zoQqg=;
 b=nQTHd4wkUIZFzDxrju3sZJdxpWBLr36WbHniRuC5YcIHx/cYT7WivS6C
 eFgNMb8hOi28VNNvmOAkURdpvDAZEvBna0i2pMipMojtGvrGrYbvItbic
 gqL5idvyoYudquyMz96TXASN085kyFg62JbBesDQ8yai/5EU35CjPPQhq
 iD+lJ+gOzxOpb0jSy9Dh8Wc5+ht3vktrG+fWnKeJdAdHXmy0aoOWBnA7M
 u1Btf2zALVVE/1eUzWE1OtQ8pn9lD8WOyVNprHsAeh7uN9caHCbny9nGe
 fiUlSihy5bnuitRnWZS8vdJv/BrE7kYEptQpeflF49xdfdDvVwoW3spnw Q==;
X-CSE-ConnectionGUID: t9Vz6az9TBKn3L0dhyeSsA==
X-CSE-MsgGUID: nTizhGicSCCkfWml+k5ZiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299571"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:15 -0700
X-CSE-ConnectionGUID: wYnpleLhT361juzMs8Dn2Q==
X-CSE-MsgGUID: OLvCxekSROuat1FYEZnGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956807"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 26/28] drm/i915/writeback: Define the disable sequence for
 writeback
Date: Fri, 25 Jul 2025 10:34:07 +0530
Message-Id: <20250725050409.2687242-27-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Define the disable sequence for a writeback encoder. We only disable
the encoder if no writeback job is pending, if it is then we just
need to disable the wd function so that values can be updated
accordingly.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index d66843fecd9a..f8e940d91cb7 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -596,6 +596,33 @@ void intel_writeback_isr_handler(struct intel_display *display)
 	}
 }
 
+static void
+intel_writeback_disable_encoder(struct intel_atomic_state *state,
+				struct intel_encoder *encoder,
+				const struct intel_crtc_state *crtc_state,
+				const struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_writeback_connector *wb_conn =
+		enc_to_intel_writeback_connector(encoder);
+	struct intel_crtc *pipe_crtc;
+	int i = 0;
+
+	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, crtc_state, i) {
+		const struct intel_crtc_state *old_pipe_crtc_state =
+			intel_atomic_get_old_crtc_state(state, pipe_crtc);
+
+		intel_crtc_vblank_off(old_pipe_crtc_state);
+	}
+
+	intel_de_rmw(display, TRANSCONF_WD(crtc_state->cpu_transcoder), WD_TRANS_ENABLE,
+		     REG_FIELD_PREP(WD_TRANS_ENABLE, 0));
+	intel_de_rmw(display, WD_TRANS_FUNC_CTL(crtc_state->cpu_transcoder),
+		     TRANS_WD_FUNC_ENABLE,
+		     REG_FIELD_PREP(TRANS_WD_FUNC_ENABLE, 0));
+	wb_conn->frame_num = 1;
+}
+
 int intel_writeback_init(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
@@ -624,6 +651,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->get_hw_state = intel_writeback_get_hw_state;
 	encoder->compute_config = intel_writeback_compute_config;
 	encoder->enable = intel_writeback_enable_encoder;
+	encoder->disable = intel_writeback_disable_encoder;
 
 	connector = &writeback_conn->connector;
 	intel_writeback_connector_alloc(connector);
-- 
2.34.1

