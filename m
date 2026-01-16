Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA16D31676
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99C010E88F;
	Fri, 16 Jan 2026 12:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lGB0xfk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059FC10E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768568282; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d9f+qbUR1luzCuA1yntR7Gx8RiIfGN4QaU+/+VOZYjMpXogmNK+qsA0ASpbUGB9lpthyZcHgTSmZr+olpeFb8X7/qHIYNPRy8DWNjA1n2XmkZa8vLRFVhGiP7TG0DN6ONlXD82CG0az1/IDwuBcti17VAYIo7BBJJD6FlhbUgwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768568282;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Nuuqy52cftd3cuhpCf1QGHu40rEZ2X7EsjpBFlTHGvo=; 
 b=f1LSGmWF1FRgELgdph2T5EKdh4LVjrLdNUUWTDyN2ykk5OR9rFfj3hutnT33Kg3Ffo9ZLXO4LC3RlJbaqkOCphr2d2fgYhBmjCactEXb6LlcLFRjsyoVfzuGDiWxDfGcZXa9qb5bhFO4G4JnK9EPbRrvruM/bvU4EAgbr0NMDHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768568282; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Nuuqy52cftd3cuhpCf1QGHu40rEZ2X7EsjpBFlTHGvo=;
 b=lGB0xfk2MUXc/5xJzgznkBpBRQhQ4UvKOSFPFFuaeK/ftCrTeAh82M424vacg7du
 sghWMCZICsetX+6ZfaGcIjbI2qMaPpYU8GLhJLrnFs1G0bhWeR8DGOdZN3RNp74UbLJ
 dZ0g6YbboW7MJLtwDL3I6lR4kxEwFzm/S0N7JwYs=
Received: by mx.zohomail.com with SMTPS id 1768568280107467.210120460804;
 Fri, 16 Jan 2026 04:58:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 16 Jan 2026 13:57:32 +0100
Subject: [PATCH v10 3/4] drm/panthor: Add tracepoint for hardware
 utilisation changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-panthor-tracepoints-v10-3-d925986e3d1b@collabora.com>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
In-Reply-To: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

Mali GPUs have three registers that indicate which parts of the hardware
are powered at any moment. These take the form of bitmaps. In the case
of SHADER_READY for example, a high bit indicates that the shader core
corresponding to that bit index is powered on. These bitmaps aren't
solely contiguous bits, as it's common to have holes in the sequence of
shader core indices, and the actual set of which cores are present is
defined by the "shader present" register.

When the GPU finishes a power state transition, it fires a
GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
received, the _READY registers will contain new interesting data. During
power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
the registers will likewise contain potentially changed data.

This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
which is something related to Mali v14+'s power control logic. The
_READY registers and corresponding interrupts are already available in
v9 and onwards.

Expose the data as a tracepoint to userspace. This allows users to debug
various scenarios and gather interesting information, such as: knowing
how much hardware is lit up at any given time, correlating graphics
corruption with a specific powered shader core, measuring when hardware
is allowed to go to a powered off state again, and so on.

The registration/unregistration functions for the tracepoint go through
a wrapper in panthor_hw.c, so that v14+ can implement the same
tracepoint by adding its hardware specific IRQ on/off callbacks to the
panthor_hw.ops member.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c   | 28 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
 drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
 drivers/gpu/drm/panthor/panthor_trace.h | 58 ++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9304469a711a..2ab444ee8c71 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -22,6 +22,9 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
+#define CREATE_TRACE_POINTS
+#include "panthor_trace.h"
+
 /**
  * struct panthor_gpu - GPU block management data.
  */
