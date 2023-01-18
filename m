Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189A67284C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06B710E826;
	Wed, 18 Jan 2023 19:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AFF10E820
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:30:44 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id q15so6806067qtn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WLJ3xkyotDYAnQVqs4JMoPxigT63WOwpqYsliWKevY=;
 b=QLg5/c8WmKxwSvCiDaG8ArEOr4p9gviyGSkiwzUM5Iy8v53g5H2JKtX1dYuYTDfpIO
 Sipcn8Yf7jCq1iKME55FdGPpSMakdyhpR8QV926DNZ4ZIEktu3rm7uyY9WJTO2+RhO1Z
 9gWxab9Nwvg7qYesrkXzEhFcb0nfdTytL5Mvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WLJ3xkyotDYAnQVqs4JMoPxigT63WOwpqYsliWKevY=;
 b=0O+TScIYqNdsvEgLrh+XPqChGPbcWqQj5W3XH2RzPi6+blJuTGnNivA0CsFNw8fQXn
 KwJVI4rON4ZiyBUtmyWEl6V2niq7k7rFv3BLT+9kZoHACVEBVa7OMM1Uved90dkShAmV
 50NJHPYLb5KoMBhNwEMiY2muPXFHbsk5bX1or3gF8S8hfUbvtuWl6YkviAP/WdpxEGX4
 i1IfSWPVQO38r0Os1sFztjJnI6DU9EMMhtvD4u5uDruIKh0aJ7ADJLDHNNCD5+DW8awL
 9PdW1WyqS0PFBMx6LuHc2AIl+stKpugObY+cZgyek4Qrtcx+wvtJltPk+E+dUo3Vv0c0
 ga/Q==
X-Gm-Message-State: AFqh2kr0z1ULnNnrOeVntXt7Oe0/jVhbNkKxGALpONVXudo9yq6jnerW
 IlHDi7Vs8S1CI0MaECYNWTasQQ==
X-Google-Smtp-Source: AMrXdXuPloj/auT/rX4UP03RfXorqWHioVKJqL9LuKIsyvz8bSQn3K6ismCX4pHsRJK8sO0kve2cwg==
X-Received: by 2002:ac8:524c:0:b0:3b6:378c:5cd7 with SMTP id
 y12-20020ac8524c000000b003b6378c5cd7mr10713401qtn.61.1674070243593; 
 Wed, 18 Jan 2023 11:30:43 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com.
 [35.245.46.29]) by smtp.gmail.com with UTF8SMTPSA id
 ga15-20020a05622a590f00b003b6325dfc4esm4613264qtb.67.2023.01.18.11.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:30:43 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Date: Wed, 18 Jan 2023 19:30:11 +0000
Message-Id: <20230118193015.911074-7-markyacoub@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
In-Reply-To: <20230118193015.911074-1-markyacoub@google.com>
References: <20230118193015.911074-1-markyacoub@google.com>
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com, marex@denx.de,
 ashutosh.dixit@intel.com, sean@poorly.run, abhinavk@codeaurora.org,
 javierm@redhat.com, arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, maxime@cerno.tech, rodrigo.vivi@intel.com,
 johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com,
 markyacoub@chromium.org, andersson@kernel.org, dianders@chromium.org,
 swati2.sharma@intel.com, manasi.d.navare@intel.com, tzimmermann@suse.de,
 bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The shim functions return error codes, but they are discarded in
intel_hdcp.c. This patch plumbs the return codes through so they are
properly handled.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-7-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-7-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-7-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-7-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-7-sean@poorly.run #v5

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebased

---
 .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 7c7253a2541c..13a4153bb76e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -492,6 +492,7 @@ static void intel_panel_info(struct seq_file *m,
 static void intel_hdcp_info(struct seq_file *m,
 			    struct intel_connector *intel_connector)
 {
+	int ret;
 	bool hdcp_cap, hdcp2_cap;
 
 	if (!intel_connector->hdcp.shim) {
@@ -499,8 +500,12 @@ static void intel_hdcp_info(struct seq_file *m,
 		goto out;
 	}
 
-	hdcp_cap = intel_hdcp_capable(intel_connector);
-	hdcp2_cap = intel_hdcp2_capable(intel_connector);
+	ret = intel_hdcp_capable(intel_connector, &hdcp_cap);
+	if (ret)
+		hdcp_cap = false;
+	ret = intel_hdcp2_capable(intel_connector, &hdcp2_cap);
+	if (ret)
+		hdcp2_cap = false;
 
 	if (hdcp_cap)
 		seq_puts(m, "HDCP1.4 ");
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0a20bc41be55..61a862ae1f28 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -177,50 +177,49 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 }
 
 /* Is HDCP1.4 capable on Platform and Sink */
-bool intel_hdcp_capable(struct intel_connector *connector)
+int intel_hdcp_capable(struct intel_connector *connector, bool *capable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
-	bool capable = false;
 	u8 bksv[5];
 
+	*capable = false;
+
 	if (!shim)
-		return capable;
+		return 0;
 
-	if (shim->hdcp_capable) {
-		shim->hdcp_capable(dig_port, &capable);
-	} else {
-		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
-			capable = true;
-	}
+	if (shim->hdcp_capable)
+		return shim->hdcp_capable(dig_port, capable);
+
+	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
+		*capable = true;
 
-	return capable;
+	return 0;
 }
 
 /* Is HDCP2.2 capable on Platform and Sink */
-bool intel_hdcp2_capable(struct intel_connector *connector)
+int intel_hdcp2_capable(struct intel_connector *connector, bool *capable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	bool capable = false;
+
+	*capable = false;
 
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
-		return false;
+		return 0;
 
 	/* MEI interface is solid */
 	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
 	if (!dev_priv->display.hdcp.comp_added ||  !dev_priv->display.hdcp.master) {
 		mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
-		return false;
+		return 0;
 	}
 	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
 
 	/* Sink's capability for HDCP2.2 */
-	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
-
-	return capable;
+	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
 }
 
 static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
@@ -2355,6 +2354,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	bool capable;
 	int ret = -EINVAL;
 
 	if (!hdcp->shim)
@@ -2373,21 +2373,27 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
 	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
 	 */
-	if (intel_hdcp2_capable(connector)) {
+	ret = intel_hdcp2_capable(connector, &capable);
+	if (capable) {
 		ret = _intel_hdcp2_enable(connector);
-		if (!ret)
+		if (!ret) {
 			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+			goto out;
+		}
 	}
 
 	/*
 	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
 	 * be attempted.
 	 */
-	if (ret && intel_hdcp_capable(connector) &&
-	    hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
+	ret = intel_hdcp_capable(connector, &capable);
+	if (ret)
+		goto out;
+
+	if (capable && hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
 		ret = _intel_hdcp_enable(connector);
-	}
 
+out:
 	if (!ret) {
 		schedule_delayed_work(&hdcp->check_work, check_link_interval);
 		intel_hdcp_update_value(connector,
@@ -2395,7 +2401,6 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
-out:
 	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 7c5fd84a7b65..f06f6e5a2b1a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
-bool intel_hdcp_capable(struct intel_connector *connector);
-bool intel_hdcp2_capable(struct intel_connector *connector);
+int intel_hdcp_capable(struct intel_connector *connector, bool *capable);
+int intel_hdcp2_capable(struct intel_connector *connector, bool *capable);
 void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
 void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
 void intel_hdcp_cleanup(struct intel_connector *connector);
-- 
2.39.0.246.g2a6d74b583-goog

