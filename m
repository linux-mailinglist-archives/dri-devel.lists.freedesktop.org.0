Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275158ACAC2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9679410F586;
	Mon, 22 Apr 2024 10:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2ad97rT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454C10F55C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:34:03 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-699320fcbc1so25213846d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713782042; x=1714386842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9RmIVhJTPtd/M32KO0T9Rps1ocUTTvulsyIxVAq4hw=;
 b=B2ad97rTsSZgNc9DbjoiffLy4omsADx+acKEwmb44UGCsYRw4j4GnhJezwLXuBY+0w
 0N2slMiepDUmmrSQ0WAH9sJHddkY/ZFXjGJ6FOSpGxyt2j8vK5i9RjiFxewyhLpzq0u5
 Wgchp1RVA0d+2XMgHTdfsVc9wVx1UnvquQ96nudjFofRSqwhBHtqN73MqtlP2KyDzXSH
 L2zZhT7TOBX+oIY/v0YKEEHFPQl1D1TdpAh6YQ9h3W8SHJJXNhY1NuRdZb/7U0kk5B9d
 3eLjYNpwZO72DhS5hSBL/a92iWiwBAEZzkcr0iMLGagvFmUtuyJVmdo44M1GHu2rr/xy
 XbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713782042; x=1714386842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9RmIVhJTPtd/M32KO0T9Rps1ocUTTvulsyIxVAq4hw=;
 b=JLXqdskYjIgY5a0wZlF/5c0oQd6GNkduOsVQm+wBg0DDam5ZTxaOWjFIGT4y/fK1lA
 90B0GSUU4BaJvKUS0V8dGsqSH7OgDgr0wB/cuiMXf+lUcdOsSDGRctQvlOi2V+moHp10
 v4Y4ynODZNTy5NQpMMTxRchm0xeeN9MfybaIugP/tBpMtiJd6BDO2FPS8+kdsdFuREsN
 KNsjeyYo7JoISHLWHY6CKv9C5cTqoJWYeUk3I+P8a/cDZqU/0iX1oRc5T7txOZ+ly/I2
 vL1ViLeaVcIXEhl2o28daCpUwQp12XwFNVVqnPOQCzvptk8bomv8Y4/IOGRunWtzYAET
 Lo6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoxhvfaqcHaDFjPJo72l9RgxdrhFoF8mO5hRKr6TgqsygQ4qIYUpO2sQmclPmCrYtVEx4PWewE1POAO+cTqd5mrHg0HcAOlRxvUQ70qZej
X-Gm-Message-State: AOJu0Yy+FZoIay+673RDU1zvSoMCvSSxDvqC/NMABhFNFQ7rNsp8wMOq
 K5tCKwv2Hn0aX0giMFwA6HTXT73nxGH0S0x236dJUBLBu9BLnL1K
X-Google-Smtp-Source: AGHT+IF7xU0CrgrENRN5M6s9mj5930yB33guQy8rgide/y00R328+7Mcpm1moYpBa6a7xF4eToPrig==
X-Received: by 2002:ad4:41c1:0:b0:6a0:7f0f:5856 with SMTP id
 a1-20020ad441c1000000b006a07f0f5856mr3428302qvq.0.1713782042309; 
 Mon, 22 Apr 2024 03:34:02 -0700 (PDT)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:21d2:385e:2c2e:5178])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a0c979a000000b0069b21f13c52sm4170919qvd.113.2024.04.22.03.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 03:34:01 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/bridge: imx: Fix unmet depenency for
 PHY_FSL_SAMSUNG_HDMI_PHY
Date: Mon, 22 Apr 2024 05:33:52 -0500
Message-ID: <20240422103352.8886-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When enabling i.MX8MP DWC HDMI driver, it automatically selects
PHY_FSL_SAMSUNG_HDMI_PHY, since it wont' work without the phy.
This may cause some Kconfig warnings during various build tests.
Fix this by implying the phy instead of selecting the phy.

To prevent this from happening with the DRM_IMX8MP_HDMI_PVI, also
imply it instead of selecting it.

Fixes: 1f36d634670d ("drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change DRM_IMX8MP_HDMI_PVI at the same time since it was affected
     from the same commit.

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 7687ed652df5..13142a6b8590 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -8,8 +8,8 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on COMMON_CLK
 	depends on DRM_DW_HDMI
 	depends on OF
-	select DRM_IMX8MP_HDMI_PVI
-	select PHY_FSL_SAMSUNG_HDMI_PHY
+	imply DRM_IMX8MP_HDMI_PVI
+	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
-- 
2.43.0

