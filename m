Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E4B8A049
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE9610EA2A;
	Fri, 19 Sep 2025 14:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNcGDHYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722C710EA22;
 Fri, 19 Sep 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758292749; x=1789828749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZRvL/i956fATbnKqzF+wDF7j5httHj9kW8m0Qm24aE=;
 b=kNcGDHYtEgmIKLEsmxuN1Rcg4cM8Qisno7YOWTVOf5bqBE8dfns5Bc5C
 QXcvDL2jfF6Zza9qf6evBjAKa4XuMRSh2ni66jFvXuX7okqzfiKqMTapu
 oFFrLubnxt5qebzzlAXuyyq0EJyhDQQY/ffa2VbdLhsjQBH7JW327Okxf
 Wym2C5FQ5EGu8ZSMxlcQmkKYRHqulGwYc7dwqwdedtds9Ps30feCmm8e3
 sTKCxdgAVWx3YO+alj3U8rBNoxGNpBcE3Oos/MuLrLMkxxKRHEjPIZOrM
 q/NwYZf2nr/ZhnFwL9ghgbbyQ3qNfqmSKOLdfVqdiY6VPpSetaZS5l+Z0 w==;
X-CSE-ConnectionGUID: SqyYb28GR0i8HPGAtFV9zQ==
X-CSE-MsgGUID: vp8nAL25S8aVmJBnYAnayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59858247"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59858247"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 07:39:09 -0700
X-CSE-ConnectionGUID: 4K+9kUjgRNiWHjBIMhTIug==
X-CSE-MsgGUID: 6o0GQ1LHSUWst2yjngSoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="199553137"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2025 07:39:08 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Fri, 19 Sep 2025 20:04:10 +0530
Message-Id: <20250919143418.3102605-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250919143418.3102605-1-nemesa.garg@intel.com>
References: <20250919143418.3102605-1-nemesa.garg@intel.com>
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
v3: Remove \n from middle[Jani]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 0c7f91046996..bc6a041cec13 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 
 	intel_vdsc_state_dump(&p, 0, pipe_config);
 
+	if (HAS_CASF(display)) {
+		drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
+			   pipe_config->hw.casf_params.strength,
+			   pipe_config->hw.casf_params.win_size,
+			   pipe_config->hw.casf_params.casf_enable);
+	}
+
 dump_planes:
 	if (!state)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 1f091fbcd0ec..157aa0b8f36e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -144,6 +144,7 @@ struct intel_display_platforms {
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
 #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
+#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
-- 
2.25.1

