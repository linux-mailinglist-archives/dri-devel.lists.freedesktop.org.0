Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3365F219C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 08:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1F10E235;
	Sun,  2 Oct 2022 06:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF3F10E0E5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 06:45:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so16498544ejb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gtEJxbrwC/UQVf48sJy2NN3O3k5LpfsDQAoSkyusABE=;
 b=omdSgHFqEeX0hz1EWZZH2RbIMxysW7X/8zVjSEW3VJR+LCkBpPE1odjPVGPcB0lmXL
 5PJDNgHjB0mFXedPPBGByQdvcpVTTIQqvLpluO80BG3siD9Ih2PB8ZIkB6EHqPAuoGBZ
 BMd1fJ7hXzIUUDLgy6PF9mV9Ss/a4NsufzCvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gtEJxbrwC/UQVf48sJy2NN3O3k5LpfsDQAoSkyusABE=;
 b=vHztqg+7Xudz+jCX210fCVe+5gTuMi+VgtPm0/svclyex40HCVWMG7HXIj85jdeyO/
 nJ5D2CpXni17vXEav1zPKyI3hwYV8pK0JWKQf10WH1feIP1NK/b5qIYYUmxzX+9Ck3St
 ZGru5njIPaXjIE4bNXKavn+BodOD88Hqoat+lFdlvQRdHmLmufUFPLp8L45tn+aj4EAt
 6ev69UzyKdnvPRjajfoycnHFdODszyIPZOmMqBrT1LzQnKgGMch+17RXfC3ObElhPfyl
 /znnYrY/yI+InwLh8LsuvPO2ORkLbAY82WP48fDmAby82qI5HJ9htFGHsfS76U3sRXg0
 MVUw==
X-Gm-Message-State: ACrzQf0070M8PAxqeNvK7SDFFMgmGlcagzh6JJmLqorEL5eOOZw17880
 YJYt1fXorFCYY7x9oh6VdC5o7g==
X-Google-Smtp-Source: AMsMyM4nEOYig64C0tZ3Z7ad76GYPRbuqYMOi4q6qDnpwgFsU96JrriTtL5fgxNnqfSki698dg6/Lw==
X-Received: by 2002:a17:907:3205:b0:770:8554:c4ee with SMTP id
 xg5-20020a170907320500b007708554c4eemr11785485ejb.39.1664693150522; 
 Sat, 01 Oct 2022 23:45:50 -0700 (PDT)
Received: from panicking.. ([109.52.206.103]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0077f5e96129fsm3569894ejw.158.2022.10.01.23.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 23:45:50 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 4/4] drm/rockchip: rgb: Add dphy connection to rgb output
Date: Sun,  2 Oct 2022 08:45:40 +0200
Message-Id: <20221002064540.2500257-5-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002064540.2500257-1-michael@amarulasolutions.com>
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dispite the commit 1f0f015151727, the rgb output has an option
to allow to sent the output pin using the dsi/lvds/ttl logic.
The only way to do and stay on the same design is let the
rockchip_rgb block to grab the handle if it is present and
enable it. The present of this handle depends on dts configuration

I have a full working example with an hardware with mixed lines
on direct logic and using the phy, with the follow dts example:

panel: panel {
	compatible = "panel-dpi";
	...
	panel-timing {
		clock-frequency = <30000000>;
		...
	};

	port {
		panel_rgb_in: endpoint {
			remote-endpoint = <&vopb_out_rgb>;
		};
	};
};

&vopb_out {
        vopb_out_rgb: endpoint@2 {
                reg = <2>;
                remote-endpoint = <&panel_rgb_in>;
        };
};

&vopb {
        status = "okay";
        pinctrl-names = "default", "sleep";
        pinctrl-0 = <&lcdc_rgb_pins>;
        pinctrl-1 = <&lcdc_sleep_pins>;

        phys = <&dsi_dphy>;
        phy-names = "dphy";
};

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 75eb7cca3d82..c725774a0f40 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -8,6 +8,7 @@
 #include <linux/component.h>
 #include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -30,6 +31,7 @@ struct rockchip_rgb {
 	struct drm_bridge *bridge;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
+	struct phy *dphy;
 	int output_mode;
 };
 
@@ -168,6 +170,22 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		goto err_free_connector;
 	}
 
+	/* PHY */
+	rgb->dphy = devm_phy_get(dev, "dphy");
+	if (!IS_ERR(rgb->dphy)) {
+		ret = phy_init(rgb->dphy);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = phy_set_mode(rgb->dphy, PHY_MODE_TTL);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = phy_power_on(rgb->dphy);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return rgb;
 
 err_free_connector:
-- 
2.34.1

