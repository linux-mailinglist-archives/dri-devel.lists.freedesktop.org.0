Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81813B59F23
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A98910E0AE;
	Tue, 16 Sep 2025 17:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qf/O4Gln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE0210E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lefflDHSjJU8hfrVIVz5tSFbjnvfBq/3+7BESO2NmBw=; b=qf/O4Glnk30wH6l7KUtm4uK96E
 iUZ2Xw0Og/2KYUrMQrh/kQFa4zbuHpCsq9SNUy+jG90mQsARXocl1J2XWHWSOsPY5+Fu963/XjYbk
 X0+xTqQ1emiSNrwrQOi64VCBVpSGmVX9vSv21U2RjqNFMwAcTxUM6WWbmt8/o4Lq4wnKzNt/aKzBP
 L3MuTQCIS1Yq+saXlKjJWn4u9NBn8bDR4dQ6UqZk5Px5cLVuF1npJPd9408FWUS1PkvY46jdkMcuK
 q+Q0IXHX+PzgmsyG5ZYsn1jEnmETbCL77DgBG+6/y/uDM0qaQemczgzg0s9jAmZnkB6OoZO3SFQfC
 BG/Q952w==;
Received: from [189.6.16.239] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uyZLx-00CLyS-Ss; Tue, 16 Sep 2025 19:20:30 +0200
From: Melissa Wen <mwen@igalia.com>
To: mwen@igalia.com, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, itoral@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com
Subject: [PATCH] drm/v3d: create a dedicated lock for dma fence
Date: Tue, 16 Sep 2025 14:18:28 -0300
Message-ID: <20250916172022.2779837-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Don't mix dma fence lock with the active_job lock. The issue was
uncovered when PREEMPT_RT on.

Link: https://github.com/raspberrypi/linux/issues/7035
Fixes: fa6a20c87470 ("drm/v3d: Address race-condition between per-fd GPU stats and fd release")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   | 1 +
 drivers/gpu/drm/v3d/v3d_fence.c | 2 +-
 drivers/gpu/drm/v3d/v3d_gem.c   | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 0317f3d7452a..b1c41af87e17 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -62,6 +62,7 @@ struct v3d_queue_state {
 	/* Currently active job for this queue */
 	struct v3d_job *active_job;
 	spinlock_t queue_lock;
+	spinlock_t fence_lock;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
diff --git a/drivers/gpu/drm/v3d/v3d_fence.c b/drivers/gpu/drm/v3d/v3d_fence.c
index 8f8471adae34..c82500a1df73 100644
--- a/drivers/gpu/drm/v3d/v3d_fence.c
+++ b/drivers/gpu/drm/v3d/v3d_fence.c
@@ -15,7 +15,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q)
 	fence->dev = &v3d->drm;
 	fence->queue = q;
 	fence->seqno = ++queue->emit_seqno;
-	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->queue_lock,
+	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->fence_lock,
 		       queue->fence_context, fence->seqno);
 
 	return &fence->base;
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index c77d90aa9b82..bb110d35f749 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -273,6 +273,7 @@ v3d_gem_init(struct drm_device *dev)
 		seqcount_init(&queue->stats.lock);
 
 		spin_lock_init(&queue->queue_lock);
+		spin_lock_init(&queue->fence_lock);
 	}
 
 	spin_lock_init(&v3d->mm_lock);
-- 
2.47.2

