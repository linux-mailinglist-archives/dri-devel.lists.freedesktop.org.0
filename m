Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FEB5552C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123C10E636;
	Wed, 22 Jun 2022 17:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B38D10E636
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:48:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id w24so8265652pjg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INtMn1T8YiMhzQt2Th4wtcU0KbijPUKMnT6GFbUU1es=;
 b=iMepv6cEm1kKrueKz6F8JmBrKe29Bg85av9Djx9b2MBTrbDc+JfTwOd23NQ0BJeQQq
 37fpA2gDzLO8DXBdJ7A/uB8Xuvc4+KcZ7fS8DOsSgvAElBeVOGA5tMu6YLkOQDWz3BpQ
 kizqT+2a2uqLFbJqLLOcqRR8PeNirsLEMS434=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INtMn1T8YiMhzQt2Th4wtcU0KbijPUKMnT6GFbUU1es=;
 b=YKblkImGcGdmYlI0Bzh4/f3a3XEDhP2Y1Z9QPGrEgNUdMpDJ53wOR3cjVKCeRgQgIH
 Crcgq7RPkoKCTdzgWFMxkP1eonwgnIQBrptMo2yiZxlwCfVC6jHK8Hc/0hhvlXUSPzSp
 OmhXJdaybiyvDWfniohnry/mkFqpwyf02vPAWHiNBI/sqV9l/JSqg/qIOBoIBCUPP0pQ
 Kqr7hB0XQ3kG1+rAzDV2gKQbw2cCGlH+1Z6FYkbzT/ijEa3qc5BxjDsoXqI+QR2J1vQH
 bMsOElnXs4HSbDsETeYFfJhOsvv4gxEHSHKBJlF1XO9bdN2XjMX2R1YcsTj5RaUMaftS
 1f/g==
X-Gm-Message-State: AJIora+O+xRsQFUHJTwPjzZ8JSzOxtcx5vvixa+r85umaCaXgoR9w+UR
 8ueAB0SJwPFhofY4h7rB9o9Ihw==
X-Google-Smtp-Source: AGRyM1uOMxnpSmvwdwqtw/1opcMtIJbxFZWf2fsabN2cbcr6zK0lX2+IO4vplGkVs7xRBGrXcbNLOA==
X-Received: by 2002:a17:903:41c7:b0:16a:2dcf:c4a0 with SMTP id
 u7-20020a17090341c700b0016a2dcfc4a0mr13200643ple.83.1655920110049; 
 Wed, 22 Jun 2022 10:48:30 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a17090b079100b001ece55aec38sm35470pjz.30.2022.06.22.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:48:29 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 9/9] drm/bridge: it6505: Add typec_mux_set callback function
Date: Wed, 22 Jun 2022 17:34:38 +0000
Message-Id: <20220622173605.1168416-10-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622173605.1168416-1-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
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

Add the callback function when the driver receives state changes of the
Type-C ports. The callback function configures the lane_swap state and
ends up updating the lane swap registers of it6505 bridge chip.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

v5 is the first version for this patch.

 drivers/gpu/drm/bridge/ite-it6505.c | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cb1dd4cbd33b..87b9bd742b52 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -17,6 +17,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/wait.h>
 
@@ -404,6 +405,7 @@ struct debugfs_entries {
 };
 
 struct it6505_port_data {
+	bool dp_connected;
 	struct typec_mux_dev *typec_mux;
 	struct it6505 *it6505;
 };
@@ -3237,9 +3239,65 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static void it6505_typec_ports_update(struct it6505 *it6505)
+{
+	usleep_range(3000, 4000);
+
+	if (it6505->typec_ports[0].dp_connected && it6505->typec_ports[1].dp_connected)
+		/* Both ports available, do nothing to retain the current one. */
+		return;
+	else if (it6505->typec_ports[0].dp_connected)
+		it6505->lane_swap = false;
+	else if (it6505->typec_ports[1].dp_connected)
+		it6505->lane_swap = true;
+
+	usleep_range(3000, 4000);
+}
+
 static int it6505_typec_mux_set(struct typec_mux_dev *mux,
 				struct typec_mux_state *state)
 {
+	struct it6505_port_data *data = typec_mux_get_drvdata(mux);
+	struct it6505 *it6505 = data->it6505;
+	struct device *dev = &it6505->client->dev;
+	bool old_dp_connected, new_dp_connected;
+
+	if (it6505->num_typec_switches == 1)
+		return 0;
+
+	mutex_lock(&it6505->extcon_lock);
+
+	old_dp_connected = it6505->typec_ports[0].dp_connected ||
+			   it6505->typec_ports[1].dp_connected;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		it6505->typec_ports[0].dp_connected, it6505->typec_ports[1].dp_connected);
+
+	data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
+			      state->alt->mode == USB_TYPEC_DP_MODE);
+
+	new_dp_connected = it6505->typec_ports[0].dp_connected ||
+			   it6505->typec_ports[1].dp_connected;
+
+	if (it6505->enable_drv_hold) {
+		dev_dbg(dev, "enable driver hold");
+		goto unlock;
+	}
+
+	it6505_typec_ports_update(it6505);
+
+	if (!old_dp_connected && new_dp_connected)
+		pm_runtime_get_sync(dev);
+
+	if (old_dp_connected && !new_dp_connected) {
+		pm_runtime_put_sync(dev);
+		if (it6505->bridge.dev)
+			drm_helper_hpd_irq_event(it6505->bridge.dev);
+		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
+	}
+
+unlock:
+	mutex_unlock(&it6505->extcon_lock);
 	return 0;
 }
 
-- 
2.37.0.rc0.104.g0611611a94-goog

