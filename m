Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D4447609
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 22:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB236E218;
	Sun,  7 Nov 2021 21:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C7D6E2D5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 21:16:30 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id jpWdmO5RwwQZfjpWdmDtkZ; Sun, 07 Nov 2021 22:16:28 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Nov 2021 22:16:28 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/2] gpu: host1x: Fix an error handling path in
 'host1x_probe()'
Date: Sun,  7 Nov 2021 22:16:25 +0100
Message-Id: <05c1932b66048ebf6742705e2ab16eea852c46d9.1636319710.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-tegra@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing 'host1x_bo_cache_destroy()' call in the error handling
path of the probe, as already done in the remove function.

In order to simplify the error handling, move the 'host1x_bo_cache_init()'
call after all the devm_ function.

Fixes: e3166698a8a0 ("drm/tegra: Implement buffer object cache")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested.
I hope that moving host1x_bo_cache_init() is just fine.
---
 drivers/gpu/host1x/dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3d4cabdbc78d..fa00e31ea2f9 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,7 +404,6 @@ static int host1x_probe(struct platform_device *pdev)
 	if (syncpt_irq < 0)
 		return syncpt_irq;
 
-	host1x_bo_cache_init(&host->cache);
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
 	INIT_LIST_HEAD(&host->list);
@@ -449,10 +448,12 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	host1x_bo_cache_init(&host->cache);
+
 	err = host1x_iommu_init(host);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to setup IOMMU: %d\n", err);
-		return err;
+		goto destroy_cache;
 	}
 
 	err = host1x_channel_list_init(&host->channel_list,
@@ -516,6 +517,8 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
 	host1x_iommu_exit(host);
+destroy_cache:
+	host1x_bo_cache_destroy(&host->cache);
 
 	return err;
 }
-- 
2.30.2

