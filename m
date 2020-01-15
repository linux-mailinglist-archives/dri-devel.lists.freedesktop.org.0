Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E013B87E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 04:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7816E846;
	Wed, 15 Jan 2020 03:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35C66E846;
 Wed, 15 Jan 2020 03:58:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; 
 d="scan'208,217";a="242720190"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 19:51:23 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [[Intel-gfx] [PATCH v2 04/10] drm/i915/display: Make WARN* drm
 specific where encoder ptr is available
Date: Wed, 15 Jan 2020 09:14:48 +0530
Message-Id: <20200115034455.17658-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Drm specific drm_WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where intel_encoder struct pointer is available.

The conversion was done automatically with below coccinelle semantic
patch.

@@
identifier func, T;
@@
func(...) {
...
struct intel_encoder *T = ...;
<...
(
-WARN(
+drm_WARN(T->base.dev,
...)
|
-WARN_ON(
+drm_WARN_ON(T->base.dev,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T->base.dev,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T->base.dev,
...)
)
...>

}

@@
identifier func, T;
@@
func(struct intel_encoder *T,...) {
<...
(
-WARN(
+drm_WARN(T->base.dev,
...)
|
-WARN_ON(
+drm_WARN_ON(T->base.dev,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T->base.dev,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T->base.dev,
...)
)
...>

}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915/display \
					--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c     |  6 ++++--
 drivers/gpu/drm/i915/display/intel_display.c |  5 +++--
 drivers/gpu/drm/i915/display/intel_dp.c      |  5 +++--
 drivers/gpu/drm/i915/display/intel_hdmi.c    | 20 ++++++++++----------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 59380663b24a..46bb98f919c1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1655,7 +1655,8 @@ static void skl_ddi_clock_get(struct intel_encoder *encoder,
 			link_clock = 270000;
 			break;
 		default:
-			WARN(1, "Unsupported link rate\n");
+			drm_WARN(encoder->base.dev, 1,
+				 "Unsupported link rate\n");
 			break;
 		}
 		link_clock *= 2;
@@ -4644,7 +4645,8 @@ intel_ddi_hotplug(struct intel_encoder *encoder,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	WARN(ret, "Acquiring modeset locks failed with %i\n", ret);
+	drm_WARN(encoder->base.dev, ret,
+		 "Acquiring modeset locks failed with %i\n", ret);
 
 	/*
 	 * Unpowered type-c dongles can take some time to boot and be
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d1de40618620..75dcaaf00536 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5729,8 +5729,9 @@ intel_get_crtc_new_encoder(const struct intel_atomic_state *state,
 		num_encoders++;
 	}
 
-	WARN(num_encoders != 1, "%d encoders for pipe %c\n",
-	     num_encoders, pipe_name(crtc->pipe));
+	drm_WARN(encoder->base.dev, num_encoders != 1,
+		 "%d encoders for pipe %c\n",
+		 num_encoders, pipe_name(crtc->pipe));
 
 	return encoder;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 011d4dde7d25..97ff276f9ca1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2223,7 +2223,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 						    intel_dp->max_link_rate);
 
 	/* No common link rates between source and sink */
-	WARN_ON(common_len <= 0);
+	drm_WARN_ON(encoder->base.dev, common_len <= 0);
 
 	limits.min_clock = 0;
 	limits.max_clock = common_len - 1;
@@ -5206,7 +5206,8 @@ intel_dp_hotplug(struct intel_encoder *encoder,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	WARN(ret, "Acquiring modeset locks failed with %i\n", ret);
+	drm_WARN(encoder->base.dev, ret,
+		 "Acquiring modeset locks failed with %i\n", ret);
 
 	/*
 	 * Keeping it consistent with intel_ddi_hotplug() and
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8f9bbffa13aa..46dd748b226c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -660,12 +660,12 @@ static void intel_write_infoframe(struct intel_encoder *encoder,
 	     intel_hdmi_infoframe_enable(type)) == 0)
 		return;
 
-	if (WARN_ON(frame->any.type != type))
+	if (drm_WARN_ON(encoder->base.dev, frame->any.type != type))
 		return;
 
 	/* see comment above for the reason for this offset */
 	len = hdmi_infoframe_pack_only(frame, buffer + 1, sizeof(buffer) - 1);
-	if (WARN_ON(len < 0))
+	if (drm_WARN_ON(encoder->base.dev, len < 0))
 		return;
 
 	/* Insert the 'hole' (see big comment above) at position 3 */
@@ -739,8 +739,8 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	drm_hdmi_avi_infoframe_colorspace(frame, conn_state);
 
 	/* nonsense combination */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB) {
 		drm_hdmi_avi_infoframe_quant_range(frame, connector,
@@ -758,7 +758,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	/* TODO: handle pixel repetition for YCBCR420 outputs */
 
 	ret = hdmi_avi_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
 	return true;
@@ -779,13 +779,13 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
 
 	ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
 	frame->sdi = HDMI_SPD_SDI_PC;
 
 	ret = hdmi_spd_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
 	return true;
@@ -811,11 +811,11 @@ intel_hdmi_compute_hdmi_infoframe(struct intel_encoder *encoder,
 	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame,
 							  conn_state->connector,
 							  &crtc_state->hw.adjusted_mode);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
 	ret = hdmi_vendor_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
 	return true;
@@ -1868,7 +1868,7 @@ static void intel_enable_hdmi_audio(struct intel_encoder *encoder,
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 
-	WARN_ON(!pipe_config->has_hdmi_sink);
+	drm_WARN_ON(encoder->base.dev, !pipe_config->has_hdmi_sink);
 	DRM_DEBUG_DRIVER("Enabling HDMI audio on pipe %c\n",
 			 pipe_name(crtc->pipe));
 	intel_audio_codec_enable(encoder, pipe_config, conn_state);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
