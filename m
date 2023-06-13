Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70272DFA5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0566010E0A8;
	Tue, 13 Jun 2023 10:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2567 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jun 2023 10:35:17 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5AD10E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2wBSbgLa93Hhq7JFpc4GMQOjRKUGshimnZAjB38+QtI=; b=yYJKcFtBdrKHarHEciqy4jzIDT
 SpixS67atMGA132TSamQorM4iLDuG4DX2YsEDKBFujshnJMUe+8yAx/rxmd9o2pdNFvl9hefM/Clk
 A6uI9eZwGNWtOnSSZHKINlRE+am47MUzXQZ2W/USFVPaYgjJX3W7pFFvm4UJlIVs2WprlEtjhvJbA
 S3UP9M7c1V+EZ/aQAjPuQX4cUQT5B/UOF4/2b/xkQpvCZKV8tDoqymBoLpj0WqXMpR/pdxIjzHKju
 BzEU/e5fBBfaLiwSWCPfPchtsqzWbVK6eBoS1NxZCNnSz5TmznxUgMmMEC/BzYw0SEH9TKlMZGllc
 Z4XHtY0w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1q90hL-007a9U-JZ; Tue, 13 Jun 2023 12:52:23 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Enable runtime PM during probe
Date: Tue, 13 Jun 2023 12:52:14 +0300
Message-Id: <20230613095215.2497004-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Currently, engine drivers only enable runtime PM during the host1x
init callback. This can happen slightly later than the probe, which
can cause the power domain to intermittently not be turned off after
probe.

My hypothesis is that there is a race condition between the post-probe
power domain poweroff that is done from a queued work, and the
pm_runtime_enable call happening in the host1x init callback.
If the pm_runtime_enable call happens first, everything is OK and
the power off work can disable the power domain as PM runtime is
enabled and the device is runtime suspended. If power off work runs
first, PM runtime is still disabled for the device and the domain
must be kept powered.

Resolve the issue by moving the runtime PM enablement to the
probe function.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gr2d.c  | 16 +++++++---------
 drivers/gpu/drm/tegra/gr3d.c  | 16 +++++++---------
 drivers/gpu/drm/tegra/nvdec.c | 17 +++++++----------
 drivers/gpu/drm/tegra/vic.c   | 17 +++++++----------
 4 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 50f77fddda54..56468268df21 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -70,22 +70,15 @@ static int gr2d_init(struct host1x_client *client)
 		goto free;
 	}
 
-	pm_runtime_enable(client->dev);
-	pm_runtime_use_autosuspend(client->dev);
-	pm_runtime_set_autosuspend_delay(client->dev, 200);
-
 	err = tegra_drm_register_client(dev->dev_private, drm);
 	if (err < 0) {
 		dev_err(client->dev, "failed to register client: %d\n", err);
-		goto disable_rpm;
+		goto detach_iommu;
 	}
 
 	return 0;
 
-disable_rpm:
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
+detach_iommu:
 	host1x_client_iommu_detach(client);
 free:
 	host1x_syncpt_put(client->syncpts[0]);
@@ -299,6 +292,7 @@ static void gr2d_remove(struct platform_device *pdev)
 {
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&gr2d->client.base);
 }
 
@@ -372,6 +366,10 @@ static int __maybe_unused gr2d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 
 disable_clk:
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c026c2c916c1..46d213620b70 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -80,22 +80,15 @@ static int gr3d_init(struct host1x_client *client)
 		goto free;
 	}
 
-	pm_runtime_enable(client->dev);
-	pm_runtime_use_autosuspend(client->dev);
-	pm_runtime_set_autosuspend_delay(client->dev, 200);
-
 	err = tegra_drm_register_client(dev->dev_private, drm);
 	if (err < 0) {
 		dev_err(client->dev, "failed to register client: %d\n", err);
-		goto disable_rpm;
+		goto detach_iommu;
 	}
 
 	return 0;
 
-disable_rpm:
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
+detach_iommu:
 	host1x_client_iommu_detach(client);
 free:
 	host1x_syncpt_put(client->syncpts[0]);
@@ -554,6 +547,7 @@ static void gr3d_remove(struct platform_device *pdev)
 {
 	struct gr3d *gr3d = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&gr3d->client.base);
 }
 
@@ -607,6 +601,10 @@ static int __maybe_unused gr3d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 
 disable_clk:
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index ae78a81e5eef..2bc75f4d539f 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -177,13 +177,9 @@ static int nvdec_init(struct host1x_client *client)
 		goto free_channel;
 	}
 
-	pm_runtime_enable(client->dev);
-	pm_runtime_use_autosuspend(client->dev);
-	pm_runtime_set_autosuspend_delay(client->dev, 500);
-
 	err = tegra_drm_register_client(tegra, drm);
 	if (err < 0)
-		goto disable_rpm;
+		goto free_syncpt;
 
 	/*
 	 * Inherit the DMA parameters (such as maximum segment size) from the
@@ -193,10 +189,7 @@ static int nvdec_init(struct host1x_client *client)
 
 	return 0;
 
-disable_rpm:
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
+free_syncpt:
 	host1x_syncpt_put(client->syncpts[0]);
 free_channel:
 	host1x_channel_put(nvdec->channel);
@@ -539,6 +532,10 @@ static int nvdec_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 
 exit_falcon:
@@ -551,8 +548,8 @@ static void nvdec_remove(struct platform_device *pdev)
 {
 	struct nvdec *nvdec = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&nvdec->client.base);
-
 	falcon_exit(&nvdec->falcon);
 }
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index da7a038dca20..19125406cf32 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -143,13 +143,9 @@ static int vic_init(struct host1x_client *client)
 		goto free_channel;
 	}
 
-	pm_runtime_enable(client->dev);
-	pm_runtime_use_autosuspend(client->dev);
-	pm_runtime_set_autosuspend_delay(client->dev, 500);
-
 	err = tegra_drm_register_client(tegra, drm);
 	if (err < 0)
-		goto disable_rpm;
+		goto free_syncpt;
 
 	/*
 	 * Inherit the DMA parameters (such as maximum segment size) from the
@@ -159,10 +155,7 @@ static int vic_init(struct host1x_client *client)
 
 	return 0;
 
-disable_rpm:
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
+free_syncpt:
 	host1x_syncpt_put(client->syncpts[0]);
 free_channel:
 	host1x_channel_put(vic->channel);
@@ -529,6 +522,10 @@ static int vic_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 
 exit_falcon:
@@ -541,8 +538,8 @@ static void vic_remove(struct platform_device *pdev)
 {
 	struct vic *vic = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&vic->client.base);
-
 	falcon_exit(&vic->falcon);
 }
 
-- 
2.40.1

