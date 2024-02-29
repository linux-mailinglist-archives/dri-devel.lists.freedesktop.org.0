Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A586CF4C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B853010E55F;
	Thu, 29 Feb 2024 16:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAeFo6fE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4610E55F;
 Thu, 29 Feb 2024 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709224352; x=1740760352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mvklfRYY+m+NZ6y4eBQblMjXus8ik/awsFdlQowp15Y=;
 b=jAeFo6fE8g8ZGnz2ZxLp5uyOX8PMs483e5uXsJeDeRlCTiE5vEuR77b+
 jaRyCacfZoqCN2uzqqfNCht0QBLzGzIbFoVzQ+PqCWPaSB85UarB5vHEN
 jlaLz+IjyX74s6KL3o/bySLQkJGVwcm1Jl1tbCylSD/KkYgMts+QSiMDF
 eBIesiiGLH+04nsCIlPhFgaeNPUc2s4kKV8AvqJFxnFGhj/7mjUZz3lqc
 CHRhHPr1ce8GipCKNCbzp2pkFNjzVuOQWyKmK24SAvqdQknAemXE7rx2n
 jgeZcr/H2zxIhLLsiHGJQ1cCftZLgzo44AwV1NY2u9Wzb8VEj/IyG58wQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29137289"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29137289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7754402"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 08:32:22 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v13 8/8] drm/i915/display: Read/Write AS sdp only when
 sink/source has enabled
Date: Thu, 29 Feb 2024 21:55:21 +0530
Message-Id: <20240229162521.2943630-9-mitulkumar.ajitkumar.golani@intel.com>
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

Write/Read Adaptive sync SDP only when Sink and Source is enabled
for the same. Also along with write TRANS_VRR_VSYNC values.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea441590204..6b8088321582 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3971,6 +3971,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
 
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
+	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
 
 	intel_audio_codec_get_config(encoder, pipe_config);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 86de854516ef..9309abeda241 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4294,6 +4294,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 		return;
 
 	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
+	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
 
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
-- 
2.25.1

