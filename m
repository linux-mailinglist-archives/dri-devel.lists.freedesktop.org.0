Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF37866BA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A235C10E49E;
	Thu, 24 Aug 2023 04:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244410E49E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 04:33:31 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-649a11843b3so37792836d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692851611; x=1693456411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zd8Hcb8bUMAg6xjVWrQA+j3K01zN9mJ6vxyg0IYjiVM=;
 b=QXrQpemdjcTMNHTWe8V/qY0OJWGkHnW6nZDHt8dg3x6HgGwuGwx1vkl1p7gu8BoU10
 Et/MeH1k6qCWPJBCD/KI/l5BnyQ1m+kfUlaJXl2wxXsnHg0bkHN3SA9aLSqeMQo4ZaCW
 xkXonosBIulTnJmry3sjnZpw7KVwB8SevWjuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692851611; x=1693456411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zd8Hcb8bUMAg6xjVWrQA+j3K01zN9mJ6vxyg0IYjiVM=;
 b=CzWv1PXDqdb6wGA+GH0lhV8Kj8oflD4mKLR9yFT/TwZkwc89LyB1eT2bunjXF2/6dW
 jr5DdNf9C5hdIKNJWcSlxc0FuUkKdGVat15K+3UKLcSuAufXfnrLLzVyKNcEIC+YVkga
 z6hVjE/pLIupP6qmLnwABujnmSAYQ3ADXoAhWr9eEWsgzXfyFlZl5b6m5eqiZXrfOZJ3
 l1iPRLy3dffvyryGLHEcZmthjdHsYdJMSI/U6/Gjv7/5F0p/oVi6qLui/Fh3hXwPHXFK
 XKSmk0QOPLLJnLUecAXMJgcUjLKRQ9ghmjgyAcJ3mf0xT22GYbi+Eck4uUVnO90AgMXt
 Oy1A==
X-Gm-Message-State: AOJu0YyHBW7RxDF1cKLreTz5uXoJ5MMFSUb6m9RyZEwNRitJ/Qo/AiBz
 uY/agpiPWohq6cMSLK82U0ipLg==
X-Google-Smtp-Source: AGHT+IEk0OyvrNJel7ns/och6In/waojNya1UG+P5c/NBlHHHr3PO66ZZQLECQC963yeHPG+AID0Pw==
X-Received: by 2002:a0c:f5d3:0:b0:64f:4a97:6088 with SMTP id
 q19-20020a0cf5d3000000b0064f4a976088mr8424594qvm.9.1692851611041; 
 Wed, 23 Aug 2023 21:33:31 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a0cca83000000b0064910f273aesm4913632qvk.146.2023.08.23.21.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 21:33:30 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/i915/dp_link_training: Add a final failing state
 to link training fallback for MST
Date: Thu, 24 Aug 2023 00:31:05 -0400
Message-ID: <20230824043240.323564-3-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824043240.323564-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
 <20230824043240.323564-1-gildekel@chromium.org>
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
max_link_rate and max_link_lane_count. In addition, it stops resetting
MST params so the zeroing of the HBR fields stick. This ensures that
the MST base connector's modes will be completely pruned, since it is
effectively left with 0Gbps bandwidth.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 27 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h       |  2 +-
 .../drm/i915/display/intel_dp_link_training.c |  8 +++---
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2152ddbab557..01b180c8d9bd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -630,7 +630,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(struct intel_dp *intel_dp,
 	return true;
 }

-int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
+void intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 					    int link_rate, u8 lane_count)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -638,18 +638,23 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,

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
@@ -662,7 +667,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 							      lane_count)) {
 			drm_dbg_kms(&i915->drm,
 				    "Retrying Link training for eDP with same parameters\n");
-			return 0;
+			return;
 		}
 		intel_dp->max_link_rate = intel_dp_common_rate(intel_dp, index - 1);
 		intel_dp->max_link_lane_count = lane_count;
@@ -673,7 +678,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 							      lane_count >> 1)) {
 			drm_dbg_kms(&i915->drm,
 				    "Retrying Link training for eDP with same parameters\n");
-			return 0;
+			return;
 		}
 		intel_dp->max_link_rate = intel_dp_max_common_rate(intel_dp);
 		intel_dp->max_link_lane_count = lane_count >> 1;
@@ -686,10 +691,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 		 */
 		intel_dp->max_link_rate = 0;
 		intel_dp->max_link_lane_count = 0;
-		return 0;
 	}
-
-	return 0;
 }

 u32 intel_dp_mode_to_fec_clock(u32 mode_clock)
@@ -5310,10 +5312,11 @@ intel_dp_detect(struct drm_connector *connector,
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
index 788a577ebe16..7388510e0cb2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -40,7 +40,7 @@ bool intel_dp_init_connector(struct intel_digital_port *dig_port,
 			     struct intel_connector *intel_connector);
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
 			      int link_rate, int lane_count);
-int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
+void intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 					    int link_rate, u8 lane_count);
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 4485ef4f8ec6..31d0d7854003 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1075,10 +1075,10 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Link Training failed with HOBL active, not enabling it from now on\n");
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
