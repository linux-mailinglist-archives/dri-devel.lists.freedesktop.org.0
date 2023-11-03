Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A57E0BCE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 00:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755F610EB00;
	Fri,  3 Nov 2023 23:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD43210EAF8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 23:04:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507c5249d55so3366792e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699052658; x=1699657458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbnyjLnhACt82EK09moKdpQ9JIR1p/S627vZZk1uJi8=;
 b=cLSZGITa7v8M9B1ENP69GuKIF1T3pVZKWzWtkZKjGtcLhklrvFIrw2J4Gs36asUr8Q
 xLC4mGM4M16vkaCciVC5PkgxSWOfYbRyxKgGs+t2bL0xEu6MuZseXqZEPil0hmL6M/oT
 Ey59nfxGltKkfsjvs4XSsVekj/1l8/DMq/hrTx2GkujYMVu6CKknpOa2miv7/4ldwNb8
 rbMyX2X7NhPmQPXgj9QJHf8UKqNTqol1DIlWQ9fkFBti2kmNcTSZjpf2dr6j8zwnnabP
 /jxLs3kYmMsPZbiYHxX+RBQ/ur1Y7AJjnfk9AstbxLMELPW54BJoX+kdxqyFpJ1LohXA
 yQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699052658; x=1699657458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbnyjLnhACt82EK09moKdpQ9JIR1p/S627vZZk1uJi8=;
 b=Ztn2qMFHAkzkWZiKh46HNlwfadDeY9NJx9h3BJxhRHB3whyo0ZTlE2i+Z5a8Doxou9
 Oo7+iUuzs5DXEeqbHPJJru7eiZTPD5MIxC/HQxTpZxnfIaH5SwXVWPuIPEj2Ks/2y+Bg
 Dau8luaFPRDTTptVOYsIY4Ux+6mINGdOegclfi06MP4gqPQVsFPHwZImytZl3eT8xek1
 i7c8amLgObsxCYXfvY1muWBBQi6hBHMBgBDbqTkTKt0asp14HBDlvtS5wxT5cx5rxCod
 hrRcWt+qMwL39bPltxeH1nHwzJxwu6NHV1fAJ/9dhevrewUL4uRm8fX0i0BRRrUxgm3z
 J4Fg==
X-Gm-Message-State: AOJu0YyJL0a4fchRqk5X7/1qPUBGAwjQQkbQtsTOaMaH8z18avBPRohK
 VgLBAbE2bNo2sO0KVzIHiWx0Ug==
X-Google-Smtp-Source: AGHT+IFqLlK/VkY8KRBbE5SnY0oiABjf4RxnnYmH4Ttg9LlJ/9dJpbi7xVLHM1tu4o89tmLTxoXKkA==
X-Received: by 2002:ac2:47fb:0:b0:507:b8e1:76f0 with SMTP id
 b27-20020ac247fb000000b00507b8e176f0mr15445608lfp.22.1699052657967; 
 Fri, 03 Nov 2023 16:04:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 16:04:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 3/6] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
Date: Sat,  4 Nov 2023 01:03:06 +0200
Message-ID: <20231103230414.1483428-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using the new DRM_AUX_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/mux/Kconfig      |  2 +-
 drivers/usb/typec/mux/nb7vpq904m.c | 44 ++----------------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 65da61150ba7..07395161dd30 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -40,7 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select REGMAP_I2C
 	help
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index cda206cf0c38..b17826713753 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -11,7 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/bitfield.h>
 #include <linux/of_graph.h>
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
@@ -70,8 +70,6 @@ struct nb7vpq904m {
 	bool swap_data_lanes;
 	struct typec_switch *typec_switch;
 
-	struct drm_bridge bridge;
-
 	struct mutex lock; /* protect non-concurrent retimer & switch */
 
 	enum typec_orientation orientation;
@@ -297,44 +295,6 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
-static int nb7vpq904m_bridge_attach(struct drm_bridge *bridge,
-				    enum drm_bridge_attach_flags flags)
-{
-	struct nb7vpq904m *nb7 = container_of(bridge, struct nb7vpq904m, bridge);
-	struct drm_bridge *next_bridge;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	next_bridge = devm_drm_of_get_bridge(&nb7->client->dev, nb7->client->dev.of_node, 0, 0);
-	if (IS_ERR(next_bridge)) {
-		dev_err(&nb7->client->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
-		return PTR_ERR(next_bridge);
-	}
-
-	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
-				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-}
-
-static const struct drm_bridge_funcs nb7vpq904m_bridge_funcs = {
-	.attach	= nb7vpq904m_bridge_attach,
-};
-
-static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
-{
-	nb7->bridge.funcs = &nb7vpq904m_bridge_funcs;
-	nb7->bridge.of_node = nb7->client->dev.of_node;
-
-	return devm_drm_bridge_add(&nb7->client->dev, &nb7->bridge);
-}
-#else
-static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
-{
-	return 0;
-}
-#endif
-
 static const struct regmap_config nb7_regmap = {
 	.max_register = 0x1f,
 	.reg_bits = 8,
@@ -461,7 +421,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
 
 	gpiod_set_value(nb7->enable_gpio, 1);
 
-	ret = nb7vpq904m_register_bridge(nb7);
+	ret = drm_aux_bridge_register(dev);
 	if (ret)
 		goto err_disable_gpio;
 
-- 
2.42.0

