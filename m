Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359452C79E
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 01:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A6F10EA94;
	Wed, 18 May 2022 23:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A3410EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 23:36:25 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7994883B46;
 Thu, 19 May 2022 01:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652916983;
 bh=OTghdqOx7JNAymlUAzuOnYDTk4dqIYnAqyVbpJHr7pU=;
 h=From:To:Cc:Subject:Date:From;
 b=Px87mgPlv4u7jl0VMjTYB9aQAh2M/0Myjb3FVxcAxzJLdZBOJSd7lGyvMunEZzlGS
 b1CpePvl5HxxLcQcx8HiYMu+9FaG0tegaqp2OqR9VnsBvAgd6zuvF4ab8V1bvMDMSp
 NoweViBIxEEbBtsLVDZpJxA8qPTgsKgleEJIy0h6LgQTU+JUyTS9/96iMDeC4KkbZ5
 s3LIOIs2OoHgcMwbNdQsz+9m3k79gAfaw5K1FlUtFKfu7/0ma142QS6ZU0aL/lLQL4
 wIUux4/3l55tGzs3TnxyzNNhnrV7v5sqzovmIXDS+hNBBONBm17J7wsJro/Tb4erfN
 eCStoLkIRN1hQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
Date: Thu, 19 May 2022 01:36:00 +0200
Message-Id: <20220518233602.248185-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle empty data-lanes = < >; property, which translates to
dsi_lanes = 0 as invalid.

Fixes: bbfd3190b6562 ("drm/bridge: tc358767: Add DSI-to-DPI mode support")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7366968dd7b21..84e6b5aa8dd1f 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1902,7 +1902,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	of_node_put(host_node);
 	of_node_put(endpoint);
 
-	if (dsi_lanes < 0 || dsi_lanes > 4)
+	if (dsi_lanes <= 0 || dsi_lanes > 4)
 		return -EINVAL;
 
 	if (!host)
-- 
2.35.1

