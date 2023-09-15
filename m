Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDF7A195D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7900C10E5E1;
	Fri, 15 Sep 2023 08:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C910E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:18 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by andre.telenet-ops.be with bizsmtp
 id m8uE2A00N3q21w7018uEer; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lGu-Id;
 Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00Gdbt-IE;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 16/41] drm: renesas: shmobile: Improve error handling
Date: Fri, 15 Sep 2023 10:53:31 +0200
Message-Id: <6dfac76e5b1c7dda3f96801ce83845a4235e2ccd.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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

Prepare for DT conversion, where panel probe can be deferred, by
streamlining error propagation and handling:
  - Use dev_err_probe() to avoid printing error messages in case of
    probe deferral,
  - Propagate errors where needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c |  3 ++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c | 14 +++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 9c3d8b3cf57d5eb6..399fedd42271cb49 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -253,7 +253,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	ret = shmob_drm_modeset_init(sdev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to initialize mode setting\n");
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to initialize mode setting\n");
 		goto err_free_drm_dev;
 	}
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index 3051318ddc7999bc..1a62e7f8a8a9e6df 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -157,9 +157,17 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 	if (ret)
 		return ret;
 
-	shmob_drm_crtc_create(sdev);
-	shmob_drm_encoder_create(sdev);
-	shmob_drm_connector_create(sdev, &sdev->encoder);
+	ret = shmob_drm_crtc_create(sdev);
+	if (ret < 0)
+		return ret;
+
+	ret = shmob_drm_encoder_create(sdev);
+	if (ret < 0)
+		return ret;
+
+	ret = shmob_drm_connector_create(sdev, &sdev->encoder);
+	if (ret < 0)
+		return ret;
 
 	drm_kms_helper_poll_init(sdev->ddev);
 
-- 
2.34.1

