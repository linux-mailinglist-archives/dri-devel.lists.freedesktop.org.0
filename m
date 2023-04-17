Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53EA6E4A3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19F010E4FB;
	Mon, 17 Apr 2023 13:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F6F10E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:44:52 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by xavier.telenet-ops.be with bizsmtp
 id lpko2900t1C8whw01pkomn; Mon, 17 Apr 2023 15:44:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1poP4u-00H0W6-1e;
 Mon, 17 Apr 2023 15:40:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1poP5n-007zAV-N3;
 Mon, 17 Apr 2023 15:40:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/5] drm: shmobile: Add missing call to
 drm_fbdev_generic_setup()
Date: Mon, 17 Apr 2023 15:40:24 +0200
Message-Id: <c30a9d5a2a18526f34af46999d2769c263f0687c.1681734821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
References: <cover.1681734821.git.geert+renesas@glider.be>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set up generic fbdev emulation, to enable support for the Linux console.

Use 16 as the preferred depth, as that is a good compromise between
colorfulness and resource utilization, and the default of the fbdev
driver.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index faacfee24763b1d4..30493ce874192e3e 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
@@ -271,6 +272,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_irq_uninstall;
 
+	drm_fbdev_generic_setup(ddev, 16);
+
 	return 0;
 
 err_irq_uninstall:
-- 
2.34.1

