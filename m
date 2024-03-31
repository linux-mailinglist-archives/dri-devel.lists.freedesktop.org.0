Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA18935E7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD7D10EA5B;
	Sun, 31 Mar 2024 20:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vfM2CNnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0E910EA5B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:45:51 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso4644582e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711917950; x=1712522750; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1twafGTjkCxgep99iHCP909BFtwNP/9s0Y+i/DCt0V4=;
 b=vfM2CNnQGoJDGzKq2UqG95R7Sd4dFIQ4T3PJwktWxLJ3aaS1FHHUMAYAX3HzQiJLB4
 WyYpXMuU28pIjKabsOujhOD7cPcoyNBdqeRiRKpSMoyrIeNzRxQT4vxW2GaYmQd6IJMH
 VAPR5OCwzupvcUw93RNa4E7wVB10COylwtcD3Dc0e4RL83uupu5VMDOElKIBOGQAwTsh
 RH9T/yMRUquIrQAhSJDqO8eGJ/O9oJAq2hzbgGwBZ6dlqVDOQoLLV73U2BZfuN+L0yOG
 QhIechdHyHn+7BIhycZNELH79seezL3HxyXymrjIUCpkK5N0lWjtKBw6Vhtq+wOx3/bH
 UDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711917950; x=1712522750;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1twafGTjkCxgep99iHCP909BFtwNP/9s0Y+i/DCt0V4=;
 b=r+3YCz78qpHeUZ9hVPf6b31bUbFlUcEAI7NuuSQU3x6cwaC0MuO7wlSS6lcn3aYm1F
 4IJUGqyewnSS4u9iwKruiUfQwsU1MMZNjXSLhka+jnIKeEPF/cu1omflAVRWFi+/7qAj
 K4WxeX4CrOZkfLOGROUjM/tK4XmzyggUeeI9X+dZGbQ6U1bpDmwpBjNS/zDcRIZYQV0C
 UCz59DMU+ar8C3m/TMm5DA6W4ZjVVKNYnuqMH+o1t/WQ2lADV3Pe/7cb0uUNkFUc97LJ
 kfOqCT9VbFqFF47iirp5lxQWUnRtBxZyuIChdxu/ZtFntNGxLXfn02GnR1eh9dXeBrBT
 1n9A==
X-Gm-Message-State: AOJu0Yw2w5hyAAbdao3EY0V+vkxANXo/dJQxvC56F4GW11BjNkqa47AT
 zPu4WHJE2AmK0Yp3sYDCvyllG6XNr1BbsM9Zdrf01//gVGH1L3OJWHoSXvUdWJo=
X-Google-Smtp-Source: AGHT+IGlgUpLxGZ4IMDU22PvHtUiUcw9q544xvbLVNB/NIOVdBQC05kVxrUPyAPTwFbgqpUnP6n0mg==
X-Received: by 2002:a05:6512:2395:b0:516:a148:2f2 with SMTP id
 c21-20020a056512239500b00516a14802f2mr3343912lfv.38.1711917949956; 
 Sun, 31 Mar 2024 13:45:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x21-20020a056512047500b00515cf449059sm907445lfd.166.2024.03.31.13.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:45:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:45:48 +0300
Subject: [PATCH v2] drm/bridge: adv7511: make it honour next bridge in DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHvLCWYC/32NSw7CMAxEr1J5TVCcNvxW3AN1kRC3tYQS5FRRU
 dW7E3oAlm8082aFTMKU4dasIFQ4c4oVzKGB5+TiSIpDZTDadLrVV+VCOVtEFWmZlRcOtYI6XLw
 nbbuOoC7fQgMvu/XRV544z0k++0nBX/rfV1ChCuiCNYaGk2nvL45O0jHJCP22bV+Hzav+twAAA
 A==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WxrAGCcX9y1DQjbk7j8vNeh8QM9ep0NwfvNj5+enTf0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxrn6do86d0p16N2qpopXnc5PcnV94P2+5/VXR+jtq/ep
 Sz4X92mk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT8fjJ/j/69wF9i7UnthZX
 ORmXdDguv5Em8enOwsneDRms5TUx90TvZS3b72olc/XTc2cTkZ6eaeHVlXqsRzbcnvhT935W1aI
 1GoLZld5KLPyRQZl7kzMYJfx9uXP//RGQazogdvmmU9OHqRveOl2YkRXoorBmz64yzh/cmz0CGe
 P4GKI3b9cTUmecuPqIjdW7PuvNApExZybvU204IKYnGGTvE1rhY9v09JipR5u2Pkt715obbJPen
 b/zLKdSNfl/Q97CvZEsBhHPvrKLTqsPrrZXD9h5XyVY5u19V6Yc9skbzqfJy784xDzvvfvneIns
 jfZ+81K37Fo4/2Wxofw179zn1inHDcIS9nMEHsz82ZoNAA==
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

DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
present at the port@1. This allows board DT to add e.g. HDMI connector
nodes or any other next chained bridge. Make adv7511 driver discover
that bridge and attach it to the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed the absent next bridge usecase
- Link to v1: https://lore.kernel.org/r/20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 39c9ece373b0..ea271f62b214 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -356,6 +356,7 @@ struct adv7511 {
 	enum drm_connector_status status;
 	bool powered;
 
+	struct drm_bridge *next_bridge;
 	struct drm_display_mode curr_mode;
 
 	unsigned int f_tmds;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..c50d994a33b5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -946,6 +947,12 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
+	if (adv->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
+		if (ret)
+			return ret;
+	}
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = adv7511_connector_init(adv);
 		if (ret < 0)
@@ -1216,6 +1223,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
+					  &adv7511->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
 	if (adv7511->info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else

---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240309-adv7511-next-bridge-10d8bbe0544e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

