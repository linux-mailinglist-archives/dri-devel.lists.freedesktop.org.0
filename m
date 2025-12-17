Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE6CC8312
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E6210ECF4;
	Wed, 17 Dec 2025 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XHCvC5LW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D197510ECF6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:30:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765981800; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IuHb49aWx1FE3IVVvFGQ0jRovMxck1pZZGclOAL5v3SCiXkC0IAPapbPnQmjTqvAEVzy0XZd+pLJL456NEluT+2fpZon0Aqws7bz5jXYRWrqIwiq2AbMIi50q8tvLXD0ADeSb9fQ6WP3mg4iJcHwBHkBKBK5+BLeCt1kWOpDQho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765981800;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ljTiiC8Aaa7q3v3glKNPBgbqYkCecupLLIv7VFlF1TM=; 
 b=XVI+az9XyX9RkQnvP/ad9sWBe9U1XnHF0JxUw9P3Uaxm5dtf1w94w12tWNpHwxONbIT5vddl0/PuM5y8Zpm7aS/2e8Vn4UGj0TY9XEZnWilw8nmcj8Jf1LrYFV+fdnJK0PXP3XydJWn95ZQ8EQuJuauUhP38Lh0fYUIeCMkwHAo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765981800; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ljTiiC8Aaa7q3v3glKNPBgbqYkCecupLLIv7VFlF1TM=;
 b=XHCvC5LW7pH937LtvZoYvsB0RUAbqUTfKlhYvLt2AFIUA+QMQcjE5vUyaj9HRv1l
 bfw8OaxMLNRBs/7YhGF9HCF0Hd1ZAXehZTe8odSQ4aQWwwxs2PRuLySE8tW/fwTtzQC
 1Fa5ie1T6YvLs4gKAP01ctQoLUeQThJbhO7Kc9Uw=
Received: by mx.zohomail.com with SMTPS id 1765981799272384.1282365384527;
 Wed, 17 Dec 2025 06:29:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Dec 2025 15:29:38 +0100
Subject: [PATCH v4 1/3] drm/panthor: Add panthor_*_irq_mask_set helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-panthor-tracepoints-v4-1-916186cb8d03@collabora.com>
References: <20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com>
In-Reply-To: <20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com>
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

Add a function to modify an IRQ's mask. If the IRQ is currently active,
it will write to the register, otherwise it will only set the struct
member.

There's no locking done to guarantee exclusion with the other two
functions that touch the IRQ mask, and it should only be called from a
context where the circumstances guarantee no concurrent access is
performed.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..894d28b3eb02 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -470,6 +470,13 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 					 panthor_ ## __name ## _irq_threaded_handler,		\
 					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
 					 pirq);							\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_mask_set(struct panthor_irq *pirq, u32 mask)	\
+{												\
+	pirq->mask = mask;									\
+	if (!atomic_read(&pirq->suspended))							\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
 }
 
 extern struct workqueue_struct *panthor_cleanup_wq;

-- 
2.52.0

