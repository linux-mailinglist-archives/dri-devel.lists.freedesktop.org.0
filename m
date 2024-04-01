Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44232893B42
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 15:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55310F158;
	Mon,  1 Apr 2024 13:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m7Tcyl7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CE810F166
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 13:12:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F19B560BC4;
 Mon,  1 Apr 2024 13:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436BCC43399;
 Mon,  1 Apr 2024 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711977131;
 bh=eHsozHMQ7QtkJFYA+A8f8zFMihC1C9yhJ7LCwmQ00kM=;
 h=Subject:To:Cc:From:Date:From;
 b=m7Tcyl7W29SGyJlq93qLWhswmfmHEKBD/XNBsvzvZp3mFWsnJZTYeetkL7RScUIqO
 53kk5GdnEP0NRjnEowEypXCWJjehxawsJolhHnQCWep9CMBFhSxHTEKTsjK1Nr1bw8
 icBZ27tvinbT1fcvXKWdyoUgtipskzes8YxVwIGc=
Subject: Patch "drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()" has been added to the 4.19-stable tree
To: airlied@linux.ie, boris.brezillon@collabora.com,
 cniedermaier@dh-electronics.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, festevam@gmail.com,
 gregkh@linuxfoundation.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, marex@denx.de, max.krummenacher@toradex.com,
 p.zabel@pengutronix.de, s.hauer@pengutronix.de, shawnguo@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 01 Apr 2024 15:12:08 +0200
Message-ID: <2024040108-path-headboard-57cf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/imx: parallel-display: Remove bus flags check in imx_pd_bridge_atomic_check()

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-imx-parallel-display-remove-bus-flags-check-in-imx_pd_bridge_atomic_check.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 6061806a863e8b65b109eb06a280041cc7525442 Mon Sep 17 00:00:00 2001
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Date: Tue, 1 Feb 2022 12:36:43 +0100
Subject: drm/imx: parallel-display: Remove bus flags check in imx_pd_bridge_atomic_check()

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


Patches currently in stable-queue which might be from cniedermaier@dh-electronics.com are

queue-4.19/drm-imx-parallel-display-remove-bus-flags-check-in-imx_pd_bridge_atomic_check.patch
