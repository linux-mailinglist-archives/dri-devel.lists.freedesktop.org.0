Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FE90E83E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B1D10EC16;
	Wed, 19 Jun 2024 10:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YFnkFLU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2F110EC14
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91EEF89;
 Wed, 19 Jun 2024 12:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718792541;
 bh=s5GeQVun/P8JpAdhwwqNjJn/k36Xql8MREpnjfZaDWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YFnkFLU7BNBibM/6yGfmWyndxZB/bjjGpVBk59C2nXoaQdUBsCqTchl8xTwNB7mU5
 CgGnODCac+v92PJIkxOQ6Bnfq00Vkn44uwcKBgTxBoqpOuiE4aSZx9KnNHUJ6s0te4
 sGIYqGbXhtnFndve/QfVytRrTIftwJzI041QkQ+U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
 linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
 Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 1/4] drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition
Date: Wed, 19 Jun 2024 12:22:15 +0200
Message-ID: <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
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

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Version 0.51 of the Renesas R-Car Gen4 TRM reports bit 16 of the
CLOCKSET1 register of the DSI transmitter module to be a reserved
field.

Fix this by correcting the CLOCKSET1_LOCK definition to match the TRM
and remove the CLOCKSET1_LOCK_PHY definition, as the register is simply
called "lock" in the datasheet.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index f8114d11f2d1..1bf9c4717d5a 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -141,8 +141,7 @@
 #define PHYSETUP_RSTZ			(1 << 0)
 
 #define CLOCKSET1			0x101c
-#define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_LOCK			(1 << 16)
+#define CLOCKSET1_LOCK			(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
 #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
 #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-- 
2.45.2

