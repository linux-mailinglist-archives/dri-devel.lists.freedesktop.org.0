Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857A069B9A6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0B10E1F9;
	Sat, 18 Feb 2023 11:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7F10E1F9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:17:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j2-20020a17090a060200b00229eec90a7fso519813pjj.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
 b=JY77n9tlE/HK4ICl9GMTuT3xOecSN1t2rBwKN2r6bw9DpB3ugVZniqFJmEP/ZS6pdn
 FZrSdrEN79gLPWOMUK+L66wCzzs3r3Q8uln5PXzclN7b87DKiNVjqYU3DiNx/XLz0qPb
 Of7YZ4EvDZl+ErstHa8fMnpIbvTchMOkO2RII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
 b=75TjQpmcFyylnBwwZ2PuKK8YZyCf/BTynEnjK28IgTkRFzfk56cY7KOJSuIW0FHEIu
 5VEXScIyojo5fBSByddYuRJmNji+kx+icAw+nlufLdKf/b1uYZGCNfFmTAzFrdNpJoHR
 9ipnknhCJfB2Jl6uJH463lDpeOgbVL8Zk3bRNImfIg1crSgNmf4UAJMfq2LLTVpDNi9C
 OPynUNry4dH7Nf/Gc6licSnYcuj+UlT6/U9PuUMppA+nlDxmVirWznJ95QQYhdCf1lob
 y2cbYMaVWnaCbqLzk5G0ko2The8IDv1c8JGeg7PV7g4FJchi6FVzGgysJ92+Qn33crSX
 Pi5w==
X-Gm-Message-State: AO0yUKXsvP07Uzn+IVNDH5aEsh8aI5Vz+7DTOAa55IAbl/bpNBqX8rd/
 m5W13IwIuzp8M63MW372aO4tIA==
X-Google-Smtp-Source: AK7set/hFbuR6/pwEBTsgMDjBxXuhNwX/DV7X+3lXNMmHiMnzFAlbjwwtNwH3GYu9AIwOZM3LSHFcw==
X-Received: by 2002:a05:6a20:4e27:b0:c6:858d:81b7 with SMTP id
 gk39-20020a056a204e2700b000c6858d81b7mr3115816pzb.25.1676719054085; 
 Sat, 18 Feb 2023 03:17:34 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:88dd:be84:8f65:fec2])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 03:17:33 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 2/5] drm/bridge: Add .get_edid callback for anx7688 driver
Date: Sat, 18 Feb 2023 19:17:09 +0800
Message-Id: <20230218111712.2380225-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
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
Cc: chrome-platform@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pin-yen Lin <treapking@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the driver to read EDID when ddc-i2c-bus phandle is present in
the device node.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index fa91bdeddef0..a16294c87940 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -6,6 +6,7 @@
  */
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -91,14 +92,24 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	return totalbw >= requiredbw;
 }
 
+static struct edid *cros_ec_anx7688_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct cros_ec_anx7688 *anx7688 = bridge_to_cros_ec_anx7688(bridge);
+
+	return drm_get_edid(connector, anx7688->bridge.ddc);
+}
+
 static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
 	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
+	.get_edid = cros_ec_anx7688_get_edid,
 };
 
 static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct cros_ec_anx7688 *anx7688;
+	struct device_node *phandle;
 	u16 vendor, device, fw_version;
 	u8 buffer[4];
 	int ret;
@@ -153,6 +164,19 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
 			 fw_version);
 
+
+	phandle = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (phandle) {
+		anx7688->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
+		of_node_put(phandle);
+		if (!anx7688->bridge.ddc)
+			return -EPROBE_DEFER;
+	} else {
+		dev_dbg(dev, "No I2C bus specified, disabling EDID readout\n");
+	}
+	if (anx7688->bridge.ddc)
+		anx7688->bridge.ops |= DRM_BRIDGE_OP_EDID;
+
 	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
 	drm_bridge_add(&anx7688->bridge);
 
-- 
2.39.2.637.g21b0678d19-goog

