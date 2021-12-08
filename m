Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA446D160
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 11:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961DB6FCD3;
	Wed,  8 Dec 2021 10:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 08 Dec 2021 10:50:56 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB386FCD3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 10:50:56 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:a0bd:6217:e9a0:bd39])
 by xavier.telenet-ops.be with bizsmtp
 id Tmlt2600B2LoXaB01mltK1; Wed, 08 Dec 2021 11:45:53 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1muuSP-003dvS-0M; Wed, 08 Dec 2021 11:45:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1muuDu-00BVhx-8b; Wed, 08 Dec 2021 11:30:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Use dev_err_probe() helper
Date: Wed,  8 Dec 2021 11:30:53 +0100
Message-Id: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"failed to initialize DRM/KMS (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to initialize DRM/KMS\n");
 		goto error;
 	}
 
-- 
2.25.1

