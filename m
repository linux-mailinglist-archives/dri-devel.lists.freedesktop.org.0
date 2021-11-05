Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E831445E45
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDE26E55E;
	Fri,  5 Nov 2021 03:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF836E558
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:07 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id g25so6580362qvf.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdsCfM6z2tApw4KfIV2/nn8GFa6NdBecKBS/5ARCb1E=;
 b=DEEpi5GQ90HmcL6+E+j/FSXrgZ6nF2aUI6R9qQ32K9ekOQynXYL7RJIoyHTyUjQiwS
 C+0r5epdAmgkIe7fsPria+O1amQdF4s8pKOT8dfQa+HbN50WF1H1gPCqSS720MCDgxJM
 qHkHUzFxXPwMcnK322eliNAd0gAl9Q6rWnZsxEdFvILAPulMVySoX8W8+sLbtnJoiYvI
 nqVEXyG/xkelurP6MBxpq1ZrFAfM+rt2OrucpP8h0vp9LOUgELePveHTfrOoFkYpAbWW
 R8QlrtdzI21pPooV6oggglX8VoD9dMJpiRtUNPLysjFAj+sLldjnlN+MeIduC+FwleFG
 EPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IdsCfM6z2tApw4KfIV2/nn8GFa6NdBecKBS/5ARCb1E=;
 b=JBcZjoNKP0Y2WaEHGOGz4dJ8R8euEWO6nQC0ld3b182WVUOCJhbhTKAiI6j26hO+ju
 Oeu+EbJoQ0iFpIV3mcRIzazAexnYl9Ji5VA44Ub0RvBoCiRb4QRQoaAw6N+C0x84U4aN
 mnOeWY5fI1kY4SmwFscs6LAXF2yAYYM76Y1tgybYginUZiC06/3bkmVzH37WNcA+z/ll
 gi3seL5LvUNgTq8w8jLABMmAc+vQDtljtCkrziHF0SFmftYNxYoIA5KVSEf3aqgTbmhb
 YA3kOCL0WkAKmT6E0U7jgnpWZthw3t7gRE/JOTVaffZ7tNQP+x0nu7nB0/QcwdJt4PtQ
 eYJg==
X-Gm-Message-State: AOAM532nzcOtK0MZWmp/VTh70Jg5YNX9oBLt+1DjpQC2FYelAqHey9en
 cDloFEnrfYbXFHrzUPwFPP3a55mo6QRisQ==
X-Google-Smtp-Source: ABdhPJwgB1HeFPmkWOzPwJIqKjkVIO9JP5N1+B7idv+Zgex7XT9bQZHxtDgJURIujtNk96dlEsW6/Q==
X-Received: by 2002:ad4:56a4:: with SMTP id bd4mr40728646qvb.16.1636081504307; 
 Thu, 04 Nov 2021 20:05:04 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id z9sm4048051qtj.87.2021.11.04.20.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:04 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 05/14] drm/i915/hdcp: Consolidate HDCP setup/state cache
Date: Thu,  4 Nov 2021 23:04:22 -0400
Message-Id: <20211105030434.2828845-6-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Stick all of the setup for HDCP into a dedicated function. No functional
change, but this will facilitate moving HDCP logic into helpers.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-6-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-6-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-6-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 52 +++++++++++++++--------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f12790697e2d..8fc830e38311 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2167,6 +2167,37 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
 	}
 }
 
+static int
+_intel_hdcp_setup(struct intel_connector *connector,
+		  const struct intel_crtc_state *pipe_config, u8 content_type)
+{
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_hdcp *hdcp = &connector->hdcp;
+	int ret = 0;
+
+	if (!connector->encoder) {
+		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
+			connector->base.name, connector->base.base.id);
+		return -ENODEV;
+	}
+
+	hdcp->content_type = content_type;
+
+	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
+		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
+		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
+	} else {
+		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
+		hdcp->stream_transcoder = INVALID_TRANSCODER;
+	}
+
+	if (DISPLAY_VER(dev_priv) >= 12)
+		dig_port->hdcp_port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
+
+	return ret;
+}
+
 static int initialize_hdcp_port_data(struct intel_connector *connector,
 				     struct intel_digital_port *dig_port,
 				     const struct intel_hdcp_shim *shim)
@@ -2306,28 +2337,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	if (!hdcp->shim)
 		return -ENOENT;
 
-	if (!connector->encoder) {
-		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
-			connector->base.name, connector->base.base.id);
-		return -ENODEV;
-	}
-
 	mutex_lock(&hdcp->mutex);
 	mutex_lock(&dig_port->hdcp_mutex);
 	drm_WARN_ON(&dev_priv->drm,
 		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
-	hdcp->content_type = content_type;
-
-	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
-		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
-		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
-	} else {
-		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
-		hdcp->stream_transcoder = INVALID_TRANSCODER;
-	}
 
-	if (DISPLAY_VER(dev_priv) >= 12)
-		dig_port->hdcp_port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
+	ret = _intel_hdcp_setup(connector, pipe_config, content_type);
+	if (ret)
+		goto out;
 
 	/*
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
@@ -2355,6 +2372,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
+out:
 	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

