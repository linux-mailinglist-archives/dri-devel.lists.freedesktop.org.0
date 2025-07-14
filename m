Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E7B038F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B11C10E021;
	Mon, 14 Jul 2025 08:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZTqa48Ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7710E021;
 Mon, 14 Jul 2025 08:16:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8F3743C73;
 Mon, 14 Jul 2025 08:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68839C4CEED;
 Mon, 14 Jul 2025 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752480999;
 bh=EXUNVHi0qvG4fFZ1xPIguHipbPUIz2io8+UJKpg8FyU=;
 h=From:To:Cc:Subject:Date:From;
 b=ZTqa48UlO78Li3onnWYC5vQW8yqGdlM649Pkr8uH4P6SI/5WTAAbNjVGWB5S9R1S4
 aQtjlseQIh7URWzGAN2CnyZWO1GkXpwR2tIGtMkhTLd5rytdwig2Hj3QWLlPtucMbZ
 Z+0ole/U3r2CaYcKXu+kT0bCzGa6sUnU4/WU1z+AkruB9NAKV7yhUTRBuPYvs8cSZ1
 1c6swSGzxDru7CQMUXKYap5O+NiY5xHX/XkkFRgZS+aPKv3XurelBpM6JtY5dDlBJv
 NogSKEh55G9ljgahYZYLacZnBUWqCrKZJrowdSU7iABgFWSsel0QEjFxS45xeSyX0y
 wzg1w3KAEWnTw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Samuel Zhang <guoqing.zhang@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Date: Mon, 14 Jul 2025 10:16:25 +0200
Message-Id: <20250714081635.4071570-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

When power management is not enabled in the kernel build, the newly
added hibernation changes cause a link failure:

arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
amdgpu_drv.c:(.text+0x1514): undefined reference to `pm_hibernate_is_recovering'

Make the power management code in this driver conditional on
CONFIG_PM and CONFIG_PM_SLEEP

Fixes: 530694f54dd5 ("drm/amdgpu: do not resume device in thaw for normal hibernation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 021defca9b61..66b5b3260fb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2963,15 +2963,15 @@ long amdgpu_drm_ioctl(struct file *filp,
 }
 
 static const struct dev_pm_ops amdgpu_pm_ops = {
-	.prepare = amdgpu_pmops_prepare,
-	.complete = amdgpu_pmops_complete,
-	.suspend = amdgpu_pmops_suspend,
-	.suspend_noirq = amdgpu_pmops_suspend_noirq,
-	.resume = amdgpu_pmops_resume,
-	.freeze = amdgpu_pmops_freeze,
-	.thaw = amdgpu_pmops_thaw,
-	.poweroff = amdgpu_pmops_poweroff,
-	.restore = amdgpu_pmops_restore,
+	.prepare = pm_sleep_ptr(amdgpu_pmops_prepare),
+	.complete = pm_sleep_ptr(amdgpu_pmops_complete),
+	.suspend = pm_sleep_ptr(amdgpu_pmops_suspend),
+	.suspend_noirq = pm_sleep_ptr(amdgpu_pmops_suspend_noirq),
+	.resume = pm_sleep_ptr(amdgpu_pmops_resume),
+	.freeze = pm_sleep_ptr(amdgpu_pmops_freeze),
+	.thaw = pm_sleep_ptr(amdgpu_pmops_thaw),
+	.poweroff = pm_sleep_ptr(amdgpu_pmops_poweroff),
+	.restore = pm_sleep_ptr(amdgpu_pmops_restore),
 	.runtime_suspend = amdgpu_pmops_runtime_suspend,
 	.runtime_resume = amdgpu_pmops_runtime_resume,
 	.runtime_idle = amdgpu_pmops_runtime_idle,
@@ -3116,7 +3116,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.probe = amdgpu_pci_probe,
 	.remove = amdgpu_pci_remove,
 	.shutdown = amdgpu_pci_shutdown,
-	.driver.pm = &amdgpu_pm_ops,
+	.driver.pm = pm_ptr(&amdgpu_pm_ops),
 	.err_handler = &amdgpu_pci_err_handler,
 	.dev_groups = amdgpu_sysfs_groups,
 };
-- 
2.39.5

