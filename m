Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D450B440A9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0710EA8F;
	Thu,  4 Sep 2025 15:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA610EA90
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:31:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D484640760;
 Thu,  4 Sep 2025 15:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9192CC4CEF0;
 Thu,  4 Sep 2025 15:31:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
Date: Thu,  4 Sep 2025 17:31:00 +0200
Message-ID: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
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

Convert the Renesas R-Car Display Unit LVDS driver from
SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
on PM, the code may still serve as an example for new drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 4dcb36dc0bff6e53..6d44238c4078a425 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -1013,7 +1013,7 @@ static int rcar_lvds_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rcar_lvds_pm_ops = {
-	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
 };
 
 static struct platform_driver rcar_lvds_platform_driver = {
@@ -1021,7 +1021,7 @@ static struct platform_driver rcar_lvds_platform_driver = {
 	.remove		= rcar_lvds_remove,
 	.driver		= {
 		.name	= "rcar-lvds",
-		.pm	= &rcar_lvds_pm_ops,
+		.pm	= pm_ptr(&rcar_lvds_pm_ops),
 		.of_match_table = rcar_lvds_of_table,
 	},
 };
-- 
2.43.0

