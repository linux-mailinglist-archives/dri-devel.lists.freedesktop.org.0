Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B3D24DAB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607DB10E766;
	Thu, 15 Jan 2026 13:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Jim4UA1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D758210E766
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768485558; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EBZgXEsW/5N+xS/Dcgfatg1VMes5tNcQebDFKrb/qso5E6J80K8thjFO5Lxacou3S+aLzCNlhq6gkMa9Aan65hhDVEpC6Jozhg+2QxmxikZMP5EbpzkJondBGBjqL73z2BvVZ3au6csV73prkiefkUtQ+EjYyn4iY96a4GeqFYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768485558;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gX3dCtVk++wU9ee5yZE4qk+1ES55FzJ5Q1jYoGhBbV0=; 
 b=nFrhZsIFgABWzmbR13EUGgP8yJEOAxpgzXsQ59IKGkD0Sexw5fUzyUj14b5k9+1AOPXYPcBiJr5GrdE5lhgovn5yb5vklr8L5KTfyqiWwBu4iRME38xFtiwxX33YE8Mc6+tHwU3hSK8b5/UVI2DEdI+7AkyADDdsL4IXzoIsGgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768485558; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=gX3dCtVk++wU9ee5yZE4qk+1ES55FzJ5Q1jYoGhBbV0=;
 b=Jim4UA1m0I5CZj/e5kSmjLyV1WkjeXA2kxggRL1nmY6ZEQ2uEfS+xTnedlMUbVbb
 2460f1clRhEHLwvyst4LNXXiSKVQN6PPWZu/1friD774pSp0ZJ5Na8wRvsLSkPXWCz7
 DUiCEovzcUTtFgKrHhKO29w+0cRRDOKPcRlt2vsE=
Received: by mx.zohomail.com with SMTPS id 1768485556990928.4577118495597;
 Thu, 15 Jan 2026 05:59:16 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 15 Jan 2026 14:58:59 +0100
Subject: [PATCH v9 1/4] drm/panthor: Rework panthor_irq::suspended into
 panthor_irq::state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-panthor-tracepoints-v9-1-e13e4f7d01dc@collabora.com>
References: <20260115-panthor-tracepoints-v9-0-e13e4f7d01dc@collabora.com>
In-Reply-To: <20260115-panthor-tracepoints-v9-0-e13e4f7d01dc@collabora.com>
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
 drivers/gpu/drm/panthor/panthor_device.h | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..2bf9a8434dc5 100644
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
@@ -409,8 +420,10 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	enum panthor_irq_state state;								\
 												\
-	if (atomic_read(&pirq->suspended))							\
+	state = atomic_read(&pirq->state);							\
+	if (state == PANTHOR_IRQ_STATE_SUSPENDED || state == PANTHOR_IRQ_STATE_SUSPENDING)	\
 		return IRQ_NONE;								\
 	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
 		return IRQ_NONE;								\
@@ -423,8 +436,11 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	enum panthor_irq_state state;								\
 	irqreturn_t ret = IRQ_NONE;								\
 												\
+	atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE, PANTHOR_IRQ_STATE_PROCESSING);	\
+												\
 	while (true) {										\
 		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
 												\
@@ -435,8 +451,11 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 		ret = IRQ_HANDLED;								\
 	}											\
 												\
-	if (!atomic_read(&pirq->suspended))							\
+	state = atomic_read(&pirq->state);							\
+	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING) {	\
 		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
+		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);				\
+	}											\
 												\
 	return ret;										\
 }												\
@@ -445,14 +464,15 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
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

