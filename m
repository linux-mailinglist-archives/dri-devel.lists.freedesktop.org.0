Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D8C962A0
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205F10E336;
	Mon,  1 Dec 2025 08:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3Hk8GR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B56510E32E;
 Mon,  1 Dec 2025 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577844; x=1796113844;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WABM3F0AqUFD/h+5NMeN8BFUPMukx54rDKevxqs39oc=;
 b=L3Hk8GR7uFNhIdsTVj2OoWtEzfKvZwUZTa1913N80p8NammRo/LL4Q6x
 BoP9Gg2dBlK+wRTnk7A2dyIGG+9jcinFcBxoE+ckMJctn8FQRPp/w9w6W
 eWz5v16H7Y6Sua7yCyc2yvmkGOm4VGjwBCDJedf7Hq7cZN8WI+08Xbr7/
 LadHBFsXT3qTYpdsFZ2sTNYiTJgBam4IMedKlpkPDfkUIHgAf2wgGbClv
 I6YD8t3ZyR8dz0GKPj+DqcK0iTGV63qycy2gD7pHX1AvLpSdSjp4WV6Ds
 JifsYfA4muczErVDCuTNFk54aQCJ2ZExSCugnetd7kyqWdpI7wKCqRXnZ w==;
X-CSE-ConnectionGUID: yHoZM8NUSSiu9W8RWngDCg==
X-CSE-MsgGUID: 7b2bLEMaQDe0pE4bllPaiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578677"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:30:43 -0800
X-CSE-ConnectionGUID: X2mToCCLSlWjKCspgtWDCQ==
X-CSE-MsgGUID: hQP62G5QTi6tIH9Gc5G8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198353753"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:30:35 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:59:02 +0530
Subject: [PATCH v9 20/20] drm/i915/histogram: Enable pipe dithering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-20-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Enable pipe dithering while enabling histogram to overcome some
atrifacts seen on the screen.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 1d02f4fdf8549a0fd7a46dbd8fdc218798c2de1b..152ae1d0393e9b2b331612494e0cf918edc6f999 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -9,10 +9,10 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "i915_drv.h"
 #include "intel_de.h"
 #include "intel_display.h"
+#include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_histogram.h"
 #include "intel_histogram_regs.h"
@@ -24,6 +24,13 @@
 #define HISTOGRAM_BIN_READ_RETRY_COUNT 5
 #define IET_SAMPLE_FORMAT_1_INT_9_FRACT 0x1000009
 
+static void intel_histogram_enable_dithering(struct intel_display *display,
+					     enum pipe pipe)
+{
+	intel_de_rmw(display, PIPE_MISC(pipe), PIPE_MISC_DITHER_ENABLE,
+		     PIPE_MISC_DITHER_ENABLE);
+}
+
 static void set_bin_index_0(struct intel_display *display, enum pipe pipe)
 {
 	if (DISPLAY_VER(display) >= 20)
@@ -204,6 +211,10 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
 
 	if (histogram->enable)
 		return 0;
+
+	/* Pipe Dithering should be enabled with histogram */
+	intel_histogram_enable_dithering(display, pipe);
+
 	 /* enable histogram, clear DPST_BIN reg and select TC function */
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_rmw(display, DPST_CTL(pipe),

-- 
2.25.1

