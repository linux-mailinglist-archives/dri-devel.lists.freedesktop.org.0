Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D647E5552AB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A937F10E2C7;
	Wed, 22 Jun 2022 17:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95F610E2C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:42:54 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id w6so9581434pfw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ptqr6Gt87GBK7ogASDiLHOYZ5B9Dk9q5REfKiGiBgc0=;
 b=Jfqg6JJQ7G9ltX2drICxGwUWHhxKuHKFf0kGAkjHl5ZR83RxlZZKlkVyQk7lHOUkJR
 rIkr9D5BVoYSsT+kdOmkw0b39O7tOqw5bSq64v9u3wiRrrBpi9CAK7IE+rSkL/Hj1irC
 2JDLTpQG/8Saf/Ut1zRwrROffMF8vajmdPNaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ptqr6Gt87GBK7ogASDiLHOYZ5B9Dk9q5REfKiGiBgc0=;
 b=JgZrMPBGjuM2MXl79R/1NnmjzKh/dUDAchTGZD+twbT6rCupW7heCAz9MyS+9BEyUt
 dKpzqvvBsusTOHl+o4y43ngTpfkoFaJi/K3ZVajxccLNi1QINpx0xZ+8xrI1lvOAQfTZ
 2JTuOJNCRxkTBhub/5NuaUo2Mwtu68ra5cwR3uDFqT8T1dT2Ea92KyWsemZVxlxs3Wvj
 2PdQgxOxozrSka083IhyQuff3CE5cJESb7ZkKlIV7uBUyLERHy3El/4Vpo2I7VQXyHXF
 KD/oJuyTBi6Ib1S2eRxdGTgaQ/Zp7X3CEGo+nbOx4ZWgUfk3O/n/KJPvurmyPGnd1O2A
 vsvQ==
X-Gm-Message-State: AJIora8YqXRs8NU0WKaqkeIW6GE/eXyRIaKZY+zSuRj76UEknbpgZ/5b
 wFP+Jdpx17Q5Vs9ACW1MPxWTWA==
X-Google-Smtp-Source: AGRyM1tKf6IK4rTXOn4QslrbCdg6CX/PumJ0UUDKbKt9Vz/2UQqZ89g2VS9gjz2ZhpbdipD5/qLGqw==
X-Received: by 2002:a63:5703:0:b0:408:b2c3:8df9 with SMTP id
 l3-20020a635703000000b00408b2c38df9mr3767997pgb.247.1655919774471; 
 Wed, 22 Jun 2022 10:42:54 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a17090b079100b001ece55aec38sm35470pjz.30.2022.06.22.10.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:42:53 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
Date: Wed, 22 Jun 2022 17:34:34 +0000
Message-Id: <20220622173605.1168416-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622173605.1168416-1-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pin-Yen Lin <treapking@chromium.org>

Add the callback function when the driver receives state
changes of the Type-C port. The callback function configures the
crosspoint switch of the anx7625 bridge chip, which can change the
output pins of the signals according to the port state.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v4:
- Patch moved to 5/9 position (since Patch v4 1/7 and 2/7 were
  applied to usb-next).

Changes since v3:
- Added Reviewed-by tag from Angelo.

Changes since v2:
- Moved num_typec_switches check to beginning of function
- Made dp_connected assignments fit on one line (and removed unnecessary
  parentheses)
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- No changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 56 +++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h | 13 ++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index bd21f159b973..5992fc8beeeb 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
@@ -2582,9 +2583,64 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
+					  enum typec_orientation orientation)
+{
+	if (orientation == TYPEC_ORIENTATION_NORMAL) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
+	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
+	}
+}
+
+static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
+{
+	if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
+		/* Both ports available, do nothing to retain the current one. */
+		return;
+	else if (ctx->typec_ports[0].dp_connected)
+		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
+	else if (ctx->typec_ports[1].dp_connected)
+		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
+}
+
 static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
 				 struct typec_mux_state *state)
 {
+	struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
+	struct anx7625_data *ctx = data->ctx;
+	struct device *dev = &ctx->client->dev;
+	bool new_dp_connected, old_dp_connected;
+
+	if (ctx->num_typec_switches == 1)
+		return 0;
+
+	old_dp_connected = ctx->typec_ports[0].dp_connected || ctx->typec_ports[1].dp_connected;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_connected);
+
+	data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
+			      state->alt->mode == USB_TYPEC_DP_MODE);
+
+	new_dp_connected = ctx->typec_ports[0].dp_connected || ctx->typec_ports[1].dp_connected;
+
+	/* dp on, power on first */
+	if (!old_dp_connected && new_dp_connected)
+		pm_runtime_get_sync(dev);
+
+	anx7625_typec_two_ports_update(ctx);
+
+	/* dp off, power off last */
+	if (old_dp_connected && !new_dp_connected)
+		pm_runtime_put_sync(dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 76cfc64f7574..7d6c6fdf9a3a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -55,6 +55,18 @@
 #define HPD_STATUS_CHANGE 0x80
 #define HPD_STATUS 0x80
 
+#define TCPC_SWITCH_0 0xB4
+#define SW_SEL1_DPTX0_RX2 BIT(0)
+#define SW_SEL1_DPTX0_RX1 BIT(1)
+#define SW_SEL1_SSRX_RX2 BIT(4)
+#define SW_SEL1_SSRX_RX1 BIT(5)
+
+#define TCPC_SWITCH_1 0xB5
+#define SW_SEL2_DPTX1_TX2 BIT(0)
+#define SW_SEL2_DPTX1_TX1 BIT(1)
+#define SW_SEL2_SSTX_TX2 BIT(4)
+#define SW_SEL2_SSTX_TX1 BIT(5)
+
 /******** END of I2C Address 0x58 ********/
 
 /***************************************************************/
@@ -444,6 +456,7 @@ struct anx7625_i2c_client {
 };
 
 struct anx7625_port_data {
+	bool dp_connected;
 	struct typec_mux_dev *typec_mux;
 	struct anx7625_data *ctx;
 };
-- 
2.37.0.rc0.104.g0611611a94-goog

