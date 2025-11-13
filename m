Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFAC580ED
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81EB10E84D;
	Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcHyBTFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068510E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b73301e6ab5so118000666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045627; x=1763650427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GCZeJVfvfEkQYdgy793PGjn+BtLipo5yJTYuBq0cOZM=;
 b=hcHyBTFRdUA3v9CY8RhKUPXGJt6fct9MGETSeBxTzIzd3a2x8FJ9oJKT4DIxAisMK1
 hdXLa9ugPeyyGjSwz4sCK/uOf15rRbW+4YkYs8qH615l+WI/H/khDEB4ae0ppJ+HMm5k
 HchNO+vpwNJeARjwf7zMjZF3hMsHiD8VMJC+VpnxPaCvYE9776x/1/S8kcq2+yxgDEh1
 vLzcHBIPvhgnqMSwM5Est3HkM/gv8mxDS4moOT3To2P3DdqfiP/77wRMrD+Zou0WHTVo
 0so/5dYMDtzd6zrGxultFYUPkqviq8Jpkja0vZaX7kgsvRqLAs7hRFGCrOn5h5OXbEtk
 Xyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045627; x=1763650427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GCZeJVfvfEkQYdgy793PGjn+BtLipo5yJTYuBq0cOZM=;
 b=B91S1FqLmPlyG6Gjt45SdTdLE0MfeaOWaXOj6P9MbcB0Kk1u5s6B1bQFwX7PXr8TPT
 JZPE5/qfaARkpDcclNjsCcqSVqC0P9qrp/Y1mnC0G9Q3R0y0ugHLP0lmTFtGxjiPh3Uw
 ajU6ObXIxMIzswXL8dcVXmZBGJn1bJ9lw7y9JaBDaiiMoaaP5dPwqdyj+bSaT+Z9uYmv
 dNPMsvINHQI1cd6Tm7jOj+HHEbO4TITf09XAdXrJbCBG1WM17dMylFISxgrdeSjLrOQN
 /CZgBenkX6auUn7VSAvDb5phsfp9q7g8IXypW1ezDeI3qqH4ifSD555SPTBZJtEBb2+N
 +51Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURdcEklhVPO1khuL3pGmszpGK4n3GkES5VktyMNqtLK1GMmopQ9U4f0Ho/I7JCj+dLeJnL2YIIljc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaIFq8l0KQR1Qv+YZ5uQIH0Ox0lT9az2vqw18BdpZ5to03ZZxC
 yJuQJne2oY1TkkxOTPgMMuneaAf/BIRUmUA9dx5PKgXsAZWT+p9zeguO
X-Gm-Gg: ASbGnct3x3nNKax+KtKxBrv/dZwd7E7rH/MXujar2FZytjh5sgAo1ov8NxUo9lrPte/
 m6IchN3RyvuCVCzg7YfZoUe6ul6/oh16JLJs744GX3Uv5VBfqM24L9P1LUHoUuSVQUnmLWE9opF
 HIvcKQdhLmO7G03SzysnX9O3DSXMvVXRyeZGptB31dtt9RZkPDcB3jEj3BiikzoAz5bhJy+u0pB
 fnjF8rvTUZEonY3p1Nw7O35V/pZADnclcGTZFJAIhnFkCUvLdToippKPtLLgm0GIElmQ6Kvp3Yj
 Wg2zhnMtsMwJD9RH2TUM2i5FzyeI3oVOj6IZZM7AayEKbBr/8Az+x7h+33Oqrk2I5hk/CPx0HsT
 J208zyqyuooOfO88L6NK0zkCtfbEWFPnqe9y5jAzSVix3IZUivejSn1UyrQqeQZVIcGvZyMMLe4
 rm468/6rj2SAuYdkjwDk9XSA==
X-Google-Smtp-Source: AGHT+IFTUpjYEZEKibKPo8txad1YlVZTcvDTCnxM3ibhTL5DA++BidJqqAp7OqK5WH2EjKo5LdtqZg==
X-Received: by 2002:a17:907:962a:b0:b6d:67b0:ca0b with SMTP id
 a640c23a62f3a-b7331c06865mr662805566b.61.1763045626671; 
 Thu, 13 Nov 2025 06:53:46 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 15/18] drm/xe: Disconnect the low hanging fences from Xe module
Date: Thu, 13 Nov 2025 15:51:52 +0100
Message-ID: <20251113145332.16805-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Preempt, tlb invalidation, and OA fences now use embedded fence lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c                  | 5 +----
 drivers/gpu/drm/xe/xe_preempt_fence.c       | 3 +--
 drivers/gpu/drm/xe/xe_preempt_fence_types.h | 2 --
 drivers/gpu/drm/xe/xe_tlb_inval.c           | 5 +----
 drivers/gpu/drm/xe/xe_tlb_inval_types.h     | 2 --
 5 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7a13a7bd99a6..41d081781060 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -112,8 +112,6 @@ struct xe_oa_config_bo {
 struct xe_oa_fence {
 	/* @base: dma fence base */
 	struct dma_fence base;
-	/* @lock: lock for the fence */
-	spinlock_t lock;
 	/* @work: work to signal @base */
 	struct delayed_work work;
 	/* @cb: callback to schedule @work */
@@ -1017,8 +1015,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	}
 
 	/* Point of no return: initialize and set fence to signal */
-	spin_lock_init(&ofence->lock);
-	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, NULL, 0, 0);
 
 	for (i = 0; i < stream->num_syncs; i++) {
 		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 7f587ca3947d..75f433aee747 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -145,9 +145,8 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 {
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
-	spin_lock_init(&pfence->lock);
 	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &pfence->lock, context, seqno);
+		       NULL, context, seqno);
 
 	return &pfence->base;
 }
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence_types.h b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
index ac125c697a41..a98de8d1c723 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
@@ -25,8 +25,6 @@ struct xe_preempt_fence {
 	struct xe_exec_queue *q;
 	/** @preempt_work: work struct which issues preemption */
 	struct work_struct preempt_work;
-	/** @lock: dma-fence fence lock */
-	spinlock_t lock;
 	/** @error: preempt fence is in error state */
 	int error;
 };
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..5c23e76b0241 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -133,7 +133,6 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	tlb_inval->seqno = 1;
 	INIT_LIST_HEAD(&tlb_inval->pending_fences);
 	spin_lock_init(&tlb_inval->pending_lock);
-	spin_lock_init(&tlb_inval->lock);
 	INIT_DELAYED_WORK(&tlb_inval->fence_tdr, xe_tlb_inval_fence_timeout);
 
 	err = drmm_mutex_init(&xe->drm, &tlb_inval->seqno_lock);
@@ -420,10 +419,8 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 {
 	xe_pm_runtime_get_noresume(tlb_inval->xe);
 
-	spin_lock_irq(&tlb_inval->lock);
-	dma_fence_init(&fence->base, &inval_fence_ops, &tlb_inval->lock,
+	dma_fence_init(&fence->base, &inval_fence_ops, NULL,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&tlb_inval->lock);
 	INIT_LIST_HEAD(&fence->link);
 	if (stack)
 		set_bit(FENCE_STACK_BIT, &fence->base.flags);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..80e893950099 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -104,8 +104,6 @@ struct xe_tlb_inval {
 	struct delayed_work fence_tdr;
 	/** @job_wq: schedules TLB invalidation jobs */
 	struct workqueue_struct *job_wq;
-	/** @tlb_inval.lock: protects TLB invalidation fences */
-	spinlock_t lock;
 };
 
 /**
-- 
2.43.0

