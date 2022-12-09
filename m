Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A260647F4D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4910E4FC;
	Fri,  9 Dec 2022 08:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19C110E4F8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574831; x=1702110831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqS6Xix3Clyg7votbMt2p6Yj9UqNWGx8KsGGmFu1njk=;
 b=d+CVQoWQYYybvRKJwZDsKICME0oQ04wyiNw/VDRFy99gpCdonbmKJG7Q
 9/0cuaKcwSjg/ukOU3ETEuIGBekQwStJm9qdqstg6/QxYrv4nA3zN/wjH
 osni3J1GJiK/bfrn8bppOq0YLicruintGxy3Etv6JXKap8hheKOhM7urY
 lOismcjXZrfh++qn72prfj8AvltM5ZfssXxvmCtu1HoqbLzbXrQGVs2fI
 67tEWvd3/ASczogLynhXz6w62aWCrV/LQ17Zvls4TotmG/PqEspE5B7gJ
 8uliyhgMEfEZhqjsDIuz3pgxq+zLdeJTKnEA2Drlerg/amQdJzY5bWtvR w==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857153"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 09:33:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 09:33:47 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 09:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574827; x=1702110827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqS6Xix3Clyg7votbMt2p6Yj9UqNWGx8KsGGmFu1njk=;
 b=Am5kftNTRp0BTz+5bYbsD4OA4l6eRe7WsKsPsUiEnN1IFwoPDtYbsqsU
 rc4fyuORBviRvxDZ3u5+50l0f5HkynzWZWC7t+MjkvscbNPxYMw60M3e1
 9QYFGXCagPHpS7T2d86uvLtxAYMv/OWBRhZkMIwiR3+IzFfZiLW38w5TH
 I8YWxKXj2QmEyA6Zz1YzlhyklyhW2tJVgaGLA6Ct75mlpUxY6UCgaRqc/
 SUm5CEUGHWnljyFN0zqfksMv92Tt71pzsD0bnnC2N9+Ej9uiIocyb28ru
 GOXC3p5IYpz9BPy+TLufddmtxfwRjggH/FLgei3XFZhgNdhceZMzfhBae w==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857149"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 09:33:46 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 12E21280073;
 Fri,  9 Dec 2022 09:33:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add enable delay support
Date: Fri,  9 Dec 2022 09:33:39 +0100
Message-Id: <20221209083339.3780776-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It takes some time until the enable GPIO has settled when turning on.
This delay is platform specific and may be caused by e.g. voltage shifts,
capacitors etc.
Fall back to current default if not specified in DT.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 047c14ddbbf11..6510ee384315e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -145,6 +145,7 @@ struct sn65dsi83 {
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
+	u32				enable_delay;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
 };
@@ -346,7 +347,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 
 	/* Deassert reset */
 	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
-	usleep_range(10000, 11000);
+	fsleep(ctx->enable_delay);
 
 	/* Get the LVDS format from the bridge state. */
 	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
@@ -603,6 +604,10 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
 				     "Failed to get supply 'vcc'\n");
 
+	if (of_property_read_u32(dev->of_node, "ti,enable-delay-us",
+				 &ctx->enable_delay))
+		ctx->enable_delay = 10000;
+
 	return 0;
 }
 
-- 
2.34.1

