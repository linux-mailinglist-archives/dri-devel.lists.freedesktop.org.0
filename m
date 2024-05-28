Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CEE8D175B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 11:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4154110E537;
	Tue, 28 May 2024 09:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="VOWiVi/W";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BJ4R6F1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D4F10E537
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1716889176; x=1748425176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vqve763J/fnX5w3j8DDUs6X/uVtGpHOXdGrGBsbN7qA=;
 b=VOWiVi/WS+ZibiEEIRF6uCxNqsyzwTvz+HzNk1zZJj1xUlzndf2Idshm
 nittRuAkQvRdZuj9syuVPYSpfNclOB52EIEsrtFywB9sgRjQdRrwVZNRC
 zASfiWCHU1uTR0XR8Kehlx8YqeLIocA33dOb4kH8i31ZAbuEgU49Y01S0
 1CnZ9aYggYw2QdFwSWt+zp35nj5pa0u07HFLWntGLrYMTNcHk0bGqGBj3
 j47jNaoQft6ZaYm3jgIWF+P6jKjzwEGvRg7fnEV+nhcdrjxH2mF+Kdwaa
 ZqBeVItwZdpoAO3SdT7fy8uH5mp3YpuOUa/W/FdogSDt9CtmKmFU39Fkf w==;
X-CSE-ConnectionGUID: 2k6GM/7jTsO5KvQ5L84hDw==
X-CSE-MsgGUID: YiUP1NdXTn+RyzxY1Ae8Bg==
X-IronPort-AV: E=Sophos;i="6.08,194,1712613600"; d="scan'208";a="37100349"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 May 2024 11:39:33 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08CE4164806; Tue, 28 May 2024 11:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1716889168; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Vqve763J/fnX5w3j8DDUs6X/uVtGpHOXdGrGBsbN7qA=;
 b=BJ4R6F1CzUj3NIBsbMaYLBCt2DbeFl2CI9KPvuf+j5wyxi/OuPHjHCHaViG8kabd5LMcLh
 7jF9z9C1IraKLgL1hUCINKUagX4RFZ6fw5U2LC5ki2TXATySWQ5A1Hze0oYRRJCJ6IAwt2
 ILnBSjQ3TqKJygFA2nBz8Y6tJCdx3o4NlvibJ8nkibKQGmAmo6pnpq0tnqZA2nf6URuua5
 saW0r6Rb1CqJuRNMWHurRqXJl0vN+YsmhdGqceuiaPqMtpQ8ASbGz6ALlV//fhz+oINt2c
 LFwppkiU9K4XKYEIJ0IvywXEuZpmLP84MpJPmF01OY4iFBNwG/12AvRn7WCUMg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
Date: Tue, 28 May 2024 11:39:21 +0200
Message-Id: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
removed), it lines up with the other error paths in probe function.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 2347f8dd632f9..8331db3b4f054 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -841,11 +841,9 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
-	if (IS_ERR(dsi->regmap)) {
-		ret = PTR_ERR(dsi->regmap);
-		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->regmap))
+		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
+				     "failed to get block ctrl regmap");
 
 	dsi->clk_pixel = devm_clk_get(dev, "pix");
 	if (IS_ERR(dsi->clk_pixel))
-- 
2.34.1

