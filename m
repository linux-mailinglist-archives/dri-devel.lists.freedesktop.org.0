Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C5895EF6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 23:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96223112098;
	Tue,  2 Apr 2024 21:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29BF6112090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 21:54:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4907B1007;
 Tue,  2 Apr 2024 14:55:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08AA93F7B4;
 Tue,  2 Apr 2024 14:54:32 -0700 (PDT)
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>
Subject: [PATCH 1/2] drm/panthor: Cleanup unused variable 'cookie'
Date: Tue,  2 Apr 2024 22:54:22 +0100
Message-ID: <20240402215423.360341-1-liviu.dudau@arm.com>
X-Mailer: git-send-email 2.44.0
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

Commit 962f88b9c916 ("drm/panthor: Drop the dev_enter/exit() sections in
_irq_suspend/resume()") removed the code that used the 'cookie' variable
but left the declaration in place. Remove it.

Fixes: 962f88b9c916 ("drm/panthor: Drop the dev_enter/exit() sections in _irq_suspend/resume()")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index dc3e9c666b5bd4..2fdd671b38fd9b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -323,8 +323,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 												\
 static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
 {												\
-	int cookie;										\
-												\
 	pirq->mask = 0;										\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
 	synchronize_irq(pirq->irq);								\
@@ -333,8 +331,6 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
 {												\
-	int cookie;										\
-												\
 	atomic_set(&pirq->suspended, false);							\
 	pirq->mask = mask;									\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
-- 
2.44.0

