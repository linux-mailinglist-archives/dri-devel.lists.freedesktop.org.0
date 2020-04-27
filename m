Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7321B99E1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38B56E11E;
	Mon, 27 Apr 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B916E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u6so16571228ljl.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRjCsCOLv/8Q3+8X5xaekVJTggWTYFdPo6SBBlHW/8A=;
 b=XiIObgnMqpaRwncCn9IoRFMRlRR8YsG1sLe+hCH7j2GoTRMPOVRqujHLttTpV9e/Ja
 w9lbhHSEnJffSpYTalVylCL6AeYn2nLnY65R6oF0nVyUuk2mM4eCFxH57A1YUNM2jwsA
 +O1f5LeDxcZrC5YUk/MYyJuDxqVwYJSNO8d7uLxREHofTnZXrN9J5gODI4sJ2D4jT47r
 VJcdzJjwNZcEn/snjcTitGhFatx7uluuDbAP5AMhQ2YsrZp5J1ONNAj7+lkVSYNpBSQm
 saKs6L2pJuPWIE+tW4pIAMcNE1CpZFBNJVwpRaDGWrr00RbHN25UIcy6mU0YsnocIsHZ
 IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JRjCsCOLv/8Q3+8X5xaekVJTggWTYFdPo6SBBlHW/8A=;
 b=LKF/NZKpBOWq9SS0KJAdQxObFOOK4yPgaqJzpo6ihRqt57aQ+jhIfTlgnokSypqTug
 zONZ72lvYU/xDur8Ozv0rHsFN4fx0X0e6RHEB629QGd1/5TXes5906zzgh870XDVCwn9
 4lNL1urfqDsbYzpA6bFJ7brpzn3kC515nRPi1Fi7NBtl9BbLkc9EjS4TIHx8wGKiZ6JV
 b6zbCfF94Pph1GyFLYnKNx0uSZRHKv3yWRcAeY6MiaT2OCZqFAj224Zdpt/QPnuZOq91
 wqaeZ13H0wbPAGbe2c9+ZD2J9JgY47aCe81lEU8A98bZRSeh657EPM8aeQh/PSIWlIBP
 5hiA==
X-Gm-Message-State: AGi0PuYmawxROEXPs2LnSAKIi9MeaoOBueZA8UnGdVgPG8xQHhDl3MMD
 TtEL5FAxEfjDnOPbZu2/O+VUBfVl
X-Google-Smtp-Source: APiQypKGuFxRLJcLYO86s3L1rQr8s/2UBCZd50C2JT4mKtQlwmVu1BDtHU4bFZXpHCjGgeMllQfG0g==
X-Received: by 2002:a2e:b885:: with SMTP id r5mr9665816ljp.118.1587975559737; 
 Mon, 27 Apr 2020 01:19:19 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 15/21] drm/bridge: megachips: enable detect bridge operation
Date: Mon, 27 Apr 2020 10:18:44 +0200
Message-Id: <20200427081850.17512-16-sam@ravnborg.org>
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

To prepare for use in a chained bridge setup enable the
detect operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index cf1dfbc88acf..78a9afe8f063 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -163,8 +163,8 @@ drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
 	.mode_valid = ge_b850v3_lvds_mode_valid,
 };
 
-static enum drm_connector_status ge_b850v3_lvds_detect(
-		struct drm_connector *connector, bool force)
+static enum drm_connector_status ge_b850v3_lvds_bridge_detect(
+		struct drm_bridge *bridge)
 {
 	struct i2c_client *stdp4028_i2c =
 			ge_b850v3_lvds_ptr->stdp4028_i2c;
@@ -182,6 +182,12 @@ static enum drm_connector_status ge_b850v3_lvds_detect(
 	return connector_status_unknown;
 }
 
+static enum drm_connector_status ge_b850v3_lvds_detect(
+		struct drm_connector *connector, bool force)
+{
+	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge);
+}
+
 static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ge_b850v3_lvds_detect,
@@ -263,6 +269,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
+	.detect = ge_b850v3_lvds_bridge_detect,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -317,6 +324,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
 	/* drm bridge initialization */
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
+	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
