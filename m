Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588F904CDE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA25F89AAE;
	Wed, 12 Jun 2024 07:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2024 07:31:29 UTC
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542B10E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:31:22 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VzcTM5yscz4wxb7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:23:19 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
 by laurent.telenet-ops.be with bizsmtp
 id aXPG2C00A3axqkY01XPGYN; Wed, 12 Jun 2024 09:23:19 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHIJ8-007OGF-Vs;
 Wed, 12 Jun 2024 09:23:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHIKC-00E9WZ-3I;
 Wed, 12 Jun 2024 09:23:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3] drm: renesas: shmobile: Call drm_atomic_helper_shutdown()
 at shutdown time
Date: Wed, 12 Jun 2024 09:23:13 +0200
Message-Id: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

From: Douglas Anderson <dianders@chromium.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time.
This is important because drm_atomic_helper_shutdown() will cause
panels to get disabled cleanly which may be important for their power
sequencing.  Future changes will remove any custom powering off in
individual panel drivers so the DRM drivers need to start getting this
right.

The fact that we should call drm_atomic_helper_shutdown() in the case of
OS shutdown comes straight out of the kernel doc "driver instance
overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
[geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
[geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
v3:
  - Add Reviewed-by,
  - Fix remaining references to drm_helper_force_disable_all(),

v2:
  - Add Reviewed-by.

Tested on Atmark Techno Armadillo-800-EVA.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index e83c3e52251dedf9..0250d5f00bf102dc 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -171,6 +171,13 @@ static void shmob_drm_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 }
 
+static void shmob_drm_shutdown(struct platform_device *pdev)
+{
+	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&sdev->ddev);
+}
+
 static int shmob_drm_probe(struct platform_device *pdev)
 {
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
@@ -273,6 +280,7 @@ static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.of_match_table = of_match_ptr(shmob_drm_of_table),
-- 
2.34.1

