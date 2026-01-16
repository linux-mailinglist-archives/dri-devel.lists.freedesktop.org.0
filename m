Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14CD31661
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A6D10E88C;
	Fri, 16 Jan 2026 12:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="f+gC34Au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301FA10E88C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768568270; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WSJP/yiH7VxKbkhjiiIh1pQCXWeVuS2LnIZNFL5IBH9C84NJyok5N3Z9EH9tISKhbY1CAOcSFPrcaAm8QdN86lIF5aXc8JxdWAppR9PF1xtuaZDrX+LhF/gDjGOiCSeZyojqJI1r/1E4w9Ys6sPJlyZ2M5+eSAfHrGZtxvmApLw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768568270;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7Vs6Hx5M5iOCZHlPNzxvtAfQld9Y5HN4gfBASmzYMnk=; 
 b=SEb9lC+yzEShEJoVVHNKx43Rt3NRtdPv+0eIAdomoN0K+eRnvxbV9+O0eJ4rIBI9KPft1tzi113EZPlPX2rBcgscyiyGbLHkuNJ0Z1l1UdWmGymn4Xu07ACGARkMml6ahzaP2x54wQK5Z3nqirmwMvZnXsRBFOcpXQ+9K1pjzMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768568270; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=7Vs6Hx5M5iOCZHlPNzxvtAfQld9Y5HN4gfBASmzYMnk=;
 b=f+gC34AuvCeGoZ/o1xqrTOP+x5gH3NaKyVolXbYc6XqY28XV6wRJQptkGfnjgluZ
 12GcOG3UZLtYU6q5y1iuCuo463qyiFu5rutmpSi3KPnQeZwI4CVRmHJ9avt+gN4yJvF
 8TpcRI1Zq2NrVT5v2DQu9ablNC8eg4HawKiOhWFk=
Received: by mx.zohomail.com with SMTPS id 1768568269688536.57292235551;
 Fri, 16 Jan 2026 04:57:49 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 16 Jan 2026 13:57:30 +0100
Subject: [PATCH v10 1/4] drm/panthor: Rework panthor_irq::suspended into
 panthor_irq::state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-panthor-tracepoints-v10-1-d925986e3d1b@collabora.com>
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

To deal with the threaded interrupt handler and a suspend action
overlapping, the boolean panthor_irq::suspended is not sufficient.

Rework it into taking several different values depending on the current
state, and check it and set it within the IRQ helper functions.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 35 +++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..8597b388cc40 100644
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
 	/** @mask: Current mask being applied to xxx_INT_MASK. */
 	u32 mask;
 
-	/** @suspended: Set to true when the IRQ is suspended. */
-	atomic_t suspended;
+	/** @state: one of &enum panthor_irq_state reflecting the current state. */
+	atomic_t state;
 };
 
 /**
@@ -409,12 +420,17 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	enum panthor_irq_state old_state;							\
 												\
-	if (atomic_read(&pirq->suspended))							\
-		return IRQ_NONE;								\
 	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
 		return IRQ_NONE;								\
 												\
+	old_state = atomic_cmpxchg(&pirq->state,						\
+				   PANTHOR_IRQ_STATE_ACTIVE,					\
+				   PANTHOR_IRQ_STATE_PROCESSING);				\
+	if (old_state != PANTHOR_IRQ_STATE_ACTIVE)						\
+		return IRQ_NONE;								\
+												\
 	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
 	return IRQ_WAKE_THREAD;									\
 }												\
@@ -423,6 +439,7 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	enum panthor_irq_state old_state;							\
 	irqreturn_t ret = IRQ_NONE;								\
 												\
 	while (true) {										\
@@ -435,7 +452,10 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 		ret = IRQ_HANDLED;								\
 	}											\
 												\
-	if (!atomic_read(&pirq->suspended))							\
+	old_state = atomic_cmpxchg(&pirq->state,						\
+				   PANTHOR_IRQ_STATE_PROCESSING,				\
+				   PANTHOR_IRQ_STATE_ACTIVE);					\
+	if (old_state == PANTHOR_IRQ_STATE_PROCESSING)						\
 		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
 												\
 	return ret;										\
@@ -445,14 +465,15 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 {												\
 	pirq->mask = 0;										\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
+	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);					\
 	synchronize_irq(pirq->irq);								\
-	atomic_set(&pirq->suspended, true);							\
+	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
 {												\
-	atomic_set(&pirq->suspended, false);							\
 	pirq->mask = mask;									\
+	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
 }												\

-- 
2.52.0

