Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C08790E51
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3010E239;
	Sun,  3 Sep 2023 21:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E210E21A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1471687e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777315; x=1694382115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxzYLYfsMsF6kZIITXju1taC/sMkbxWNFfavaK+QQhU=;
 b=b90yBlRd4yXafLAjQ91D1az30fDLrfUbmaDjs12oYAJxoxWTuniV3YjnvuAr5ZIJEl
 BlBEEza2c2G2GfB4ZvoBRoXTaM2YmO1BBydWcAJZDyfR3LJK7pWQiGBNuhxhZDousQpL
 eLS0cHgIr5PLNG9tdEck1cUiZurb0OXO34ltiFeqgq/F7Gb9ZaW2utTyePLZFCLJPl2i
 /6C22Zl3EqP/5Yb5D9cQ8bz1MpppMtzA5DruQIpb5+42cykl4urAfbstOeekyg5VySZy
 lAMqGa4fLdOLdnxItUYYqrVUGa+8qSVaIfrDxopOMbik0dlDGoh+3P81qV6Dk7qP3BUg
 +k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777315; x=1694382115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxzYLYfsMsF6kZIITXju1taC/sMkbxWNFfavaK+QQhU=;
 b=BEI4Nmf2N2+hBjSmTsiOti8jxUH81Fm1O9vbLGswPw3mgSbNQZf0KkjCgEzq50G8vK
 aiWPUGqDPXTM8FBHFFefyjqUj5Vxu7tHHtPAFH8usFrTQnzF9DhRThu2e3p9etnKkKOK
 dgNU7zoj5W2TycSBa5Ez46HgZCU68VDhHuSoEKeWoqcqIa/6RhkH2WGrNloHv9MchnEw
 9aGlGWRHpOPxBCHt7ITWjFQTI5zk4StlDXZH3La6ME1w4OcHaEzAXb26gW7WNF6RdjI3
 w18hmC2gCY3GMJBUPtv3i8wdu+oga0+Kc6sIgB1TvvU7fVmlNTNisoOtYytx3QmF6ks0
 C33w==
X-Gm-Message-State: AOJu0Yw6EmjsCpuhHUwXL093vd93pwnVRUu4ARJmklY63L5CPObrDapb
 DU1yGqg+VE8B//2ibY/8fGFM5Q==
X-Google-Smtp-Source: AGHT+IHkhutnflS0UUIMoJstZXZDY/ceuTUjBBh2pmrIlmKpCCqxCMZjLAzGe9MmdoJHda/q0FEUHw==
X-Received: by 2002:a19:4f4f:0:b0:500:a1e4:fc44 with SMTP id
 a15-20020a194f4f000000b00500a1e4fc44mr4968258lfk.61.1693777315009; 
 Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 05/12] drm/bridge: remove conditionals around
 devicetree pointers
Date: Mon,  4 Sep 2023 00:41:43 +0300
Message-Id: <20230903214150.2877023-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove ifdef CONFIG_OF around the drm_bridge::of_node field. This follow
the correponding change to struct device we had since 2.6.39. Having
conditional around the of_node pointers turns out to make driver code
use ugly #ifdef blocks. Drop the conditionals and remove the #ifdef
blocks from the affected drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c         | 2 --
 drivers/gpu/drm/drm_bridge_connector.c | 2 --
 include/drm/drm_bridge.h               | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..7f41525f7a6e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -302,9 +302,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->panel = panel;
 
 	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
-#ifdef CONFIG_OF
 	panel_bridge->bridge.of_node = panel->dev->of_node;
-#endif
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 008d730e1c2f..ca255609fb08 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -372,11 +372,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
-#ifdef CONFIG_OF
 		if (!drm_bridge_get_next_bridge(bridge) &&
 		    bridge->of_node)
 			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
-#endif
 
 		if (bridge->path)
 			path = bridge->path;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 98e9d76474f4..afa1de791075 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -716,10 +716,8 @@ struct drm_bridge {
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
 	struct list_head chain_node;
-#ifdef CONFIG_OF
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
-#endif
 	/** @list: to keep track of all added bridges */
 	struct list_head list;
 	/**
-- 
2.39.2

