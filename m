Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97119E51B5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283910EE13;
	Thu,  5 Dec 2024 09:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt1RkQ9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096510E391;
 Thu,  5 Dec 2024 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392192; x=1764928192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cyi/oGuAj38oWKIqlgdaUIuoFYoSjqhNTGENbFsmkyo=;
 b=Yt1RkQ9vFAuIgMlTKCg7LWk0pQlWKlniAilaHTOLpP81rwhgMA9Cqb7y
 lNS4eosKobvyzVfnpg9aZgMbZ9JQ4obM3DkyFhQxKWoBjIayPUPviZ4/h
 0fV2bOXP38bLeMdhq1ianMCfF2dSgI0Lwyt5GvaNE0mMfGp3ZbmV7muxH
 TKv0ds4fs8EPEnwVqzQCHM4QgKbs2aIfKEDXome1D4bmp/1ARmoOJD6ft
 P565uVOVPaMyDndbPtOXZveKStVO68WApKi96oLQjGNQvoTzlJiRzTCvn
 +gZEfNN4kTg7gnyu5wAGbVPILxfxg87I06gfAgiPT38gQXIfXQqroLh0e A==;
X-CSE-ConnectionGUID: IdfOU60eRSGQaMEgTXSEvA==
X-CSE-MsgGUID: nMAOiIkhR+yF63BcSnOzaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33938950"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33938950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:52 -0800
X-CSE-ConnectionGUID: Bi+zwxSmR5aXtJR+1bRdQg==
X-CSE-MsgGUID: +5cfenAVQVKWjYEpYFo/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="124862183"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/3] drm/i915/display: use drm_print_hex_dump() for crtc state
 dump
Date: Thu,  5 Dec 2024 11:49:34 +0200
Message-Id: <12d76e34ed4c508524f768a46d2a2beb09991a23.1733392101.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733392101.git.jani.nikula@intel.com>
References: <cover.1733392101.git.jani.nikula@intel.com>
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

Use the drm_printer based printer to get the device specific printing of
the hex dump.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 705ec5ad385c..1faef60be472 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -50,16 +50,6 @@ intel_dump_infoframe(struct drm_i915_private *i915,
 	hdmi_infoframe_log(KERN_DEBUG, i915->drm.dev, frame);
 }
 
-static void
-intel_dump_buffer(const char *prefix, const u8 *buf, size_t len)
-{
-	if (!drm_debug_enabled(DRM_UT_KMS))
-		return;
-
-	print_hex_dump(KERN_DEBUG, prefix, DUMP_PREFIX_NONE,
-		       16, 0, buf, len, false);
-}
-
 #define OUTPUT_TYPE(x) [INTEL_OUTPUT_ ## x] = #x
 
 static const char * const output_type_str[] = {
@@ -293,8 +283,8 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		drm_dp_as_sdp_log(&p, &pipe_config->infoframes.as_sdp);
 
 	if (pipe_config->has_audio)
-		intel_dump_buffer("ELD: ", pipe_config->eld,
-				  drm_eld_size(pipe_config->eld));
+		drm_print_hex_dump(&p, "ELD: ", pipe_config->eld,
+				   drm_eld_size(pipe_config->eld));
 
 	drm_printf(&p, "vrr: %s, vmin: %d, vmax: %d, pipeline full: %d, guardband: %d flipline: %d, vmin vblank: %d, vmax vblank: %d\n",
 		   str_yes_no(pipe_config->vrr.enable),
-- 
2.39.5

