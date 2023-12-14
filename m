Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC11812BAB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937210E921;
	Thu, 14 Dec 2023 09:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E3010E921
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702546147; x=1734082147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ym6r9xLfSQXQR38T2QPlxeuiIFQ1e3Eir7XYGVFm++0=;
 b=L4ZLzvjbQ7BKPjZYZKJA+GSmZD9KnNLnw+WSduqQQNHaTZyJOUZswsoZ
 tvGMC/U9NmI8KhOkF11r1y89g/qbuEKwHqhk0Cx99j2VlBxQuIvZq3RKe
 ukKA/7er21qB2L6SmeoY7N/vVF9qe0/PLvXDqj4ksHGst/lp2DltCb6b3
 S2N4+kQ+oAoNzN1ZC59Wk56h3Qaj+jZFo89Q5UpYXw/PlH1h6+ti2EIAu
 k60AuUdqAEmg4yrsGR4XdFW6hJGPYWeBe773softg10SGarGDaoxCstVV
 m0dEQ/JG1hXVhKW5SU6bBcrWmrIlnXEkCgTfkt7zSJ9XRtXKeNau98UKz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2174512"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2174512"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 01:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777831513"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="777831513"
Received: from mdemezzi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 01:29:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Date: Thu, 14 Dec 2023 11:28:56 +0200
Message-Id: <20231214092856.4019251-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213095023.3928703-1-jani.nikula@intel.com>
References: <20231213095023.3928703-1-jani.nikula@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdmi-codec.h does not appear to directly need drm/drm_edid.h for
anything. Remove it.

There are some files that get drm/edid.h by proxy; include it where
needed.

v2-v3: Fix build (kernel test robot <lkp@intel.com>)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm pretty sure I haven't compiled everything that might implicitly
depend on the include. However, the right thing to do is to include
drm_edid.h where needed, not from somewhat random intermediate
headers. I hope this uncovers anything I missed.
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 1 +
 include/sound/hdmi-codec.h                 | 1 -
 5 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 9663601ce098..b9205d14d943 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -18,6 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index e971b75e90ad..f3f130c1ef0a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b88fb52726f..766c8d01e6b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/drm_edid.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f05e2c95a60d..34f807ed1c31 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,6 +35,7 @@
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9b162ac1e08e..5e1a9eafd10f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -12,7 +12,6 @@
 
 #include <linux/of_graph.h>
 #include <linux/hdmi.h>
-#include <drm/drm_edid.h>
 #include <sound/asoundef.h>
 #include <sound/soc.h>
 #include <uapi/sound/asound.h>
-- 
2.39.2

