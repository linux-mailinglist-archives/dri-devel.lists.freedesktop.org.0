Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D578112D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9D10E551;
	Fri, 18 Aug 2023 17:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268A10E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 17:03:06 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6418c819c3cso6175096d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692378185; x=1692982985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pwm6qC3rFWwLT5tqCtYk21W/7NJaeJPBzz2LnoB74+k=;
 b=moPCHHA/jPu7nm/tnzJ122npk5VEyU6mX/Cnsc20e3Jc88UehtXhW40fFDNWXOGfsw
 7ILLtj3U7oYElkI4Ibm2cDBVxzTnG1cVoQcCzSoEGcVqTFBiFU83NAwRlyUrnv3q3/Zq
 tgnE9VWxQMQMwNbuPYGvlnYiIoMcF2f0bEkgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692378185; x=1692982985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pwm6qC3rFWwLT5tqCtYk21W/7NJaeJPBzz2LnoB74+k=;
 b=WhZE2TbPNkO1PfCZ+1JhHLTyWkgXWQutJm/M0QCPp7yHJFCHJcvOwzp8aSXNzZg6Nw
 +BBMVH8AsC29jG6aDzHpcM361sl+odLng4Cx5UJ8naTY/Oiu3rp35DcmQTGbh3ps2eq3
 MYj277CNQL7vemBAfgb+P8I5dBiYcXz1mLdK/CD7E4SU0tYfI0kaLa7IpvdKBOymV9hu
 KHPhIMck85ZyuiRWnY47iV20W0UsnrJd+AD7yJvKrWOjjY/4ZOJsgqrelL2k3243ZdB5
 B7jxmziWXc5hj8hZ4uOvCYoIOHRcax+7jrf8/WYeBaWaABgTnkTp1WaL58gbSg8qlOIp
 gk5g==
X-Gm-Message-State: AOJu0YzvFBtfEK+cb0CU3qH2mB0SzXsoVZmIot2W2w21xduu4sSatOns
 jpi6FIOahmeo6KTGRNXTrYbF1A==
X-Google-Smtp-Source: AGHT+IHZMl81okXnA8gwntvbXsQZZwZpWgHsJ1ZjMw6KPJp7X3AND4i6Ffwqk1OcqkfhxV5BOMyifw==
X-Received: by 2002:a0c:9d45:0:b0:64b:33ae:efa7 with SMTP id
 n5-20020a0c9d45000000b0064b33aeefa7mr2791895qvf.10.1692378185645; 
 Fri, 18 Aug 2023 10:03:05 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:281:cb2f:c9c3:f2f8])
 by smtp.gmail.com with ESMTPSA id
 cx12-20020a05620a51cc00b00767cfb1e859sm649278qkb.47.2023.08.18.10.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:03:05 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/dp_link_training: Add a final failing state to
 link training fallback for MST
Date: Fri, 18 Aug 2023 12:59:19 -0400
Message-ID: <20230818170156.2194015-3-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818170156.2194015-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
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
Cc: Sean Paul <seanpaul@chromium.org>, Gil Dekel <gildekel@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, MST link training has no fallback whatsoever. This means that
if an MST base connector fails to link-train once, the training
completely fails, which makes this case significantly more common than a
complete SST link training failure.

Until MST fallback is fully implemented, this patch adds a final failure
case to MST link training (similar to SST). In particular, this patch
zeros out both max_link_rate and max_link_lane_count. In addition, it
stops reseting MST params so the zeroing of the bit rate fields stick.
This ensures that the MST base connector's modes will be completely
pruned, since it is effectively left with 0Gbps bandwidth.

Once again, it is the userspace's responsibility to ignore connectors
with no modes, even if they are marked as connected.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 29 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h       |  4 +--
 .../drm/i915/display/intel_dp_link_training.c |  8 ++---
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1e4dae8aad90..aee3845edd2d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -630,26 +630,31 @@ static bool intel_dp_can_link_train_fallback_for_edp(struct intel_dp *intel_dp,
 	return true;
 }

-int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
-					    int link_rate, u8 lane_count)
+void intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
+					     int link_rate, u8 lane_count)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int index;

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
@@ -4920,10 +4922,11 @@ intel_dp_detect(struct drm_connector *connector,
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
index 22099de3ca45..c26cc2e6f289 100644
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
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      u8 *pipe_mask);
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
