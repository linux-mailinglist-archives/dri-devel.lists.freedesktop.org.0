Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C594B94F3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5710E6A0;
	Thu, 17 Feb 2022 00:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93B10E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:56 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C6C4F82148;
 Thu, 17 Feb 2022 01:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057555;
 bh=bqToU5+PbxYVzrJXIvQWF0mHiqZzYWa1q7R1M9IYA+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMPl/ffz493ELNcY9YF9jOhholkNORB0WXEBkX/UxG4jLTlmRlh0JpYvM/vfag8Nb
 G3aI83AurjnsF4asFVFzAEV1bgH5OLoN0Tb8KYz+wAJQ4i7HRNFUolK1zQnkUkGAdt
 7K0Z3nJYdGuOc4JdnYdbs5CrLGOlZzy/f4B3NzOkIGVnskzTvku9C8wsBDQY7A4Nlp
 LAk4nQtZACyXyVCsgj7QJPqrbsspo2C2G/gU2RGgfvGMQ9taingLnZT25/P5xgDrYO
 HWWYBPVVxi1MEyXzCOkhr3VMNWqKOXwuYY2Xm/v2ciCyYJmwD5c/CMwnJBghlyy7D8
 /KCBXrAeRfH+w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 06/12] drm: bridge: icn6211: Use DSI burst mode without EoT
 and with LP command mode
Date: Thu, 17 Feb 2022 01:25:24 +0100
Message-Id: <20220217002530.396563-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217002530.396563-1-marex@denx.de>
References: <20220217002530.396563-1-marex@denx.de>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI burst mode is more energy efficient than the DSI sync pulse mode,
make use of the burst mode since the chip supports it as well. Disable the
generation of EoT packet, the chip ignores it, so no point in emitting it.
Enable transmission of data in LP mode, otherwise register read via DSI
does not work with this chip.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 7cc1f0d0dcdfd..2040596717139 100644
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

