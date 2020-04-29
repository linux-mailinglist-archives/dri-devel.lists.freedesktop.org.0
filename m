Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B331C1BE7DF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2016F3AA;
	Wed, 29 Apr 2020 19:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D96F3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:23 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l78so3357804qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f6MEZnkl4NSKyNDWkAAso81ljL4LaIi7HLwxXSetA1M=;
 b=BmX30afZHdnz24M2mMvxjzw007dzXBQULct94xjEVO1zpMOaCpeXnfDoS67y8hET8P
 6ru0L1JIFLFR7Wljrhg3qJFPPHgW46UyxEaM86Om2Mls/s/qW5RaMmdAXPkeiwhsgzm0
 A035R/yu7gJwwH1u1DFFHg4uc/e8Hpbx8M2z7h/Lh0PDBNnCndvO1GyZAOq1oi2FULr0
 RhFxXbnyJitM8Gx5RdA5oyoBRsn6s3SxC1RswP7ifXXUH0BlJFEXOKp89Ucp3r38YMbb
 dYzDUfZjxp3cCTqTqZH19avN3VDSPuJyf+0Umi0esQ4R9yfJZCfDYB2/46LdHfzRWmPS
 JHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f6MEZnkl4NSKyNDWkAAso81ljL4LaIi7HLwxXSetA1M=;
 b=a0DJ/HXgBzAnhs144RVqoQ0xkZxDGEBIZqqJbKKVWw9UhaqXB5fAvZlCVlKO4PRuRG
 QO1nUOf7J4VKWp0PhYIboYVCKuKrH/N7DFK+5nrhqTjBNI0b/QxQwDUxKyuATIfacxDQ
 kxsYkoIGcKIHnkS5xkzxd1cYUu+kuhhpgvoXfwiKzzTcjvx3djceX3psixDyXRprtZYu
 2uTVxcU4pZhjK2/gv+i7TMn8CrAjtWsKRyeYTqJsWMQaqrLJ1QTmU8/oX5zcbdftJ13C
 +BCb1CCUB+q8IvgbLB+EEUzv4ts6Vv1whid+0GORIGvrycw7bvpbbt8BXi4/dE4rMCXp
 NEZw==
X-Gm-Message-State: AGi0PuYxggcemYhh0XIfVcNJlvDyAtAkBCXQzLv1/KLJ+6RPRmhyN2Li
 bpj7/uJa1wRC45Ngbp5npmF3tqgm8vc=
X-Google-Smtp-Source: APiQypKfsXI3Wi94Zoza1Ijb4fnyABtsFzKMf6n+T+T7g/ZemCPcZfPaRCw65/xRHBjyGeLXsXTC8Q==
X-Received: by 2002:a05:620a:1232:: with SMTP id
 v18mr69080qkj.429.1588190122588; 
 Wed, 29 Apr 2020 12:55:22 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id j76sm108821qke.114.2020.04.29.12.55.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 10/16] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Wed, 29 Apr 2020 15:54:56 -0400
Message-Id: <20200429195502.39919-11-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
References: <20200429195502.39919-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
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
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  6 ++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 11155a8a73c0..85dcb2dc2d3c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3865,13 +3865,14 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
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
index 6659ce15a693..0bd440382281 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -16,6 +16,7 @@ struct drm_connector_state;
 struct drm_encoder;
 struct drm_i915_private;
 struct drm_modeset_acquire_ctx;
+struct intel_atomic_state;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_digital_port;
@@ -127,4 +128,9 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 
+void intel_ddi_update_pipe(struct intel_atomic_state *state,
+						   struct intel_encoder *encoder,
+						   const struct intel_crtc_state *crtc_state,
+						   const struct drm_connector_state *conn_state);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4d2384650383..d9dc4dc6ea92 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -805,6 +805,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *intel_dig_port, enum
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
