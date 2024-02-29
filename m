Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3DB86CED5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBDB10E542;
	Thu, 29 Feb 2024 16:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YlL3P7HN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619110E52E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709223770;
 bh=FbUFTxW1sPYhtBRpk4roBC9QtA97yqwmH+mSd63Ye3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YlL3P7HNc1sAVZiPT6K6to3Fkaq2v5pBcIQViFFuDaSarufyRQ6S5g5UAwJOulxyu
 XOeeVRLd6ixS0vgF9ZKdvIz2s6ppVa8+uLR3xVF1WfIyzcmkjt7p9gy0wE/nJQ7aSB
 B6nKtb/AR26AOX71da8iIk5W8ZmG/qpCr5HGfUjes5XS5bQ/9oqTHVN7nxx2THFjtd
 rgWGs7iRQ4a2r4YdI8sI9qgSVSNbMCJAjFRn5amCXHtRp8ql31sXDh1mZSBgTSMuPB
 nCoTqes3rPr5SQHO4ZCpeTC0Ix3eQFfYLRExmVQxQjjUdtbXUZa/L/aj+J68HQ0iSo
 V/fdQTsmdzDRQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A7D637820E8;
 Thu, 29 Feb 2024 16:22:49 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Grant Likely <grant.likely@linaro.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 12/14] drm/panthor: Allow driver compilation
Date: Thu, 29 Feb 2024 17:22:26 +0100
Message-ID: <20240229162230.2634044-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229162230.2634044-1-boris.brezillon@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
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

Now that all blocks are available, we can add/update Kconfig/Makefile
files to allow compilation.

v6:
- Add Maxime's and Heiko's acks
- Keep source files alphabetically ordered in the Makefile

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
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/Kconfig          |  2 ++
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/panthor/Kconfig  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/Makefile | 14 ++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 872edb47bb53..ad8227d88840 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -370,6 +370,8 @@ source "drivers/gpu/drm/lima/Kconfig"
 
 source "drivers/gpu/drm/panfrost/Kconfig"
 
+source "drivers/gpu/drm/panthor/Kconfig"
+
 source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..6eb2b553a163 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -179,6 +179,7 @@ obj-$(CONFIG_DRM_XEN) += xen/
 obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
 obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
+obj-$(CONFIG_DRM_PANTHOR) += panthor/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
new file mode 100644
index 000000000000..55b40ad07f3b
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
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select DRM_EXEC
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_GPUVM
+	select DRM_SCHED
+	select IOMMU_IO_PGTABLE_LPAE
+	select IOMMU_SUPPORT
+	select PM_DEVFREQ
+	help
+	  DRM driver for ARM Mali CSF-based GPUs.
+
+	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
+
+	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
+	  be supported with the panfrost driver as they are not CSF GPUs.
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
new file mode 100644
index 000000000000..15294719b09c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+panthor-y := \
+	panthor_devfreq.o \
+	panthor_device.o \
+	panthor_drv.o \
+	panthor_fw.o \
+	panthor_gem.o \
+	panthor_gpu.o \
+	panthor_heap.o \
+	panthor_mmu.o \
+	panthor_sched.o
+
+obj-$(CONFIG_DRM_PANTHOR) += panthor.o
-- 
2.43.0

