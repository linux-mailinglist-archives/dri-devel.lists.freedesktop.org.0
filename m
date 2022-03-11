Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFE4D69D1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC4910E661;
	Fri, 11 Mar 2022 21:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0521710E659
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 21:03:05 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D87B683A42;
 Fri, 11 Mar 2022 22:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647032583;
 bh=XQbx4XN5TkhEiS6N4lJYkAmGzRtHqicZuUteBisTiJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sXsisB4rE3krfHSjq4RLWs5s7yEAmdd5fIFBSG/JG3XhtvPFIOoQLHADYeHelAsuc
 CT5g8pz3z6diAxiEQ1hNgbfoKODDu+TW8muPx3Dwm/SNOzsbAp3TTMYiJ4BxU2NXxC
 W/bHlnjElGmOeVGlfkTGGSjfmUQS4UTKtdGX9QjFcGCcSS2mHMwS3jP4psuYCN+7QZ
 eh1aKP1T8Ys/VM/mtgdT2FqTNbIo8Fw7UAIAg39BTZrx1OXNMWUPqNN+IJ1rj2BpkM
 oQQIN1lBA2Qp2V0FXNJV68wIAnXU5UwzGMsLDYHQI8xknrSa0H792FkR1Uz6J7SbZF
 lUJHmWQkMUSdQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/13] drm: bridge: icn6211: Use DSI burst mode without EoT
 and with LP command mode
Date: Fri, 11 Mar 2022 22:02:21 +0100
Message-Id: <20220311210227.124331-8-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311210227.124331-1-marex@denx.de>
References: <20220311210227.124331-1-marex@denx.de>
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
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index c838d25c96ce2..b3212f3387615 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -485,7 +485,8 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = icn->dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
-- 
2.34.1

