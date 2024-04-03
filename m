Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4D8967D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E861127EB;
	Wed,  3 Apr 2024 08:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NJRQk4h6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BE21127EB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:11:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BD61ECE20B6;
 Wed,  3 Apr 2024 08:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31ECC433F1;
 Wed,  3 Apr 2024 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712131858;
 bh=SG0i7m/Qv+Wgr/oIlICWhiX3c3WYeQZoUHuUuYHJ3Mg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJRQk4h6DbL0PRCv2v9sEcKs42xqNz/dxm75KgThlyRajdVuR078RQ02O7Izdo+ZZ
 LnK2cN6v+mPmgcHePdMATB3uWETGSzCoSJz5BBh+gbBFtlrzLAOtVzoTK9cKPTD3VX
 xoglKUzgdJlNV7lO9y0aBfZDI24awPTqxjbDGUnUTcOZxsNcWxCNIyZ+UqDVyYvmJO
 RYoSNwxAs2MVFI6FRMnpM6OyUArbDkXu+BieEVf366sDxQluFmBuH+PruUunNsQ9nZ
 NRi1r/PQPL/Svp9zyGT2Mai3oHNv3/DVU/reCWO2S9NvNWzVWNBW42fOs6BC3OmsjV
 h5Uy2eh2EdNIA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 22/34] drm/komeda: don't warn for unused debugfs files
Date: Wed,  3 Apr 2024 10:06:40 +0200
Message-Id: <20240403080702.3509288-23-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
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

With debugfs disabled, the komeda_register debugfs file is unused:

drivers/gpu/drm/arm/display/komeda/komeda_dev.c:44:1: error: unused variable 'komeda_register_fops' [-Werror,-Wunused-const-variable]
DEFINE_SHOW_ATTRIBUTE(komeda_register);

The komeda_debugfs_init() function already has a call to debugfs_initialized()
that ends up eliminating the file as dead code, so just drop the #ifdef
to get rid of the warning.

Fixes: 576832681891 ("arm/komeda: Compile komeda_debugfs_init() only if CONFIG_DEBUG_FS is enabled")
Fixes: 7d3cfb70a604 ("drm/komeda: Add debugfs node "register" for register dump")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 14ee79becacb..5ba62e637a61 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -12,10 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
-#ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
-#endif
 
 #include <drm/drm_print.h>
 
@@ -43,7 +41,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
 
 DEFINE_SHOW_ATTRIBUTE(komeda_register);
 
-#ifdef CONFIG_DEBUG_FS
 static void komeda_debugfs_init(struct komeda_dev *mdev)
 {
 	if (!debugfs_initialized())
@@ -55,7 +52,6 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 	debugfs_create_x16("err_verbosity", 0664, mdev->debugfs_root,
 			   &mdev->err_verbosity);
 }
-#endif
 
 static ssize_t
 core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -265,9 +261,7 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 
 	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
 
-#ifdef CONFIG_DEBUG_FS
 	komeda_debugfs_init(mdev);
-#endif
 
 	return mdev;
 
@@ -286,9 +280,7 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
 
-#ifdef CONFIG_DEBUG_FS
 	debugfs_remove_recursive(mdev->debugfs_root);
-#endif
 
 	if (mdev->aclk)
 		clk_prepare_enable(mdev->aclk);
-- 
2.39.2

