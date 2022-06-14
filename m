Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841654BAE2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 21:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297FF112CB0;
	Tue, 14 Jun 2022 19:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8C112CB0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 19:46:22 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so12797672pjm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EP6kjhqDA4kzHmGHs/9bVpqUdTblq6ZRXkltoDHVJIg=;
 b=GcWlCP/GNpmS+ZTqes3eEyiy6M8IJ5cz50y4m4PFUwIS7osKafuAUy6szkDG0MV1gj
 02nAmkiWVyBLGTRlV7Kd3H1Bac98DRb9Vbhdxt2YAFxERw3b5MvBGGaaVM4FoOEPaQxq
 m3wuaovtbrHbpl6A/KjmRQJBmeiVMGxm4dLMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EP6kjhqDA4kzHmGHs/9bVpqUdTblq6ZRXkltoDHVJIg=;
 b=02clSqTZrWiqWlKwuUYI00ILCODQ9TBUrCYsCXdYvfVhkrxdxD/Jh8bNR50yeu1wqD
 vBwn3J9nAk901RjPByPNPBKiQUcrh9vxvkH/irLyKgaXqMRZ2NAhDEr/rnrR1AQ7Ftbs
 M1WrEjm7ghcPMhJoHZHtzRrM5lw0WoFxuUDujRAeQJ9EpCRiG921zm13JNdIE6kAMhai
 LGk0DIOPS3+rk7kxKK2cWNpu7aR4o90qEN0+Xt5xYJFI7yA8FoG6BluRQXvQgi9fVsEz
 js+yxU94Gwql0tY9GFr4f8ZK5j56iUFj6Kwqml4kXzknAZJ8+ORZ/QnJioHK3jw5iQXx
 sgdQ==
X-Gm-Message-State: AJIora/J6UEMp+db79BWiBUdFXKTswXsHwsy4IiDv35rm80RGB64JFj1
 cA8e5IPoUor/BgFbbFppU1DLyQ==
X-Google-Smtp-Source: AGRyM1ts/A9elnR0lCZjcV3e64abgFvNk6iD/IFUcyUTyE+3MbAB7sPQQTBg1CpFg8Yv13OD0qq8Fw==
X-Received: by 2002:a17:90b:4b83:b0:1e3:3ad3:612c with SMTP id
 lr3-20020a17090b4b8300b001e33ad3612cmr6040010pjb.87.1655235981552; 
 Tue, 14 Jun 2022 12:46:21 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a17090a409500b001df3a251cc2sm10014426pjg.4.2022.06.14.12.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:46:20 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
Date: Tue, 14 Jun 2022 19:34:41 +0000
Message-Id: <20220614193558.1163205-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614193558.1163205-1-pmalani@chromium.org>
References: <20220614193558.1163205-1-pmalani@chromium.org>
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
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

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
2.36.1.476.g0c4daa206d-goog

