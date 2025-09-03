Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB4B42D10
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405810E95F;
	Wed,  3 Sep 2025 22:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eck7e282";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594A710E95F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 22:55:11 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-77238cb3cbbso491315b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 15:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756940111; x=1757544911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DrlQU7DJzhqfes9DRlgKy/K0KdWM3hZbJrlRWvaOQOk=;
 b=Eck7e282FB+hemRhCTY1C0aTAHgUZp7HfY2HDpC9L6mDVcySXNg6URl5XRMV174DMq
 63TrflZTpenvI4Cb7MCv37ow/0uHM3Nm3/B9Adm6+nk5j/7EzIwblmqThVEhH1QLGex8
 bylVorKQdxyNvU04H6nNmGyS0xqowpNkGlD7d1sh16BT+XnI0xqNwyQ9AUR+sAqTAM5N
 GUiE0jwDQNAUZG17mcRXN6C2UBjIm+P+9vJJE4am/YwqLGLE8GQ6dkcbXWiMSq6W6NBu
 OzfgGnRcnFXy2rVXfde55DJsgP6rUgV3jT96igxMtMZFvsoZ6SjzN4dgAtsiAJeNkfw5
 XLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756940111; x=1757544911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrlQU7DJzhqfes9DRlgKy/K0KdWM3hZbJrlRWvaOQOk=;
 b=DZb/fJwXddEdjjUYi5JeC9kbMRN+B3HgGG0SkaglxZzWXd5ntifEfOxRG5+quaCKjQ
 CFunH6O7/uWEKA+VyyS1rB/m6kF0yOICASIzL6+UbeoVX4/WE0BUBmjb/XEO+ryPGwXA
 NSFw1qcPIeZJc6J7nMgNxm9eA0Hga8xVMFSDbgF+OkXfqvlBpVvAoQ+YjPq8RVBYrNvJ
 xyNlisEkgcwDYGPCjcsi2uFvqurhNQIOWDwzMlQC36c6nFtDfZDbHog6EoVrjrLvW/0W
 aw0iRzzkvwYDpWM2Rp/QBfhIjED2XopY9jny3TRwipASfiPj3RFD1Hljv9dwao0KIVzA
 0jSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHy2VKavER65Ly8TAuB65HD1UZdFzZo8qWaTqKsZS5Gvf+zGQvtijMmDUPvCmixGB/qjuB+KZ02gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylWIiwdjfdY4/8iBxdsFeQp1+ef2S8wWNQJm/47lKAEj9nOjIJ
 MFFyVxDmGIeljrUR5ZSP6LufnXV13XSVwzMpxZkQwsOAeEgTihYhmVnF
X-Gm-Gg: ASbGncttM6Cj6jDUpwHQb0GXMlGON1DAXAl43PFclXdZ4z1IqJ767yV2Wwz9X0RRxuc
 N7nOwwRuG4F0GkFPt7/nB0PcwnY59VAaAqTJ56b6S5MeGQh5ggEV4Yz5Z+KWc1FKHrumXC4xDkW
 Y4JQDSEY+ieyHhO+SXTewifV1pi6EDexl0T/ycQUjktJ6/HhpoYXSo89d/thCsSVkeZkdBKjzbS
 f+AU2snAp4bMl1sN6SNK7si5JvDFMe0BAw6Y/k5VhMQ+qRZpeZqPJjJjyPN71d8QMqdoADOsw4i
 5bzvOMF9VE/nCNThPOtAvSoZd+qIR1IpDRweA2AswOgLmSr7aBDL5imE2fUkW5G2gzG/o7RkB85
 kl9vVQeRcG7GrmZtiZWbVOTKoHgCzqNmG/fo22ae3cAOWJMx80qcD57s9W+IDJEg+VFIBpu+QMa
 sIMoV+m85BBA==
X-Google-Smtp-Source: AGHT+IFlDq2Qsn6j7X4Ynu7LubxbAsFYhg6GM5TR++pB6soDJoI0HSplg1yL36/BooPWOdImex7hkA==
X-Received: by 2002:a05:6a20:3c8f:b0:249:d3d:a4d4 with SMTP id
 adf61e73a8af0-2490d3db2e4mr4287081637.26.1756940110633; 
 Wed, 03 Sep 2025 15:55:10 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b4fb15f50d6sm2243371a12.0.2025.09.03.15.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 15:55:10 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
Date: Wed,  3 Sep 2025 15:55:04 -0700
Message-ID: <20250903225504.542268-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
In-Reply-To: <20250903225504.542268-1-olvaffe@gmail.com>
References: <20250903225504.542268-1-olvaffe@gmail.com>
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

Add panthor_soc_data to control custom ASN_HASH. Add compatible string
for "mediatek,mt8196-mali" and enable custom ASN_HASH for the soc.

Without custom ASN_HASH, FW fails to boot

  panthor 48000000.gpu: [drm] *ERROR* Unhandled Page fault in AS0 at VA 0x0000000000000000
  panthor 48000000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
  panthor 48000000.gpu: probe with driver panthor failed with error -110

