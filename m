Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D132E4EDC5E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4C10F349;
	Thu, 31 Mar 2022 15:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F1010F23D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:05:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F1CC784225;
 Thu, 31 Mar 2022 17:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648739141;
 bh=uag0JRVOByh0KjpfH3kVdfrKkkq/vAtHzgOLClHmy+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zh0x8N4xMGUFtWxrRmnsYAxJuFilo/Y6S1Qm6QhWBOBK8Pih8RTFgoh8RrWA6/FGJ
 za1Q9vms9bRGDkoG3+tYcSoa13LZwwVc5WhKVleUobyEEidiWbpkS5QscrgkpJz8Kw
 1sRk5E2Q45LIZsFBa038RrM2Om7LgAQlNnV5aXKjqEuP5GbEVENxBdAaXnfzu1xFkS
 d99mKKFuHUL9u9qmARyKjMBSjZOo1NaHJ+IxCP5kmvLpjzN0UEZLzA1ANX+hl/5OpV
 4I6ywf6wlm7bjDKRBgvoMSU75sIwaihdIvrjORHNOOMzRaNybR0h5FmqhvJMNiSbbI
 O6Pu8I/yTvPeQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/11] drm: bridge: icn6211: Use DSI burst mode without EoT
 and with LP command mode
Date: Thu, 31 Mar 2022 17:05:03 +0200
Message-Id: <20220331150509.9838-6-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331150509.9838-1-marex@denx.de>
References: <20220331150509.9838-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI burst mode is more energy efficient than the DSI sync pulse mode,
make use of the burst mode since the chip supports it as well. Disable the
generation of EoT packet, the chip ignores it, so no point in emitting it.
Enable transmission of data in LP mode, otherwise register read via DSI
does not work with this chip.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
V4: No change
V5: No change
V6: No change
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index d4a52176814c..e3a7b945a0ef 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -464,7 +464,8 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
-- 
2.35.1

