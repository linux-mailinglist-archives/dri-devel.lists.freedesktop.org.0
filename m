Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DA7ACBA0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCB910E13B;
	Sun, 24 Sep 2023 19:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2CE10E148
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c123eed8b2so83440671fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583580; x=1696188380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8y8h3EEz9VirQFhjmojPuvqBkQuqu/oUUWDuJnG4W+c=;
 b=J1Spl3Tk1Wfh2VSJijxSQ3dmTGtSH9e8atY9jzfHq4qyrfJ9vCrsGIYqLdlk8qyq9s
 gh+jzUXViqz8Hz6zPijD6Rbjfnfl4K9rHjinn21XhD0TMtMyS3s4qPcWr8ktbdNncGtL
 psc4xmPuH7sUggyhfZle+0d9umYsHhD7DJndTIjv9eru5fQbWSPsIKn7KXLKKikG3Una
 oB8z0qO4iH68S9NiK3TMPBVturqo5PAaRueNPM7lzz6C1Akee93rIpvQapkDH/OWzcHz
 bwFlmx531NoswmnIExpNmlTAvTbE47l7MEUZ5BrS5XqtzwkzSBhIwRH+7oL86evWwLaR
 B+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583580; x=1696188380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8y8h3EEz9VirQFhjmojPuvqBkQuqu/oUUWDuJnG4W+c=;
 b=B8fMTbK0WXGW95L2xme2/LMoK2O3F0fz+fJ9vXp2OE5NPJwgfr0o8Y22Dn8eRYqsCH
 +N23GPNRAynG4LlywGSHCc1XQ5uqTKgr2IjBJC7eyvo6YPF2Ak5FojRBiDWnPFFfcNp8
 zEQceteqA7GMhpshB+XSO/EZsvj2A7axoEOi7gY3+DvbvlmWkqn43b/W6IISNQUyD9vu
 4RhYXzTgTZbfOJwfUqGJstVDxhsOsQja3TrjFA0mhNJTCJqQCGTuXD5NpsOagEIQ/ERZ
 NRI7o5U2eN6vJpNhIuKysg9OFDpW8BaYEq1vQku9szaG2WI9TXDl4KvSM8GgLe6DGE3v
 o+CQ==
X-Gm-Message-State: AOJu0Yx7cfo5Jvd8Cm0p0/aayCKScjjjArW0Ecb5TsO9Acd6sxQ2JsMc
 P5yFByjouZTKhsZVWJpZhHA=
X-Google-Smtp-Source: AGHT+IGnY2zymlYXEbyV+5gsOUvzTU+WsC5ThrC5P4hO3P9yxgQq4BLXWnYLwnhf4fRNeIa24G6f0Q==
X-Received: by 2002:a2e:2417:0:b0:2c0:2ab7:9ab5 with SMTP id
 k23-20020a2e2417000000b002c02ab79ab5mr4174912ljk.12.1695583579523; 
 Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 7/7] drm/sun4i: dw-hdmi: check for phy device first
Date: Sun, 24 Sep 2023 21:26:04 +0200
Message-ID: <20230924192604.3262187-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's check for phy device first. Since it uses much of the same clocks
and resets it also lowers amount of possible deferred probes.

While at it, don't report error for deferred phy probe.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 35 +++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 41f815a1faec..c1becd964326 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -173,11 +173,24 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct device_node *phy_node;
 	struct drm_encoder *encoder;
 	struct sun8i_dw_hdmi *hdmi;
+	struct sun8i_hdmi_phy *phy;
 	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
+	if (!phy_node) {
+		dev_err(dev, "Can't find PHY phandle\n");
+		return -EINVAL;
+	}
+
+	phy = sun8i_hdmi_phy_get(phy_node);
+	of_node_put(phy_node);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "Couldn't get the HDMI PHY\n");
+
 	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
@@ -185,6 +198,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	plat_data = &hdmi->plat_data;
 	hdmi->dev = &pdev->dev;
 	encoder = &hdmi->encoder;
+	hdmi->phy = phy;
 
 	hdmi->quirks = of_device_get_match_data(dev);
 
@@ -232,22 +246,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_assert_ctrl_reset;
 	}
 
-	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
-	if (!phy_node) {
-		dev_err(dev, "Can't found PHY phandle\n");
-		ret = -EINVAL;
-		goto err_disable_clk_tmds;
-	}
-
-	hdmi->phy = sun8i_hdmi_phy_get(phy_node);
-	of_node_put(phy_node);
-	if (IS_ERR(hdmi->phy)) {
-		dev_err(dev, "Couldn't get the HDMI PHY\n");
-		ret = PTR_ERR(hdmi->phy);
-		goto err_disable_clk_tmds;
-	}
-
-	ret = sun8i_hdmi_phy_init(hdmi->phy);
+	ret = sun8i_hdmi_phy_init(phy);
 	if (ret)
 		goto err_disable_clk_tmds;
 
@@ -259,7 +258,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
 	plat_data->output_port = 1;
-	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
+	sun8i_hdmi_phy_set_ops(phy, plat_data);
 
 	platform_set_drvdata(pdev, hdmi);
 
@@ -310,7 +309,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	drm_bridge_remove(&hdmi->enc_bridge);
 	dw_hdmi_remove(hdmi->hdmi);
 err_deinit_phy:
-	sun8i_hdmi_phy_deinit(hdmi->phy);
+	sun8i_hdmi_phy_deinit(phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
-- 
2.42.0

