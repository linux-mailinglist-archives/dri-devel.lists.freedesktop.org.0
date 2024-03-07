Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092B8747D5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D5210FD39;
	Thu,  7 Mar 2024 06:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJ9nezXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCAD1124D6;
 Thu,  7 Mar 2024 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709791230; x=1741327230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehFtacMlRUd1phXTaCKFkgOlmsUOqvHt6QC/y9UAJ8s=;
 b=EJ9nezXfWmfuUpOg77afMRxdxQA+rl+doe79EsHTLTeEn2J6C1PuEzZK
 mre8hJx9tPlN/lBh5QRcgJ8UA3qchbvgLU7nsYgbMDS2FhJu2M5510H7u
 q30OjuGKkkxpBv/AESkurV1iFA00Y/ujIf+U5Ft3E2r5cl3KGNKvtXo1L
 5c5Vd87pU+iVOvMxJZSjbsHWyVvCQP2Ukm1BqDDuEf9QGA4W86YQYjAiw
 F/2PMKwBeALPgDsfhGlezb1lyG1uP72env5+TxvYki6Hs4mXrTlgWXUHy
 KDkkZUX6N6E8xOW9JDwK8H4tZ03u03iRF3CI7l9pPYH7pRtyyYJfgiH5R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4313125"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4313125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 22:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10087133"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2024 22:00:28 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v16 9/9] drm/i915/display: Read/Write Adaptive Sync SDP
Date: Thu,  7 Mar 2024 11:23:29 +0530
Message-Id: <20240307055329.3238634-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add read/write calls for Adaptive Sync SDP.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index c587a8efeafc..f164020a4773 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3972,6 +3972,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
 
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
+	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
 
 	intel_audio_codec_get_config(encoder, pipe_config);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cf89e69d2e7a..7f87876651e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4330,6 +4330,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 		return;
 
 	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
+	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
 
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
-- 
2.25.1

