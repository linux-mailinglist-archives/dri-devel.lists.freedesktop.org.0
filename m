Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7EE90E840
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B710E1A5;
	Wed, 19 Jun 2024 10:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DcIxatKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE8410EC14
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90D121011;
 Wed, 19 Jun 2024 12:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718792542;
 bh=LkqjVsjra+Xu0oLeFPfT/pyzgjb+wYakW5vKSvgV5w8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DcIxatKe+jmKXmh5aWDJzTJEgJ6o9JqmxDV65kNeh4DyuWcePgquJ9QzebpPGVPex
 +P5EuHZI01/Cr34hZw8UkqYILhXwly0/YdJy3WJAG1brZNTkTh5y/NZEIrjK0w2DtS
 en+2mho53FH7ZOPDrfWpUddmnmQ4T6rgo4fkjaRQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
 linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
 Phong Hoang <phong.hoang.wz@renesas.com>
Subject: [PATCH 2/4] drm: ti-sn65dsi86: Check bridge connection failure
Date: Wed, 19 Jun 2024 12:22:16 +0200
Message-ID: <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>
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

From: Phong Hoang <phong.hoang.wz@renesas.com>

Add a check to the register access function when attaching a bridge
device.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..b7df53577987 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 
 static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
 {
+	int ret;
 	int val;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
@@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
+	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
 	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return ret;
+
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-- 
2.45.2