@@ -48,6 +51,9 @@ struct panthor_gpu {
 	 GPU_IRQ_RESET_COMPLETED | \
 	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
 
+#define GPU_POWER_INTERRUPTS_MASK	\
+	(GPU_IRQ_POWER_CHANGED | GPU_IRQ_POWER_CHANGED_ALL)
+
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
 	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
@@ -80,6 +86,12 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
 
+	if (tracepoint_enabled(gpu_power_status) && (status & GPU_POWER_INTERRUPTS_MASK))
+		trace_gpu_power_status(ptdev->base.dev,
+				       gpu_read64(ptdev, SHADER_READY),
+				       gpu_read64(ptdev, TILER_READY),
+				       gpu_read64(ptdev, L2_READY));
+
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
 		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
@@ -157,6 +169,22 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+int panthor_gpu_power_changed_on(struct panthor_device *ptdev)
+{
+	guard(pm_runtime_active)(ptdev->base.dev);
+
+	panthor_gpu_irq_enable_events(&ptdev->gpu->irq, GPU_POWER_INTERRUPTS_MASK);
+
+	return 0;
+}
+
+void panthor_gpu_power_changed_off(struct panthor_device *ptdev)
+{
+	guard(pm_runtime_active)(ptdev->base.dev);
+
+	panthor_gpu_irq_disable_events(&ptdev->gpu->irq, GPU_POWER_INTERRUPTS_MASK);
+}
+
 /**
  * panthor_gpu_block_power_off() - Power-off a specific block of the GPU
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 12e66f48ced1..12c263a39928 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -51,5 +51,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
 int panthor_gpu_soft_reset(struct panthor_device *ptdev);
+void panthor_gpu_power_changed_off(struct panthor_device *ptdev);
+int panthor_gpu_power_changed_on(struct panthor_device *ptdev);
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 80c521784cd3..d135aa6724fa 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -2,6 +2,8 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
 #include <linux/nvmem-consumer.h>
+#include <linux/platform_device.h>
+
 #include <drm/drm_print.h>
 
 #include "panthor_device.h"
@@ -30,6 +32,8 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 		.soft_reset = panthor_gpu_soft_reset,
 		.l2_power_off = panthor_gpu_l2_power_off,
 		.l2_power_on = panthor_gpu_l2_power_on,
+		.power_changed_off = panthor_gpu_power_changed_off,
+		.power_changed_on = panthor_gpu_power_changed_on,
 	},
 };
 
@@ -54,6 +58,64 @@ static struct panthor_hw_entry panthor_hw_match[] = {
 	},
 };
 
+static int panthor_hw_set_power_tracing(struct device *dev, void *data)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+
+	if (!ptdev)
+		return -ENODEV;
+
+	if (!ptdev->hw)
+		return 0;
+
+	if (data) {
+		if (ptdev->hw->ops.power_changed_on)
+			return ptdev->hw->ops.power_changed_on(ptdev);
+	} else {
+		if (ptdev->hw->ops.power_changed_off)
+			ptdev->hw->ops.power_changed_off(ptdev);
+	}
+
+	return 0;
+}
+
+int panthor_hw_power_status_register(void)
+{
+	struct device_driver *drv;
+	int ret;
+
+	drv = driver_find("panthor", &platform_bus_type);
+	if (!drv)
+		return -ENODEV;
+
+	ret = driver_for_each_device(drv, NULL, (void *)true,
+				     panthor_hw_set_power_tracing);
+
+	return ret;
+}
+
+void panthor_hw_power_status_unregister(void)
+{
+	struct device_driver *drv;
+	int ret;
+
+	drv = driver_find("panthor", &platform_bus_type);
+	if (!drv)
+		return;
+
+	ret = driver_for_each_device(drv, NULL, NULL, panthor_hw_set_power_tracing);
+
+	/*
+	 * Ideally, it'd be possible to ask driver_for_each_device to hand us
+	 * another "start" to keep going after the failing device, but it
+	 * doesn't do that. Minor inconvenience in what is probably a bad day
+	 * on the computer already though.
+	 */
+	if (ret)
+		pr_warn("Couldn't mask power IRQ for at least one device: %pe\n",
+			ERR_PTR(ret));
+}
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 56c68c1e9c26..2c28aea82841 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -19,6 +19,12 @@ struct panthor_hw_ops {
 
 	/** @l2_power_on: L2 power on function pointer */
 	int (*l2_power_on)(struct panthor_device *ptdev);
+
+	/** @power_changed_on: Start listening to power change IRQs */
+	int (*power_changed_on)(struct panthor_device *ptdev);
+
+	/** @power_changed_off: Stop listening to power change IRQs */
+	void (*power_changed_off)(struct panthor_device *ptdev);
 };
 
 /**
@@ -32,6 +38,8 @@ struct panthor_hw {
 };
 
 int panthor_hw_init(struct panthor_device *ptdev);
+int panthor_hw_power_status_register(void);
+void panthor_hw_power_status_unregister(void);
 
 static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
 {
diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
new file mode 100644
index 000000000000..5bd420894745
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_trace.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Collabora ltd. */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM panthor
+
+#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __PANTHOR_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "panthor_hw.h"
+
+/**
+ * gpu_power_status - called whenever parts of GPU hardware are turned on or off
+ * @dev: pointer to the &struct device, for printing the device name
+ * @shader_bitmap: bitmap where a high bit indicates the shader core at a given
+ *                 bit index is on, and a low bit indicates a shader core is
+ *                 either powered off or absent
+ * @tiler_bitmap: bitmap where a high bit indicates the tiler unit at a given
+ *                bit index is on, and a low bit indicates a tiler unit is
+ *                either powered off or absent
+ * @l2_bitmap: bitmap where a high bit indicates the L2 cache at a given bit
+ *             index is on, and a low bit indicates the L2 cache is either
+ *             powered off or absent
+ */
+TRACE_EVENT_FN(gpu_power_status,
+	TP_PROTO(const struct device *dev, u64 shader_bitmap, u64 tiler_bitmap,
+		 u64 l2_bitmap),
+	TP_ARGS(dev, shader_bitmap, tiler_bitmap, l2_bitmap),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__field(u64, shader_bitmap)
+		__field(u64, tiler_bitmap)
+		__field(u64, l2_bitmap)
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__entry->shader_bitmap	= shader_bitmap;
+		__entry->tiler_bitmap	= tiler_bitmap;
+		__entry->l2_bitmap	= l2_bitmap;
+	),
+	TP_printk("%s: shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
+		  __get_str(dev_name), __entry->shader_bitmap, __entry->tiler_bitmap,
+		  __entry->l2_bitmap
+	),
+	panthor_hw_power_status_register, panthor_hw_power_status_unregister
+);
+
+#endif /* __PANTHOR_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE panthor_trace
+
+#include <trace/define_trace.h>

-- 
2.52.0

