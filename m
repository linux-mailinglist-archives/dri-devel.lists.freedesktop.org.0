Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55596737C0A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B47D10E3D9;
	Wed, 21 Jun 2023 07:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5DB10E3D9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:32:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f9083d8849so50124795e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 00:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687332727; x=1689924727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kmvHVXRDKqzFFcrWt+SJPU4Lcp8ha56oKmpqUONLlm8=;
 b=rqJgV+Tgbheh69qxRv9aEo7439O/wiUJqGbfIJbaVnyuECGj8rrnvxmXSLd5R5m2jK
 ZZN095TsDc2DLdcUN+2YPG/8YZ7R1c3oeILqPVOosTj6wQH5h/2tKgS73E1sz3OHaXe0
 D4WsOTDxvAZ6dsmijxyiazQb0/v0ADEKAX/ScAtIY+HXb/RA38aBqqYdtkO2mTBNYR6A
 HFLA46ttDkxbib+qm2wVzhK1So/mWcMTBLKRqAAHElPYfFViK6JOT6mLQCq9vXKDvRSC
 mFABIqGLVC2OcNiAumPHEXiqCUAHjWZ/qiDublIaCyjAOf74940y1C3bnD/JDOumGIny
 xQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332727; x=1689924727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmvHVXRDKqzFFcrWt+SJPU4Lcp8ha56oKmpqUONLlm8=;
 b=iX8XRJyfIrpGSklycMx5r5DtSXkWGptcXMyByLAAJHwKb9sfbGSo2DZWXD/bzAqnQk
 sBEvIU37NxPkjp/b9fvuOd97TE1bEGDHErv4jE5sLpLAAKE1v7YZOUcGnZbUFjDgSv12
 zm7xQB8nY1s3Wl+2mWSfVBdnC1YgZXIMVx2q509jpkvszaZzy6ii5Mk5qKYQhtBw7nTk
 GSSe4UA68PD9t4njLZFd8xbtDAwaLDyCGjc+YjcxBFHpYdlIMKtMNaUKbQfWadT+l+QJ
 tR7hv7HZundyyv1Wz6SpuQOLWy08XrfNw50HteOCfoZdwuzoOvCCw3Ga2zOvvOwlQt23
 o9Fw==
X-Gm-Message-State: AC+VfDzDC+u1Qk4S0xnbtCpHXAbpwwryNeR+/axXWFjFK3fzUD6UIR5f
 dd4IsMKYi8Tjt1RQD9WqffE=
X-Google-Smtp-Source: ACHHUZ5DLf5c2uJYNlwVcCvkvAWXLwYzyx1pWgAqAksIZrY6kxe+Ywq7Y9qfv7TMbCLD/lLEHwEfFw==
X-Received: by 2002:a7b:c041:0:b0:3f9:b748:ff3f with SMTP id
 u1-20020a7bc041000000b003f9b748ff3fmr3730382wmc.1.1687332727066; 
 Wed, 21 Jun 2023 00:32:07 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:8d00:aed9:fe98:2f71:4615])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adff6cc000000b0030903d44dbcsm3714608wrp.33.2023.06.21.00.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 00:32:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: juan.hao@nxp.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: keep the signaling time of merged fences
Date: Wed, 21 Jun 2023 09:32:04 +0200
Message-Id: <20230621073204.28459-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Android CTS is testing for that.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-fence-unwrap.c | 11 +++++++++--
 drivers/dma-buf/dma-fence.c        |  5 +++--
 drivers/gpu/drm/drm_syncobj.c      |  2 +-
 include/linux/dma-fence.h          |  2 +-
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 7002bca792ff..06eb91306c01 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -66,18 +66,25 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 {
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
+	ktime_t timestamp;
 	unsigned int i;
 	size_t count;
 
 	count = 0;
+	timestamp = ns_to_ktime(0);
 	for (i = 0; i < num_fences; ++i) {
-		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
 			if (!dma_fence_is_signaled(tmp))
 				++count;
+			else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+					  &tmp->flags) &&
+				 ktime_after(tmp->timestamp, timestamp))
+				timestamp = tmp->timestamp;
+		}
 	}
 
 	if (count == 0)
-		return dma_fence_get_stub();
+		return dma_fence_allocate_private_stub(timestamp);
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..ad076f208760 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
 
 /**
  * dma_fence_allocate_private_stub - return a private, signaled fence
+ * @timestamp: timestamp when the fence was signaled
  *
  * Return a newly allocated and signaled stub fence.
  */
-struct dma_fence *dma_fence_allocate_private_stub(void)
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 {
 	struct dma_fence *fence;
 
@@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-	dma_fence_signal(fence);
+	dma_fence_signal_timestamp(fence, timestamp);
 
 	return fence;
 }
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..04589a35eb09 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
  */
 static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_allocate_private_stub();
+	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
 
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d54b595a0fe0..0d678e9a7b24 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
 
 struct dma_fence *dma_fence_get_stub(void);
-struct dma_fence *dma_fence_allocate_private_stub(void);
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
 u64 dma_fence_context_alloc(unsigned num);
 
 extern const struct dma_fence_ops dma_fence_array_ops;
-- 
2.34.1

