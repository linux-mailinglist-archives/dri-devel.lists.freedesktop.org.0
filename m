Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5062D8F0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7510E5BE;
	Thu, 17 Nov 2022 11:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9F910E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:08:13 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id p21so1295372plr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 03:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guDJ2D49X6qr8IBe/bEb2QRhshSWmmIUhs4eglbthY4=;
 b=T1QGfHblOvZFLAQ313+nynqrD6Pdbe1Pe3Zu2voXKUWYJ9vmhps/ejU6uy25NcskKj
 akstmsM5kk0uinqghnCVvwnxzAL768fyvX8cacrJ3O8j0shlGjfr37wyPjsFjMlEdpbv
 GfAHEfTmqlI1eVeggfwxsVmNSXl/XdHkCb2U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=guDJ2D49X6qr8IBe/bEb2QRhshSWmmIUhs4eglbthY4=;
 b=mskULn1yWPniPDiYmJEiEQp+x6JTFDIjn9VY39I4xIpyE3/KcXJp6+kvSnvZCDmAOw
 lldoZ7G7ShYmSCxhO7DppYFnk4ex7HA5ZxWyYvL8rTp/BLkMx++OyZKgbDsrZzjzhpGH
 zNISaKmiEnDOKMAE532rNIuV72apH7WNvkGJaeEUnhhbJ9MaL17WQhaRw+pn043JibGn
 y3flJ0fIiXEH6cZLXJ+C+xmZiyC2KAvryL4j0TnGabvq3Dk3oDkO4hFuA6j/s73Rt+Yl
 OFZg29RQDkOQmQ/UnGFZMGiMnshcxQDDAc96z4Kn7gQ6zbwla1v+OkokGoOIbdy1uGar
 px8g==
X-Gm-Message-State: ANoB5pkVei86q9Xz/snGLbhvBid2cKzjBsIMlEFM5GEtgWV9lei2tKyS
 C9V0kAMNLdR3+Qal/YycY3fwTQ==
X-Google-Smtp-Source: AA0mqf706RxiMdIusqWwX81fa7V9EmCKZIYsYRY+QZDaYVhDAVD7PxZtE/5/OggHcrFqjSWwqJfHzA==
X-Received: by 2002:a17:90a:6547:b0:213:d08f:a483 with SMTP id
 f7-20020a17090a654700b00213d08fa483mr2325282pjs.21.1668683293463; 
 Thu, 17 Nov 2022 03:08:13 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e678:c7f5:9cb3:1a06])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170902ccd200b0017a032d7ae4sm1025540ple.104.2022.11.17.03.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 03:08:13 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v6 3/3] drm/bridge: it6505: handle HDCP request
Date: Thu, 17 Nov 2022 19:08:04 +0800
Message-Id: <20221117110804.1431024-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221117110804.1431024-1-hsinyi@chromium.org>
References: <20221117110804.1431024-1-hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

it6505 supports HDCP 1.3, but current implementation lacks the update of
HDCP status through drm_hdcp_update_content_protection(). it6505 default
enables the HDCP. If user set it to undesired then the driver will stop
HDCP.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: allen chen <allen.chen@ite.com.tw>
---
v5->v6: no change.
---
 drivers/gpu/drm/bridge/ite-it6505.c | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 21a9b8422bda..be08b42de4ea 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -423,6 +423,7 @@ struct it6505 {
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
 	int extcon_state;
+	struct drm_connector *connector;
 	enum drm_connector_status connector_status;
 	enum link_train_status link_state;
 	struct work_struct link_works;
@@ -2399,6 +2400,14 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
 	it6505->hdcp_status = HDCP_AUTH_DONE;
+	if (it6505->connector) {
+		struct drm_device *drm_dev = it6505->connector->dev;
+
+		drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+		drm_hdcp_update_content_protection(it6505->connector,
+						   DRM_MODE_CONTENT_PROTECTION_ENABLED);
+		drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+	}
 	it6505_show_hdcp_info(it6505);
 }
 
@@ -2931,6 +2940,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!connector))
 		return;
 
+	it6505->connector = connector;
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
 	if (WARN_ON(!conn_state))
@@ -2974,6 +2984,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
+	it6505->connector = NULL;
 	if (it6505->powered) {
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D3);
@@ -3028,6 +3039,48 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 	return edid;
 }
 
+static int it6505_connector_atomic_check(struct it6505 *it6505,
+					 struct drm_connector_state *state)
+{
+	struct device *dev = &it6505->client->dev;
+	int cp = state->content_protection;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "hdcp connector state:%d, curr hdcp state:%d",
+			     cp, it6505->hdcp_status);
+
+	if (!it6505->hdcp_desired) {
+		DRM_DEV_DEBUG_DRIVER(dev, "sink not support hdcp");
+		return 0;
+	}
+
+	if (it6505->hdcp_status == HDCP_AUTH_GOING)
+		return -EINVAL;
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		if (it6505->hdcp_status == HDCP_AUTH_DONE)
+			it6505_stop_hdcp(it6505);
+	} else if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (it6505->hdcp_status == HDCP_AUTH_IDLE &&
+		    it6505->link_state == LINK_OK)
+			it6505_start_hdcp(it6505);
+	} else {
+		DRM_DEV_DEBUG_DRIVER(dev, "invalid to set hdcp enabled");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int it6505_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	return it6505_connector_atomic_check(it6505, conn_state);
+}
+
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3035,6 +3088,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.attach = it6505_bridge_attach,
 	.detach = it6505_bridge_detach,
 	.mode_valid = it6505_bridge_mode_valid,
+	.atomic_check = it6505_bridge_atomic_check,
 	.atomic_enable = it6505_bridge_atomic_enable,
 	.atomic_disable = it6505_bridge_atomic_disable,
 	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
@@ -3354,6 +3408,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD;
+	it6505->bridge.support_hdcp = true;
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;
-- 
2.38.1.431.g37b22c650d-goog

