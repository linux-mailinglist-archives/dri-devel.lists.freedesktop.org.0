Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BA48E311
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026710EB85;
	Fri, 14 Jan 2022 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05910EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:49:01 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 99B4180D1C;
 Fri, 14 Jan 2022 04:48:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132139;
 bh=sBnk+YNwAWXkfpQkEZOFkRVKvigBFxFWh7NDBNA7c3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lin0xAASdoC23lHMrnEZbwvJ8+VeY4jVtgMaRhAH2Sk/qK7hcCPS8mYpIZO+OvtQn
 jGCjH1SkNAW5aJax+D7Nwe5wxvKZjh7xholpzQX15j0HuXTEFY9dlvW6wRIETdZJIW
 xvGXTL6UL6mh26j9qQJqFwaeBrwLTqze7sT9gJIXHuYExR8I4b+2dxXr6wQ7tWvXo5
 zFxblOSg0oACEOtZiNUXPdPJpQaCtn800UdOQBQSMCYdZzHwk+Y2nEEbgD4Evf9XTo
 1dXGBrOIcoNkTjbI2YUhTG/fBXV8O1LLipa9WrlYLMmaGnuDaXoxv/GWLCRCcEqB6i
 LBeuyTMRZ8V3A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] drm: bridge: icn6211: Use DSI burst mode without EoT
 and with LP command mode
Date: Fri, 14 Jan 2022 04:48:33 +0100
Message-Id: <20220114034838.546267-9-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI burst mode is more energy efficient than the DSI sync pulse mode,
make use of the burst mode since the chip supports it as well. Disable the
generation of EoT packet, the chip ignores it, so no point in emitting it.
Enable transmission of data in LP mode, otherwise register read via DSI
does not work with this chip.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index aa58f957651e2..6daf2f8013733 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -529,7 +529,8 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = icn->dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
-- 
2.34.1

