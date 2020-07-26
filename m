Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF3E22E290
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC746E06E;
	Sun, 26 Jul 2020 20:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A776C6E059
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so15001784ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOZbsQZpgjOycHk0tiCVZFPbraV+pXlHSxRel9UQjHw=;
 b=R3LgLSBLNnSVekabz3NBn6UpXchETW8u2hZ0FMZZToNx5fhFa0WnqWmjVInCrP+Vgl
 fUyJn7d6e5L+3yVTQOoixO9IAHuGRib446OZs6UrFUy8187IbrcH/cMXpFl71uX7xKE+
 4TWdllZKIpmYUQ12Bwp6DXhIgDEhpKJ0+ru35eSbwJn0/uzsVa6C4VuNMy7DeYpU7Hep
 zdzV9OefQ1n3wtsSIXZxgakEloNednjitzIh+nH4XMSzxr5ooU4D7xUZVihtSSR+yVxl
 8cYDcGA2FK6k9WNbpT5ChtYRQ185V6uwbd1v338idDq7/nh3fGQrae5RTOIYvcYT7dzB
 1S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nOZbsQZpgjOycHk0tiCVZFPbraV+pXlHSxRel9UQjHw=;
 b=igK92gbHg8B5K11oo0vog1dG7Q2Ep6oN4HqCMa99TRdQdU4rkLyB2+9XddKyyNvqz/
 33QXuBVKw1Uv6Y25uBF6ZgFmBGSZL3H+qqoiC/b5f9E5zKu0SbuuO1MnJ/+AwATEaXkJ
 yZ85t+exEQTS3rK3MPQ8sfz41xPL4iH1lj18Cp2kN6tFDm9FDta4ACyCAfKiLUCwmSC2
 cIDW5tj98Z2BgDQTml8BoePwWaxLn401QywVOnZECCIkHzHKAhLnFkoslJBSXzoNuVf+
 S50rKux9hJOpfrcnflCPBbFdbKuJwMIbC4+YQmLNfq+lb6MUOjpOaLjpZl5N2hMzlReC
 D81w==
X-Gm-Message-State: AOAM530mhr5VB531+mSuIV/9GMmm1iUeVIBT3w20IMMUsvLwXrVvWWO7
 NFFev9xh2X4w1BHfP/POvB0+WSwn1s4=
X-Google-Smtp-Source: ABdhPJxNfh+FsCl4LP32/OHq5e6vWYeul6tsXlIbCZ5ob3aCv6EkElOQd9AQQ+Jt+f8MW3DDcjejWw==
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr359850lja.191.1595795624945; 
 Sun, 26 Jul 2020 13:33:44 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 09/15] drm/bridge: megachips: add helper to create connector
Date: Sun, 26 Jul 2020 22:33:18 +0200
Message-Id: <20200726203324.3722593-10-sam@ravnborg.org>
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

Factor out connector creation to a small helper function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 47 +++++++++++--------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 6200f12a37e6..258e0525cdcc 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -191,6 +191,32 @@ static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ge_b850v3_lvds_create_connector(struct drm_bridge *bridge)
+{
+	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(connector,
+				 &ge_b850v3_lvds_connector_helper_funcs);
+
+	ret = drm_connector_init(bridge->dev, connector,
+				 &ge_b850v3_lvds_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(connector, bridge->encoder);
+}
+
 static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 {
 	struct i2c_client *stdp4028_i2c
@@ -209,7 +235,6 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
-	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
 	int ret;
@@ -219,25 +244,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(connector,
-				 &ge_b850v3_lvds_connector_helper_funcs);
-
-	ret = drm_connector_init(bridge->dev, connector,
-				 &ge_b850v3_lvds_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	ret = drm_connector_attach_encoder(connector, bridge->encoder);
+	ret = ge_b850v3_lvds_create_connector(bridge);
 	if (ret)
 		return ret;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
