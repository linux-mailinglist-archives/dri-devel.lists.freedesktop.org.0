Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DB9E6F22
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 14:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218DD10F0E5;
	Fri,  6 Dec 2024 13:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Kx/tjtQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8F010F0E5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ddbug0qkyR38S6aPXYIzyi0Ue//TOwJjbSXOboz1a8=; b=Kx/tjtQ2c7NQd4aKCbGH7q5Dty
 8CJqL5EkXPDBOt3dkHPcOPeJnBZy+n4pdxL5NQgBtehUdfbyYFuf1cGSRWqp3P+synnKwFEkyl3YS
 ASZ+er/+qdM0JDPOfEgxvPVdQGEKaL+s6yD0x3QhBgncwWoN5DztuEGOcdmNFKbJnXfaNwGB6890D
 MRsg54YTrtUA8PGcuaBHo3xZ44LE11C4yV/j3SXYw0N8OHDXEa47VG1WkWUCgxGKU9CQHF9eOu6ce
 umbO1Iojx2m452Q3nqWnSr7mDUlB+vvzw2NnfOdITpOul1hfPKlO7rA0orubl/PtrQa1LjL+Wplb3
 2XWZkGUA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tJYDB-00HQHu-NC; Fri, 06 Dec 2024 14:17:38 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 4/4] drm/vc4: Remove `vc4_queue_seqno_cb()`
Date: Fri,  6 Dec 2024 10:12:37 -0300
Message-ID: <20241206131706.203324-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206131706.203324-1-mcanal@igalia.com>
References: <20241206131706.203324-1-mcanal@igalia.com>
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

The function `vc4_queue_seqno_cb()` is no longer needed, as we are
using DMA Reservation Objects to track BOs. Using DMA Resv, we can use
`dma_fence_add_callback()` to perform the async page flip.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  3 ---
 drivers/gpu/drm/vc4/vc4_gem.c | 32 --------------------------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ff8048991030..7e23363d008f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -1022,9 +1022,6 @@ void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
 int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
 		       uint64_t timeout_ns, bool interruptible);
 void vc4_job_handle_completed(struct vc4_dev *vc4);
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb));
 int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 879d9fdfff22..8acfc301529b 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -927,38 +927,6 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 }
 
-static void vc4_seqno_cb_work(struct work_struct *work)
-{
-	struct vc4_seqno_cb *cb = container_of(work, struct vc4_seqno_cb, work);
-
-	cb->func(cb);
-}
-
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb))
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	unsigned long irqflags;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return -ENODEV;
-
-	cb->func = func;
-	INIT_WORK(&cb->work, vc4_seqno_cb_work);
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	if (seqno > vc4->finished_seqno) {
-		cb->seqno = seqno;
-		list_add_tail(&cb->work.entry, &vc4->seqno_cb_list);
-	} else {
-		schedule_work(&cb->work);
-	}
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	return 0;
-}
-
 /* Scheduled when any job has been completed, this walks the list of
  * jobs that had completed and unrefs their BOs and frees their exec
  * structs.
-- 
2.47.1

