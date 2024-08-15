Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E339526FE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE63510E3AB;
	Thu, 15 Aug 2024 00:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VJzn/A9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE5510E3A4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-712603f7ba5so311230b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682081; x=1724286881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBspZU3HeL7PY6QZuDg6iQx5V3y6UFV5ZGsLfhqF10c=;
 b=VJzn/A9vEiFfivy7EzYmqbOx9ga4U6N1w3EvAgukF0wOOIOy5gH94ytCPmU5kcO1CY
 J+KpF8dIGC7cpImqoZidYJrZHMHYBcTiSPoAdyMlIxLvqq71iK+ne0U960z9xMhXLU6X
 olnTHM/4x1Sexy2q4JOpLpvujGWWD/SyDKuJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682081; x=1724286881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBspZU3HeL7PY6QZuDg6iQx5V3y6UFV5ZGsLfhqF10c=;
 b=o0vauh8/zLIoKAFje+sUShWCnt6Tboyfy7zNXkdmiDfSVHam+PAvm2LyC/vatC7ayP
 ZCZvnlZRFMCysEesXJ1UFzN135SvyHQpnglTOspXtSogdGuncO9lti2r0mW2oymIdSJK
 AOBxhzYd538xBYzwGkBkgM4UEhGaQEXw6/daUv4AESbw87U8RKu8r5oQ3J5YEP83QKQs
 53j5B68+oailHfsJ4voWfetT97Dx08PugT2aJiilW/BuZmhaY6gzWIZERL0xS99V3Jxd
 tLaWs993wIMR5/NWWmGHSvaRNQ/yK7XFDKLZGDe5Fz//w/5eTurDTqqD+ycDM8rVoWW9
 DpOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMatQTjZ9tjI31phO4y3RMUsLLOFzguc9PaygX3t2cYP9pY63txAS3HLV0paHWp47SF+hAxIJ+jezllFc7BVp1JhYBi18Ut7dFhsxO+OzT
X-Gm-Message-State: AOJu0Yx6Ekk7VgbtBI07iy4J3phJ/ZzFTOUxEOctsHlRmO1HNOsRJP13
 xxow8IkhL3ci3hfwTO1dH8vNdLLhNB51tk/AAYoIY/wYXKY+H/zwztyJCekyJg==
X-Google-Smtp-Source: AGHT+IF3toalk+6TfBGNRbLO8JKuCUY5aMyE+LAw0Xw9EDSvJ2wZkjR8HAHNKQxh/Te6Kdy5uE3aKw==
X-Received: by 2002:a05:6a00:3c84:b0:70d:1b17:3c5e with SMTP id
 d2e1a72fcca58-712670e8640mr6076731b3a.6.1723682081340; 
 Wed, 14 Aug 2024 17:34:41 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7127ae11b3csm157292b3a.71.2024.08.14.17.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:40 -0700 (PDT)
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
Subject: [PATCH v2 10/11] platform/chrome: cros_ec_typec: Support DP
 orientation
Date: Wed, 14 Aug 2024 17:34:15 -0700
Message-ID: <20240815003417.1175506-11-swboyd@chromium.org>
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

Handle orientation for the type-c port when the DT node has the
'orientation' property. The 'orientation' property is present when the
DisplayPort lanes are directly wired to the usb-c-connector and the
board design relies on the DP lanes to be remapped by software. The
property wouldn't be present if, for example, the EC controls a port
mapper part that flips the DP lanes for the port orientation.

Pass the port orientation to drm_dp_typec_bridge_assign_pins() when the
DT property is present so that the previous drm_bridge in the bridge
chain can remap the DP lanes to the right usb-c-connector SuperSpeed
pins for the orientation.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index fa7f7efb9d3f..9b54b3288f5f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -28,6 +28,7 @@ struct cros_typec_dp_bridge {
 	struct cros_typec_data *typec_data;
 	struct drm_dp_typec_bridge_dev *dev;
 	struct cros_typec_port *active_port;
+	bool orientation;
 };
 
 #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
@@ -449,13 +450,15 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	struct device *dev = typec->dev;
 	struct cros_typec_dp_bridge *dp_bridge;
 	struct fwnode_handle *ep __free(fwnode_handle);
+	struct fwnode_handle *devnode;
 	struct drm_dp_typec_bridge_dev *dp_dev;
 	int num_lanes;
 	struct drm_dp_typec_bridge_desc desc = {
 		.of_node = dev->of_node,
 	};
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	devnode = dev_fwnode(dev);
+	ep = fwnode_graph_get_endpoint_by_id(devnode, 0, 0, 0);
 	if (!ep) {
 		/* There isn't a DP input endpoint. Ignore. */
 		return 0;
@@ -467,6 +470,8 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	typec->dp_bridge = dp_bridge;
 	dp_bridge->typec_data = typec;
 
+	dp_bridge->orientation = fwnode_property_read_bool(devnode, "orientation");
+
 	num_lanes = fwnode_property_count_u32(ep, "data-lanes");
 	if (num_lanes < 0)
 		num_lanes = 4;
@@ -582,6 +587,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	u32 cable_tbt_vdo;
 	u32 cable_dp_vdo;
 	int ret;
+	enum typec_orientation orientation;
 	bool hpd_asserted = port->mux_flags & USB_PD_MUX_HPD_LVL;
 
 	if (typec->pd_ctrl_ver < 2) {
@@ -622,7 +628,13 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	}
 
 	if (dp_bridge && dp_bridge->active_port == port) {
-		ret = drm_dp_typec_bridge_assign_pins(dp_bridge->dev, dp_data.conf, 0,
+		orientation = TYPEC_ORIENTATION_NORMAL;
+		if (dp_bridge->orientation &&
+		    port->mux_flags & USB_PD_MUX_POLARITY_INVERTED)
+			orientation = TYPEC_ORIENTATION_REVERSE;
+
+		ret = drm_dp_typec_bridge_assign_pins(dp_bridge->dev, dp_data.conf,
+						      orientation,
 						      port->lane_mapping);
 		if (ret)
 			return ret;
-- 
https://chromeos.dev

