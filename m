Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DE61FC0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAF10E532;
	Mon,  7 Nov 2022 17:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37DC10E544
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843594; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+3P3wqz1jwbsocGqfxEzObGi6ZWNcGmPZP0SRMAoFE=;
 b=RZ2Gk2A4SHM9nHT+NSSNbHwothCRQAikLa9tCH/TS9p0P01+9U6+f6/OljI8wBhxuWBeB6
 UI8/kRqHmWCaQdV3d+Ew5a3yh1JnSfC/7MS2yCu6HEhxKCLPesKbhwRafN3yoWdYtrhEKf
 p6uyEDWMw333qBxCZyxEqWNtHP23fDM=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 20/26] drm: tegra: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:50 +0000
Message-Id: <20221107175256.360839-10-paul@crapouillou.net>
In-Reply-To: <20221107175256.360839-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
.runtime_suspend/.runtime_resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Note that this driver should probably use the
DEFINE_RUNTIME_DEV_PM_OPS() macro instead, which will provide
.suspend/.resume callbacks, pointing to pm_runtime_force_suspend() and
pm_runtime_force_resume() respectively; unless those callbacks really
aren't needed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dpaux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7dc681e2ee90..3c84e73d5051 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -598,7 +598,6 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int tegra_dpaux_suspend(struct device *dev)
 {
 	struct tegra_dpaux *dpaux = dev_get_drvdata(dev);
@@ -657,10 +656,9 @@ static int tegra_dpaux_resume(struct device *dev)
 	clk_disable_unprepare(dpaux->clk);
 	return err;
 }
-#endif
 
 static const struct dev_pm_ops tegra_dpaux_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra_dpaux_suspend, tegra_dpaux_resume, NULL)
+	RUNTIME_PM_OPS(tegra_dpaux_suspend, tegra_dpaux_resume, NULL)
 };
 
 static const struct tegra_dpaux_soc tegra124_dpaux_soc = {
@@ -694,7 +692,7 @@ struct platform_driver tegra_dpaux_driver = {
 	.driver = {
 		.name = "tegra-dpaux",
 		.of_match_table = tegra_dpaux_of_match,
-		.pm = &tegra_dpaux_pm_ops,
+		.pm = pm_ptr(&tegra_dpaux_pm_ops),
 	},
 	.probe = tegra_dpaux_probe,
 	.remove = tegra_dpaux_remove,
-- 
2.35.1

