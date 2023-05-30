Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B86715A08
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55310E330;
	Tue, 30 May 2023 09:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2410E330
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 09:26:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp
 [126.205.206.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE8F7F3;
 Tue, 30 May 2023 11:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685438778;
 bh=zA4sTK2Jca312XTfJFlyixKDKl3jwNdf4ulN9FP63o4=;
 h=From:To:Cc:Subject:Date:From;
 b=DASpM/W+4WTaKmHn2/R6A4Ko4dr9b6AMrzguOfsw9cf2lXf92d5NddTFdRTO6GvmU
 W+EoNgBJnKsYjF10MJkbpzbYuBJpCPuHFGTUWwVjl+KlUoVjfvnwD0RBLUeu++Mp6t
 h5kh+RARNnxQqi3yw0P1SmZyuazpjFFoElZs6098=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Replace DRM_INFO() with drm_info()
Date: Tue, 30 May 2023 12:26:39 +0300
Message-Id: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_info() adds proper context to the kernel log message, as it receives
the drm_device pointer. It is thus preferred over DRM_INFO(). Replace
the latter with the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 91095f9deb8b..fe4d3b3c9b0c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -713,7 +713,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
+	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
 
 	drm_fbdev_generic_setup(&rcdu->ddev, 32);
 
-- 
Regards,

Laurent Pinchart