With custom ASN_HASH, panthor probes fine and userspace boots to ui just
fine as well

  panthor 48000000.gpu: [drm] clock rate = 0
  panthor 48000000.gpu: EM: created perf domain
  panthor 48000000.gpu: [drm] Mali-G925-Immortalis id 0xd830 major 0x0 minor 0x1 status 0x5
  panthor 48000000.gpu: [drm] Features: L2:0x8130306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
  panthor 48000000.gpu: [drm] shader_present=0xee0077 l2_present=0x1 tiler_present=0x1
  panthor 48000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
  panthor 48000000.gpu: [drm] Firmware git sha: 27713280172c742d467a4b7d11180930094092ec
  panthor 48000000.gpu: [drm] CSF FW using interface v3.13.0, Features 0x10 Instrumentation features 0x71
  [drm] Initialized panthor 1.5.0 for 48000000.gpu on minor 1

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/Kconfig              |  6 +++++
 drivers/gpu/drm/panthor/Makefile             |  2 ++
 drivers/gpu/drm/panthor/panthor_device.c     |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h     |  4 +++
 drivers/gpu/drm/panthor/panthor_drv.c        |  4 +++
 drivers/gpu/drm/panthor/panthor_gpu.c        | 26 +++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h       |  4 +++
 drivers/gpu/drm/panthor/panthor_soc.h        | 26 ++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_soc_mt8196.c |  9 +++++++
 9 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b0..a207962cb518d 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -21,3 +21,9 @@ config DRM_PANTHOR
 
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
+
+config DRM_PANTHOR_SOC_MT8196
+	bool "Enable MediaTek MT8196 support"
+	depends on DRM_PANTHOR
+	help
+	  Enable SoC-specific code for MediaTek MT8196.
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c125..75e92c461304b 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -12,4 +12,6 @@ panthor-y := \
 	panthor_mmu.o \
 	panthor_sched.o
 
+panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) += panthor_soc_mt8196.o
+
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd87..c7033d82cef55 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -172,6 +172,8 @@ int panthor_device_init(struct panthor_device *ptdev)
 	struct page *p;
 	int ret;
 
+	ptdev->soc_data = of_device_get_match_data(ptdev->base.dev);
+
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed57..160977834e017 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -28,6 +28,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_soc_data;
 struct panthor_vm;
 struct panthor_vm_pool;
 
@@ -93,6 +94,9 @@ struct panthor_device {
 	/** @base: Base drm_device. */
 	struct drm_device base;
 
+	/** @soc_data: Optional SoC data. */
+	const struct panthor_soc_data *soc_data;
+
 	/** @phys_addr: Physical address of the iomem region. */
 	phys_addr_t phys_addr;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9256806eb6623..061ba38dd1bad 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -33,6 +33,7 @@
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
+#include "panthor_soc.h"
 
 /**
  * DOC: user <-> kernel object copy helpers.
@@ -1683,6 +1684,9 @@ static struct attribute *panthor_attrs[] = {
 ATTRIBUTE_GROUPS(panthor);
 
 static const struct of_device_id dt_match[] = {
+#ifdef CONFIG_DRM_PANTHOR_SOC_MT8196
+	{ .compatible = "mediatek,mt8196-mali", .data = &panthor_soc_data_mediatek_mt8196, },
+#endif
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be09..e68001a330790 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -19,6 +19,7 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_regs.h"
+#include "panthor_soc.h"
 
 /**
  * struct panthor_gpu - GPU block management data.
@@ -52,6 +53,28 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
+static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
+{
+	const struct panthor_soc_data *data = ptdev->soc_data;
+	u32 l2_config;
+	u32 i;
+
+	if (!data || !data->asn_hash_enable)
+		return;
+
+	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
+		drm_err(&ptdev->base, "Custom ASN hash not supported by the device");
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(data->asn_hash); i++)
+		gpu_write(ptdev, GPU_ASN_HASH(i), data->asn_hash[i]);
+
+	l2_config = gpu_read(ptdev, GPU_L2_CONFIG);
+	l2_config |= GPU_L2_CONFIG_ASN_HASH_ENABLE;
+	gpu_write(ptdev, GPU_L2_CONFIG, l2_config);
+}
+
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -241,8 +264,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 			      hweight64(ptdev->gpu_info.shader_present));
 	}
 
-	/* Set the desired coherency mode before the power up of L2 */
+	/* Set the desired coherency mode and L2 config before the power up of L2 */
 	panthor_gpu_coherency_set(ptdev);
+	panthor_gpu_l2_config_set(ptdev);
 
 	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf83..8fa69f33e911e 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -64,6 +64,8 @@
 
 #define GPU_FAULT_STATUS				0x3C
 #define GPU_FAULT_ADDR					0x40
+#define GPU_L2_CONFIG					0x48
+#define   GPU_L2_CONFIG_ASN_HASH_ENABLE			BIT(24)
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
@@ -110,6 +112,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
diff --git a/drivers/gpu/drm/panthor/panthor_soc.h b/drivers/gpu/drm/panthor/panthor_soc.h
new file mode 100644
index 0000000000000..784f4f359f0bb
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_soc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Google LLC */
+
+#ifndef __PANTHOR_SOC_H__
+#define __PANTHOR_SOC_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+
+/**
+ * struct panthor_soc_data - Panthor SoC Data
+ */
+struct panthor_soc_data {
+	/** @asn_hash_enable: True if GPU_L2_CONFIG_ASN_HASH_ENABLE must be set. */
+	bool asn_hash_enable;
+
+	/** @asn_hash: ASN_HASH values when asn_hash_enable is true. */
+	u32 asn_hash[3];
+};
+
+#ifdef CONFIG_DRM_PANTHOR_SOC_MT8196
+extern const struct panthor_soc_data panthor_soc_data_mediatek_mt8196;
+#endif
+
+#endif /* __PANTHOR_SOC_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_soc_mt8196.c b/drivers/gpu/drm/panthor/panthor_soc_mt8196.c
new file mode 100644
index 0000000000000..d85b2168c158c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_soc_mt8196.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 Google LLC */
+
+#include "panthor_soc.h"
+
+const struct panthor_soc_data panthor_soc_data_mediatek_mt8196 = {
+	.asn_hash_enable = true,
+	.asn_hash = { 0xb, 0xe, 0x0, },
+};
-- 
2.51.0.338.gd7d06c2dae-goog

