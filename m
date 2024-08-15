Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454B9526F7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAF210E396;
	Thu, 15 Aug 2024 00:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="R0I2e83j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C5910E396
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-710d1de6e79so294453b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682071; x=1724286871;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTAqmUB3C74WyCJMJxJLb1pif+r1V9bPB5gyO42OGKo=;
 b=R0I2e83jZzlVK7IIjDGzmxussAhI8w9LuKElEaTFj6SMlY67XyYp0iiiNxNlpbu4JI
 vvLQuBVKYb4BUDy02VUPeeFOfxiRxqGzXF2/b+K7TZC2Wmx2HFHiPTnfVKSXpGlTlD8V
 EhHXhDArmncYfS/fxNbX8azZIVzl06pXZB+II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682071; x=1724286871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTAqmUB3C74WyCJMJxJLb1pif+r1V9bPB5gyO42OGKo=;
 b=hLoNz04JYOJtAh7HPwen/LNgb8wJDolc0XCf5amrEFwbgeArglgJi8vDUETDwW0w0y
 S+swtdsmNX6se+n1lWE7C4berQQMTsgQpN4D4uX6xYVMznRF1EeLIYRvNIlwTurGAD1x
 VWJaN9KUQ5kiPYvUIX68MCEw4cCfFRWvnQjRnzlBOkmqveMM1arckGIF6yTJ7MkhccP0
 XcEoeNNOTjc8xiqkfxqYcOMhBep0dbbqHOQMrgGB8sj9G55zVmkfFlaSqXvLPXKYtQJs
 g6Ru1RAR/CVvpp/M9uA6+UeBAkX7P5s3jzVdfMtysOzxo4vMpeyDh7h/21iYwAeqgKON
 Hb2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpRijxUF8xy5mKDBnV0SsID2LYWYL0ujAtKLFZvMLkKtWXjUkDI330tFuQhzezcPTlI1/tTczWNc7/4L5fEjhDE4CuYYSbTGCbKUD7ba+J
X-Gm-Message-State: AOJu0YyFGNWhVbf9FvlkJP1zpJnW42Xx6GCghZCxdEaSarVMf/5v2Zzz
 ybIYxucUuZzWxwDoESKQ7hG1WczQQLeZj/sFWRBOuCKgkog2yFnY/MAgJbq64g==
X-Google-Smtp-Source: AGHT+IFi1sUOZeFN/sl/EmCy6pJtHVwtGc94+AhjMPhFgSZ7/Ovt9ABuwlS25ptPfHZRf5MNIAy+Kw==
X-Received: by 2002:a05:6a21:2d0a:b0:1c6:fa3a:c798 with SMTP id
 adf61e73a8af0-1c8eaee91ecmr5582828637.32.1723682071315; 
 Wed, 14 Aug 2024 17:34:31 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7127af1999fsm151333b3a.169.2024.08.14.17.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:30 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 05/11] drm/bridge: dp_typec: Add "no-hpd" support
Date: Wed, 14 Aug 2024 17:34:10 -0700
Message-ID: <20240815003417.1175506-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
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

Some EC firmwares on Trogdor/Strongbad boards don't properly indicate
the state of the DP HPD level on a type-c port. The EC only indicates
that DP mode is entered or exited for a type-c port. The HPD state is
expressed to the DP controller via a pin on the AP that the EC drives
high or low when the type-c port partner (i.e. monitor) asserts or
deasserts HPD.

TL;DR: These devices don't support HPD signaling from the type-c code
paths.

Add support for HPD coming from somewhere else in the bridge chain.
Callers can set the struct drm_dp_typec_bridge_desc::no_hpd member to
indicate that HPD shouldn't be signaled from this bridge.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 12 +++++++++++-
 include/drm/bridge/aux-bridge.h         |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 79652d27db40..a5a434b7d5ec 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -20,6 +20,7 @@ static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 struct drm_aux_hpd_bridge_data {
 	struct drm_bridge bridge;
 	struct device *dev;
+	bool no_hpd;
 };
 
 enum dp_lane {
@@ -54,6 +55,7 @@ to_drm_dp_typec_bridge_data(struct drm_bridge *bridge)
 struct drm_dp_typec_bridge_dev {
 	struct auxiliary_device adev;
 	size_t max_lanes;
+	bool no_hpd;
 };
 
 static inline struct drm_dp_typec_bridge_dev *
@@ -232,6 +234,7 @@ devm_drm_dp_typec_bridge_alloc(struct device *parent, const struct drm_dp_typec_
 	adev->dev.release = drm_dp_typec_bridge_release;
 	adev->dev.platform_data = of_node_get(desc->of_node);
 	typec_bridge_dev->max_lanes = desc->num_dp_lanes;
+	typec_bridge_dev->no_hpd = desc->no_hpd;
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -278,6 +281,8 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 
 	if (!data)
 		return;
+	if (data->no_hpd)
+		return;
 
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
@@ -467,6 +472,7 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 {
 	struct device *dev = &auxdev->dev;
 	struct drm_aux_hpd_bridge_data *hpd_data;
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
 	struct drm_dp_typec_bridge_data *typec_data;
 	struct drm_bridge *bridge;
 	u8 dp_lanes[] = { DP_ML0, DP_ML1, DP_ML2, DP_ML3 };
@@ -477,6 +483,7 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 			return -ENOMEM;
 		bridge = &hpd_data->bridge;
 		bridge->funcs = &drm_aux_hpd_bridge_funcs;
+		bridge->ops = DRM_BRIDGE_OP_HPD;
 	} else if (id->driver_data == DRM_AUX_TYPEC_BRIDGE) {
 		typec_data = devm_kzalloc(dev, sizeof(*typec_data), GFP_KERNEL);
 		if (!typec_data)
@@ -484,6 +491,10 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 		hpd_data = &typec_data->hpd_bridge;
 		bridge = &hpd_data->bridge;
 		bridge->funcs = &drm_dp_typec_bridge_funcs;
+		typec_bridge_dev = to_drm_dp_typec_bridge_dev(dev);
+		if (!typec_bridge_dev->no_hpd)
+			bridge->ops = DRM_BRIDGE_OP_HPD;
+		hpd_data->no_hpd = typec_bridge_dev->no_hpd;
 		memcpy(typec_data->dp_lanes, dp_lanes, sizeof(typec_data->dp_lanes));
 	} else {
 		return -ENODEV;
@@ -491,7 +502,6 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 
 	hpd_data->dev = dev;
 	bridge->of_node = dev_get_platdata(dev);
-	bridge->ops = DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	auxiliary_set_drvdata(auxdev, hpd_data);
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 258b87c93623..13f5e98b4d31 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -28,10 +28,12 @@ struct drm_dp_typec_bridge_dev;
  * struct drm_dp_typec_bridge_desc - drm_dp_typec_bridge descriptor
  * @of_node: device node pointer corresponding to this bridge instance
  * @num_dp_lanes: number of input DP lanes possible (1, 2 or 4)
+ * @no_hpd: true if this bridge can't signal HPD state with drm_dp_typec_bridge_notify()
  */
 struct drm_dp_typec_bridge_desc {
 	struct device_node *of_node;
 	size_t num_dp_lanes;
+	bool no_hpd;
 };
 
 enum usb_ss_lane {
-- 
https://chromeos.dev

