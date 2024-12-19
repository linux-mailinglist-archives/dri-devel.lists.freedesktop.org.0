Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E99F8718
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9710EDDD;
	Thu, 19 Dec 2024 21:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/5A+5p4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90610EDC5;
 Thu, 19 Dec 2024 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644123; x=1766180123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iHaOt6GOAV8rYtRQfXA3tw0c5poZTvnvzr8sUGqI2z4=;
 b=e/5A+5p4wBogiJG/Dep0i1YWuFu5XB2GG8cDDWheO+eO3JAHLCAUrmMZ
 ZOoNUvgptMQiYJvQvl+IyF4TYskV4SNrhE70dancF9HJzFN0u+R+JRs2d
 ha3U6LBXT3pW5e0xkg0eQ87slGGjklz/ofFYsA7pqeuvISC2q4JYKRxeo
 ex1+yJuxjSTTFmrCSW1GPWfG79TV1kClq+gyyaiAspTq/HPT6q0YWp91j
 u0Iy8QiMlU0f84pyaud8vpQ+dnucooIasywJgXFG9pVxh2/FIlcXRnixa
 8S5d33e6Prxt/EQdLokxg4e6d/U2/9cdlUN5BPzwsf6NRbaWrSUu4B2ey Q==;
X-CSE-ConnectionGUID: O6RhXtdRQmiTJ17YuPwSig==
X-CSE-MsgGUID: CIPN4G4jRlOBEfXnUdAC/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590374"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:15 -0800
X-CSE-ConnectionGUID: hbLqYIR+Qs+3MvPA5CXJ6w==
X-CSE-MsgGUID: s3gC3H4tSSKUiZu7jgAdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146272"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 11/16] drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ
 registers
Date: Thu, 19 Dec 2024 23:34:00 +0200
Message-Id: <38cfa6554f8249605a8af98353f64c6b53d1d106.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Write the DP2 specific VFREQ registers.

This is preparation for enabling 128b/132b SST. This path is not
reachable yet.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 64528ff8856e..91e6cd91e91f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3467,8 +3467,20 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_crtc *pipe_crtc;
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	int i;
 
+	/* 128b/132b SST */
+	if (intel_dp_is_uhbr(crtc_state)) {
+		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+		u64 crtc_clock_hz = KHz(adjusted_mode->crtc_clock);
+
+		intel_de_write(display, TRANS_DP2_VFREQHIGH(cpu_transcoder),
+			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
+		intel_de_write(display, TRANS_DP2_VFREQLOW(cpu_transcoder),
+			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
+	}
+
 	intel_ddi_enable_transcoder_func(encoder, crtc_state);
 
 	/* Enable/Disable DP2.0 SDP split config before transcoder */
-- 
2.39.5

