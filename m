Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355959DAC7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B6B10E1BC;
	Tue, 23 Aug 2022 10:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEBD10E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:57:22 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B0732B3;
 Tue, 23 Aug 2022 12:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661252241;
 bh=0ZKn8A8NZffnPKKGKfeXL3ev8QEusBBlb7dR3SmdfG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUHBfVi/xsl5Vpb6y3jpeUwvx1MJC4SkH/r8emtHRR89JJsswkOojYu3fSSmdtMnJ
 LdaImEsD5KMWdSw+I43Vrlwb2fCc0CHW3avBuMleFV/LrJzoSk93/qpXsOhCtPwgBM
 m9nONvMsJ/INKgTZN7vRxaj7X4G/qHGN22v27G6Q=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3.1 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Date: Tue, 23 Aug 2022 13:57:06 +0300
Message-Id: <20220823105706.44282-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
References: <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
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

rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
or-operation to add the new values to the current value in the register,
it should first make sure the fields are cleared.

Do this by using rcar_mipi_dsi_write() to write the VCLKSET register
with a variable that has all the unused bits zeroed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 06250f2f3499..90128d5e3d17 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 
 	/* Enable DOT clock */
 	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
@@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
 		|  VCLKSET_LANE(dsi->lanes - 1);
 
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
 	/* After setting VCLKSET register, enable VCLKEN */
 	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
-- 
2.34.1

