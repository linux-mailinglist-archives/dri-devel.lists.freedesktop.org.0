Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06BF86FCBC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4410F9B9;
	Mon,  4 Mar 2024 09:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PKyJblPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222110F854
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709543297;
 bh=JF7pYoYuekm/+xrcimq5rjyT6LvJu2tYAR7CeQRBj/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PKyJblPT3ykrcaedcDmzO+QGYvyZMPKsyLu/4ODEEE8TvNDUpgnbLmvYjGhvVbzDL
 JIpE8wr6+oCDr1xnsqcDAck9ngkqnK8QxHXqBWDXWQT04XNaP6yGU7/2NRV6pwA8tQ
 MBVHQR7Dxd/RGCrbGUuuZcayFl5LDxDmUExFQLU32LAhEKceNu38NhiBEDrul9AOay
 LsE1gnIXMk+6DgYFkX3XjjYr4rDcoeoNjkwU8LmHSyn8CJLOIwJbGjgZ2nyOrhqoh8
 DzgcPVOy53tNXCIFqPanASpCO9WtJKQC7iT0v2cbYQUVqcANVw3VgHDzp9QdrHKDqH
 c0NTsrjfjsFEQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0ECBB37820C3;
 Mon,  4 Mar 2024 09:08:17 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] drm/panthor: Fix undefined panthor_device_suspend/resume
 symbol issue
Date: Mon,  4 Mar 2024 10:08:12 +0100
Message-ID: <20240304090812.3941084-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304090812.3941084-1-boris.brezillon@collabora.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
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

panthor_device_resume/suspend() are only compiled when CONFIG_PM is
enabled but panthro_drv.c doesn't use the pm_ptr() macro to conditionally
discard resume/suspend assignments, which causes undefined symbol
errors at link time when !PM.

We could fix that by using pm_ptr(), but supporting the !PM case makes
little sense (the whole point of these embedded GPUs is to be low power,
so proper PM is a basic requirement in that case). So let's just enforce
the presence of CONFIG_PM with a Kconfig dependency instead.

If someone needs to relax this dependency, it can be done in a follow-up.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/Kconfig          | 1 +
 drivers/gpu/drm/panthor/panthor_device.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b..fdce7c1b2310 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -6,6 +6,7 @@ config DRM_PANTHOR
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
+	depends on PM
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 68e467ee458a..efea29143a54 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -403,7 +403,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 	return 0;
 }
 
-#ifdef CONFIG_PM
 int panthor_device_resume(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
@@ -548,4 +547,3 @@ int panthor_device_suspend(struct device *dev)
 	mutex_unlock(&ptdev->pm.mmio_lock);
 	return ret;
 }
-#endif
-- 
2.43.0

