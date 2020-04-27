Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3D51B99DF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9D6E0EC;
	Mon, 27 Apr 2020 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9716E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l19so16583591lje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dVCpJuXIjdYiyeM0xRpClT6FSdk8oCsw6TMHYEMUaYs=;
 b=YmjmkIiwq24gmCplfe4sZlenmfs9YxwNsdtX/zjwR960jTEE9xZ2pUH/JEMhUozUci
 +EZWTL1Bfqk+2aPJP/mIecQwTvmniLIcEXRdGjOMazi64uYtGAlMQgIMgXH4jAHLxH3R
 t6FIUpqXVBJOYZ+oPvlVKrorv7aakT55U3ZfAnuOmKNOC3caCAyLq9yUpyEPnbp0TqDJ
 crJ9FvE2NvsNNuBY+GoOgH+ZiwQfZ4CRaSQDRMcuweRNSF2im2O+6s+GZeGTgJpffDRz
 cGFFKYsioJVMtkF3/W0WBsYTPO7Kx8Nj77t63atz87Zbkm2MGnmkmm+o5dk156SQjGFT
 8SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dVCpJuXIjdYiyeM0xRpClT6FSdk8oCsw6TMHYEMUaYs=;
 b=f+NCgFR7kq9NLO3El2iyLqej8dDwYB1K+zeJarcHCzwb3+rMTrh/VNPsrcjNcwkaD0
 TN34YEJybhwMLUgzN3Tnw/wWSpyE4AySbmzuRE5cIsrkWLfHbhECmNCZSobi5Qka1k9R
 as4ohX3IsztzN4ftz6pE2mO2V6Ws29UdnsFb+aO6GDW4wamcdpQH+vM8L20Ad8vhhRNM
 y2/1REQHaDjGl2/y4OfCWra7xVDK0bA2C0LeKNqITCfFAIOi6+TtR+irQ7opZhb20J8i
 0wdf7VYNeNya3LkFXYZ7e6jyQC+yNFgs+eQ3P+BOIsWdm3neVOpeJDAHA7wYKQZeF9HY
 7mfw==
X-Gm-Message-State: AGi0Puae1/m0j+krCSE3LcL3ND14BF7WRvkbQZo9y+xROnZMhvDQpP01
 SjblgPk8LulKSk/foJEbsoj158Ua
X-Google-Smtp-Source: APiQypL/lisDqlH89Y56DgNeAdu9/PxMGe0W+lLdACDOrMZ+0Pkw0gXPzy9oFhubAddP64bxkJ5kcw==
X-Received: by 2002:a2e:3519:: with SMTP id z25mr11516123ljz.253.1587975550852; 
 Mon, 27 Apr 2020 01:19:10 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:10 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 08/21] drm/bridge: tc358767: add get_edid bride operation
Date: Mon, 27 Apr 2020 10:18:37 +0200
Message-Id: <20200427081850.17512-9-sam@ravnborg.org>
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
index 211a058c7243..42a153bcde64 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1316,6 +1316,20 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
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
@@ -1335,12 +1349,7 @@ static int tc_connector_get_modes(struct drm_connector *connector)
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
@@ -1451,6 +1460,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.disable = tc_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
+	.get_edid = tc_get_edid,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1684,7 +1694,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
-	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;
+	tc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
