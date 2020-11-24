Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FB2C3AA9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42C76E862;
	Wed, 25 Nov 2020 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Tue, 24 Nov 2020 17:20:42 UTC
Received: from softboy.mntmn.com (softboy.mntmn.com [91.250.115.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EC426E423
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:20:42 +0000 (UTC)
From: "Lukas F. Hartmann" <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com 5B16A720718
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
 s=mntremail; t=1606237969;
 bh=UEu8QDWrOSRJQOojTYBi65+7G2OU5JZ5f4MfrL5efs4=;
 h=From:To:Cc:Subject:Date:From;
 b=dixofOlgFN3BMeNmGaGzbvnWgAxoJfqMfxmQGjJlXm6NW6rNfIzUI0nUj1mVJoOpI
 s6Dui+LI4tSjA2/O6aQ5BEUoQ+nmtC29fz3yrj8ZGQB8iuHHEf8kBeCefUIdoGGuuk
 QgpYOEPaNk8WJ7vTtpuHL/OjHjz6HX4pn9iqlrKDxGBHsT2zBZ/87uMHrad0yEgMEe
 BQ+sxgKnumrAuomnP97wG3hRT3PS/dR/5pwr9WdPPfMudy04jRhYg78amxfZvwlwK0
 JVQu4qxE1Kb990gFE09o7bwA1LzzqL8Y4F1gyM+6z2X4asoVAEMdTuErwflzz8XaGE
 ubx5BaDwVnmkg==
To: lukas@mntre.com
Subject: nwl-dsi: fixup mode only for LCDIF input, not DCSS
Date: Tue, 24 Nov 2020 18:12:17 +0100
Message-Id: <20201124171216.980628-1-lukas@mntre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, agx@sigxcpu.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, laurentiu.palcu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fixup of HSYNC and VSYNC should not be done when the input source is
DCSS, or internal display does not work on MNT Reform 2 (open hardware 
laptop based on NXP i.MX8M using DCSS->DSI->eDP for internal display).

Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 66b67402f..6735ab2a2 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -807,10 +807,16 @@ static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
 				      const struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
 {
-	/* At least LCDIF + NWL needs active high sync */
-	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	struct device_node *remote;
+	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
+
+	remote = of_graph_get_remote_node(dsi->dev->of_node, 0,
+						NWL_DSI_ENDPOINT_LCDIF);
+	if (remote) {
+		/* At least LCDIF + NWL needs active high sync */
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	}

 	return true;
 }
--
2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
