Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6C8052E1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 12:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094B810E4F1;
	Tue,  5 Dec 2023 11:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CA810E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 11:30:13 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a051:433:f7fa:99b4])
 by andre.telenet-ops.be with bizsmtp
 id JbWB2B0090xLcQm01bWBHF; Tue, 05 Dec 2023 12:30:11 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rATcc-00B4GH-Ak;
 Tue, 05 Dec 2023 12:30:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rATcw-002X6f-UF;
 Tue, 05 Dec 2023 12:30:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm: renesas: shmobile: Call drm_helper_force_disable_all()
 at shutdown time
Date: Tue,  5 Dec 2023 12:30:02 +0100
Message-Id: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Douglas Anderson <dianders@chromium.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time.
This is important because drm_helper_force_disable_all() will cause
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
---
Tested on Atmark Techno Armadillo-800-EVA, where the PWM instance
driving the backlight is now stopped on shutdown.
Panel-simple does print two new warnings:

    +panel-simple panel: Skipping disable of already disabled panel
    +panel-simple panel: Skipping unprepare of already unprepared panel
     reboot: System halted
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index bd16d4780c6436c3..a15162be26f259a4 100644
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
@@ -274,6 +281,7 @@ static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.of_match_table = of_match_ptr(shmob_drm_of_table),
-- 
2.34.1

