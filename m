Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF759C1B5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A456F90F27;
	Mon, 22 Aug 2022 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B3290E59
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:35:10 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA5429AA;
 Mon, 22 Aug 2022 16:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661178909;
 bh=x7IQOBok8WLpd2lre1kfQXiXqj4R6G4M2UlK51gYuBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KUjj22yHd2+PrSxl8/dc4YUp9amhUWVROD25AjTJ88V2kSt7CIOquFmIsYnUKd+7H
 OFYKx0WA/vBTR+tcp/rT4W+Ttpf8qYXOToKhSTuMOp7DK7ySYobXSrHbuzY+Wb+wBO
 AsCwbkgvLCD4SAJgnIU22UWFd0LVmGhPpaBPuLZg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Date: Mon, 22 Aug 2022 17:34:01 +0300
Message-Id: <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
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

rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
or-operation to add the new values to the current value in the register,
it should first make sure the fields are cleared.

Do this by using rcar_mipi_dsi_write() to write the VCLKSET_CKEN bit to
VCLKSET before the rest of the VCLKSET configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 06250f2f3499..b60a6d4a5d46 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -412,9 +412,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 			return ret;
 	}
 
-	/* Enable DOT clock */
-	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	/* Clear VCLKSET and enable DOT clock */
+	rcar_mipi_dsi_write(dsi, VCLKSET, VCLKSET_CKEN);
+
+	vclkset = 0;
 
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
-- 
2.34.1

