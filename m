Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D37715A07
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468E10E30C;
	Tue, 30 May 2023 09:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF30B10E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 09:26:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp
 [126.205.206.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 000007EC;
 Tue, 30 May 2023 11:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685438769;
 bh=xyWNyLfZ4XMMC+JRf20PcpUZeFT54eA0T5pwZvOMi8M=;
 h=From:To:Cc:Subject:Date:From;
 b=hcgal3qzvMOVEXUXhheG63dfeAIILx4VcY8tCjF/i1xva6aSWwW4kVRxWzi/jhq93
 mXxoq3U3WFWTOuy4ThzI3sDiwQx+2JG4g+J7LT3qk8dc/hCng3WrE4pNVkgU6mEa/v
 VaJVfbPdZDQEL9e/UCCCxDtrH+v0jpRC7gCpG4jE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Use dev_err_probe()
Date: Tue, 30 May 2023 12:26:29 +0300
Message-Id: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
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

Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 1ffde19cb87f..91095f9deb8b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -701,9 +701,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"failed to initialize DRM/KMS (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "failed to initialize DRM/KMS\n");
 		goto error;
 	}
 

base-commit: 85d712f033d23bb56a373e29465470c036532d46
prerequisite-patch-id: 74c948ef7587221bcc859d7e0b38b54b7c404163
prerequisite-patch-id: 41d31c65b9895beb2f15c1dd2b89e435657a639c
prerequisite-patch-id: bd71c64e0d7f9a6a5212ef9ad499fb7cdc718425
prerequisite-patch-id: a01de55d9563b98ab2d86d78db436da198bc4649
prerequisite-patch-id: 2faeeea13f349cae2470b09926ed52e5743f1579
prerequisite-patch-id: 783a84269c3d66600ec31046bee76e2aabcb32ad
-- 
Regards,

Laurent Pinchart

