Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50ECB325C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9310E757;
	Wed, 10 Dec 2025 14:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aciy/Hql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B401010E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 14:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765377063; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=h+b0o9Ajc8djBP/n6RiIezMaAx1rJkKbu1a27YDn0KT1AO9YJcnIwS3HO+shMwjdwQ7du3XxXI68sBCBxsD1Vgq+pUlINBj7MwuNAdF7omxZNWQQ8J/IA+/WvxHUm/zL7QJU6mMQDaWyZeOS42iKLCaK6Ylr8YQMdLwc28zKNB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765377063;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rcaw19VuwpON+pQPOZlaaUEIk+hLLkSUhU1T90+YEV0=; 
 b=LbV0AqwMNxPfyWVPKL3yn1kgGAx/gu2xEdn0mA8DTS12pHUEjFOhI/Aeiclo0L4COUrviJCN2PwNpbn6/4zhFMzXQN3qNGW8YiGohq2uYi7gffH3v3bvubi82Bja3RxzEsJ7tPplo/vT8BmKqOIG2nlecmg6/bfrah6ED5fO/S0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765377063; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=rcaw19VuwpON+pQPOZlaaUEIk+hLLkSUhU1T90+YEV0=;
 b=aciy/HqlSdA76b1tNLLp9+skkjS1D41TkPMEt4CJCkOwQzUhbNYOL90p2HSfNEjX
 l1V97qhaYHjv1IA0Ys8xFPbDE79fROdksyHAuwsb8C4LQy0s3oCuPb598PjejEvHQZh
 hGLpuXfbbK9w0h4nwoxyXThivuszKKlVF9MXYowg=
Received: by mx.zohomail.com with SMTPS id 1765377062670439.8807266096917;
 Wed, 10 Dec 2025 06:31:02 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 10 Dec 2025 15:30:40 +0100
Subject: [PATCH v2 4/4] drm/panthor: Add gpu_job_irq tracepoint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-panthor-tracepoints-v2-4-ace2e29bad0f@collabora.com>
References: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
In-Reply-To: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
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

Mali's CSF firmware triggers the job IRQ whenever there's new firmware
events for processing. While this can be a global event (BIT(31) of the
status register), it's usually an event relating to a command stream
group (the other bit indices).

Panthor throws these events onto a workqueue for processing outside the
IRQ handler. It's therefore useful to have an instrumented tracepoint
that goes beyond the generic IRQ tracepoint for this specific case, as
it can be augmented with additional data, namely the events bit mask.

This can then be used to debug problems relating to GPU jobs events not
being processed quickly enough. The duration_ns field can be used to
work backwards from when the tracepoint fires (at the end of the IRQ
handler) to figure out when the interrupt itself landed, providing not
just information on how long the work queueing took, but also when the
actual interrupt itself arrived.

With this information in hand, the IRQ handler itself being slow can be
excluded as a possible source of problems, and attention can be directed
to the workqueue processing instead.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 13 +++++++++++++
 drivers/gpu/drm/panthor/panthor_trace.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4beaa589ba66..1823d7ba5c78 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -26,6 +26,7 @@
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
+#include "panthor_trace.h"
 
 #define CSF_FW_NAME "mali_csffw.bin"
 
@@ -1060,6 +1061,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 
 static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
 {
+	u32 duration;
+	u64 start;
+
+	if (tracepoint_enabled(gpu_job_irq))
+		start = ktime_get_ns();
+
 	gpu_write(ptdev, JOB_INT_CLEAR, status);
 
 	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
@@ -1072,6 +1079,12 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
 		return;
 
 	panthor_sched_report_fw_events(ptdev, status);
+
+	if (tracepoint_enabled(gpu_job_irq)) {
+		if (check_sub_overflow(ktime_get_ns(), start, &duration))
+			duration = U32_MAX;
+		trace_gpu_job_irq(ptdev->base.dev, status, duration);
+	}
 }
 PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
 
diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
index 8258217066fc..c5ceda52a6b1 100644
--- a/drivers/gpu/drm/panthor/panthor_trace.h
+++ b/drivers/gpu/drm/panthor/panthor_trace.h
@@ -52,6 +52,34 @@ TRACE_EVENT_FN(gpu_power_status,
 	panthor_gpu_power_status_register, panthor_gpu_power_status_unregister
 );
 
+/**
+ * gpu_job_irq - called after a job interrupt from firmware completes
+ * @dev: pointer to the &struct device, for printing the device name
+ * @events: bitmask of BIT(CSG id) | BIT(31) for a global event
+ * @duration_ns: Nanoseconds between job IRQ handler entry and exit
+ *
+ * The panthor_job_irq_handler() function instrumented by this tracepoint exits
+ * once it has queued the firmware interrupts for processing, not when the
+ * firmware interrupts are fully processed. This tracepoint allows for debugging
+ * issues with delays in the workqueue's processing of events.
+ */
+TRACE_EVENT(gpu_job_irq,
+	TP_PROTO(const struct device *dev, u32 events, u32 duration_ns),
+	TP_ARGS(dev, events, duration_ns),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__field(u32, events)
+		__field(u32, duration_ns)
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__entry->events		= events;
+		__entry->duration_ns	= duration_ns;
+	),
+	TP_printk("%s: events=0x%x duration_ns=%d", __get_str(dev_name),
+		  __entry->events, __entry->duration_ns)
+);
+
 #endif /* __PANTHOR_TRACE_H__ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.52.0

