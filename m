Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D43AE102
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 00:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4595589755;
	Sun, 20 Jun 2021 22:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2E089755
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 22:48:39 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 67A2E800BF;
 Mon, 21 Jun 2021 00:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624229317;
 bh=aDQ0+1hZup573im6sTGC9BMFPyDIKuC80w+b6PEIPlQ=;
 h=From:To:Cc:Subject:Date:From;
 b=pd1q8/In9dhFP+Xmsurs7P3gnTrEsmqTYdcnoWAXUz9a26sgpM3rvOU0kAmRhXWNU
 QVcg8qp+AHLoEsQEIvhwv2LkEszWjcsotzr58Kn1zT0tsNAmTv5xIeLf0bnll/NM2y
 Y5zlubCGlzpZ9ovCmSJkLnTpKSaTr2ZMrjFvRGFG7YleufkpuYaL+X4jrGYNhciyVB
 3MJHBDKSaHKRqEeBQtyRp5STML5Ia5cOcndP3wiZSa6J5oIv7ipNLBnoWbip6ctrZJ
 e5Mn2RLwDVJtdUhVtjwh1tRP02MVIcHRJBjf4ppWW4MR3Xm3JUxUa0YC+EeYh5zOfT
 y73ksN6yPedPQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mxsfb: Disable overlay plane support for i.MX8MM/i.MX8MN
Date: Mon, 21 Jun 2021 00:48:34 +0200
Message-Id: <20210620224834.189411-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Abrecht <public@danielabrecht.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The iMX8MM and iMX8MN do not support the overlay plane, so they
are MXSFB V4. Add the compatible strings to reflect this. Note
that iMX8MQ does support the overlay plane, so it is MXSFB V6.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Abrecht <public@danielabrecht.ch>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c277d3f61a5e..0ae4a3553304 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -308,6 +308,8 @@ static const struct of_device_id mxsfb_dt_ids[] = {
 	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
 	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
 	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
+	{ .compatible = "fsl,imx8mm-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
+	{ .compatible = "fsl,imx8mn-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
-- 
2.30.2

