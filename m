Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8833B440B1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9F710EA93;
	Thu,  4 Sep 2025 15:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C167610EA91
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:32:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5176544391;
 Thu,  4 Sep 2025 15:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958DAC4CEF1;
 Thu,  4 Sep 2025 15:32:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
Date: Thu,  4 Sep 2025 17:32:36 +0200
Message-ID: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
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

Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
->runtime_suspend|resume callbacks"), unassigned
.runtime_{suspend,resume}() callbacks are treated the same as dummy
callbacks that just return zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 5d272916e200980f..1225029689271e2f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -683,11 +683,6 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int imx8qxp_ldb_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
 static int imx8qxp_ldb_runtime_resume(struct device *dev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
@@ -700,7 +695,7 @@ static int imx8qxp_ldb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
-	RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend, imx8qxp_ldb_runtime_resume, NULL)
+	RUNTIME_PM_OPS(NULL, imx8qxp_ldb_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
-- 
2.43.0

