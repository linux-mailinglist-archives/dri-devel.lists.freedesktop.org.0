Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B94A6CDD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6530710F946;
	Wed,  2 Feb 2022 08:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Tue, 01 Feb 2022 11:12:09 UTC
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24A4710E4F9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:12:09 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx4.securetransport.de (Postfix) with ESMTPSA id DFB32720CB1;
 Tue,  1 Feb 2022 12:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1643713542;
 bh=LGCUiTG6SpjxILKUwKkbZ1ay/IxlTOvR7yJthxP/ndg=;
 h=From:To:CC:Subject:Date:From;
 b=dVXM0mK1I429vjfZeayk8xsJ1R7HYDXhwt7CbK8AJknHfYpE2vCUWII4/cD3co1dU
 q4YcCdgBxA9fKbLeo9juNttesLHdGRAA/kEBOL401HXzwWhhlqbMlqRazcJ9DdRcJP
 obAKq0KDtDLphs9hU4iK7W4inhQGaGBlp7DXPhfznFalzGwQM0ZCnDn5tVzohoAyqC
 fZV0UbASFp60+qvGPo8lOKguhCV8rCCjoHcYWz27cNtIxhHEr9YuMVh7BTkkwFq9OY
 Iypt1OkA74lweZ/XR4BTsLvhVSXEWZWznTJ2uicoxTCzc8t/Bjd3iiNAv9i7L68RcB
 wT1UrHFLe2ArQ==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Feb 2022 12:05:18 +0100
Received: from localhost.localdomain (172.16.51.18) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Tue, 1 Feb 2022 12:05:17 +0100
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Date: Tue, 1 Feb 2022 12:03:58 +0100
Message-ID: <20220201110358.3530-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 02 Feb 2022 08:24:59 +0000
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
 Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
2.11.0

