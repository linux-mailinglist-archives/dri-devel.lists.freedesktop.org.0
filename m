Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6478741C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AB110E594;
	Thu, 24 Aug 2023 15:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568310E592
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:26:50 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bd77864e05so4846902a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692890809; x=1693495609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXP3WRBgNLLhBji7BQzGnABPGDEirFPt3NjHtQtXMEQ=;
 b=ifGTOwxcKkH0zeQx1bP8kb/fUs2/xcIP/xTdcP/9/uolkExM+we26pn7/ry+yMMHWK
 sZzWq5qK21Xnk//CzQOELyQWboRIN9oPKpNgUPQWapiEQfG/yfNiT3tShwDlHYxrRMxX
 ksd6UxGxAz+dfIF7ohHaAGoq4jZUEO23W6b1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890809; x=1693495609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXP3WRBgNLLhBji7BQzGnABPGDEirFPt3NjHtQtXMEQ=;
 b=XMHV50zaVNVCGJCOaXt6CALOtXgbCOIq4ia8NY0v4TmlvoHw0SHbGsShzv1nkyNcJN
 U2rJwbxC+yxqI8wiHddmh3n9l3Ol6CNNz134EHodG4QvCbFo4+PTSHGiDgj2oZ093Cv6
 SHfMe58JZTZX4pSGyaWZXe86H1kYsJ3cP0jo91U3eLX5liiWbAo8i1X7AqQNqMqc33DZ
 CB1GWdKbb3toEFMnpwuGXacJVB3mQHgYzqLWAwAfY2ge+m+cqKImSRZfhA5fjeGnTH7s
 3LLu5tBzJkp9sZ28C9qF7PNswbHP8jPEQjtUNUUNsYTlqxobaj/vNGLqX7LGUfYfXb+o
 Kf4g==
X-Gm-Message-State: AOJu0Yw21VlzmKyvMjzQjtTlB3IOwOXySqDhR2CQp6oq89AX89PNtxm1
 iVzZ1byn2QRgh/aa4U0/CCkmSA==
X-Google-Smtp-Source: AGHT+IFlXZHMggSvqwJFfV+EtvF+cYH6q+NaOa/CUTKj84YMQAmMP8JH+mh/JpcDJBrNV0reWHJhFQ==
X-Received: by 2002:a05:6358:8820:b0:134:ce27:223c with SMTP id
 hv32-20020a056358882000b00134ce27223cmr19345653rwb.27.1692890809580; 
 Thu, 24 Aug 2023 08:26:49 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac83d8a000000b0041079ba4f6bsm4423014qtf.12.2023.08.24.08.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:26:49 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/i915/dp_link_training: Add a final failing state
 to link training fallback for MST
Date: Thu, 24 Aug 2023 11:25:18 -0400
Message-ID: <20230824152631.401621-3-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824152631.401621-1-gildekel@chromium.org>
References: <20230824152631.401621-1-gildekel@chromium.org>
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
Cc: seanpaul@chromium.org, Gil Dekel <gildekel@chromium.org>,
 navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, MST link training has no fallback. This means that if an MST
base connector fails to link-train once, the training completely fails,
which makes this case significantly more common than a complete SST link
training failure.

Similar to the final failure state of SST, this patch zeros out both
max_link_rate and max_link_lane_count. In addition, it stops reseting
MST params so the zeroing of the HBR fields stick. This ensures that
the MST base connector's modes will be completely pruned, since it is
effectively left with 0Gbps bandwidth.

Change-Id: Id5de137d0ce4e1ad34e137733a73a1ebbc5b94e5
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 27 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h       |  4 +--
 .../drm/i915/display/intel_dp_link_training.c |  8 +++---
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2b8d2ee08a2b2..9a5bcd630068e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -608,7 +608,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(struct intel_dp *intel_dp,
 	return true;
 }

-int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
+void intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 					    int link_rate, u8 lane_count)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -616,18 +616,23 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,

 	/*
 	 * TODO: Enable fallback on MST links once MST link compute can handle
-	 * the fallback params.
+	 * the fallback params. For now, similar to the SST case, ensure all of
+	 * the base connector's modes are pruned in the next connector probe by
+	 * effectively reducing its bandwidth to 0 so userspace can ignore it
+	 * within the next modeset attempt.
 	 */
 	if (intel_dp->is_mst) {
 		drm_err(&i915->drm, "Link Training Unsuccessful\n");
-		return -1;
+		intel_dp->max_link_rate = 0;
+		intel_dp->max_link_lane_count = 0;
+		return;
 	}

 	if (intel_dp_is_edp(intel_dp) && !intel_dp->use_max_params) {
 		drm_dbg_kms(&i915->drm,
 			    "Retrying Link training for eDP with max parameters\n");
 		intel_dp->use_max_params = true;
-		return 0;
+		return;
 	}

 	index = intel_dp_rate_index(intel_dp->common_rates,
@@ -640,7 +645,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 							      lane_count)) {
 			drm_dbg_kms(&i915->drm,
 				    "Retrying Link training for eDP with same parameters\n");
-			return 0;
+			return;
 		}
 		intel_dp->max_link_rate = intel_dp_common_rate(intel_dp, index - 1);
 		intel_dp->max_link_lane_count = lane_count;
@@ -651,7 +656,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 							      lane_count >> 1)) {
 			drm_dbg_kms(&i915->drm,
 				    "Retrying Link training for eDP with same parameters\n");
-			return 0;
+			return;
 		}
 		intel_dp->max_link_rate = intel_dp_max_common_rate(intel_dp);
 		intel_dp->max_link_lane_count = lane_count >> 1;
@@ -664,10 +669,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
                  */
 		intel_dp->max_link_rate = 0;
 		intel_dp->max_link_lane_count = 0;
-		return 0;
 	}
-
-	return 0;
 }

 u32 intel_dp_mode_to_fec_clock(u32 mode_clock)
@@ -4669,10 +4671,11 @@ intel_dp_detect(struct drm_connector *connector,
 	intel_dp_configure_mst(intel_dp);

 	/*
-	 * TODO: Reset link params when switching to MST mode, until MST
-	 * supports link training fallback params.
+	 * Note: Even though MST link training fallback is not yet implemented,
+	 * do not reset. This is because the base connector needs to have all
+	 * its modes pruned when link training for the MST port fails.
 	 */
-	if (intel_dp->reset_link_params || intel_dp->is_mst) {
+	if (intel_dp->reset_link_params) {
 		intel_dp_reset_max_link_params(intel_dp);
 		intel_dp->reset_link_params = false;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index a54902c713a34..7069ac5afbb81 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -40,8 +40,8 @@ bool intel_dp_init_connector(struct intel_digital_port *dig_port,
 			     struct intel_connector *intel_connector);
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
 			      int link_rate, int lane_count);
-int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
-					    int link_rate, u8 lane_count);
+void intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
+					     int link_rate, u8 lane_count);
 int intel_dp_retrain_link(struct intel_encoder *encoder,
 			  struct drm_modeset_acquire_ctx *ctx);
 void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 3d3efcf02011e..720af16a654c9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1116,10 +1116,10 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 			    "not enabling it from now on",
 			    encoder->base.base.id, encoder->base.name);
 		intel_dp->hobl_failed = true;
-	} else if (intel_dp_get_link_train_fallback_values(intel_dp,
-							   crtc_state->port_clock,
-							   crtc_state->lane_count)) {
-		return;
+	} else {
+		intel_dp_get_link_train_fallback_values(intel_dp,
+							crtc_state->port_clock,
+							crtc_state->lane_count);
 	}

 	/* Schedule a Hotplug Uevent to userspace to start modeset */
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
