Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8C59C1B4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83790F30;
	Mon, 22 Aug 2022 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6680090E4F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:35:10 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF4516BB;
 Mon, 22 Aug 2022 16:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661178908;
 bh=SUwR7JJReefh06KPVq8xcaWvlofbEY1j3jKAt2Cwh+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dWgRZa8/yMryJzCl8LTzkYocXZ8YFvN6tZhQBkI+Dyh36GKZZraCJTVjKRz477rJj
 CmthJifsfpRtG0gV/zTQhtxjbU4S3sreGzOBShGK/U1unRaKY/CUPK9p0R8HEyD/+f
 gW721TYb/UfweCvwaMCuChAaS8VmRmqGXjmlZSYs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/5] drm: rcar-du: dsi: Improve DSI shutdown
Date: Mon, 22 Aug 2022 17:33:59 +0300
Message-Id: <20220822143401.135081-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Improve the DSI shutdown procedure by clearing various bits that were
set while enabling the DSI output. There has been no clear issues caused
by these, but it's safer to ensure that the features are disabled at the
start of the next DSI enable.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 7f2be490fcf8..9c79fe2fc70b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 
 static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
 {
+	/* Disable VCLKEN */
+	rcar_mipi_dsi_write(dsi, VCLKSET, 0);
+
+	/* Disable DOT clock */
+	rcar_mipi_dsi_write(dsi, VCLKSET, 0);
+
 	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
 	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
 
+	/* CFGCLK disable */
+	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
+
+	/* LPCLK disable */
+	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
+
 	dev_dbg(dsi->dev, "DSI device is shutdown\n");
 }
 
-- 
2.34.1

