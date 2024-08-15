Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E19526F8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810E010E39B;
	Thu, 15 Aug 2024 00:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A0t8EBgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7F10E396
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:33 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fec34f94abso4559555ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682073; x=1724286873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yiv0xFPMhU7ZUs+XvuB/ZZA+l47REHWpzG575OPKPI=;
 b=A0t8EBgzRcwy2UYQNNm5GV22XXWP7XD2TW3V6JiD6YeF2bdDLvbr463stsKPafRCy/
 gCl+fyFpKwnlXXiB3K+Xu3zcd9qOIJuSygqb1gj1LoUJrfrZ1E+YvremmIoKVPE6wkvi
 iFs8owFckcUN2cbfDroZZ0Hc1MK3D+f12boCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682073; x=1724286873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yiv0xFPMhU7ZUs+XvuB/ZZA+l47REHWpzG575OPKPI=;
 b=bZK0+O39i1zAhadFx/mNhWavWh7FwWDqd9R95n8JMkV/aO1mBt7Ko+G7vX4hEQqXTj
 HFbVl9iXNVtLo4WJpKtfdideUKxBQMws4Kp+KG1gKHpY6zaXoLPlVDozOFcKV4jvWnhk
 HVYcEzF9tszl1LfBTIUpzE+Goda3Yy1GzasfEDmQyJuYEGh5f4lKM6icWSBt5hvUESkJ
 TINnzQi68Sz6GYmHlGEnFZPVGYrnsbG4+N5zaWQE1WbMx8fL0eDgQI+2Nb4V2al24+om
 D0XX4bbmQDIf3Yct180tg+uEB8lUXV1UPKRdrARY1jcvfOtNg1C+Z4bDLQ82gbjBtC43
 80UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCngZWvoyYcDPoVqdx/tLmwlHu+MCmx6fM0PhB6v68o9edZn8VB4VbfrArHHMj70iBQLg8+/+NUPr+Pofl7EEbxLsLGOp/wYqJas5KPTH8
X-Gm-Message-State: AOJu0YxPlGH3R+fM9DGFeGASVSUBoCA6urcLMWJdQ/qcgy64vbPoLP+e
 2r+DJYUmRGVzFy+Y3b6t8AK0aFujqj45VyE+7+j7yq2X8HqmJqM14WAHZh1oxw==
X-Google-Smtp-Source: AGHT+IHJN+4iBjtg5BFHkoM0j1LHWILoEX4QehkqxO/ua5YPwB+wrtI73F9/wcxBEBcJXyMVg84zJg==
X-Received: by 2002:a17:902:7c92:b0:1fc:6b8b:4918 with SMTP id
 d9443c01a7336-201d64b09ddmr38089775ad.41.1723682072985; 
 Wed, 14 Aug 2024 17:34:32 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f03a16b2sm1970445ad.268.2024.08.14.17.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:32 -0700 (PDT)
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
Subject: [PATCH v2 06/11] drm/bridge: dp_typec: Allow users to hook hpd notify
 path
Date: Wed, 14 Aug 2024 17:34:11 -0700
Message-ID: <20240815003417.1175506-7-swboyd@chromium.org>
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

The previous patch added support for no-hpd to drm_dp_typec_bridge code.
Allow users of this bridge to hook the HPD notification path of the
bridge chain so that they can be made aware of the connector status
changing. This helps HPD-less users of the bridge inject the HPD state
into their code by using the connector status as a proxy for HPD being
asserted or deasserted.

In particular, this will help Trogdor/Strongbad boards that need to read
the EC's analog mux which steers the DP signal to one or the other USB
type-c ports to figure out which type-c port has HPD asserted.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 19 +++++++++++++++++++
 include/drm/bridge/aux-bridge.h         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a5a434b7d5ec..32c0171c512c 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -55,6 +55,9 @@ to_drm_dp_typec_bridge_data(struct drm_bridge *bridge)
 struct drm_dp_typec_bridge_dev {
 	struct auxiliary_device adev;
 	size_t max_lanes;
+	void (*hpd_notify)(struct drm_dp_typec_bridge_dev *dev,
+			   void *data, enum drm_connector_status status);
+	void *hpd_data;
 	bool no_hpd;
 };
 
@@ -235,6 +238,8 @@ devm_drm_dp_typec_bridge_alloc(struct device *parent, const struct drm_dp_typec_
 	adev->dev.platform_data = of_node_get(desc->of_node);
 	typec_bridge_dev->max_lanes = desc->num_dp_lanes;
 	typec_bridge_dev->no_hpd = desc->no_hpd;
+	typec_bridge_dev->hpd_notify = desc->hpd_notify;
+	typec_bridge_dev->hpd_data = desc->hpd_data;
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -305,6 +310,19 @@ void drm_dp_typec_bridge_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev
 }
 EXPORT_SYMBOL_GPL(drm_dp_typec_bridge_notify);
 
+static void drm_dp_typec_bridge_hpd_notify(struct drm_bridge *bridge,
+					    enum drm_connector_status status)
+{
+	struct drm_dp_typec_bridge_data *data;
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+
+	data = to_drm_dp_typec_bridge_data(bridge);
+	typec_bridge_dev = to_drm_dp_typec_bridge_dev(data->hpd_bridge.dev);
+
+	if (typec_bridge_dev->hpd_notify)
+		typec_bridge_dev->hpd_notify(typec_bridge_dev, typec_bridge_dev->hpd_data, status);
+}
+
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     enum drm_bridge_attach_flags flags)
 {
@@ -460,6 +478,7 @@ static const struct drm_bridge_funcs drm_dp_typec_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.hpd_notify = drm_dp_typec_bridge_hpd_notify,
 };
 
 enum drm_aux_bridge_type {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 13f5e98b4d31..3229f200f0df 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -28,11 +28,16 @@ struct drm_dp_typec_bridge_dev;
  * struct drm_dp_typec_bridge_desc - drm_dp_typec_bridge descriptor
  * @of_node: device node pointer corresponding to this bridge instance
  * @num_dp_lanes: number of input DP lanes possible (1, 2 or 4)
+ * @hpd_notify: callback for bridge hot plug detect events
+ * @hpd_data: data passed to @hpd_notify callback
  * @no_hpd: true if this bridge can't signal HPD state with drm_dp_typec_bridge_notify()
  */
 struct drm_dp_typec_bridge_desc {
 	struct device_node *of_node;
 	size_t num_dp_lanes;
+	void (*hpd_notify)(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+			   void *data, enum drm_connector_status status);
+	void *hpd_data;
 	bool no_hpd;
 };
 
-- 
https://chromeos.dev

