Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE947320CB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998510E536;
	Thu, 15 Jun 2023 20:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775710E536
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:19:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A834586167;
 Thu, 15 Jun 2023 22:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860357;
 bh=P9iXJviGZ5J3NqHCLPEh5LPn+kpMEUWD9kYTEe3hTgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GzAOlnvUov4w2dReQzMgGIfofKYb33FwoAoJEZGtA9esMToQZUmL/Bwu/Fo4OOhB0
 IFY9E1U1v3xT38s8cotzzsFYXwXFUtoultQFblazEQ1qHWzqwJPK2DnPyUyV+3msbj
 FgokEPBkHvwiPIlvzbQM34noHUro1jXICbMD46/L7HSzqsv28ppJHqEEonsAjRK/lr
 8AC6eSOls0sl7DjnFGEFR/aOQk/DATEFcx8rl1eGHXKop1G2Af1guN22TPkseOsQOz
 2JIinrsUHm5bEspArvxWEWjeVTpLLDN+4AWPw+A9nN9Rf5ORzP3KMEggl1OG6oQskb
 wNghI5MbMd93Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/bridge: tc358762: Instruct DSI host to generate HSE
 packets
Date: Thu, 15 Jun 2023 22:19:00 +0200
Message-Id: <20230615201902.566182-3-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bridge seems to need the HSE packet, otherwise the image is
shifted up and corrupted at the bottom. This makes the bridge
work with Samsung DSIM on i.MX8MM and i.MX8MP.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 5e00c08b99540..77f2ec9de9e59 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -241,7 +241,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_LPM;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO_HSE;
 
 	ret = tc358762_parse_dt(ctx);
 	if (ret < 0)
-- 
2.39.2

