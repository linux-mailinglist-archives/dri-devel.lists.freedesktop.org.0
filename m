Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233AA7FBEA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D410E63B;
	Tue,  8 Apr 2025 10:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbbletWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5548610E212;
 Tue,  8 Apr 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744108200; x=1775644200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JS6CCLIvy+3q8T0XGcJ93Bz5Z1SsKdIg43rpE0gWw4A=;
 b=HbbletWsFk5dDuLaYADUZ2wg4+HYp9UFpp0WMpACYGeacfBbvbF6u70T
 58s/euTKUL3Rlx97INHqDqu5uBO8XfD6ADn6vyAfHsq4N6NfX/SLuoYbf
 mIwA+HXBhKEwfEGouXM57MKGFGKjA4qQvCG8XCk+oxtic/m29tkKlUGk6
 23P++l2fb9QX1WRsOpee3iJOM8UAnurzJo2O11XgbuiR1vyF3L5KEZCx4
 3MnVuZ3M884Uo9Onsi9nYZ1En0YrLv5zhVCBkYJtXaWRruIlma1ai1Dve
 DF3exKylN1ezmPU/5qt14eO2DZispnR3eddHgZh3j1LJWzCzHkuRTvTDS A==;
X-CSE-ConnectionGUID: GMlXxZAjQlChm2eV8gow5w==
X-CSE-MsgGUID: WRhjkBvMQHSJCzVzxkiiTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62934144"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="62934144"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 03:29:56 -0700
X-CSE-ConnectionGUID: 5DtlhpfnQEaUoDtZxM1ZFw==
X-CSE-MsgGUID: Bw0HWn9VTAquuAxPEOvUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133391987"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 03:29:54 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Tue,  8 Apr 2025 15:54:58 +0530
Message-Id: <20250408102506.1053569-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408102506.1053569-1-nemesa.garg@intel.com>
References: <20250408102506.1053569-1-nemesa.garg@intel.com>
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
index 368b0d3417c2..09b9991beffa 100644
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

