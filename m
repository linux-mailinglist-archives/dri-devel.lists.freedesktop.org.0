Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2532153FDE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBDB6F9F5;
	Thu,  6 Feb 2020 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004E6F9E3;
 Thu,  6 Feb 2020 08:00:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c84so5788164wme.4;
 Thu, 06 Feb 2020 00:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjYTnVG7+ACFqI6Svg5/K0RXWs6QPB8w7ppawHLSitc=;
 b=P4yfRQtAB4VabCdxENb0Uuh8NGyU7hCdvSuzBRSnhUl2oapF/b4yecb4bpoNC031az
 5zJMosZmH6+xKQpUd/M5/b1fzvp62tCe7is56i1ITXbZdrcy+lx8x45rcliQKpPQlnl/
 nFZntTVdS2L2FcMeOGzGpvz8aQOayO0Of1ZFB9s+FSxcaVR4cXKeDO2C5me3G65KxJeB
 mr4rjQMRKY2Ka2tVBF8V+8nediKPrIEWkCAZSJynA5NrQ4fVPM2KtAkSXuGwmHvLkcsn
 F1jDWPV9R0C5RgqAalhxKcJeddI1/g1vaxzyp65ui7sPrc3s+HcHTd/AdEcnPiZqi7qF
 /QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjYTnVG7+ACFqI6Svg5/K0RXWs6QPB8w7ppawHLSitc=;
 b=rdBXk8qIAY46h7GnBao1aUuxrwMlDqMAcWGKB4Fqd1ffBQXbahwudHHruI884TbAil
 ToIUDLXlskJ2jFuSqU4/BZuMnbIuCgPkK5RdNvcYkJkImfLZkEIZpG8A7K5H/yDW5NMW
 Jkrdp9dyRXgyDVv6HtUPo6yN/HgOfzkUHSN4/UiCMUH7tcM1HC+Zro38CSDvggsQyawc
 gADP2fKaRBuQ27YDMLph6WkO23BcO+IjkH9cQ8x7hqdksIFASYqCqhXP9azTdky0IcBf
 rCFILKXhIXw4GR+vmzDJrisDvHAJP7xT9Mqr5HLCmvggyw5TRb+xEnWl6nvCWrBVYYHR
 uvKg==
X-Gm-Message-State: APjAAAXv01oDyM9/Uwj9wbOgRJ6DgDXLvenK2lhsXWIGQd4E/D6d2iMS
 aeZvmItFp+l8nBnOzieDmCg=
X-Google-Smtp-Source: APXvYqw/7R5mDQLPE/OgZOnxm7jnVRsngzFLhwuIeUJIRXLaWnKYMNVc5zKgGdxXSI18KAeLxFXlog==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr2879567wmj.27.1580976056631; 
 Thu, 06 Feb 2020 00:00:56 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:56 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 09/12] drm/i915/dp_mst: convert to drm_device based logging
 macros.
Date: Thu,  6 Feb 2020 11:00:10 +0300
Message-Id: <20200206080014.13759-10-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion of instances of the printk based drm logging macros to the
struct drm_device based logging macros in i915/display/intel_dp_mst.c.
This also involves extracting the drm_i915_private device pointer from
various intel types to use in the macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 30 ++++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b8aee506d595..45028faa4409 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -42,6 +42,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 					    struct drm_connector_state *conn_state,
 					    struct link_config_limits *limits)
 {
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	struct drm_atomic_state *state = crtc_state->uapi.state;
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
@@ -73,7 +74,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	}
 
 	if (slots < 0) {
-		DRM_DEBUG_KMS("failed finding vcpi slots:%d\n", slots);
+		drm_dbg_kms(&i915->drm,
+			    "failed finding vcpi slots:%d\n", slots);
 		return slots;
 	}
 
@@ -322,15 +324,18 @@ static void intel_mst_disable_dp(struct intel_encoder *encoder,
 	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	int ret;
 
-	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
+	drm_dbg_kms(&i915->drm,
+		    "active links %d\n", intel_dp->active_mst_links);
 
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
 	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
 	if (ret) {
-		DRM_DEBUG_KMS("failed to update payload %d\n", ret);
+		drm_dbg_kms(&i915->drm,
+			    "failed to update payload %d\n", ret);
 	}
 	if (old_crtc_state->has_audio)
 		intel_audio_codec_disable(encoder,
@@ -371,7 +376,8 @@ static void intel_mst_post_disable_dp(struct intel_encoder *encoder,
 
 	if (intel_de_wait_for_set(dev_priv, intel_dp->regs.dp_tp_status,
 				  DP_TP_STATUS_ACT_SENT, 1))
-		DRM_ERROR("Timed out waiting for ACT sent when disabling\n");
+		drm_err(&dev_priv->drm,
+			"Timed out waiting for ACT sent when disabling\n");
 	drm_dp_check_act_status(&intel_dp->mst_mgr);
 
 	drm_dp_mst_deallocate_vcpi(&intel_dp->mst_mgr, connector->port);
@@ -405,7 +411,8 @@ static void intel_mst_post_disable_dp(struct intel_encoder *encoder,
 		intel_dig_port->base.post_disable(&intel_dig_port->base,
 						  old_crtc_state, NULL);
 
-	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
+	drm_dbg_kms(&dev_priv->drm, "active links %d\n",
+		    intel_dp->active_mst_links);
 }
 
 static void intel_mst_pre_pll_enable_dp(struct intel_encoder *encoder,
@@ -445,7 +452,8 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 		    INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
 		    !intel_dp_mst_is_master_trans(pipe_config));
 
-	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
+	drm_dbg_kms(&dev_priv->drm, "active links %d\n",
+		    intel_dp->active_mst_links);
 
 	if (first_mst_stream)
 		intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
@@ -461,7 +469,7 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 				       pipe_config->pbn,
 				       pipe_config->dp_m_n.tu);
 	if (!ret)
-		DRM_ERROR("failed to allocate vcpi\n");
+		drm_err(&dev_priv->drm, "failed to allocate vcpi\n");
 
 	intel_dp->active_mst_links++;
 	temp = intel_de_read(dev_priv, intel_dp->regs.dp_tp_status);
@@ -491,11 +499,12 @@ static void intel_mst_enable_dp(struct intel_encoder *encoder,
 	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 
-	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
+	drm_dbg_kms(&dev_priv->drm, "active links %d\n",
+		    intel_dp->active_mst_links);
 
 	if (intel_de_wait_for_set(dev_priv, intel_dp->regs.dp_tp_status,
 				  DP_TP_STATUS_ACT_SENT, 1))
-		DRM_ERROR("Timed out waiting for ACT sent\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for ACT sent\n");
 
 	drm_dp_check_act_status(&intel_dp->mst_mgr);
 
@@ -727,7 +736,8 @@ static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id, connector->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n", connector->base.id,
+		    connector->name);
 	drm_connector_unregister(connector);
 
 	if (dev_priv->fbdev)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
