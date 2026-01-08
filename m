Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A4D03485
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514410E74A;
	Thu,  8 Jan 2026 14:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gFIqMON8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130C10E74C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767881969; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KH+8d942znBaQODIzbpOpQmzfulBIutHMjPEK21GwPuqK3tpPTF7JlkuHWpzN9NzCjPW370mQAT/N1qeaQvBlYTj0U/878iuJUzBg68l6VamurSX+i3h2VrYtCbJUgqCQu6Svdzjj1tfl3n9/9wzuWkbm2gpIyZmP9L7DIJNhDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767881969;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Go9cy2QQg93M1WGt+NHXxLishJHACoM3/1pCLFEWKHQ=; 
 b=b57OhzucedMDs2SQ1HOMiLbSFwlx93dxQDmfKcqiIrut+nogXxLqgAxVVUiHGUxHqOPTyqW5iaR8uwHj2XdYrXYROp7Vl1wqk/XA1fMI6kVKHiEhLnTioqbPhVmvjgti2QkTwnLHF/VHnJZliOpUwQKCcgiAlpYqptaiRAomITU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767881969; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Go9cy2QQg93M1WGt+NHXxLishJHACoM3/1pCLFEWKHQ=;
 b=gFIqMON8LXfJE3uZt8xag/iBHGTg7fECgf+W97gTK/d2uQ5HaZNTopA6Us4kvvJ8
 eog6vllRON7obJF6+GG1KTtVyIppOO3xA3tLv3gpEXOjN+kV3P1HplrZgPrIuBKzJ+A
 1matTT+uAouotncIIoQwo6ecmvau8+YANtAqM4iU=
Received: by mx.zohomail.com with SMTPS id 1767881966798710.2139228320978;
 Thu, 8 Jan 2026 06:19:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 15:19:07 +0100
Subject: [PATCH v7 2/4] drm/panthor: Rework panthor_irq::suspended into
 panthor_irq::state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-panthor-tracepoints-v7-2-afeae181f74a@collabora.com>
References: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
In-Reply-To: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
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

To deal with the threaded interrupt handler and a suspend action
overlapping, the boolean panthor_irq::suspended is not sufficient.

Rework it into taking several different values depending on the current
state, and check it and set it within the IRQ helper functions.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 40 +++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index cf76a8abca76..a8c21a7eea05 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -61,6 +61,17 @@ enum panthor_device_pm_state {
 	PANTHOR_DEVICE_PM_STATE_SUSPENDING,
 };
 
+enum panthor_irq_state {
+	/** @PANTHOR_IRQ_STATE_ACTIVE: IRQ is active and ready to process events. */
+	PANTHOR_IRQ_STATE_ACTIVE = 0,
+	/** @PANTHOR_IRQ_STATE_PROCESSING: IRQ is currently processing events. */
+	PANTHOR_IRQ_STATE_PROCESSING,
+	/** @PANTHOR_IRQ_STATE_SUSPENDED: IRQ is suspended. */
+	PANTHOR_IRQ_STATE_SUSPENDED,
+	/** @PANTHOR_IRQ_STATE_SUSPENDING: IRQ is being suspended. */
+	PANTHOR_IRQ_STATE_SUSPENDING,
+};
+
 /**
  * struct panthor_irq - IRQ data
  *
@@ -76,8 +87,8 @@ struct panthor_irq {
 	/** @mask: Values to write to xxx_INT_MASK if active. */
 	u32 mask;
 
-	/** @suspended: Set to true when the IRQ is suspended. */
-	atomic_t suspended;
+	/** @state: one of &enum panthor_irq_state reflecting the current state. */
+	atomic_t state;
 
 	/** @mask_lock: protects modifications to _INT_MASK and @mask */
 	spinlock_t mask_lock;
@@ -415,7 +426,7 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 												\
 	guard(spinlock_irqsave)(&pirq->mask_lock);						\
 												\
-	if (atomic_read(&pirq->suspended))							\
+	if (atomic_read(&pirq->state) == PANTHOR_IRQ_STATE_SUSPENDED)				\
 		return IRQ_NONE;								\
 	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
 		return IRQ_NONE;								\
@@ -428,11 +439,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	enum panthor_irq_state state;								\
 	irqreturn_t ret = IRQ_NONE;								\
 	u32 mask;										\
 												\
 	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
 		mask = pirq->mask;								\
+		atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE,				\
+			       PANTHOR_IRQ_STATE_PROCESSING);					\
 	}											\
 												\
 	while (true) {										\
@@ -446,11 +460,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 	}											\
 												\
 	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
-		if (!atomic_read(&pirq->suspended)) {						\
+		state = atomic_read(&pirq->state);						\
+		if (state != PANTHOR_IRQ_STATE_SUSPENDED &&					\
+		    state != PANTHOR_IRQ_STATE_SUSPENDING) {					\
 			/* Only restore the bits that were used and are still enabled */	\
 			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
 				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
 				  (mask & pirq->mask));						\
+			atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);			\
 		}										\
 	}											\
 												\
@@ -461,16 +478,17 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 {												\
 	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
 		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
+		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);				\
 	}											\
 	synchronize_irq(pirq->irq);								\
-	atomic_set(&pirq->suspended, true);							\
+	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq)			\
 {												\
 	guard(spinlock_irqsave)(&pirq->mask_lock);						\
 												\
-	atomic_set(&pirq->suspended, false);							\
+	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
 }												\
@@ -494,19 +512,25 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 												\
 static inline void panthor_ ## __name ## _irq_enable_events(struct panthor_irq *pirq, u32 mask)	\
 {												\
+	enum panthor_irq_state state;								\
+												\
 	guard(spinlock_irqsave)(&pirq->mask_lock);						\
 												\
 	pirq->mask |= mask;									\
-	if (!atomic_read(&pirq->suspended))							\
+	state = atomic_read(&pirq->state);							\
+	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING)	\
 		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_disable_events(struct panthor_irq *pirq, u32 mask)\
 {												\
+	enum panthor_irq_state state;								\
+												\
 	guard(spinlock_irqsave)(&pirq->mask_lock);						\
 												\
 	pirq->mask &= ~mask;									\
-	if (!atomic_read(&pirq->suspended))							\
+	state = atomic_read(&pirq->state);							\
+	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING)	\
 		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
 }
 

-- 
2.52.0

