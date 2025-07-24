Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB360B10BF0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379D10E3E8;
	Thu, 24 Jul 2025 13:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kusE4ipV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C03610E353;
 Thu, 24 Jul 2025 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365060; x=1784901060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRmcySyn0390ifC8vaL+3mLfqBrqSOaFdpiEpEhnhWg=;
 b=kusE4ipVbBqBv2tM5TSHs84sQc8OnOcxnpbszacK+/mKFmWEQudcQX4W
 8GdFkSMD6nxGR2DA2ZM4OfMsX/8/g7BC+zbXsajR0qeNSgnQHbL3hjKjJ
 4j0fPuC1bDVp2c0QXJSXmYgAcfeqxCrV6yPpw/zVdw7koXTtUz0XvSDp1
 i9Ig9h0bLKjN2oKHfA1DlqnmAG9L7/981W5t5cqvgxSOplwlmayvL+F0h
 hre5PeUZ3GgBMxoOxcB1RMrUzGOUDebIK+X7wpsr7I6AJYBNBRbgVGKh9
 Bcyd5zAOxYzhBwuQ3jSTbPXOMv8W+es+H0vuLZ6KgNC0bSZLrvtbqfuxb g==;
X-CSE-ConnectionGUID: Dj2Fy7fXSu+64Jbrgo35Ww==
X-CSE-MsgGUID: 7UO1vVMORiKO5PrX3jbplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55553875"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55553875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 06:51:00 -0700
X-CSE-ConnectionGUID: NQeQLrICRL63zFGULKmoGg==
X-CSE-MsgGUID: iIwXt8DVTKaJG5mG/49kfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159826446"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 06:50:57 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Thu, 24 Jul 2025 19:15:36 +0530
Message-Id: <20250724134544.284371-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724134544.284371-1-nemesa.garg@intel.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
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

Add HAS_CASF macro to check whether platform supports
the content adaptive sharpness capability or not.

v2: Update commit message[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 0c7f91046996..33ec30123214 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 
 	intel_vdsc_state_dump(&p, 0, pipe_config);
 
+	if (HAS_CASF(display)) {
+		drm_printf(&p, "sharpness strength: %d, sharpness tap size :%d\n sharpness enable :%d\n",
+			   pipe_config->hw.casf_params.strength,
+			   pipe_config->hw.casf_params.win_size,
+			   pipe_config->hw.casf_params.casf_enable);
+	}
+
 dump_planes:
 	if (!state)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 4308822f0415..7f76215195d8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -145,6 +145,7 @@ struct intel_display_platforms {
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
 #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
+#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
-- 
2.25.1

