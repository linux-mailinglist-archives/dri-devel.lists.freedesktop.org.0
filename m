Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213B6EAED8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CA410E256;
	Fri, 21 Apr 2023 16:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74E10E256
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:12:47 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-b8f5121503eso2466337276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682093565; x=1684685565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKO1I2nyCroJ5CwepD9IlxcHZJ24Ly0m35i9l8S4MQs=;
 b=HJfyn5H0QVx3NXHRM8iU50CH7Ukb/wfDINz8hm/4f7n2NjK0MiMfZadyU4/9ZxGvkJ
 pH/IHUyy274lKYCO1jODOlPX2cacKBGdFCiGRGEYu2bzEwGpsO7LKkbrxIkAQWVLIc+j
 byWAkFmPgv/5cQKlcgPuQSV6bzI9E6E8GcAvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093565; x=1684685565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKO1I2nyCroJ5CwepD9IlxcHZJ24Ly0m35i9l8S4MQs=;
 b=aT5T22WBfIYFc5vyHNCjJWbXdUo7vtsXsWIuiBHd6RgXxsFruFak4LNs6OWNAZj1in
 O1+KSYaYjITmrIv4l4V39U6khAO5hkk5UO0MitHgYYeyw+MXp6lRePGMqxh6yp8oQoZg
 iBPSRYQaw5pC36c8btKt0SC30VWs8ZZlEGRLAkIZgTDfhMragV9kS2hIOp2TuWRSD73n
 l3VuzPaI8oWWrUX6yBbCqDX4ojXOHxsKJRKCCKqxHE9YAVVRT6Mj6tgE/4VmKSpanLT/
 H+uKWTpz2TA4GkTkcn+mqV+rSb/bimDQbtIIk87z0bz3qXbLDCVV/qCrQimFQnBWrQE/
 b1Xw==
X-Gm-Message-State: AAQBX9fNb/67IEwNOBD9uGF/LnHEUSHACw2GlOgMuTnf5Aru92Is0W7y
 o93U0gWA6NPkVQE+7qRRSCIH8RoCqSpuCGfyMug=
X-Google-Smtp-Source: AKy350ZfHj4U+debwEjtoM+P+zXHEbqLPoMWNeevKjzr0FvvwqIS7hVfrAuFlrrufYErsNiIub5ahw==
X-Received: by 2002:a25:b31b:0:b0:b8c:4e4:d3d4 with SMTP id
 l27-20020a25b31b000000b00b8c04e4d3d4mr2748897ybj.17.1682093565513; 
 Fri, 21 Apr 2023 09:12:45 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 n12-20020a0dcb0c000000b00552e32354f8sm1038529ywd.32.2023.04.21.09.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:12:45 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/2] dp_hdcp: Get the hdcp key from the connector prop
Date: Fri, 21 Apr 2023 12:12:37 -0400
Message-ID: <20230421161237.357342-3-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230421161237.357342-1-markyacoub@google.com>
References: <20230421161237.357342-1-markyacoub@google.com>
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
Cc: Mark Yacoub <markyacoub@chromium.org>, seanpaul@chromium.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[Why]
To support protected content, the driver requires a key.
Currently, it's being injected from debugfs, which is not super useful
to run a user space in the wild.

[How]
When the key is needed, fetch the "Content Protection Property" on the
connector and get the key blob. Verify that the size is valid and use
it.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_hdcp.c | 66 +++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
index 191340971f943..4321d245b36c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_hdcp.c
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
@@ -117,19 +117,61 @@ static bool dp_hdcp_are_keys_valid(struct drm_connector *connector,
 	return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
 }
 
+static bool dp_hdcp_get_key_from_connector(struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct drm_property_blob *key_blob;
+	u8 *raw_key;
+	int ret;
+	struct dp_hdcp *hdcp;
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop =
+		dev->mode_config.content_protection_key_property;
+
+	if (!prop)
+		return false;
+
+	key_blob = connector->state->content_protection_key;
+	if (!key_blob)
+		return false;
+
+	raw_key = key_blob->data;
+
+	if (key_blob->length !=
+	    DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN) {
+		drm_dbg_atomic(
+			dev,
+			"[CONNECTOR:%d:%s] Content Protection Key is a blob that we don't expect.\n",
+			connector->base.id, connector->name);
+		return false;
+	}
+
+	hdcp = dp_display_bridge_to_hdcp(bridge);
+	ret = dp_hdcp_ingest_key(hdcp, key_blob->data, key_blob->length);
+	if (ret)
+		return false;
+
+	return true;
+}
+
 static int dp_hdcp_load_keys(struct drm_connector *connector, void *driver_data)
 {
 	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
 	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
 	int i, ret = 0;
+	bool is_hdcp_key_valid;
 
 	mutex_lock(&hdcp->key_lock);
+	is_hdcp_key_valid = hdcp->key.valid;
+	mutex_unlock(&hdcp->key_lock);
 
-	if (!hdcp->key.valid) {
-		ret = -ENOENT;
-		goto out;
+	if (!is_hdcp_key_valid &&
+	    !dp_hdcp_get_key_from_connector(connector, bridge)) {
+		return -ENOENT;
 	}
 
+	mutex_lock(&hdcp->key_lock);
+
 	dp_catalog_hdcp_write_aksv(hdcp->catalog, hdcp->key.ksv.words);
 
 
@@ -139,7 +181,6 @@ static int dp_hdcp_load_keys(struct drm_connector *connector, void *driver_data)
 	}
 	dp_catalog_hdcp_post_write_key(hdcp->catalog);
 
-out:
 	mutex_unlock(&hdcp->key_lock);
 	return ret;
 }
@@ -346,6 +387,8 @@ int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
 		   struct drm_bridge *bridge, struct dp_catalog *catalog)
 {
 	struct drm_hdcp_helper_data *helper_data;
+	struct drm_device *dev;
+	struct drm_property *prop;
 
 	/* HDCP is not configured for this device */
 	if (!hdcp->parser->io.dp_controller.hdcp_key.base)
@@ -357,7 +400,20 @@ int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
 		return PTR_ERR(helper_data);
 
 	helper_data->driver_data = bridge;
-	hdcp->dev = connector->dev;
+
+	dev = connector->dev;
+	prop = dev->mode_config.content_protection_key_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					   "Content Protection Key", 0);
+	}
+	if (!prop)
+		return -1;
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_MODE_HDCP_CONTENT_TYPE0);
+	dev->mode_config.content_protection_key_property = prop;
+
+	hdcp->dev = dev;
 	hdcp->connector = connector;
 	hdcp->helper_data = helper_data;
 	hdcp->catalog = catalog;
-- 
2.40.0.634.g4ca3ef3211-goog

