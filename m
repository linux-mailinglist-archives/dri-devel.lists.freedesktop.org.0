Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2EC60E4EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A9C10E57A;
	Wed, 26 Oct 2022 15:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015B310E578
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:36:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 95E1685066;
 Wed, 26 Oct 2022 17:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666798576;
 bh=eAFKYuF/4DKrG6rbPW7nSPBlnWhyZOTNt23wiQmkAOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0ueHW3S3M+hPE0aUBIXG+LXhfpuJ7gd6tuwl8i47I5crWpuBvpCQq6HhSZEyd6r8
 cgXzZI9ZOZMQUsYnOMPVAmeTdItu3iapT5L8R5dLsuWt71fXNYag+6icMP9RXxTER3
 /D31JXebW5B4RbDUX7WKlXgkCG/TlLwvPoEyNQDFr5UDRaZDemM1yplmeluTPQkh/f
 hSITJnGUN/mzbDiatZlDPNX3YaztN36JaJ84CkwnIvnVcFT7muwrpJJzd6/UWExQlN
 NVCPPQHAXN6Oz1y9SQ4kdp7NulGLkYBTewFI+R6JwhTQSnAU4y1OLdXueOXAewL2nH
 LOJHUtpMfo3gQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: tc358767: Report minimum and maximum DSI HS
 clock to upstream bridge
Date: Wed, 26 Oct 2022 17:35:58 +0200
Message-Id: <20221026153559.387041-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221026153559.387041-1-marex@denx.de>
References: <20221026153559.387041-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case TC358767 operates in DSI-to-DPI mode and its clock are supplied
from XTal connected to RefClk, the range of supported input DSI HS clock
is limited.

Expose this limitation to the upstream bridge by providing minimum and
maximum accepted DSI HS clock frequency via bridge state.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index b5f4e5328eaf9..3f423a29c703b 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1516,10 +1516,34 @@ static int tc_dpi_atomic_check(struct drm_bridge *bridge,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_connector_state *conn_state)
 {
+	struct tc_data *tc = bridge_to_tc(bridge);
+	unsigned int dpi_max_pixrate;
+
 	/* DSI->DPI interface clock limitation: upto 100 MHz */
 	if (crtc_state->adjusted_mode.clock > 100000)
 		return -EINVAL;
 
+	bridge_state->hs_rate_min =
+		crtc_state->adjusted_mode.clock *
+		mipi_dsi_pixel_format_to_bpp(tc->dsi->format);
+	/* Split video data transfer across multiple lanes */
+	bridge_state->hs_rate_min /= tc->dsi->lanes;
+	/* DSI bus is DDR */
+	bridge_state->hs_rate_min /= 2;
+	/* Apply 1.2 DSI protocol overhead */
+	bridge_state->hs_rate_min =
+		bridge_state->hs_rate_min * 12 / 10;
+
+	/*
+	 * The bridge supports maximum DPI resolution 1366x768 24bpp 60Hz
+	 * and is not capable of running at full 500 MHz in all data lane
+	 * configurations at least in DSI-to-DPI mode.
+	 */
+	dpi_max_pixrate = 1366 * 768 * 24 * 60 / 1000;
+	bridge_state->hs_rate_max =
+		clamp((dpi_max_pixrate * 12 / 10) / tc->dsi->lanes / 2,
+		      0U, 500000U);
+
 	return 0;
 }
 
-- 
2.35.1

