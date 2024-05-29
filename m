Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0498D2DA3
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 08:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C410E245;
	Wed, 29 May 2024 06:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="H3asLmz3";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bdfeg6gH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439EA10E245
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1716965655; x=1748501655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QNRzo83mZGl9G2410HmioNDgIdVNX31t5SpCkoFYr+8=;
 b=H3asLmz3YGZaRi55ERBEPIbPVy5EA+g6s7hzy5bUkQfqDQ4hp8ZbetTf
 HxHzq4QJfhwD9nHrPS9nUG25kKXvCHu8WE2ciefzhlci+yvj7OpzxrCA5
 gLi3aG/KU2l/VU4oZbkGBU58Myn7N/T/FXdoP4rs3srzJrfFhd1QdF9Ph
 LYbi24+Rs7LpmrtzyDFbJkT7hWkDmWQXRvumM++m0B9Lbp91ZCxXZAWvG
 Sa6FlIMSmS+kLO9D2l8xEJSweQWJ3+crrC7WSvutyCKH2SYCmw4Vh4mjy
 B8SSX4epra9Bfn0v3DIUOWlhEARTNmpTy2GE86MOYZc4SI1sckpQ74XoB g==;
X-CSE-ConnectionGUID: SJwekOs4SRqwQrXOawD0mA==
X-CSE-MsgGUID: DYZpWyxERPibBz6M9pvhCA==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; d="scan'208";a="37117803"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 29 May 2024 08:54:12 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78F8F165466; Wed, 29 May 2024 08:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1716965648; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=QNRzo83mZGl9G2410HmioNDgIdVNX31t5SpCkoFYr+8=;
 b=Bdfeg6gH84Vlbe+i8jRR2jAr7aux6uMweLpkeI7vw7sP3H2weCpr9L3pkQ/FQQFpXu67Z6
 n9o2+XU0DjmRnsL6E9p7DoXxSmWDyn3kGa6UDEPKITRSPMzsm6Ay3AvRpJ0juX7uGRwerf
 toYPhm4AO86z2B0O51REBXe8G2/YfuNQL1l44tNk3fPT+P6v3eBG9Eb+x6g6icv0eSkCFb
 n1mcImCbeiR+Zue9qf2KX6iO0pXvrpjuwlcyLFE8dxhBCKhEsDb6w1/YBSsBvUNlz+rwIt
 MDjtTfp7Dm/CA6SesEOfykOEgvyiWeNfD7nX6yjtkO8Iv7NRLE0YEI/0pciNhA==
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
Subject: [PATCH v2 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
Date: Wed, 29 May 2024 08:53:58 +0200
Message-Id: <20240529065400.461633-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Removed unused variable
* Added missing \n at end of string

 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 2347f8dd632f9..13025f47f3902 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -834,18 +834,15 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct imx93_dsi *dsi;
-	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
 		return -ENOMEM;
 
 	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
-	if (IS_ERR(dsi->regmap)) {
-		ret = PTR_ERR(dsi->regmap);
-		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->regmap))
+		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
+				     "failed to get block ctrl regmap\n");
 
 	dsi->clk_pixel = devm_clk_get(dev, "pix");
 	if (IS_ERR(dsi->clk_pixel))
-- 
2.34.1

