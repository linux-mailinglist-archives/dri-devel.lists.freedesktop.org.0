Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72E803BAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA910E3A6;
	Mon,  4 Dec 2023 17:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D1A10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A07066072A7;
 Mon,  4 Dec 2023 17:33:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701711212;
 bh=kQg6Al7g33GSTK1fPZailEBTjLzVO0EjQFvye+T8baM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SZOPEFN+2h/C3BH6qxRw1v7VJnFYR+r6aQnhyWPnhtP7Uwd0K2b+u4wsor0Xv0YiM
 wbcmi19MXcXSYv7WkpQSxlHYTB0lOmGws4kpzF3EqWnNt5CNhtEsYn1dDwDzIxa63G
 Azx/5GV2ser0RJPpU90D5QJYHZb072gKnemaFrneQIw93VDUkqkXatuyBsOm22LiJR
 FbVpLCWgb1rytWvRIqUD4L31y6vFTcPItQXJ5dasFIKbVs+QRVsebvRAChuQ2rAepe
 T10LFh+MjqAAZaBnyf7L0tEa9iOLNktKxbz42coMvJVzqZQhMgV4j+iVMVD21Ylpk4
 FqcK7SLDp8QOQ==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/14] drm/panthor: Allow driver compilation
Date: Mon,  4 Dec 2023 18:33:05 +0100
Message-ID: <20231204173313.2098733-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204173313.2098733-1-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all blocks are available, we can add/update Kconfig/Makefile
files to allow compilation.

v3:
- Add a dep on DRM_GPUVM
- Fix dependencies in Kconfig
- Expand help text to (hopefully) describe which GPUs are to be
  supported by this driver and which are for panfrost.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
---
 drivers/gpu/drm/Kconfig          |  2 ++
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/panthor/Kconfig  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b7abd436455f..9cc1e56d3eec 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -381,6 +381,8 @@ source "drivers/gpu/drm/lima/Kconfig"
 
 source "drivers/gpu/drm/panfrost/Kconfig"
 
+source "drivers/gpu/drm/panthor/Kconfig"
+
 source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b4cb0835620a..b73abec60bbf 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -190,6 +190,7 @@ obj-$(CONFIG_DRM_XEN) += xen/
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

