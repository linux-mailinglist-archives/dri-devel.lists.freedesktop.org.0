Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B01D2725
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5891489321;
	Thu, 14 May 2020 06:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE41F892FF;
 Thu, 14 May 2020 06:07:49 +0000 (UTC)
IronPort-SDR: dAagyIlO3SqPKMoVpxvikWgy9SPef3xVza70BMejxl7CtAdV72a5hx5pIVMuGBUa96LrzG1Ety
 urT9+nfnTDlw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 23:07:49 -0700
IronPort-SDR: dH5LOujCUdfZaazYDrzWTfmYBayy6DCNa1OzIL6aB/UK7GvY0yLBPROshJDNS2ypit/HbIEqXS
 syLoQsJcy18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="409956995"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.18.167])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:47 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 06/14] drm/i915: Include DP VSC SDP in the crtc state dump
Date: Thu, 14 May 2020 09:07:24 +0300
Message-Id: <20200514060732.3378396-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dump out the DP VSC SDP in the normal crtc state dump

v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
    Use drm core's DP VSC SDP logging function

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index eb3ab77bc559..5484c8f3f8ff 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12866,6 +12866,16 @@ intel_dump_infoframe(struct drm_i915_private *dev_priv,
 	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);
 }
 
+static void
+intel_dump_dp_vsc_sdp(struct drm_i915_private *dev_priv,
+		      const struct drm_dp_vsc_sdp *vsc)
+{
+	if (!drm_debug_enabled(DRM_UT_KMS))
+		return;
+
+	drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, vsc);
+}
+
 #define OUTPUT_TYPE(x) [INTEL_OUTPUT_ ## x] = #x
 
 static const char * const output_type_str[] = {
@@ -13029,6 +13039,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
+		intel_dump_dp_vsc_sdp(dev_priv, &pipe_config->infoframes.vsc);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
