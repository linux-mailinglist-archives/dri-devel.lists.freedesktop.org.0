Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255E22E28D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6289DBD;
	Sun, 26 Jul 2020 20:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA4989C55
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q6so15018688ljp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34/eXQ4tDZgqR/bq7lFsL6vM1XudODgIuh4eMcj7yBw=;
 b=jhJkTPjAnh9OIDsRUzfQsmZq5+/NxnXNYVkPef/QdYBJczCq/pSA3xZLgN2kyFCWBP
 59im+I26DxKZYB1ni4ErEmRo4RWKgA4w/vRAYNnPoTVpzI5yM9IWC3OtZeYjMLNCFJZY
 D/0+qFPg/TEgPCg8//xLoL3FNNKsIbEdARPNWZyg7U6EbSIMQiDu2yPEr3xTCQSObkZI
 0AKXGSzLzQmIzMxT7Hlw6Ny1UsGEKuFbwKdZ50OlWXSs9mDh1MCJSvij8OpZ5jDh9s5J
 H5PZCr0A1E0WbuqOyYgq83K4qRFm2j5YAQkRcNFD9XRbThFd7yG7GmS40soK77ouRHi2
 53lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=34/eXQ4tDZgqR/bq7lFsL6vM1XudODgIuh4eMcj7yBw=;
 b=e8OPTdZpRNDfw1M7+pJUD/PksRphR+nvKnSU2og27DGQDj0jm1EkE4lGd86B/Wa46r
 K8M8W2Hmpket+SWojDmEV/KtRYKfiX4YMmcK/dMTh/d42VqLXj/pStL1FK6CN3bVJN40
 aDADySyGsJ1OY813donkeeIgfaAbYr3UW2dyg7AhrcJSajnUtHeAIW6h6b6s746u6SOL
 2omHQ2BbNCSl20EDJb1cG69CWbBx/ReKhiXTpAqmFGK9re/1s3bxpidpm5BW2SyBL1w/
 UMIEmuxEw7KCQci+H8CHEGf/AVr8SvZ97mzzZDODV9ZX01JBicYfLd7/hyVbhbtheghT
 Tkdw==
X-Gm-Message-State: AOAM5324dkQYpY+anhg2+IVWGMThfyQUqOxJ9LqEcjKa6bVFj1VI58FE
 QYhhW8gvqiG6EMWIwppLDm6W8KurpHo=
X-Google-Smtp-Source: ABdhPJyHTeQpa7uBiddIqHl2cqnyFf+xBDYHXrZoIKxJBctTIaOT3ko9KNbhfkGJ2jMRK+lOX/F94A==
X-Received: by 2002:a2e:2a81:: with SMTP id q123mr8738050ljq.229.1595795618996; 
 Sun, 26 Jul 2020 13:33:38 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 05/15] drm/bridge: tc358767: add detect bridge operation
Date: Sun, 26 Jul 2020 22:33:14 +0200
Message-Id: <20200726203324.3722593-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kbuild test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for chained operation by adding
support for the detect operation.

v2:
  - Do not announce detect operation if there is no hpd pin (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c2777b226c75..e8ba713bedac 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1369,21 +1369,13 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
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
 
-	if (tc->hpd_pin < 0) {
-		if (tc->panel)
-			return connector_status_connected;
-		else
-			return connector_status_unknown;
-	}
-
 	ret = regmap_read(tc->regmap, GPIOI, &val);
 	if (ret)
 		return connector_status_unknown;
@@ -1396,6 +1388,20 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
 		return connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	if (tc->hpd_pin >= 0)
+		return tc_bridge_detect(&tc->bridge);
+	else
+		if (tc->panel)
+			return connector_status_connected;
+
+	return connector_status_unknown;
+}
+
 static const struct drm_connector_funcs tc_connector_funcs = {
 	.detect = tc_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1458,6 +1464,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.disable = tc_bridge_disable,
 	.post_disable = tc_bridge_post_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
+	.detect = tc_bridge_detect,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1680,6 +1687,9 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
+	if (tc->hpd_pin >= 0)
+		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
