Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D261EBC4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F410E222;
	Mon,  7 Nov 2022 07:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B4110E222;
 Mon,  7 Nov 2022 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805639; x=1699341639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5LujnC3Xnql//DHLTNlF4c2pcaIPaA+AMRBQAw/eS9U=;
 b=XMw8cUcQwq73OkKEJC263XEj/zfPE3XDA7pexeONhfV1hGleD/M1LrHX
 5KQ0+urh/mUcrS2OVOkJ798sbl/nGxzrppUfrCNZ8i0Y9PwZdis6A/Dwp
 /t7+gIsg0NRQbi4ts8uvZfqCI6Dj1VYdjZCj0yY0OWA5TjJjzYsizE1eW
 whn7revF7U7hMXzCdn0T9ZWVbhmK7OkcJwrzUavPfIJFtgyqAVtBUSzkl
 nL97voX4l5lF7YkUpRj+fSdSnAexLMrrO59WMYIBt2J4Tj8lj8v17Z7gB
 +euzRDGirD5ZYJr2HVo/jDw4AlYqaM58AKo7olhxs+E1+RoEpCzqK3GCt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463391"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463391"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767290"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767290"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:36 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 12/15] drm/i915/display/mtl: Reset FRL Transcoder config while
 disabling HDMI
Date: Mon,  7 Nov 2022 12:50:42 +0530
Message-Id: <20221107072045.628895-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While disabling HDMI, reset the FRL transcoder config if FRL mode was
used.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 5e2e4c78c564..cb0d19b6ee56 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2667,6 +2667,8 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
+	enum transcoder hdmi_transcoder;
+	u8 buf;
 
 	dig_port->set_infoframes(encoder, false,
 				 old_crtc_state, old_conn_state);
@@ -2679,6 +2681,16 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
 	if (DISPLAY_VER(dev_priv) >= 12)
 		intel_ddi_disable_pipe_clock(old_crtc_state);
 
+	if (old_crtc_state->frl.enable) {
+		hdmi_transcoder = old_crtc_state->cpu_transcoder;
+		buf = intel_de_read(dev_priv,
+				    TRANS_HDMI_FRL_CFG(hdmi_transcoder));
+		buf &= ~(TRANS_HDMI_FRL_ENABLE | TRANS_HDMI_FRL_TRAINING_COMPLETE);
+
+		intel_de_write(dev_priv,
+			       TRANS_HDMI_FRL_CFG(hdmi_transcoder), buf);
+	}
+
 	intel_display_power_put(dev_priv,
 				dig_port->ddi_io_power_domain,
 				fetch_and_zero(&dig_port->ddi_io_wakeref));
-- 
2.25.1

