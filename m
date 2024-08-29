Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB69645DB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2110E676;
	Thu, 29 Aug 2024 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZGgSZZjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385FC10E677
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RFBc7HO/3CGjXg/tdgnc05MS5iTS/6RyGYZ4mkVX9vU=; b=ZGgSZZjql6u4En3dW7JWdEBDaF
 zvhw7xKD8tERFjlD4dcBbzXf8TTqpEOf04gFpsmFdVOTvpDNpYzpo7RQFU/Op+xdqGTl3i/GOaBXU
 /WVCn/VmAPkCxOfANTyQAMXB7gMVllEUx+X2X5WX5VFOWKxwCXdv//1KkO+oYGgPdp/wXXySZosVD
 1GX9MNrcNK9iU0BmN8LJocqq1u32vz0MYvzJlYMQPB+8OGojhoJZ9Pb3g8R1kDg+7yAGs7Xs45ySz
 u1MAVLhDvT/OSBvAe+XFkxw1TIAv+UtYSxp5G7eisIKNw4yJUauvWOF2rgzmDva/uXuIQvrxyQgaP
 1RKxE1DA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjevA-006jlG-VQ; Thu, 29 Aug 2024 15:10:41 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 02/10] drm/v3d: Flush the MMU before we supply more memory
 to the binner
Date: Thu, 29 Aug 2024 10:05:10 -0300
Message-ID: <20240829130954.2439316-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829130954.2439316-1-mcanal@igalia.com>
References: <20240829130954.2439316-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We must ensure that the MMU is flushed before we supply more memory to
the binner, otherwise we might end up with invalid MMU accesses by the
GPU.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 1 +
 drivers/gpu/drm/v3d/v3d_irq.c | 2 ++
 drivers/gpu/drm/v3d/v3d_mmu.c | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index cf4b23369dc4..75b4725d49c7 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -553,6 +553,7 @@ void v3d_irq_disable(struct v3d_dev *v3d);
 void v3d_irq_reset(struct v3d_dev *v3d);
 
 /* v3d_mmu.c */
+int v3d_mmu_flush_all(struct v3d_dev *v3d);
 int v3d_mmu_set_page_table(struct v3d_dev *v3d);
 void v3d_mmu_insert_ptes(struct v3d_bo *bo);
 void v3d_mmu_remove_ptes(struct v3d_bo *bo);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index d469bda52c1a..20bf33702c3c 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -70,6 +70,8 @@ v3d_overflow_mem_work(struct work_struct *work)
 	list_add_tail(&bo->unref_head, &v3d->bin_job->render->unref_list);
 	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 
+	v3d_mmu_flush_all(v3d);
+
 	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start << V3D_MMU_PAGE_SHIFT);
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
 
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 06bb44c7f35d..3b7694ee7536 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -28,7 +28,7 @@
 #define V3D_PTE_WRITEABLE BIT(29)
 #define V3D_PTE_VALID BIT(28)
 
-static int v3d_mmu_flush_all(struct v3d_dev *v3d)
+int v3d_mmu_flush_all(struct v3d_dev *v3d)
 {
 	int ret;
 
-- 
2.46.0

