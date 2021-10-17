Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3974305B2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 02:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51E6E8E7;
	Sun, 17 Oct 2021 00:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8641A6E8E7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 00:12:22 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4189083209;
 Sun, 17 Oct 2021 02:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634429540;
 bh=1NwdYw1Kty3P/bmZ6Fjrh2EVp6bVutiM8C9BBm3FkS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EAgcUqJdB/DAyUmIue9tut9eZm47aKRJfzwAFXq/MygwuLx/YD0F2dmKj5IKX8LmG
 yOYGBo0urOoSay1v1gUYUDYm8EOCrADkMKCkKCmuwCJ5EUiOs77hnk6Ibj7b3UI7a7
 V9CT7F/9VAE1KFK8KFY2tHdWT6qpqKgM9Z4TUC2kFajH+u8NLEk09bTfG2BEaIXD7Q
 oM5qm8CWa1CST5GYwG/oUcOWEYLLZnR/il1wQ/HGhwVxXmiimEl3CnyENiSRCcEEnY
 xHZ5msHouwi0XwGQN7habTSFTiG3mpiyvACGszz6n4H1D3Mj4egxW/p6Iw9Cm4uROz
 Zz8+PNAE3ADXA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Date: Sun, 17 Oct 2021 02:12:04 +0200
Message-Id: <20211017001204.299940-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017001204.299940-1-marex@denx.de>
References: <20211017001204.299940-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
select input pixel data sampling edge. Add DT property "pclk-sample", not
the same as the one used by display timings but rather the same as used by
media, and configure bus flags based on this DT property.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Limit the pixelclk-active to encoders only
    - Update DT binding document
V3: - Determine whether this is encoder from connector, i.e.
      lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS
V4: - Switch to pclk-sample. Note that the value of this is inverted,
      so all the existing users of pixelclk-active using previous
      previous version of this patch must be reworked
V5: Rebase on recent linux-next
---
 drivers/gpu/drm/bridge/lvds-codec.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f991842a161f..702ea803a743 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -21,6 +21,7 @@ struct lvds_codec {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_bridge_timings timings;
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
@@ -119,6 +120,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *bus_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	u32 val;
 	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
@@ -187,12 +189,25 @@ static int lvds_codec_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * Encoder might sample data on different clock edge than the display,
+	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
+	 * the sampling edge.
+	 */
+	if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS &&
+	    !of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
+		lvds_codec->timings.input_bus_flags = val ?
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
 	lvds_codec->bridge.of_node = dev->of_node;
+	lvds_codec->bridge.timings = &lvds_codec->timings;
 	drm_bridge_add(&lvds_codec->bridge);
 
 	platform_set_drvdata(pdev, lvds_codec);
-- 
2.33.0

