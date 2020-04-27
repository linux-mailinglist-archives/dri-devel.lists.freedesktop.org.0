Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEE1B99CE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39626E101;
	Mon, 27 Apr 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151656E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l19so16583553lje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VP2/278WkYO+H5RLQTt421elIwxLMbKbJ63B0FTUyV0=;
 b=Qr5yPM5Tp1VD4vDkaFAInWcO8l4Ohaw+Y0chgrNMgtDFtsAv4TGzWnqWPV97HJnh37
 QNVvz7aC9KKK7MAbWUschLnfAQ/tLk0Ychq5Hg8DoIvMxWmUJ8CtdvZz79DvGir2DAnp
 FL2mqSYkm6d1quIBo/T+eB67mBxC04oMKsGDFIJXSttEZLst0hRxEdjM8YD12p8HpqC9
 DwutinImymDbwZwHete+/kGPzmAFlGtWWRRRWABmumf27D3IT/jWzHRtlFG3Si8pKuhs
 5lfUdDRJmlqiD3Ril20yUHQQqNdKXJfaUJ1QmEvTrvoKMKq104L/FHUpyrU9yLnwfujT
 VEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VP2/278WkYO+H5RLQTt421elIwxLMbKbJ63B0FTUyV0=;
 b=SmE+qxOXUlShMdtOGaICh8WMaRLVywMUHtfytjrFWsQjpYpnaoNe4j6jwxAXtiyQis
 lT5u0FvTmTRzkmFTiDv9mVDAqs+4yVNiw/Cn/QGZr3kFovRFhWuZBxbJdo0E2C+VuMyt
 2o5bgpX7EMySdkDuibsw7bY7HjLcJ1u37TsHKiiKNd0DBYmwpG95S00teaYGYEFejhD/
 2nwtqoTs4B6XgRK9PQja5jghzvVa+5sCfCu0WQf6ly98k8/XnDZi2RccG0eD23Y9Yq/V
 b56qPMq4ICWWmEY1IiB+s+gD1zYCpKsMLv1IJ8Lwq2US+jp6dQ+o2c3ezqTK6Y6J5pmI
 3y+Q==
X-Gm-Message-State: AGi0PuaXH6XjyLWgLonV21Ey6EFv8p0uW6PgqBkYzfEzDy8E+JGwknpb
 xK8q76mapHycsP2rupAMEY4P9tEq
X-Google-Smtp-Source: APiQypIrVXubIzogZX7uRvleXMHNrG2btXi9VN+Soec0bVTc659z7nVQtduFUpYH+YH+u9KitgF8aA==
X-Received: by 2002:a2e:6c16:: with SMTP id h22mr12560899ljc.30.1587975549643; 
 Mon, 27 Apr 2020 01:19:09 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:09 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 07/21] drm/bridge: tc358767: add detect bridge operation
Date: Mon, 27 Apr 2020 10:18:36 +0200
Message-Id: <20200427081850.17512-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for chained operation by adding
support for the detect operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 51f80ded6235..211a058c7243 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1352,10 +1352,9 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 	.get_modes = tc_connector_get_modes,
 };
 
-static enum drm_connector_status tc_connector_detect(struct drm_connector *connector,
-						     bool force)
+static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
 {
-	struct tc_data *tc = connector_to_tc(connector);
+	struct tc_data *tc = bridge_to_tc(bridge);
 	bool conn;
 	u32 val;
 	int ret;
@@ -1379,6 +1378,14 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
 		return connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	return tc_bridge_detect(&tc->bridge);
+}
+
 static const struct drm_connector_funcs tc_connector_funcs = {
 	.detect = tc_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1443,6 +1450,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.enable = tc_bridge_enable,
 	.disable = tc_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
+	.detect = tc_bridge_detect,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1676,6 +1684,8 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
+	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;
+
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
