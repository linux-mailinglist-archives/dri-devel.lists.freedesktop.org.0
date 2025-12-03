Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51441C9F33A
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A1110E157;
	Wed,  3 Dec 2025 13:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="HrHOlml2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9B10E172
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764770204; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CSOAJ8aJW0jn2SFif2Ydk1uQyyx6OEm7IJwciO3Sg6SROYVwJ/RRuewWYdPTsYmahAnJ2SmplKzq4IhJCs8NW7GpYaADtcXOBjuvrJyx38ZrhsbRaYLpcBuazfK8oa0HVHzcMI796Nz3wTnJJ9ZQQF6TsG1NtOBW7SS9orRkxps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764770204;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BafTXFGVFmIDDsJ0hvlCVkL5yw5qTMNyy0t2dgnoYMY=; 
 b=IvM5C3Pu8NCdCFMKgrlOkvqIwAKijPDvajO/jw5dQzapX48tBhSuNEZoU5w0xQYlEef004uR4diZgsgBCoCfAP4382ukzoDXFMg+GxuUQjVGtjosTWbXHUvv5fT6jm2KPFpviXPiAqIkUy5T4Fvxn5VLobl9fK10JtiQehp8Apg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764770204; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=BafTXFGVFmIDDsJ0hvlCVkL5yw5qTMNyy0t2dgnoYMY=;
 b=HrHOlml2eCgEgPkZ1bObztMnXMkWea5+PIxlEZ7ntgnS0NMh2ZN9IPItYVvNG74y
 V/GyBb2VBTdP2fAawrhK5aAgkBl7wCMqYtoEvvhjk6EqXc6lS1+EznPJaJgZntZH7l+
 01lB1860OHGbTiKqOtY+jsVtk+SIlLUFETd+Mybc=
Received: by mx.zohomail.com with SMTPS id 1764770203279936.6526689272895;
 Wed, 3 Dec 2025 05:56:43 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 03 Dec 2025 14:56:22 +0100
Subject: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
In-Reply-To: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
are powered and active at any moment. These take the form of bitmaps. In
the case of SHADER_PWRACTIVE for example, a high bit indicates that the
shader core corresponding to that bit index is active. These bitmaps
aren't solely contiguous bits, as it's common to have holes in the
sequence of shader core indices, and the actual set of which cores are
present is defined by the "shader present" register.

When the GPU finishes a power state transition, it fires a
GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
received, the PWRACTIVE registers will likely contain interesting new
information.

This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
which is something related to Mali v14+'s power control logic. The
PWRACTIVE registers and corresponding interrupts are already available
in v9 and onwards.

Expose this as a tracepoint to userspace. This allows users to debug
various scenarios and gather interesting information, such as: knowing
how much hardware is lit up at any given time, correlating graphics
corruption with a specific active shader core, measuring when hardware
is allowed to go to an inactive state again, and so on.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  1 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
 drivers/gpu/drm/panthor/panthor_trace.h  | 38 ++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index e133b1e0ad6d..a3cb934104b8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -548,6 +548,7 @@ int panthor_device_resume(struct device *dev)
 			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
 	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
 	mutex_unlock(&ptdev->pm.mmio_lock);
+
 	return 0;
 
 err_suspend_devfreq:
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9cb5dee93212..8830aa9a5c4b 100644
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
@@ -46,6 +49,7 @@ struct panthor_gpu {
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
 	 GPU_IRQ_RESET_COMPLETED | \
+	 GPU_IRQ_POWER_CHANGED_ALL | \
 	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
 
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
@@ -97,6 +101,11 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 		wake_up_all(&ptdev->gpu->reqs_acked);
 	}
 	spin_unlock(&ptdev->gpu->reqs_lock);
+
+	if (status & GPU_IRQ_POWER_CHANGED_ALL)
+		trace_gpu_power_active(gpu_read64(ptdev, SHADER_PWRACTIVE),
+				       gpu_read64(ptdev, TILER_PWRACTIVE),
+				       gpu_read64(ptdev, L2_PWRACTIVE));
 }
 PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
 
diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
new file mode 100644
index 000000000000..01013f81e68a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_trace.h
@@ -0,0 +1,38 @@
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
+TRACE_EVENT(gpu_power_active,
+	TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
+	TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
+	TP_STRUCT__entry(
+		__field(u64, shader_bitmap)
+		__field(u64, tiler_bitmap)
+		__field(u64, l2_bitmap)
+	),
+	TP_fast_assign(
+		__entry->shader_bitmap	= shader_bitmap;
+		__entry->tiler_bitmap	= tiler_bitmap;
+		__entry->l2_bitmap	= l2_bitmap;
+	),
+	TP_printk("shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
+		  __entry->shader_bitmap, __entry->tiler_bitmap, __entry->l2_bitmap
+	)
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

