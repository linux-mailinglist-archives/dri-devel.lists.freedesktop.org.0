Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659CB7582FC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A3210E3A7;
	Tue, 18 Jul 2023 16:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256A10E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by michel.telenet-ops.be with bizsmtp
 id Ngur2A00Q0ucMBo06gurXS; Tue, 18 Jul 2023 18:54:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nZc-MO;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gdp-NZ;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 34/41] drm: renesas: shmobile: Shutdown the display on
 remove
Date: Tue, 18 Jul 2023 18:54:39 +0200
Message-Id: <61738d0ed968fa59c3e5180123e208eaf8c9a43e.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the device is unbound from the driver, the display may be active.
Make sure it gets shut down.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 78f9650e3a61365f..51a9a6955d1fb0fb 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -172,6 +173,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 	struct drm_device *ddev = &sdev->ddev;
 
 	drm_dev_unregister(ddev);
+	drm_helper_force_disable_all(ddev);
 	drm_kms_helper_poll_fini(ddev);
 	return 0;
 }
-- 
2.34.1

