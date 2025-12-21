Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074ACD4342
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 18:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4FC10E1F9;
	Sun, 21 Dec 2025 17:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SuYAmhzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178C10E1F9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 17:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766337033; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NlXmpZtQ934SzfExExbxDlqPjptLrOhDpP4xHCbYkJ6uwiUTzZIGFxb1Qtj7LtePyFrDHvexPKqNUl8BdTMctvSIfbUZDXPciZxLOD/ETBO+Kwfrqzp2Ju6ZrdILwbLDxcYBOSLgIJKgfeBggGZCr4ptInzuAkpGc+KED7I3M/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766337033;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=chueondfD86kdGwgLZ56e0qD/fJZCo7LjN/Q+k1QS44=; 
 b=jZCjLu+ib0WPBdzX2oIwW0QG1ykEWzcoFzxO4G5G+8NaMRLj4xrvc99QWX4X6E0RvcewUV5xUTeD+jbhJBSvd153mhY8u3THB2PtofEKOzVViM0h1x7hZQwGm0nEzMdRWT0KubiodPgelwnDKqGCLAQO/7fUx3R6awDMVXykiE4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766337033; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=chueondfD86kdGwgLZ56e0qD/fJZCo7LjN/Q+k1QS44=;
 b=SuYAmhziU7VTWz0KRAaO8+xso+pP4mmCOd3xFq/xO0fq3PiXgNMDVuxwN0s1BAGh
 mgnPX/4PTZ2XNSQeJ/Fkqm5YNuJ9dsyUX490EpvzJrDFXdbOXf93a40n8REF1HyXEJN
 XKi+Nz+KUyafrykySG0MVguTkyApRGuhQB838GAQ=
Received: by mx.zohomail.com with SMTPS id 1766337031977694.907927720342;
 Sun, 21 Dec 2025 09:10:31 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sun, 21 Dec 2025 18:10:14 +0100
Subject: [PATCH v5 1/3] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-panthor-tracepoints-v5-1-889ef78165d8@collabora.com>
References: <20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com>
In-Reply-To: <20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com>
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

The current IRQ helpers do not guarantee mutual exclusion that covers
the entire transaction from accessing the mask member and modifying the
mask register.

This makes it hard, if not impossible, to implement mask modification
helpers that may change one of these outside the normal
suspend/resume/isr code paths.

Add a spinlock to struct panthor_irq that protects both the mask member
and register. Acquire it in all code paths that access these. Then, add
the aforementioned new helpers: mask_enable, mask_disable, and
resume_restore. The first two work by ORing and NANDing the mask bits,
and the latter relies on the new behaviour that panthor_irq::mask is not
set to 0 on suspend.

panthor_irq::suspended remains an atomic, as it's necessarily written to
outside the mask_lock in the suspend path.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 55 +++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..eb75c83e2db3 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -73,11 +73,14 @@ struct panthor_irq {
 	/** @irq: IRQ number. */
 	int irq;
 
-	/** @mask: Current mask being applied to xxx_INT_MASK. */
+	/** @mask: Values to write to xxx_INT_MASK if active. */
 	u32 mask;
 
 	/** @suspended: Set to true when the IRQ is suspended. */
 	atomic_t suspended;
+
+	/** @mask_lock: protects modifications to _INT_MASK and @mask */
+	spinlock_t mask_lock;
 };
 
 /**
@@ -410,6 +413,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
 												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
 	if (atomic_read(&pirq->suspended))							\
 		return IRQ_NONE;								\
 	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
@@ -425,8 +430,10 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 	struct panthor_device *ptdev = pirq->ptdev;						\
 	irqreturn_t ret = IRQ_NONE;								\
 												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
 	while (true) {										\
-		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
+		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask);	\
 												\
 		if (!status)									\
 			break;									\
@@ -443,18 +450,30 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 												\
 static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
 {												\
-	pirq->mask = 0;										\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
+	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
+	}											\
 	synchronize_irq(pirq->irq);								\
 	atomic_set(&pirq->suspended, true);							\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
 {												\
-	atomic_set(&pirq->suspended, false);							\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
 	pirq->mask = mask;									\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
+	atomic_set(&pirq->suspended, false);							\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_resume_restore(struct panthor_irq *pirq)		\
+{												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
+	atomic_set(&pirq->suspended, false);							\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
 }												\
 												\
 static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
@@ -463,13 +482,33 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 {												\
 	pirq->ptdev = ptdev;									\
 	pirq->irq = irq;									\
-	panthor_ ## __name ## _irq_resume(pirq, mask);						\
+	pirq->mask = mask;									\
+	spin_lock_init(&pirq->mask_lock);							\
+	panthor_ ## __name ## _irq_resume_restore(pirq);					\
 												\
 	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
 					 panthor_ ## __name ## _irq_raw_handler,		\
 					 panthor_ ## __name ## _irq_threaded_handler,		\
 					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
 					 pirq);							\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_mask_enable(struct panthor_irq *pirq, u32 mask)	\
+{												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
+	pirq->mask |= mask;									\
+	if (!atomic_read(&pirq->suspended))							\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_mask_disable(struct panthor_irq *pirq, u32 mask)	\
+{												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
+	pirq->mask &= ~mask;									\
+	if (!atomic_read(&pirq->suspended))							\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
 }
 
 extern struct workqueue_struct *panthor_cleanup_wq;

-- 
2.52.0

