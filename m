Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19769DD44
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 10:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA6310E0FE;
	Tue, 21 Feb 2023 09:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5729910E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 09:51:46 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u14so479508ple.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KG6QSJbypzUGB5xaZ21VNAzG0yHFxcV/96+5oqf9BzQ=;
 b=KuyVVTOClmKqZW8WOr08nnolQpZRXrV9mpvaydXdCafjx1XTd8QTNHjiB6gl3bvV25
 QWfK8U/aSXWzvNTZptHA30lkxH1wnE0LxABcxEY5W4WJu6VRbDTmZeJKsL4ONKDDtqhp
 q0gLLqrqiv/v6yV2v9NMuou9AOS9KoGQEq8ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KG6QSJbypzUGB5xaZ21VNAzG0yHFxcV/96+5oqf9BzQ=;
 b=oTDTwyGUj0PSepSWjfYg3jpgYtD4zmLCCDRuYZMRfGshqPxezgtq73gBGfKljEw22Y
 A8C41mnWiTRQJ1p9xWl8WEaaSwUooMS9ax0KokORHtJ2XDkyETGXRVk2E2sbqbp89gPc
 CP3+oahVvVuDcc/1kUM/mF6YAMO03/FsTEEdsVzcHG79kif5EtrpLduPqnuR5zD7YTMH
 86rKyJjw5fc1jUi8UDNwjjMnCXqBeEi89jhD2Z3dgrndhFxUK9rYCo8ZR7PB2amQVXXS
 IfsuMHIvx4wTtnfJCQ8VLgsVMYdGwDnXW8iirPFD4vqkpXbAe0rJRJcenkEQHcs7cgPO
 FuBg==
X-Gm-Message-State: AO0yUKXgbkHs1F31krlPB+finXoFvLttuDP6l0NiGTtuPBXpaboU/UQ2
 Y23WgDiArMuz7P8RH7QAReMX6Q==
X-Google-Smtp-Source: AK7set83merWWBZBGuzCzPIekx2EVTUiErZDikE4N3fOkXMpulNW3ufMoGkyxAWm4YPtCanMcw6blA==
X-Received: by 2002:a05:6a20:914a:b0:be:d368:5c7f with SMTP id
 x10-20020a056a20914a00b000bed3685c7fmr15892164pzc.41.1676973105963; 
 Tue, 21 Feb 2023 01:51:45 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a1f5:f58d:584e:5906])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:51:45 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v12 05/10] drm/bridge: anx7625: Check for Type-C during panel
 registration
Date: Tue, 21 Feb 2023 17:50:49 +0800
Message-Id: <20230221095054.1868277-6-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The output port endpoints can be connected to USB-C connectors.
Running drm_of_find_panel_or_bridge() with such endpoints leads to
a continuous return value of -EPROBE_DEFER, even though there is
no panel present.

To avoid this, check for the existence of a "mode-switch" property in
the port endpoint, and skip panel registration completely if so.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v12:
- Updated to use fwnode_for_each_typec_mode_switch macro
- Dropped collected tags

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6846199a2ee1..486b5099f5dd 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1648,7 +1648,8 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *port_node;
+	struct fwnode_handle *fwnode;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1687,6 +1688,16 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	/*
+	 * Don't bother finding a panel if a Type-C `mode-switch` property is
+	 * present in one of the endpoints in the output port.
+	 */
+	port_node = of_graph_get_port_by_id(np, 1);
+	fwnode_for_each_typec_mode_switch(&port_node->fwnode, fwnode) {
+		fwnode_handle_put(fwnode);
+		return 0;
+	}
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
-- 
2.39.2.637.g21b0678d19-goog

