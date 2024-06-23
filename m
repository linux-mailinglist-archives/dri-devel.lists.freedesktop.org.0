Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41E0913BCE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10A10E0B5;
	Sun, 23 Jun 2024 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="SFprlq73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F396F899E9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:39:11 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AF7918785E;
 Sun, 23 Jun 2024 16:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719153550;
 bh=2yevWxu9JNU5Upe6HBwkstsbv88AuAP3nQmwmlNt/uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SFprlq73WqRqkP6NENUajVQQ0b09KohMeO996PeTf/FNnE+OXZx1ELOWyTnJYxDrw
 njIOETg9nJERqTWJt9MPQB03l8OgyzgznSxE6j9TnVTB6VtMcmeRo1BtHm3zKsfvr7
 c4CUmc0Gy5w9UnRQRnB559pjdW43YOfxFmUtwOT0ACB+Qjp0E5kGupu1SLrpXxpyEp
 hs05qiwzCy9ds4NGjU3Bqk/i27zkX3zqIL/svN51s5tYi/IOi1hWW3Qb1COFpN4tVZ
 UXIgXfKle++w+9QyjTdTCf6+xvfTU8fvvcGnvdmsEKdCjfctBt0hsp9KJfjYVEhCDg
 4a6QaP0AQsh7Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v3 4/6] drm/bridge: tc358767: Disable
 MIPI_DSI_CLOCK_NON_CONTINUOUS
Date: Sun, 23 Jun 2024 16:38:36 +0200
Message-ID: <20240623143846.12603-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623143846.12603-1-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI_DSI_CLOCK_NON_CONTINUOUS causes visible artifacts in high
resolution modes, disable it. Namely, in DSI->DP mode 1920x1200 24
bpp 59.95 Hz, with DSI bus at maximum 1 Gbps per lane setting, the
image contains jittering empty lines.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: No change
V3: No change
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c4e2455ad95e4..a48454fe2f634 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2303,7 +2303,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+			  MIPI_DSI_MODE_LPM;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.43.0

