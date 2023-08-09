Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5137765A4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE1210E47B;
	Wed,  9 Aug 2023 16:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9963E10E475
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A4126607207;
 Wed,  9 Aug 2023 17:53:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600021;
 bh=W4eI3w7UwkmOGgt09WmbBkXEKVn2/gHzxPKrlzs0c2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fGMaQ0RY1xQqND5GNRvGd19mWa71e1PRThS2AlhqJUfIHgpCm09bUipC8MZiMj7il
 oWut0PGXTktcOKbrJ422w5/D9uYJ+aRjOxVcleZHLNLHTUCIr58EmhfY/fOItwgm7+
 zev0n3JXnPlf2pu5U/fTO9fdbTsQ0BqbWKTooOkibaXyQpDjqBj39vopG8aQukWmqF
 paW6HTl62xXnbOqqS2qvpQzCRIMs6JFNOQSQwFSgBr7pMJAJ+RK+97O3NSP2vYDznv
 f1T7nmFVMcbxDdcDxuSNXisYLqh8hiX2uDfUJ+oaKtLSB3nhXL69f1AEKcshlLC3S6
 Rab8VXqVNoDIA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Date: Wed,  9 Aug 2023 18:53:26 +0200
Message-ID: <20230809165330.2451699-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all blocks are available, we can add/update Kconfig/Makefile
files to allow compilation.

v2:
- Rename the driver (pancsf -> panthor)
- Change the license (GPL2 -> MIT + GPL2)
- Split the driver addition commit
- Add new dependencies on GPUVA and DRM_SCHED

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/Kconfig          |  2 ++
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/panthor/Kconfig  | 16 ++++++++++++++++
 drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2a44b9419d4d..bddfbdb2ffee 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -358,6 +358,8 @@ source "drivers/gpu/drm/lima/Kconfig"
 
 source "drivers/gpu/drm/panfrost/Kconfig"
 
+source "drivers/gpu/drm/panthor/Kconfig"
+
 source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..0a260727505f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -188,6 +188,7 @@ obj-$(CONFIG_DRM_TVE200) += tve200/
 obj-$(CONFIG_DRM_XEN) += xen/
 obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
 obj-$(CONFIG_DRM_LIMA)  += lima/
+obj-$(CONFIG_DRM_PANTHOR) += panthor/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
new file mode 100644
index 000000000000..a9d17b1bbb75
--- /dev/null
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+config DRM_PANTHOR
+	tristate "Panthor (DRM support for ARM Mali CSF-based GPUs)"
+	depends on DRM
+	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on MMU
+	select DRM_EXEC
+	select DRM_SCHED
+	select IOMMU_SUPPORT
+	select IOMMU_IO_PGTABLE_LPAE
+	select DRM_GEM_SHMEM_HELPER
+	select PM_DEVFREQ
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	help
+	  DRM driver for ARM Mali CSF-based GPUs.
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
2.41.0

