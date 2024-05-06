Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0568BCF0D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D6F10F052;
	Mon,  6 May 2024 13:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aoVRIpuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0D10F052
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 36CF7612B7;
 Mon,  6 May 2024 13:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775B7C116B1;
 Mon,  6 May 2024 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002522;
 bh=yYJipGADf8UJHcchwZluJd8e0AxButwRdoUdpxl7l5Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aoVRIpuMXfmKxTrrGGCBOz/nNDclfDeb3r8oq/8cGNaMUauqFc6TvCTxMWYoqLp/E
 a4nWfgjh6HayGaegeyZ98S6GpU4KldaRIloHqEfuIt7hKnaxXCQh1qF4/D8cXGg+Nd
 Zd4DBbnx2msAtHLmPP0jQB3wgtHs6Ox0ln9bE9ibwLUWM0UzkJxM92q+7yF9jvUCDu
 14WOuZ6O5oGE3ga71J92BHv509CN80KR2qf/qAxWygZ1xZAe8PEigeFxBGBMDIn8vw
 IMaTlAZq0ZF6YXWfO0SFI/u0PvUIQ9a3VQyzwALosJthO29zjoAQG3sSUnGVnbQ/7J
 awDu2v5DOzH3A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:33 +0200
Subject: [PATCH 04/20] drm/bridge: tc358775: fix regulator supply id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-4-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

The regulator id is given without the "-supply" postfix. With that
fixed, the driver will look up the correct regulator from the device
tree.

Fixes: b26975593b17 ("display/drm/bridge: TC358775 DSI/LVDS driver")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 3b7cc3be2ccd..980f71ea5a6a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -680,14 +680,14 @@ static int tc_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	tc->vddio = devm_regulator_get(dev, "vddio-supply");
+	tc->vddio = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(tc->vddio)) {
 		ret = PTR_ERR(tc->vddio);
 		dev_err(dev, "vddio-supply not found\n");
 		return ret;
 	}
 
-	tc->vdd = devm_regulator_get(dev, "vdd-supply");
+	tc->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(tc->vdd)) {
 		ret = PTR_ERR(tc->vdd);
 		dev_err(dev, "vdd-supply not found\n");

-- 
2.39.2

