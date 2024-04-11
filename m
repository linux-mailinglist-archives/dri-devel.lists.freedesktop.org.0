Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81078A0D5F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 12:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A892510E169;
	Thu, 11 Apr 2024 10:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2BG8GuAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951210E169
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 10:03:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 410F862024;
 Thu, 11 Apr 2024 10:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588AFC433C7;
 Thu, 11 Apr 2024 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712829802;
 bh=RfTQQXnAUYVg1yrWumFjor8u2e48qfNt1oH1zpbQo1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2BG8GuAL0l5zVijMXRiD+FNOPW17tFLBgKj4mBUG4oXC9wwmM+LUSLqD8vxh8KyNG
 K4IgL/Tc0oxPdl7A6HlnhZqS79gxN58V4MrLbZ+qBsE0xvXRG0ffe0MCESaBb3uksb
 /N8P9picUnFnaE7YheYW9lqZlNkjMTZcwzztkRX4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 4.19 109/175] drm/imx: parallel-display: Remove bus flags
 check in imx_pd_bridge_atomic_check()
Date: Thu, 11 Apr 2024 11:55:32 +0200
Message-ID: <20240411095422.849076905@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411095419.532012976@linuxfoundation.org>
References: <20240411095419.532012976@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Christoph Niedermaier <cniedermaier@dh-electronics.com>

commit 6061806a863e8b65b109eb06a280041cc7525442 upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/imx/parallel-display.c |    8 --------
 1 file changed, 8 deletions(-)

--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -235,14 +235,6 @@ static int imx_pd_bridge_atomic_check(st
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


