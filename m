Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF354CFCB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB63112744;
	Wed, 15 Jun 2022 17:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88DF11275A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:29:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d13so10956837plh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU1gCwo/vpUxCIc57VV4IsZishi0TSmAXrvBQIGpe2U=;
 b=R48f0TErt8niv/gv0d0lSVb6ITUrGLs9Pd30o8jOJZHXeD52Fzw4OHBJ7lzPtQ1FLu
 wTXzhTC2c8lGmQ/HkwHyMOyoDwMv8eMS97KPLg62tAJyPlPdqaPPN9e5lywZaCofvNb/
 2stqabdAEpTT7j5KWGiwE2SbZRUUlEodPRwkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yU1gCwo/vpUxCIc57VV4IsZishi0TSmAXrvBQIGpe2U=;
 b=PMOueivWl0YIwjnIsn0h6p2yeHXR2vlW0QoTm/z9hqyPUr973yPUVcUlmsevaqNexL
 W71Wvpoe4vhBxrTxJiuy0nyCYxpZ+prF7yMRvfznl/V9iDa88VKhsl1LuX1L1Rti5yGY
 3isb5cdba9X8bcY7R1D89asKCJpddWlP6fdmXIDG9rHWgX1ihHi6CwG+DVbqvkGTpZwp
 4DKrEs61dF3nCZ1bRaAO2YCK29qoI2lxbLkkjIoc4YmHCdle88HT7RFkFFgHOJlI9jia
 BQvAPVbDAe+IQVJua1KMgNm7bV0BBRi8tIerjRIbPPlOdYkAtle190GAR2IuYUTyGTrV
 9uAw==
X-Gm-Message-State: AJIora9fY7gL2/bTXFoeOXIfVnVAAiLDw04tZ2OA6QWeiV4UUJ/2VWnE
 yIMPibxioRxU4FA1fP7FVLkiTg==
X-Google-Smtp-Source: AGRyM1vwzPqUpHG5Lx/pI9IZTeCHB9Koz2dOT5UMwKL1uJ93y7aUKTlLKD5db94RZYOrNopuHiJliQ==
X-Received: by 2002:a17:903:1cd:b0:168:e97b:54be with SMTP id
 e13-20020a17090301cd00b00168e97b54bemr782149plh.163.1655314140495; 
 Wed, 15 Jun 2022 10:29:00 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:29:00 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 5/7] drm/bridge: anx7625: Register number of Type C switches
Date: Wed, 15 Jun 2022 17:20:21 +0000
Message-Id: <20220615172129.1314056-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
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

Parse the "switches" node, if available, and count and store the number
of Type-C switches within it. Since we currently don't do anything with
this info, no functional changes are expected from this change.

This patch sets a foundation for the actual registering of Type-C
switches with the Type-C connector class framework.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Move ret variable to Patch v3 6/7.
- Make error print a dev_dbg, since it is noisy.
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- No changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 53a5da6c49dd..e3d4c2738b8c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2581,6 +2581,20 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
+{
+	struct device_node *of = of_get_child_by_name(device->of_node, "switches");
+
+	if (!of)
+		return -ENODEV;
+
+	ctx->num_typec_switches = of_get_child_count(of);
+	if (ctx->num_typec_switches <= 0)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int anx7625_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
@@ -2686,6 +2700,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->pdata.intp_irq)
 		queue_work(platform->workqueue, &platform->work);
 
+	ret = anx7625_register_typec_switches(dev, platform);
+	if (ret)
+		dev_dbg(dev, "Didn't register Type C switches, err: %d\n", ret);
+
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
 	if (!anx7625_of_panel_on_aux_bus(&client->dev))
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index e257a84db962..d5cbca708842 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -473,6 +473,7 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	int num_typec_switches;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.36.1.476.g0c4daa206d-goog

