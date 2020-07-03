Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215B213FF7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAFA6EBC3;
	Fri,  3 Jul 2020 19:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493A46EBC1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n23so38240225ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2awxpQwNdgliNiuyXwBUPI0+3Y9fl9Ao6gbJ2At26g=;
 b=FGm5BDJk5LnvGPrNimY/fzvo7CfLlZhTmykLykjHMKLdKYfM50ukl4toWyrIL2bbgG
 nceNIXKi9cpjYu03KPwcoN0iv8k+AoBgEZrYDN/Iz3+/pwDqWndv83B80bQvabwF1MHn
 oE0V4SC5H3yZOyRUY4OFR3lep17273NaNn2VsDfR5klNEd8/mtQ8Wf5WxYCi4K8Xwyln
 KMxjLnMzOvtJfrZ154cGmmgg6UJs0YSi7lLErWYCZHjGyOaAPwYRrFXxO9zAptJ61egX
 PlqkuNdkh2Iqe6OdhNEMRH2aspCR7dgtDq53ThasM0v7pL9+j17qFGsNUOdQNxU+8Tr+
 ivnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E2awxpQwNdgliNiuyXwBUPI0+3Y9fl9Ao6gbJ2At26g=;
 b=kMMR07D0Qh8ojT2vtrgnwuH4bGs1H8wO1vofX3Mj0qlAuh/hP+9PhYrDQ3UTICpaFo
 o3F23kD3eQIleRDiVK2qe8QhfsepFE3M6rZe5nuPUMuYsEERqCiiiGSHUmbeZz91GBW2
 kJRL+znKV2dtlCMWxREE4WH3NhU8nKsBu9qnCVSKh5IkQrT8IOrvzD1fE7Jg+qscrJo5
 bEegbHyrmhFYH/LCUg2YU5X9WUM/z3qk0cLUblN5W5+HH8HCnCL6Co0g/OLZ9qBAxoJv
 SeoxnIUA2S273oO4fAdyUg7/Wiv360aATu1uJE9eWJ6c0qXhG8vfBIKtoZ/rluqiCRem
 cIBA==
X-Gm-Message-State: AOAM532bHHjt1EPIvz/w/u356RpUUEO+ORh+1Q+lZjaym5lEWaIrqhOX
 EfUoMlPMNwdOxujCElmpC8pOfRxM7BA=
X-Google-Smtp-Source: ABdhPJxzddOVjCQQAkP9oHNDpS30Xaw3EZpOvWuHRbBUSK/ADv8qS4sOvhDKD28zfXE147aA4AZLWw==
X-Received: by 2002:a2e:7e08:: with SMTP id z8mr15942295ljc.66.1593804284566; 
 Fri, 03 Jul 2020 12:24:44 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 19/21] drm/bridge: nxp-ptn3460: add get_modes bridge
 operation
Date: Fri,  3 Jul 2020 21:24:15 +0200
Message-Id: <20200703192417.372164-20-sam@ravnborg.org>
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

Add the get_modes() bridge operation to prepare for
use as a chained bridge.
Add helper function that is also used by the connector.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 52 ++++++++++++++++++----------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 0bd9f0e451b3..e253c185f94c 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -154,17 +154,13 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
 }
 
-static int ptn3460_get_modes(struct drm_connector *connector)
+static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
 {
-	struct ptn3460_bridge *ptn_bridge;
-	u8 *edid;
-	int ret, num_modes = 0;
+	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	bool power_off;
-
-	ptn_bridge = connector_to_ptn3460(connector);
-
-	if (ptn_bridge->edid)
-		return drm_add_edid_modes(connector, ptn_bridge->edid);
+	u8 *edid;
+	int ret;
 
 	power_off = !ptn_bridge->enabled;
 	ptn3460_pre_enable(&ptn_bridge->bridge);
@@ -172,30 +168,46 @@ static int ptn3460_get_modes(struct drm_connector *connector)
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
 		DRM_ERROR("Failed to allocate EDID\n");
-		return 0;
+		return NULL;
 	}
 
 	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
-			EDID_LENGTH);
+				 EDID_LENGTH);
 	if (ret) {
 		kfree(edid);
-		goto out;
+		return NULL;
 	}
 
+	if (power_off)
+		ptn3460_disable(&ptn_bridge->bridge);
+
+	kfree(ptn_bridge->edid);
 	ptn_bridge->edid = (struct edid *)edid;
-	drm_connector_update_edid_property(connector, ptn_bridge->edid);
 
-	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
+	return ptn_bridge->edid;
+}
 
-out:
-	if (power_off)
-		ptn3460_disable(&ptn_bridge->bridge);
+static int ptn3460_connector_get_modes(struct drm_connector *connector)
+{
+	struct ptn3460_bridge *ptn_bridge;
+	struct edid *edid;
+
+	ptn_bridge = connector_to_ptn3460(connector);
+
+	if (ptn_bridge->edid)
+		return drm_add_edid_modes(connector, ptn_bridge->edid);
+
+	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
+	if (!edid)
+		return 0;
+
+	drm_connector_update_edid_property(connector, edid);
 
-	return num_modes;
+	return drm_add_edid_modes(connector, edid);
 }
 
 static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
-	.get_modes = ptn3460_get_modes,
+	.get_modes = ptn3460_connector_get_modes,
 };
 
 static const struct drm_connector_funcs ptn3460_connector_funcs = {
@@ -249,6 +261,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
 	.disable = ptn3460_disable,
 	.attach = ptn3460_bridge_attach,
+	.get_edid = ptn3460_get_edid,
 };
 
 static int ptn3460_probe(struct i2c_client *client,
@@ -304,6 +317,7 @@ static int ptn3460_probe(struct i2c_client *client,
 	}
 
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
+	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ptn_bridge->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ptn_bridge->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
