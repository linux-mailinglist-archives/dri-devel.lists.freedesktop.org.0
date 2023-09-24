Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A77ACBA1
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C2D10E13D;
	Sun, 24 Sep 2023 19:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6410E143
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a9d82d73f9so614701566b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583578; x=1696188378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyCnYDXrBkQd8nc6ex8m6+Z4ml6K8C/rEJGtjuolnss=;
 b=JAJQY/JtIHgjjpqJZe0k+NAcVWudrjlTUmOU+x8FWJHIhAxFZsEpFECLeksH1AzWQp
 1wUFkaH2j6DGaXTEWajSvXi8ArXiBGArnMGGcNjyjmE0U8VDD2M67iT6/MedgLerYA51
 7KZ7wCO5tQIZUUIVBdsTIJ32m9+yqI/G3RNdJr7n5jLQEIXIX5fvTjY7Y+840XznQPAA
 5MR7KpfJEXOOkUihIrCEivFDtTOgqT283kJ2gG2KJxL86CQvTZF45BSTqrRVKiBT1TAD
 Sb0uY+kjUXbyyqYpNnfoqpnC5nblrxNtHuQl+G/xLboFjVBrjyFeMt+Xl5DQbH06Ei2N
 9jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583578; x=1696188378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyCnYDXrBkQd8nc6ex8m6+Z4ml6K8C/rEJGtjuolnss=;
 b=Ns8650sFvnyC4zcPf5gTbsVT+mwNpEcCoY60fi9pnSF3CcL28zDtFO1FD8GvjTPlEc
 BqQUYBT3HcgddMRoUA6LA3S00gLq2fKnGanL+65VZJ32MHDpNa5RUtRGuMe8up8duu9k
 5Gymmd99c9rueEUpCPeoNmWDX0RnGr6AuWhhblab4+7mOn/Qmd3ka6reg4EX9/3DfL/a
 nIiSI9fNjzXk59HYdeoARICo17U7cm+gOUXCSbDvOKRaKRT+cY6jVn5aMj1PApDmtfHb
 86tMQFxPgckJkMuyr/9TFlKBZ7XKsAhHJikgwunf6BDTgSzd10IzvNz7sM603t4JW2gt
 se/Q==
X-Gm-Message-State: AOJu0YwTERRSTw9KtBW09XosAmLswxvwLiEp740KTeNcQ0TM7WWPCESu
 1OZy8gZtwemM7VoHb6vNKyA=
X-Google-Smtp-Source: AGHT+IHCd1BgUV+vVYd3ZH8172gAFJIE1DUEWCbKCJthb4PpjhafqLcGbcOPCGbl9m5xDtLEBPKB7g==
X-Received: by 2002:a17:907:7715:b0:9ae:6a8b:f8aa with SMTP id
 kw21-20020a170907771500b009ae6a8bf8aamr3983876ejc.26.1695583578522; 
 Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 6/7] drm/sun4i: dw-hdmi: Make sun8i_hdmi_phy_get() more
 intuitive
Date: Sun, 24 Sep 2023 21:26:03 +0200
Message-ID: <20230924192604.3262187-7-jernej.skrabec@gmail.com>
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

Let's make sun8i_hdmi_phy_get() to behave more like other kernel
functions and return phy pointer instead of setting field in struct.
This also makes function more universal.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 10 ++++------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index d93e8ff71aae..41f815a1faec 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -239,10 +239,11 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 	}
 
-	ret = sun8i_hdmi_phy_get(hdmi, phy_node);
+	hdmi->phy = sun8i_hdmi_phy_get(phy_node);
 	of_node_put(phy_node);
-	if (ret) {
+	if (IS_ERR(hdmi->phy)) {
 		dev_err(dev, "Couldn't get the HDMI PHY\n");
+		ret = PTR_ERR(hdmi->phy);
 		goto err_disable_clk_tmds;
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 21e010deeb48..748b6a4d9cdd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -200,7 +200,7 @@ encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
 	return container_of(encoder, struct sun8i_dw_hdmi, encoder);
 }
 
-int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
+struct sun8i_hdmi_phy *sun8i_hdmi_phy_get(struct device_node *node);
 
 int sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
 void sun8i_hdmi_phy_deinit(struct sun8i_hdmi_phy *phy);
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index f917a979e4a4..1c9bdefed35e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -650,25 +650,23 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{ /* sentinel */ }
 };
 
-int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
+struct sun8i_hdmi_phy *sun8i_hdmi_phy_get(struct device_node *node)
 {
 	struct platform_device *pdev = of_find_device_by_node(node);
 	struct sun8i_hdmi_phy *phy;
 
 	if (!pdev)
-		return -EPROBE_DEFER;
+		return ERR_PTR(-EPROBE_DEFER);
 
 	phy = platform_get_drvdata(pdev);
 	if (!phy) {
 		put_device(&pdev->dev);
-		return -EPROBE_DEFER;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	hdmi->phy = phy;
-
 	put_device(&pdev->dev);
 
-	return 0;
+	return phy;
 }
 
 static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
-- 
2.42.0

