Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1171859995
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 22:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82710E0FD;
	Sun, 18 Feb 2024 21:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2jJ/nLmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8C10E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708292509;
 bh=fC5FhUvgf05kwz98YCrIP3zyCDj41IZkYBSs85fDp1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2jJ/nLmvSO5N0t07j5q6jIwkJJ5gZTL5tzMUdbkTK+Kw26XReH49OayBBBVQCsJii
 xPnOEL7yTChWIqUvRHJeVGq0HGYZnyDZ0fZmThESQXcJ7pJ+rtd0sD9c3xAAf54CIf
 z7AlsDCdpVha5RkBhGoqCEq6WnClK7+7wbjca8RqY0QEGBfWxUaph4SA8PA0hW02Pf
 av6NXpW2d8EI7zEMlKZvL574pie8DhvfJN+PFNtLFQzqXXVj09bU5OeXfhxGhjSur/
 2MkSB1dfllCqoWd2ztz96KYBVYiTj4uEbRVSNhyNyEI+d0BXcy4h8SghwU+nF9LMaY
 F+vuaQfCDAEJw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7F70B37820C1;
 Sun, 18 Feb 2024 21:41:48 +0000 (UTC)
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
 Grant Likely <grant.likely@linaro.org>
Subject: [PATCH v5 12/14] drm/panthor: Allow driver compilation
Date: Sun, 18 Feb 2024 22:41:26 +0100
Message-ID: <20240218214131.3035480-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218214131.3035480-1-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
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

