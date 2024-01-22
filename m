Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F3836A9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840BD10F5E6;
	Mon, 22 Jan 2024 16:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C571E10F5E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705941065;
 bh=UyjKVldzPK1qdGh21n9bsaFvfq2HYPVrP/jSm0NeeRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aJ2xqM5U/pFEqtV3D8n284+0J9lOuJ+9vzUKa/UGouWY4DnraCg18QUnsPFo+PkWc
 vaGIzw2ajqFTmoeoqcao9kUAQnE/rRMj7HnplfXVsU++rQwwB0N1octP2mhtcZDHaF
 RkMibcYGmrUjf2mRQUOHxY+DLuLSUol+615TY4Tp6OT/KkEhDa3RgREV/y7UjnDV7l
 RuaQjGYJeR5UBWS5Wwu9GHxq6rxs+WxWMnloSMvaVN7BWe+go33/gPwXGUPTm2spiN
 ecpFtk3+OsAO+MZM5xFqj3EB6DdUBw0AMXT9FYlSN0LDwE/Q1Y5R/8SVcq+1xTOV+l
 AgFtQ+1tNk5sg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9926D378200E;
 Mon, 22 Jan 2024 16:31:04 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/14] drm/panthor: Allow driver compilation
Date: Mon, 22 Jan 2024 17:30:43 +0100
Message-ID: <20240122163047.1954733-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122163047.1954733-1-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all blocks are available, we can add/update Kconfig/Makefile
files to allow compilation.

v4:
- Add Steve's R-b

v3:
- Add a dep on DRM_GPUVM
- Fix dependencies in Kconfig
- Expand help text to (hopefully) describe which GPUs are to be
  supported by this driver and which are for panfrost.

Co-developed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/Kconfig          |  2 ++
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/panthor/Kconfig  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 628f90ed8a9b..88c1ca148507 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -369,6 +369,8 @@ source "drivers/gpu/drm/lima/Kconfig"
 
 source "drivers/gpu/drm/panfrost/Kconfig"
 
+source "drivers/gpu/drm/panthor/Kconfig"
+
 source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8ac6f4b9546e..9023d5440cd7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_DRM_XEN) += xen/
 obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
 obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
+obj-$(CONFIG_DRM_PANTHOR) += panthor/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
new file mode 100644
index 000000000000..159845e51116
--- /dev/null
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+config DRM_PANTHOR
+	tristate "Panthor (DRM support for ARM Mali CSF-based GPUs)"
+	depends on DRM
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
+	depends on MMU
+	select DRM_GPUVM
+	select DRM_EXEC
+	select DRM_SCHED
+	select IOMMU_SUPPORT
+	select IOMMU_IO_PGTABLE_LPAE
+	select DRM_GEM_SHMEM_HELPER
+	select PM_DEVFREQ
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	help
+	  DRM driver for ARM Mali CSF-based GPUs.
+
+	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
+
+	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
+	  be supported with the panfrost driver as they are not CSF GPUs.
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
new file mode 100644
index 000000000000..64193a484879
--- /dev/null
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+panthor-y := \
+	panthor_devfreq.o \
+	panthor_device.o \
+	panthor_drv.o \
+	panthor_gem.o \
+	panthor_gpu.o \
+	panthor_heap.o \
+	panthor_heap.o \
+	panthor_fw.o \
+	panthor_mmu.o \
+	panthor_sched.o
+
+obj-$(CONFIG_DRM_PANTHOR) += panthor.o
-- 
2.43.0

