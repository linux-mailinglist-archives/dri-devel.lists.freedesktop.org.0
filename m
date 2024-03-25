Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E3A88A351
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3F210E8E6;
	Mon, 25 Mar 2024 13:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xiqXG0Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE83210E8E5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711375028;
 bh=kDcBtq6heBWRHySSkn7bg8FNSQBQy5UiFLr0DykwkT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xiqXG0BfmK65uD8K1GQLk2BSBIuMLiH7sDi7GeRuIERbxfuqI7Vt7RNfGLHHHc2K5
 JHC/HC/MvcDch6Y3kk0eT/P1H5YAigo+OlwjRkBaQhd2adiaafvjgimG7b7eYwhsxP
 AstD+IWgpg+f6kAnjx1SvZpvE5Iu24WX9h0lJgOiHVw12+DnsxZ0xF36UZqMR+QkEe
 SgL0rQ22ZXd2FeixjhW6iq2V80kkCOCIxL8ltngGyjBqylGh/KWBiE+nC0O+gpqoSp
 QuluRmm3niQpHjcFkOt+uIgJY2Ev0QDIFUQ5wFW9yYRlB7r40lQu49sytGg5JXUxF+
 QUNlHZGtwU/kQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D69F37820BB;
 Mon, 25 Mar 2024 13:57:08 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 3/3] drm/panthor: Actually suspend IRQs in the unplug path
Date: Mon, 25 Mar 2024 14:57:05 +0100
Message-ID: <20240325135705.3717293-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325135705.3717293-1-boris.brezillon@collabora.com>
References: <20240325135705.3717293-1-boris.brezillon@collabora.com>
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

panthor_xxx_irq_suspend() doesn't mask the interrupts if drm_dev_unplug()
has been called, which is always the case when our panthor_xxx_unplug()
helpers are called. Fix that by introducing a panthor_xxx_unplug() helper
that does what panthor_xxx_irq_suspend() except it does it
unconditionally.

v2:
- Add Steve's R-b

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
Found inadvertently while debugging another issue. I guess I managed to
call rmmod during a PING and that led to the FW interrupt handler
being executed after the device suspend happened.
---
 drivers/gpu/drm/panthor/panthor_device.h | 8 ++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     | 2 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 3a930a368ae1..5634e9490c7f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -321,6 +321,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 	return ret;										\
 }												\
 												\
+static inline void panthor_ ## __name ## _irq_unplug(struct panthor_irq *pirq)			\
+{												\
+	pirq->mask = 0;										\
+	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
+	synchronize_irq(pirq->irq);								\
+	atomic_set(&pirq->suspended, true);							\
+}												\
+												\
 static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
 {												\
 	int cookie;										\
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 33c87a59834e..7a9710a38c5f 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1128,7 +1128,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 
 	/* Make sure the IRQ handler can be called after that point. */
 	if (ptdev->fw->irq.irq)
-		panthor_job_irq_suspend(&ptdev->fw->irq);
+		panthor_job_irq_unplug(&ptdev->fw->irq);
 
 	panthor_fw_stop(ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 6dbbc4cfbe7e..b84c5b650fd9 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -174,7 +174,7 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
 	unsigned long flags;
 
 	/* Make sure the IRQ handler is not running after that point. */
-	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
+	panthor_gpu_irq_unplug(&ptdev->gpu->irq);
 
 	/* Wake-up all waiters. */
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fdd35249169f..1f333cdded0f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2622,7 +2622,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
  */
 void panthor_mmu_unplug(struct panthor_device *ptdev)
 {
-	panthor_mmu_irq_suspend(&ptdev->mmu->irq);
+	panthor_mmu_irq_unplug(&ptdev->mmu->irq);
 
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
-- 
2.44.0

