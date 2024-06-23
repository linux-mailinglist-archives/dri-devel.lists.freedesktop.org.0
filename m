Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1109137F0
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D723710E100;
	Sun, 23 Jun 2024 05:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cwsdPoZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981EF10E048
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:40:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so1971097e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719121219; x=1719726019; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=cwsdPoZrOZKtSmuLCLTMbKXhN3GOnhEy8ghLZE8lqcWw0z4ByR8HhHjy+OSbm9aOt/
 sErpQ5JusDN6fiXAxmD8XUXdz1Prn+U7Am7lFgw2b8hjK/Z+Qqx9uAn7BoGgOxFzYy8G
 LQ/DNnZUiPUQ/+FW+ZdosGRNmCREV2iKlHfEhBJJjGruuN0GgJsNv+UdnIxnaaUdMhAR
 ukSwUzywqClfJxMhatBPQG5ug8piwEEDAcUmTiFp9Mhu+Gyu2JmMDH4LpkB45tYffEYS
 6dTKEecpoH4/w3eCnc+Mlb7eHHuXOKEYC1BrxQq6VfXSfTA5r3ZMxXkMlsFLUEAbWwcZ
 MCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719121219; x=1719726019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=G2u7mUAlM0hKW+juVZW6dsote2tN66p4PTSayyhg8DdtByu/EggXkltutLdDBoeiaJ
 xlf8wbUFTkz9OsGq8hfA6gWCY/psNeqWyns3ytPPV+dOi3opv13r0Vn22J3YPBtv98LE
 R3mT0zuMkPc1dqGiLBkr7zHx780uT+ELgV0/Xv6wMInB5yY55iMh53hKfY5j0S+DXLr0
 23JsrtBF8seDdKU4w8FPoXhSVfnSafiC83PkJBlASLc2M1c2srqb+0CBjIlPKu7V2D8s
 W7s9h/aXfvlUyPMEE8SJfMKaQ8+7ydsslqSzAsNVMozDPFFpOzb0VfAZh0JOWpa2KWA3
 s3+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgQm2aFtE9W4DEWlypKOzTt/s3FZK1LrkaM2Oms/NF+5wpBqy5QbR0O7RtP6nIAtSbogGmB04TzH1rKBAL2kfAzrN6LrdesxjAq01WsRhi
X-Gm-Message-State: AOJu0YxAftHYZPnDiL27pHX36RRAv18YBSQ5ewWSEyrCw7nv3PAmQ7dG
 UrBM5r39C9afGWUHSjgRW5fNmudp7ssmsLyovkC1IiGm2c3knINlUe73iS5oi3c=
X-Google-Smtp-Source: AGHT+IFuCPUyL+zRFxa1v0tcKCSI3+LoANHXMylFFQW3d9q4jeiaePhHRqSnp/6uBUz1C9TF9/I1Rg==
X-Received: by 2002:a05:6512:31d2:b0:52c:e3bd:c708 with SMTP id
 2adb3069b0e04-52ce3bdc757mr436609e87.10.1719121219460; 
 Sat, 22 Jun 2024 22:40:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bcd32sm659696e87.65.2024.06.22.22.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:40:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 08:40:12 +0300
Subject: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3yTmp3Sv/j769E4v8X1gSQqZKrDdcZgB/xdp5LC/6x4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7VBENNTf284nWcQLh19OCMqf5IH1l5DhmmVZ
 yDrtAtWhEiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZne1QQAKCRCLPIo+Aiko
 1U8hB/9SdkyyQg2swP/hpd6sqcRQmN44V1uzQeeeLir0Z86HYX6cpVuiZZKhFO2c2rLP45ryy/i
 A5Xl2EAGhcZ3l1uEjXG7Jflm09qnZQwT0zDkgtgjIAaVd+8IeqKyPhtKCY52+Qta66/wCZitg5y
 Gtz+GGfdKbUtakJIgpe77KynIp8mIS0/lL28/oNnnCidrAF9/PWCxnYcv4TPkDXJftSF6c9pder
 hzJPbmXZfku9q60/SPFe4SZ9AIucQuYC7UiFXcvvCEDszVItrKJfcgUpvH0xcHuEdhHxu28LQRd
 op8kCK69QUiDJfHyliwKoF9Q9TY/SexvsU6snm1xFS5RBrg2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if there is a
the drm_bridge_connector has bridge_hdmi.

Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
call this function from HDMI bridges, there is is no function that
corresponds to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
 drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
 include/drm/display/drm_hdmi_state_helper.h     |  3 ---
 include/drm/drm_atomic_state_helper.h           |  2 ++
 5 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2dab3ad8ce64..67f39857b0b4 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,27 +8,6 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-/**
- * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
- * @connector: DRM connector
- * @new_conn_state: connector state to reset
- *
- * Initializes all HDMI resources from a @drm_connector_state without
- * actually allocating it. This is useful for HDMI drivers, in
- * combination with __drm_atomic_helper_connector_reset() or
- * drm_atomic_helper_connector_reset().
- */
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state)
-{
-	unsigned int max_bpc = connector->max_bpc;
-
-	new_conn_state->max_bpc = max_bpc;
-	new_conn_state->max_requested_bpc = max_bpc;
-	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
-}
-EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
-
 static const struct drm_display_mode *
 connector_state_get_mode(const struct drm_connector_state *conn_state)
 {
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..1518ada81b45 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -478,6 +478,27 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ * @new_conn_state: connector state to reset
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state)
+{
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_conn_state->max_bpc = max_bpc;
+	new_conn_state->max_requested_bpc = max_bpc;
+	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
 /**
  * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0869b663f17e..7ebb35438459 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 285f366cf716..454319b40f17 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,9 +8,6 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state);
-
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb2658..adf300e6b4eb 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -71,6 +71,8 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);

-- 
2.39.2

