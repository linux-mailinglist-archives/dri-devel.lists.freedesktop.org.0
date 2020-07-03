Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB357213FEA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979BF6EBB6;
	Fri,  3 Jul 2020 19:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF7F6EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q7so24949919ljm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTVWqiM+BduXPJ5UHraanNT3752gujcMuWty5rcw5eg=;
 b=D7Ja3RdppZYNgVhoDnm+xi6k53gtN20Hp5ov4Ds/Aud82vjrjKwtdXAZEo4P+MQTIg
 fRN4zxHR8GfoNDLKVw34Uha15JiQsPF3E7t/X29ABWz2rNDZW4x+9JgDCAtfCrzZY5NV
 wJAU2D+GWtktk7y649Xt6Acllh1YShVDYaplL+woLSW9w/pjRVUydqX8+3ItRv44uUNw
 0cFGx2xhoy+gEiITBRNev2aAayhRXVMHhkb4Hgw+w9AqKQ/TfEQUMCBgyodtLhmQilDH
 7OcdGa2nGnXcOliuvzudws8yYPatL6QUTGoDboNHna2d/2b2XJ0N1JrMVEOQe8sFrzVJ
 ePmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JTVWqiM+BduXPJ5UHraanNT3752gujcMuWty5rcw5eg=;
 b=J60N7UUC13JfSFZmYd0XVTD1sOGhtKRzRDOjHE4gDVwkNvdBO1PtvU4/Mu5MkG9dMS
 ZbuogfKe24rCQHib9Lzzv+NJ9aw7dALoVJSfdi0jDZth2pAxwcBnhUQSk0rv86jmRZVR
 zBiFTmgEYyU8zIcI1gGhR8a8H4Ejba7fYdTv6sVQAOowow1rKzvgJDh0ujPx6JbXRhNz
 a1u/S5mAyjXBUHQ5/vJt16t+0Wb95wOFTzgU9K4rIgvR7mukyrmWnKavvIZ0jOJdIUX2
 70v3PsnWoU2AIMtUHjE1jEljwLJ8dXXuUmpSv9buV6xv3kgY6NVeFx/gEMv1hKABm6mY
 N2GQ==
X-Gm-Message-State: AOAM5336s35TR1UdGpxWZrDx6dL4pghiYWFBtyCUzPuMym3iV5YmlHeZ
 00qisD5jx+ouaPUX92J4k68JJVqsH1o=
X-Google-Smtp-Source: ABdhPJw681iNMMANohG3+mI5Qnm4pgJd1xB6GYXHDWDaPC/8q4wyZhl2u/tf7XvlrB5G/Pffvm60FA==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr18541373ljc.282.1593804273572; 
 Fri, 03 Jul 2020 12:24:33 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 08/21] drm/bridge: tc358767: add get_edid bride operation
Date: Fri,  3 Jul 2020 21:24:04 +0200
Message-Id: <20200703192417.372164-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for chained bridge with the addition of
get_edid support.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 85973ae728db..fb9d57967b2c 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1317,6 +1317,20 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 	tc->mode = *mode;
 }
 
+static struct edid *tc_get_edid(struct drm_bridge *bridge,
+				struct drm_connector *connector)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	struct edid *edid;
+
+	edid = drm_get_edid(connector, &tc->aux.ddc);
+
+	kfree(tc->edid);
+	tc->edid = edid;
+
+	return edid;
+}
+
 static int tc_connector_get_modes(struct drm_connector *connector)
 {
 	struct tc_data *tc = connector_to_tc(connector);
@@ -1336,12 +1350,7 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 			return count;
 	}
 
-	edid = drm_get_edid(connector, &tc->aux.ddc);
-
-	kfree(tc->edid);
-	tc->edid = edid;
-	if (!edid)
-		return 0;
+	edid = tc_get_edid(&tc->bridge, connector);
 
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
@@ -1452,6 +1461,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.disable = tc_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
+	.get_edid = tc_get_edid,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1685,7 +1695,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
-	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;
+	tc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
