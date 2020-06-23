Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280C1205699
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 17:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E182A6E9EA;
	Tue, 23 Jun 2020 15:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46406E9E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h23so8650137qtr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sSwciNWqia9KhaBvAgY/wIGJboJ5HaYJ/LaHVcu0yGo=;
 b=ctG4Up7ElDFHASyTXiF2eA6QR3vvrhRhUTwV9nMXLK1ZZ1xrO8Vh+ZKif89hkgH18d
 YDt8yCUJdffWlAkzL5IRWQ30twfM/5imvHX7WYnX6AIDsTmy4rX7Ew7bPc9E2br0Crx2
 KE6Avs60G2N5sm6HsgLkrWveZS6K6DORFuDpTdpwcywXcp53PWiiYzSe5E8RBfV/mJ5q
 nFCnLcmjNXj18Q65e8krBWcVxqKGITgOIZMtwzuKwtna8s/CVjM+pED4JdVMLNDRG6Dy
 KQ4AmJMkbMYVEfO7aqkN7esN9aHisFfdfeYEoA9+49KYuIF1xX1/Chj9A0tG0SKqJp2m
 I2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sSwciNWqia9KhaBvAgY/wIGJboJ5HaYJ/LaHVcu0yGo=;
 b=Kb748EHB5PL2gl2ihAUH0Xi6fVfJ2xTr7eJpjk8a8LRohx+N9Fh8yvG/3yPtkd8cIc
 0EFw0/mH2TN73N3Uq2yev+jrXnwCI9yqrb1Yzqn0fZCOfu8yysDxkALZQ0TOKiZ60QWR
 IOywzwyW95xZ8Q9M0BAfAL3LG+rut7J2r8exEptreqEqCgCETfv3SYZC+gzwCbx0ZxrU
 uNcDc1MVwOMX2b/kKDPpzOVzNd6R+umvikT+JhtFurJ3V64BpMB1ttNmHkbi/spOvbi9
 Swv2G1CPdsiYlBMl3WQz11ztGzJ1/Gfmzpx3Yifdp4+W+QYPRC2r+BfIhM8iQhKunbUs
 kgow==
X-Gm-Message-State: AOAM532nwWxM4TAE5xXRgV4Rlbi9OEJSYGXvW4R4/xt2Qyxm+Q/CRScO
 sA2kbxclyFF3+F9jvAbBcRlYzEB1xlk=
X-Google-Smtp-Source: ABdhPJxQL5jFVrgtsUIF7WFrqJGQLzN32Of/QMjY+D3C66UobYNImCYSpif1ITDlF8zklxRMKgOb2g==
X-Received: by 2002:ac8:2914:: with SMTP id y20mr22082773qty.30.1592927974690; 
 Tue, 23 Jun 2020 08:59:34 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id z9sm858299qkj.129.2020.06.23.08.59.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 11/17] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Tue, 23 Jun 2020 11:59:01 -0400
Message-Id: <20200623155907.22961-12-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623155907.22961-1-sean@poorly.run>
References: <20200623155907.22961-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

In order to act upon content_protection property changes, we'll need to
implement the .update_pipe() hook. We can re-use intel_ddi_update_pipe
for this

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-11-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-11-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-11-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-11-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-11-sean@poorly.run #v6

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-None
Changes in v7:
-None
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  6 ++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 536299f902b9..29f1f552e8d8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3907,13 +3907,14 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
 	intel_panel_update_backlight(state, encoder, crtc_state, conn_state);
 }
 
-static void intel_ddi_update_pipe(struct intel_atomic_state *state,
-				  struct intel_encoder *encoder,
-				  const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+void intel_ddi_update_pipe(struct intel_atomic_state *state,
+			   struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state)
 {
 
-	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
+	    !intel_encoder_is_mst(encoder))
 		intel_ddi_update_pipe_dp(state, encoder, crtc_state,
 					 conn_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0a8950f744f6..6352c7e97e3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -17,6 +17,7 @@ struct drm_encoder;
 struct drm_i915_private;
 struct drm_modeset_acquire_ctx;
 struct drm_dp_vsc_sdp;
+struct intel_atomic_state;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_digital_port;
@@ -128,4 +129,9 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 
+void intel_ddi_update_pipe(struct intel_atomic_state *state,
+			   struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 9308b5920780..0675825dcc20 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -836,6 +836,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *intel_dig_port, enum
 	intel_encoder->compute_config_late = intel_dp_mst_compute_config_late;
 	intel_encoder->disable = intel_mst_disable_dp;
 	intel_encoder->post_disable = intel_mst_post_disable_dp;
+	intel_encoder->update_pipe = intel_ddi_update_pipe;
 	intel_encoder->pre_pll_enable = intel_mst_pre_pll_enable_dp;
 	intel_encoder->pre_enable = intel_mst_pre_enable_dp;
 	intel_encoder->enable = intel_mst_enable_dp;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
