Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9CAFF102
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 20:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57410E358;
	Wed,  9 Jul 2025 18:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AD510E812
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 18:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7884645002;
 Wed,  9 Jul 2025 18:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDFBC4CEEF;
 Wed,  9 Jul 2025 18:43:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()
Date: Wed,  9 Jul 2025 20:43:25 +0200
Message-ID: <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Convert the Renesas RZ/G2L MIPI DSI Encoder driver from
SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us
drop the __maybe_unused annotations from its runtime suspend and resume
callbacks, and reduces kernel size in case CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb54559..3b52dfc0ea1e04e6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -913,7 +913,7 @@ static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
  * Power Management
  */
 
-static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device *dev)
+static int rzg2l_mipi_pm_runtime_suspend(struct device *dev)
 {
 	struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
 
@@ -923,7 +923,7 @@ static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device *dev)
+static int rzg2l_mipi_pm_runtime_resume(struct device *dev)
 {
 	struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
@@ -940,7 +940,7 @@ static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
-	SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend, rzg2l_mipi_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend, rzg2l_mipi_pm_runtime_resume, NULL)
 };
 
 /* -----------------------------------------------------------------------------
@@ -1072,7 +1072,7 @@ static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
 	.remove = rzg2l_mipi_dsi_remove,
 	.driver	= {
 		.name = "rzg2l-mipi-dsi",
-		.pm = &rzg2l_mipi_pm_ops,
+		.pm = pm_ptr(&rzg2l_mipi_pm_ops),
 		.of_match_table = rzg2l_mipi_dsi_of_table,
 	},
 };
-- 
2.43.0

