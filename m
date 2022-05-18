Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850C52C7DA
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 01:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1275310E5DD;
	Wed, 18 May 2022 23:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B6110E5DD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 23:38:58 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0860180179;
 Thu, 19 May 2022 01:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652917137;
 bh=SFPakd09zKwAkoIuHkDa3UA436hIUultR7zG/51Cxyo=;
 h=From:To:Cc:Subject:Date:From;
 b=0HWw/9Dea5XvtUTNWAoV8yca4ABFlTwr4qeXZBlPCVbtBZLPtPHwMj0g+OL/ZGNEX
 K5Qhcc6gVOjF4jTl4NLqoN38V5nCzleCwNsoanx/hNOhcFBDCT/URihT59IskqWo8N
 7jN515t+7mXoSK0IQZ1r32lVKqqOCRnW2iHD9oTWeCGMNc3pofGYsc+W9OTOjYObbi
 B7+Slaytgf1LGSic9qNujsbnbNc6NWeCFFFU6Het4K1/rSb4IOEewLYAd7NbQX2iB2
 rh4yCBmSuMEBFIuOdFFZKKkbRfuhvi1xUkjq4UUsx+6uIwdnKnk4FUoRNPlQ7G0dlR
 OFGK3cLKzS8Jg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
Date: Thu, 19 May 2022 01:38:44 +0200
Message-Id: <20220518233844.248504-1-marex@denx.de>
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

Fixes: ceb515ba29ba6 ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
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
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index d64d4385188dd..dc65f424e7f3c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -585,7 +585,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	ctx->host_node = of_graph_get_remote_port_parent(endpoint);
 	of_node_put(endpoint);
 
-	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
+	if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
 		ret = -EINVAL;
 		goto err_put_node;
 	}
-- 
2.35.1

