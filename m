Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0779713B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13910E7A1;
	Thu,  7 Sep 2023 09:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5410E223;
 Thu,  7 Sep 2023 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078924; x=1725614924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4+3i/0kKktiy7dn/G4BVceBBaCtF/ZxYXJhD9wvFc8=;
 b=IEkQ/H3o/SeBoWJDRSBP4JXkXQxf9V0fQDmxuFblfeGLcl1RDu/NAerH
 CQVBfIoMo98Aj9pJXuHjxvriLJ208b3NZ+kf+E+VCUVHybJiZKEYED++n
 e2zeK+mTfUUUi4p0HseG5QEOYjYqIwecgAqNZyJsZNh5PQGvRL3rdHNSL
 0a6qkxUYoZb//YD8kScj9IRcmjeBhM/x7ZBiHj5+WNEih7DJnhTw4kCgP
 Xyc8d/5um1q55MjRLnaiH5+6KdMQ0pTgD8BJBnl7lBfctu7cdk3Ez22+y
 0dO/0GWfrvQe+Ugo0C/fpJw6CO7i9ilvl37vWEXTsTz0tU8WRt09wcprA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443690259"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="443690259"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741958734"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="741958734"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/edid: include drm_eld.h only where required
Date: Thu,  7 Sep 2023 12:28:21 +0300
Message-Id: <d4f0141ad179557f43035a53a49c9ee53e8a0a84.1694078430.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694078430.git.jani.nikula@intel.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce the dependencies on drm_eld.h. Some files might be able to drop
the dependency on drm_edid.h too with the direct inclusion of drm_eld.h.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 1 +
 drivers/gpu/drm/drm_edid.c                           | 1 +
 drivers/gpu/drm/i915/display/intel_audio.c           | 1 +
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c            | 1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c              | 1 +
 drivers/gpu/drm/radeon/radeon_audio.c                | 1 +
 drivers/gpu/drm/tegra/hdmi.c                         | 1 +
 drivers/gpu/drm/tegra/sor.c                          | 1 +
 include/drm/drm_edid.h                               | 1 -
 sound/core/pcm_drm_eld.c                             | 1 +
 sound/soc/codecs/hdac_hdmi.c                         | 1 +
 sound/soc/codecs/hdmi-codec.c                        | 1 +
 sound/x86/intel_hdmi_audio.c                         | 1 +
 14 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 268cb99a4c4b..fe7e307ae7f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -86,6 +86,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 39dd3f694544..2025970816c9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -41,6 +41,7 @@
 #include <drm/drm_displayid.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 19605264a35c..39f5b698e08a 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/i915_component.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 8d4640d0fd34..fcddd6d81768 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 
 #include "i915_drv.h"
 #include "intel_crtc_state_dump.h"
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 135a2527fd1b..6abae283998e 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -35,6 +35,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e7c9c353c51..9332aa633867 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -38,6 +38,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index d6ccaf24ee0c..279bf130a18c 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -26,6 +26,7 @@
 #include <linux/component.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_eld.h>
 #include "dce6_afmt.h"
 #include "evergreen_hdmi.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0ba3ca3ac509..a1fcee665023 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -24,6 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index d5a3d3f4fece..83341576630d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -20,6 +20,7 @@
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 1ff52f57ab9c..e98aa6818700 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -25,7 +25,6 @@
 
 #include <linux/types.h>
 #include <linux/hdmi.h>
-#include <drm/drm_eld.h> /* FIXME: remove this, include directly where needed */
 #include <drm/drm_mode.h>
 
 struct drm_device;
diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 07075071972d..1cdca4d4fc9c 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -6,6 +6,7 @@
 #include <linux/export.h>
 #include <linux/hdmi.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <sound/pcm.h>
 #include <sound/pcm_drm_eld.h>
 
diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 8b6b76029694..d1b53fc1efb6 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/hdmi.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d21f69f05342..9b01d060f7cc 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -17,6 +17,7 @@
 #include <sound/pcm_iec958.h>
 
 #include <drm/drm_crtc.h> /* This is only to get MAX_ELD_BYTES */
+#include <drm/drm_eld.h>
 
 #define HDMI_CODEC_CHMAP_IDX_UNKNOWN  -1
 
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index ab95fb34a635..02f5a7f9b728 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -30,6 +30,7 @@
 #include <sound/control.h>
 #include <sound/jack.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/intel_lpe_audio.h>
 #include "intel_hdmi_audio.h"
 
-- 
2.39.2

