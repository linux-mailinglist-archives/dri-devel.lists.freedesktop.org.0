Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FB1316BD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6C56E4CF;
	Mon,  6 Jan 2020 17:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0765B6E4CD;
 Mon,  6 Jan 2020 17:28:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="225496109"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:25 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 3/7] drm/i915: add helper functions to get device ptr
Date: Mon,  6 Jan 2020 22:53:22 +0530
Message-Id: <20200106172326.32592-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
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

We will need struct device pointer to pass it to dev_WARN* calls.

Add helper functions to exract device pointer from various structs.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 14 ++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.h                     |  5 +++++
 drivers/gpu/drm/i915/i915_drv.h                    | 11 +++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 630a94892b7b..6cca8921f3c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1523,6 +1523,20 @@ dp_to_i915(struct intel_dp *intel_dp)
 	return to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
 }
 
+static inline struct device *enc_to_dev(const struct intel_encoder *encoder)
+{
+	return encoder->base.dev->dev;
+}
+
+static inline struct device *
+crtc_state_to_dev(const struct intel_crtc_state *state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(state->uapi.crtc);
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+
+	return i915_to_dev(i915);
+}
+
 static inline struct intel_digital_port *
 hdmi_to_dig_port(struct intel_hdmi *intel_hdmi)
 {
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index b47c6acaf9c0..2900ef848e84 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -348,6 +348,11 @@ static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
 	return i915->gvt;
 }
 
+static inline struct device *vgpu_to_dev(const struct intel_vgpu *vgpu)
+{
+	return i915_to_dev(vgpu->gvt->dev_priv);
+}
+
 enum {
 	INTEL_GVT_REQUEST_EMULATE_VBLANK = 0,
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b7f122dccdca..bd4557d6f35b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1314,6 +1314,17 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 	return pci_get_drvdata(pdev);
 }
 
+static inline struct device *i915_to_dev(const struct drm_i915_private *i915)
+{
+	return i915->drm.dev;
+}
+
+static inline struct device *
+perf_stream_to_dev(const struct i915_perf_stream *stream)
+{
+	return i915_to_dev(stream->perf->i915);
+}
+
 /* Simple iterator over all initialised engines */
 #define for_each_engine(engine__, dev_priv__, id__) \
 	for ((id__) = 0; \
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
