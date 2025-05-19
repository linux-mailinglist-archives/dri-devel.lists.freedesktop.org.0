Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7BABBDCE
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 14:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0592F10E222;
	Mon, 19 May 2025 12:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx4Wy7nX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835F610E1B0;
 Mon, 19 May 2025 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747657914; x=1779193914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okW+sx8sTQZMykmfaSbvYqn3WnLDjGVrOY/QeVHNQ/U=;
 b=dx4Wy7nX/R7mjmcdatoqf8petMb5nl5wE7JvIuueXq7KqqxYVxm8OxaQ
 i2TBtDuXVC1UC7ybF+6CVwdR023fgVwuuHx26PKrqTSCWPiAZKmz3DI/K
 ZDE18osZbsePBZATCiFMn7oFGQl+y/Bo4k8sJ4fLnWMTdQiL5b8zVN+EX
 kk3ri5X39y0hPSqseTP1UPKbEcUjzKIbzrWGNG/KcKw361L4/AyD/2qAL
 1txZ+bt+usGlke6ocysRYCVtaf5Amr8gsCpZmIYVHw/+p9I8shYferWP2
 sXPhukgFvnGKlJDgfYg7z8d7LF2e9a6jVymyqZNo+wliAxT/7v3byiZPP w==;
X-CSE-ConnectionGUID: YIPUgW/LSJ+oJ8uWzcNkIw==
X-CSE-MsgGUID: gLXkCaVrQ32Vx4mf0vO89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49709985"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49709985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:31:53 -0700
X-CSE-ConnectionGUID: wBnjKUH1RBe99lW+ABT03g==
X-CSE-MsgGUID: gdSM8Ly0Tgqkfo1Spp3Qqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144358071"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 19 May 2025 05:31:52 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Mon, 19 May 2025 17:56:36 +0530
Message-Id: <20250519122644.3685679-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519122644.3685679-1-nemesa.garg@intel.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
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
index f0ea56cc5def..3adab00566f2 100644
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

