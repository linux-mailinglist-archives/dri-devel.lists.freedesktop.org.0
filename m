Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D3248A26
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF2189FED;
	Tue, 18 Aug 2020 15:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619FA89FDD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:40:26 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o22so15404172qtt.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Thba8+glQUvDD0rFp1/U2AyH28RV6eO8HcRnSnMrtVk=;
 b=GeeXeZFdZ+Jz5bXsz+3WcXnCVvvSuG7mdCPgGzakZKLYjY67p/M+6f9Gco2wkhzHjn
 4h91okInKd/UFZlgeYITzXLMIaMkUjqlN1eHGZDSihsUN8CM7/+ODmUFf2xhNlhUCuTo
 5zcujibbnsU4M2JuGm6CIUuL1PMR91arX0uxxm+29RSSkzRvvJn7U7rz4w4iGbwomlBB
 mhTcqv4c4trCw9TFjUmtVgaAKh0gElIt2Wm//b9fgf2Y5sCLSbrBwhde6oGglyvrysCX
 viZovfK/zYtttirEfda0fPSEqqv9KCPgrH7Hzcq9hwrkJ8XXN1NfhtbkAL5H/78F5whf
 F8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Thba8+glQUvDD0rFp1/U2AyH28RV6eO8HcRnSnMrtVk=;
 b=lcRF1Kdpd2x2lkJJdh9Q6Uor+jIRYcoQdkeueLSCEh2yZKJ9NS2jEtpMSr9W0C6FhB
 tNO/fvOfTJ9dMn16JkKhtma40pEaP5juofgOURKGP8If+b1F6wTiFd6OisdcxclBKlRk
 AlZPGj0yObewaYk8wPwiQlt7ijZw9FUREOCvkqVNgYK0PZt9MzLMeJ+2z5dOTCX+W4Zm
 lo1zlfO4OtNkuEkKCRGi9dW9lNx5EAhmID6c17lU9Icdod+KnBtKZcz0aXTDNqIVnWck
 633qXrU2rTfdRTJ2mJE8jFoD2CvgiU3WgosX+wIym500KlDGulAerGwGUJDqJnpuKgnq
 jZog==
X-Gm-Message-State: AOAM530+3zME4T2WywykbDs5UwxVClApckvelDWfQ1tj5AtyNNl9/lHp
 bRkYO2wH4nZxbhS020vA9NGs9uUL9jkJxw==
X-Google-Smtp-Source: ABdhPJzJNgEG25n1y/CGRPhtyfFa2SJMuQG9Fcytnq0n5P7JRIz/+UsAOndaIyKMUexxvS1bHOSyPg==
X-Received: by 2002:ac8:4095:: with SMTP id p21mr18563095qtl.185.1597765225387; 
 Tue, 18 Aug 2020 08:40:25 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id f39sm25900839qta.59.2020.08.18.08.40.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:40:25 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 11/17] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Tue, 18 Aug 2020 11:38:59 -0400
Message-Id: <20200818153910.27894-12-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
References: <20200818153910.27894-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

In order to act upon content_protection property changes, we'll need to
implement the .update_pipe() hook. We can re-use intel_ddi_update_pipe
for this

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-11-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-11-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-11-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-11-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-11-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-12-sean@poorly.run #v7

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
Changes in v8:
-None
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  6 ++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a1643588b5f9..36022281d7e0 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4012,13 +4012,14 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
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
index b901ab850cbd..d13b45151a3f 100644
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
index a2d91a499700..b97b2918d802 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -865,6 +865,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *dig_port, enum pipe
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
