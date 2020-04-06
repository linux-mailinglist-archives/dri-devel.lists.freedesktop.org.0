Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092919F4CB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037286E365;
	Mon,  6 Apr 2020 11:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAECC6E365;
 Mon,  6 Apr 2020 11:38:12 +0000 (UTC)
IronPort-SDR: I50vy8gRR2thWJS1shz8FHxEvfm2VeMggKSqNUSC7802lGYqBR7qsquXKpOCbgH+GBKjBuOrQF
 eyr+5Axu24aQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:12 -0700
IronPort-SDR: qbOxFTZ7IS9aOBD+0hZK2uHvBccZXwrrTYGhiYNy5O/3+5C5BSk84l2j3au1QN/NVZk8AMlejT
 PXVqRVi5gulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192447"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:08 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH 11/18] drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:57:53 +0530
Message-Id: <20200406112800.23762-12-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN* over WARN* calls.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index e6306cbb7a3a..477465a9af90 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -431,7 +431,7 @@ static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
 	else
 		BUF_PRINT("(%02X)", cmd);
 
-	WARN_ON(pos >= sizeof(buffer) - 1);
+	drm_WARN_ON(intel_sdvo->base.base.dev, pos >= sizeof(buffer) - 1);
 #undef BUF_PRINT
 
 	DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(intel_sdvo), cmd, buffer);
@@ -597,7 +597,7 @@ static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
 		BUF_PRINT(" %02X", ((u8 *)response)[i]);
 	}
 
-	WARN_ON(pos >= sizeof(buffer) - 1);
+	drm_WARN_ON(intel_sdvo->base.base.dev, pos >= sizeof(buffer) - 1);
 #undef BUF_PRINT
 
 	DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(intel_sdvo), buffer);
@@ -1106,7 +1106,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					   HDMI_QUANTIZATION_RANGE_FULL);
 
 	ret = hdmi_avi_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(intel_sdvo->base.base.dev, ret))
 		return false;
 
 	return true;
@@ -1123,11 +1123,12 @@ static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
 	     intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI)) == 0)
 		return true;
 
-	if (WARN_ON(frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
+	if (drm_WARN_ON(intel_sdvo->base.base.dev,
+			frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
 		return false;
 
 	len = hdmi_infoframe_pack_only(frame, sdvo_data, sizeof(sdvo_data));
-	if (WARN_ON(len < 0))
+	if (drm_WARN_ON(intel_sdvo->base.base.dev, len < 0))
 		return false;
 
 	return intel_sdvo_write_infoframe(intel_sdvo, SDVO_HBUF_INDEX_AVI_IF,
@@ -1257,7 +1258,8 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 		clock->m1 = 12;
 		clock->m2 = 8;
 	} else {
-		WARN(1, "SDVO TV clock out of range: %i\n", dotclock);
+		drm_WARN(pipe_config->uapi.crtc->dev, 1,
+			 "SDVO TV clock out of range: %i\n", dotclock);
 	}
 
 	pipe_config->clock_set = true;
@@ -2294,7 +2296,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
 				return 0;
 			}
 
-		WARN_ON(1);
+		drm_WARN_ON(connector->dev, 1);
 		*val = 0;
 	} else if (property == intel_sdvo_connector->top ||
 		   property == intel_sdvo_connector->bottom)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
