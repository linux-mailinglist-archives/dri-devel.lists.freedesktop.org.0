Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FCB1D4BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 11:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888210E334;
	Thu,  7 Aug 2025 09:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdKKxPRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A1B10E332;
 Thu,  7 Aug 2025 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754559237; x=1786095237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZxZOgNhe0uZYtkzhR5vS9zOGMQylVAYJyPnHshEhtu0=;
 b=MdKKxPRmAPsw5AArfYkY6Vpa3xBJjjPHkT6Y0iU1/6OfjKgbrpNUVFzT
 AfOYuX+KqlMtEigostkZMXij7S6QB5jXILguMloQwOb87qwZqgQ0GK4/0
 5uBU/m8qeo8+GoF9q6PNKs/HkG7JmHhFD26s/5RlWJLd/r7nXtjqrIfKC
 YaoHlCbQE49PpnIa2+Z6hW5GmeLDPsq9xKAtWqZlkUWa3C88p1cO4CUyb
 HinkX8ZtBrJPXFYPMg2Sf7BbyKr+3h0+GQtBOM0x7p7gme4yLCrUAmTwR
 wQ/HJOZyJUrC9mIMiCErSJH9lat7NW47jWFKemnNFR5xtEAH1PiuMPJV0 A==;
X-CSE-ConnectionGUID: 2AGCw6njQlykAqVovnQXhg==
X-CSE-MsgGUID: Kj5ySNIeQvmarFOOEKIaKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56597253"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56597253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 02:33:57 -0700
X-CSE-ConnectionGUID: 64W1bMjzT9CtjLLs2X9ObA==
X-CSE-MsgGUID: 5LfMiBdFQS6o7akTlgViSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164918519"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 02:33:55 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Thu,  7 Aug 2025 14:58:33 +0530
Message-Id: <20250807092841.3169436-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
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

