Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D9A5551F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155F310EA69;
	Thu,  6 Mar 2025 18:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="bOKoEO73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Thu, 06 Mar 2025 09:21:45 UTC
Received: from mta-65-226.siemens.flowmailer.net
 (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724010E922
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:21:45 +0000 (UTC)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id
 2025030609114004cbfd28870ee67056
 for <dri-devel@lists.freedesktop.org>;
 Thu, 06 Mar 2025 10:11:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pkzhFHGUhtHHd85O2rQyM7bs5etdC+NbUnb3Yfsf2cY=;
 b=bOKoEO73mjW4+KYmghRKEq1A1fADX+yozUZTrTqzs2mE7pQJAEfDTwJJBllROLeQK0kqm6
 4WMC6P2YniCAgoslX57LN0iyMtB1tK2k9mnDL67r6TAsSuOWb605/zTT5nPTw4vWiOj+ijNI
 nvfVCf/cdkEligtYsbkodUxFmphLYTj7axSpef1xRhE5oJzIxFNdhpcZ8wpPNuUjaVrkSHUG
 pLASCcyR3LlZD3GQ61xMsCjMAXHkTEQ+QnjWgHoTaFwZloV3e2PhEs1fOEBRW5GD3whZkb1C
 QbgCP7A5WXqxFAtsTMgpEVZNKebKJ/Bzfbdbys0xt56BCxbxcSdaf2FA==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Andrej Picej <andrej.picej@norik.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Date: Thu,  6 Mar 2025 10:11:33 +0100
Message-ID: <20250306091133.46888-3-alessandro.zini@siemens.com>
In-Reply-To: <20250306091133.46888-1-alessandro.zini@siemens.com>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-Mailman-Approved-At: Thu, 06 Mar 2025 18:35:34 +0000
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

From: Alessandro Zini <alessandro.zini@siemens.com>

The h/vsync-disable properties are used to control whether to use or
not h/vsync signals, by configuring their pulse width to zero.

This is required on some panels which are driven in DE-only mode but do
not ignore sync packets, and instead require them to be low-voltage level
or ground.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 95563aa1b450d..c94ea92159402 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -164,6 +164,8 @@ struct sn65dsi83 {
 	int				irq;
 	struct delayed_work		monitor_work;
 	struct work_struct		reset_work;
+	bool				hsync_disable;
+	bool				vsync_disable;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -604,10 +606,12 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	/* 32 + 1 pixel clock to ensure proper operation */
 	le16val = cpu_to_le16(32 + 1);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &le16val, 2);
-	le16val = cpu_to_le16(mode->hsync_end - mode->hsync_start);
+	le16val = cpu_to_le16(ctx->hsync_disable ?
+		0 : mode->hsync_end - mode->hsync_start);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
 			  &le16val, 2);
-	le16val = cpu_to_le16(mode->vsync_end - mode->vsync_start);
+	le16val = cpu_to_le16(ctx->vsync_disable ?
+		0 : mode->vsync_end - mode->vsync_start);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
 			  &le16val, 2);
 	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
@@ -867,6 +871,14 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		}
 	}
 
+	ctx->hsync_disable = false;
+	if (of_property_present(dev->of_node, "hsync-disable"))
+		ctx->hsync_disable = true;
+
+	ctx->vsync_disable = false;
+	if (of_property_present(dev->of_node, "vsync-disable"))
+		ctx->vsync_disable = true;
+
 	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
 	if (IS_ERR(panel_bridge))
 		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
-- 
2.48.1

