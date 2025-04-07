Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F053DA7E141
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64810E4CA;
	Mon,  7 Apr 2025 14:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TrPhd/9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D716C10E4AC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:25:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B675143281;
 Mon,  7 Apr 2025 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744035907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41vTHyL+V115rpzV8yiJOSt8o1/SbibksvBOkcYUztI=;
 b=TrPhd/9yx/uz+Jqhl6cevPGe1U4iJYU/GtPYsROsV9SszFY7WzMHdKyCFM32TgMqsvJp5S
 bTOwqvj7B8cNjD2QoNzqZkZ4k2B/tZ3NSugTR0mh2kVtaTk24SAli1yaHhVuCuGSTxKvCS
 NQ1MyEwid5p0Dx2ztEIFOoXPsRnx7sivyEv7jc26iVzSFwtn/HuVFCYSlVnu/38P9xMMoH
 bIMowGNR6DiM6Wsc5v7EbAJVZ+mZYrSZXtHzJpGm4Xp+xzR1DK0vNcLRcHoTDc1TGjoY5d
 iOCTdFprFCIN145qsTw+uPPlChnIW3Dhoxw0P65R7Fl5vYfdak6BesuQ3m7Gng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:36 +0200
Subject: [PATCH 21/34] drm/omap: dss: hdmi4: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-21-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedukeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This is the new API for allocating DRM bridges.

Switching from a non-devm to a devm allocation allows removing the kfree()
in the remove function and in the probe error management code, and as a
consequence to simplify the code flow by removing now unnecessary gotos.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a3b22952fdc32b5899dae82d413108c5c0a1c3c8..3cd612af24498b057c33eaecb3d43c8df76cd23e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -505,7 +505,6 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
 {
-	hdmi->bridge.funcs = &hdmi4_bridge_funcs;
 	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
@@ -761,9 +760,9 @@ static int hdmi4_probe(struct platform_device *pdev)
 	int irq;
 	int r;
 
-	hdmi = kzalloc(sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(&pdev->dev, struct omap_hdmi, bridge, &hdmi4_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->pdev = pdev;
 
@@ -774,25 +773,24 @@ static int hdmi4_probe(struct platform_device *pdev)
 
 	r = hdmi4_probe_of(hdmi);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_wp_init(pdev, &hdmi->wp, 4);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_phy_init(pdev, &hdmi->phy, 4);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi4_core_init(pdev, &hdmi->core);
 	if (r)
-		goto err_free;
+		return r;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		DSSERR("platform_get_irq failed\n");
-		r = -ENODEV;
-		goto err_free;
+		return -ENODEV;
 	}
 
 	r = devm_request_threaded_irq(&pdev->dev, irq,
@@ -800,7 +798,7 @@ static int hdmi4_probe(struct platform_device *pdev)
 			IRQF_ONESHOT, "OMAP HDMI", hdmi);
 	if (r) {
 		DSSERR("HDMI IRQ request failed\n");
-		goto err_free;
+		return r;
 	}
 
 	hdmi->vdda_reg = devm_regulator_get(&pdev->dev, "vdda");
@@ -808,7 +806,7 @@ static int hdmi4_probe(struct platform_device *pdev)
 		r = PTR_ERR(hdmi->vdda_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -827,8 +825,6 @@ static int hdmi4_probe(struct platform_device *pdev)
 	hdmi4_uninit_output(hdmi);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(hdmi);
 	return r;
 }
 
@@ -841,8 +837,6 @@ static void hdmi4_remove(struct platform_device *pdev)
 	hdmi4_uninit_output(hdmi);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(hdmi);
 }
 
 static const struct of_device_id hdmi_of_match[] = {

-- 
2.49.0

