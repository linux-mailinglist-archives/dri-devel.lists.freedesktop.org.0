Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E062DB861
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 02:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6170E89BFB;
	Wed, 16 Dec 2020 01:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30189BFB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 01:22:29 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B7802CF;
 Wed, 16 Dec 2020 02:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608081748;
 bh=4dBb2lP0GqDwkNh1RcPCy46ORJdrPcexLfRYH43K91M=;
 h=From:To:Cc:Subject:Date:From;
 b=P99Ma0JNZJdVW9qMOKPBGPve2PnbJ16eV0mcjyZXnY0va6cAGZDfIYEj+ODG5BNCH
 Lc4dWuARLihc7Fb7vuXGDFa1tDHMsQZNkZqkCNP5rV9QONt9Uob1VdTSNHxQ0N3dQ6
 EBJyX6TO9rNi8zP05Q+affmbvI2362RC6xIWCKe8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Fix leak of CMM platform device reference
Date: Wed, 16 Dec 2020 03:22:18 +0200
Message-Id: <20201216012218.9205-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device references acquired by of_find_device_by_node() are not
released by the driver. Fix this by registering a cleanup action.

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 92dfa3d4c011..7070f3c9b529 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -721,6 +722,8 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 
 		of_node_put(cmm);
 
+		rcdu->cmms[i] = pdev;
+
 		/*
 		 * -ENODEV is used to report that the CMM config option is
 		 * disabled: return 0 and let the DU continue probing.
@@ -739,13 +742,22 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 				"Failed to create device link to CMM%u\n", i);
 			return -EINVAL;
 		}
-
-		rcdu->cmms[i] = pdev;
 	}
 
 	return 0;
 }
 
+static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i) {
+		if (rcdu->cmms[i])
+			put_device(&rcdu->cmms[i]->dev);
+	}
+}
+
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 {
 	static const unsigned int mmio_offsets[] = {
@@ -766,6 +778,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	if (ret)
 		return ret;
 
+	ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
+	if (ret)
+		return ret;
+
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
