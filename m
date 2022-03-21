Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C514E292F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A2A10E47C;
	Mon, 21 Mar 2022 14:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3E510E47C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:01:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A9FCB816E1;
 Mon, 21 Mar 2022 14:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469D4C340F3;
 Mon, 21 Mar 2022 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647871311;
 bh=ZLNrGtC/1yYtaIEPvn2dN37TDlIhPm1AaMyY5zLM+o8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=w8gY10Zv3XvQyqm2Nt5OAfbKkFgLHV2J5YO3Iotiy2u/isKlm7tgLPqy9zeWe47+z
 MAyMKDwDDXiU1yKDNENy1+mwsmOd6SgN/UtVjolaUGeNEDO5v/2lA/jQP4qMjXb6Fo
 X4VsgHpCIBQrBnQoEUgKO35jyy4OSQfjQPcYBEqg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5.16 17/37] drm/imx: parallel-display: Remove bus flags check
 in imx_pd_bridge_atomic_check()
Date: Mon, 21 Mar 2022 14:52:59 +0100
Message-Id: <20220321133221.794975962@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133221.290173884@linuxfoundation.org>
References: <20220321133221.290173884@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Max Krummenacher <max.krummenacher@toradex.com>,
 Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, stable@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christoph Niedermaier <cniedermaier@dh-electronics.com>

[ Upstream commit 6061806a863e8b65b109eb06a280041cc7525442 ]

If display timings were read from the devicetree using
of_get_display_timing() and pixelclk-active is defined
there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
automatically generated. Through the function
drm_bus_flags_from_videomode() e.g. called in the
panel-simple driver this flag got into the bus flags,
but then in imx_pd_bridge_atomic_check() the bus flag
check failed and will not initialize the display. The
original commit fe141cedc433 does not explain why this
check was introduced. So remove the bus flags check,
because it stops the initialization of the display with
valid bus flags.

Fixes: fe141cedc433 ("drm/imx: pd: Use bus format/flags provided by the bridge when available")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Tested-by: Max Krummenacher <max.krummenacher@toradex.com>
Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220201113643.4638-1-cniedermaier@dh-electronics.com
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/imx/parallel-display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index a8aba0141ce7..06cb1a59b9bc 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -217,14 +217,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 	if (!imx_pd_format_supported(bus_fmt))
 		return -EINVAL;
 
-	if (bus_flags &
-	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
-	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
-	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)) {
-		dev_warn(imxpd->dev, "invalid bus_flags (%x)\n", bus_flags);
-		return -EINVAL;
-	}
-
 	bridge_state->output_bus_cfg.flags = bus_flags;
 	bridge_state->input_bus_cfg.flags = bus_flags;
 	imx_crtc_state->bus_flags = bus_flags;
-- 
2.34.1



