Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FC40CE30
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224296EA40;
	Wed, 15 Sep 2021 20:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B7F6EA40
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:39:08 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id a66so5018198qkc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzhM5e5dPVJ8cbEOQ+kFjFOnqRe4MfO+I5K+E1Gofyg=;
 b=eMnKlKRcC/+Y1ZXCNUvg7Mm8BAY0et7n8in88bx23iXk0ohO5xRYUJlCTnrfZvvtOS
 In5e3YyBhFcwgvaMyD25x5IAkeBjPqaJhpeXtbLFFnYelr+PUdnDtTWYF8C7izmDyH03
 tbD8wx8iSezHaFRNMzWbaRvRQksqbQQzCPXME+vOSRQjC/rZAwxqidGvUC+n+PddGIQA
 BKglCRNf5L5+6bMYMJgyKx5qBQZnB7jL+Ji/TNmghKzJi+OWx8NnkJm0/7l4vdUGO3ZB
 kCSay9I13/FuE3JoM2LN9mwXODnKxYpS122Ud1o2NJxDv3opGM/Hy0zfgKV46J4Hepij
 NFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzhM5e5dPVJ8cbEOQ+kFjFOnqRe4MfO+I5K+E1Gofyg=;
 b=ZymtO+yZ9pzn47EZ5MQmUjXVLiWLyBLqpvbEKFJ5lSk4hbCltuoBD0RePDkRMkXml2
 DqCcIzbo0H+9ACZJuNjMxjjxRMnuQqu5KxF7IC9g8WTLovLWi4Yj0JYY/iNqtDGUeXc9
 25uM01jH4l8A3TLmZBkKjpnV7xpvNd7SeTQf3UKfXv8f6d230lehbbTB3DkW844cdhzR
 NSFEZ3keoZa0QxrLuLdQ5oIO/iXkF/hPRJ0v7a7ZpW3Zwd6ALe57UeNKdhrqusRMR1F+
 q0tRJ8YJZmfGcaWuwVkfswO/olSCYBEWYnkHWrlpP9kGk5lPs4e4n43yOUYNJHsaS9Je
 ay7w==
X-Gm-Message-State: AOAM530W/zZ0K1iUXgRgBOSCPsXwCqWIhv1Ov5yo4OL0CDSp5haT6FtF
 Wzq8RZJkxmx5V+2/hAQu2MNoipxTadQBEw==
X-Google-Smtp-Source: ABdhPJzeWcsfG7VI1lQyjbI034VKXwzFo5P/ToKHk3TaZhBgX1oZxyFx7Q76yHysbrQyJu3xkXkKdg==
X-Received: by 2002:a05:620a:1307:: with SMTP id
 o7mr1809189qkj.437.1631738346461; 
 Wed, 15 Sep 2021 13:39:06 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u189sm822308qkh.14.2021.09.15.13.39.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:39:06 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 05/13] drm/i915/hdcp: Consolidate HDCP setup/state cache
Date: Wed, 15 Sep 2021 16:38:24 -0400
Message-Id: <20210915203834.1439-6-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Stick all of the setup for HDCP into a dedicated function. No functional
change, but this will facilitate moving HDCP logic into helpers.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-6-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 52 +++++++++++++++--------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index feebafead046..af166baf8c71 100644
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

