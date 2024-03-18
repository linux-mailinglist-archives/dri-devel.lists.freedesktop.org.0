Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B687E551
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 09:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220110F4BE;
	Mon, 18 Mar 2024 08:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ylhovdzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D810F4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710752338;
 bh=T9jlVMSPOPeAHYRXQn/Nqdcz5en9h+8NQmkriKCBo/E=;
 h=From:To:Cc:Subject:Date:From;
 b=ylhovdzHUhsJtfEGyjISNiqGBHVzAOiOj1G+en/n4I9CJu3CHucPVEAKUxqlGtPKh
 +vSBqWNFFY2dre187aYbYDw244+UtNiyox43Wq8ngBOACm8en60bsopTXXzorvn1Tr
 CblXKOzHWiI0V91cQQGVm2OfishgvLM+LMZNKFQydVRJQ9R3m3AIfJcSLPNYOZ3bVU
 wjI7xmJGVmTR5NdG239hFELNK/0EH6LmWgyKniXrWcFB1Mb99PVyQgiUFNWQOA6C3y
 gnIqs8Plpw671mo2GO8v5fhLUl1GmEA+DrfSOlZT5YfvpkU7co/uHWwqnKOavFmpYH
 zERrNfcah3y6g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8CF683781FCE;
 Mon, 18 Mar 2024 08:58:57 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/panthor: Fix the CONFIG_PM=n case
Date: Mon, 18 Mar 2024 09:58:55 +0100
Message-ID: <20240318085855.994179-1-boris.brezillon@collabora.com>
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

Putting a hard dependency on CONFIG_PM is not possible because of a
circular dependency issue, and it's actually not desirable either. In
order to support this use case, we forcibly resume at init time, and
suspend at unplug time.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Tested by faking CONFIG_PM=n in the driver (basically commenting
all pm_runtime calls, and making the panthor_device_suspend/resume()
calls unconditional in the panthor_device_unplug/init() path) since
CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
can't be 100% sure this will work correctly on a platform that has
CONFIG_PM=n.
---
 drivers/gpu/drm/panthor/panthor_device.c | 13 +++++++++++--
 drivers/gpu/drm/panthor/panthor_drv.c    |  4 +++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 69deb8e17778..ba7aedbb4931 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -87,6 +87,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 
+	/* If PM is disabled, we need to call the suspend handler manually. */
+	if (!IS_ENABLED(CONFIG_PM))
+		panthor_device_suspend(ptdev->base.dev);
+
 	/* Report the unplug operation as done to unblock concurrent
 	 * panthor_device_unplug() callers.
 	 */
@@ -218,6 +222,13 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	/* If PM is disabled, we need to call panthor_device_resume() manually. */
+	if (!IS_ENABLED(CONFIG_PM)) {
+		ret = panthor_device_resume(ptdev->base.dev);
+		if (ret)
+			return ret;
+	}
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
@@ -402,7 +413,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 	return 0;
 }
 
-#ifdef CONFIG_PM
 int panthor_device_resume(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
@@ -547,4 +557,3 @@ int panthor_device_suspend(struct device *dev)
 	mutex_unlock(&ptdev->pm.mmio_lock);
 	return ret;
 }
-#endif
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ff484506229f..2ea6a9f436db 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1407,17 +1407,19 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+#ifdef CONFIG_PM
 static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
 				 panthor_device_suspend,
 				 panthor_device_resume,
 				 NULL);
+#endif
 
 static struct platform_driver panthor_driver = {
 	.probe = panthor_probe,
 	.remove_new = panthor_remove,
 	.driver = {
 		.name = "panthor",
-		.pm = &panthor_pm_ops,
+		.pm = pm_ptr(&panthor_pm_ops),
 		.of_match_table = dt_match,
 	},
 };
-- 
2.43.0

