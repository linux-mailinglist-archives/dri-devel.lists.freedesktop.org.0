Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ADB422548
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65B56EB56;
	Tue,  5 Oct 2021 11:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBDF6EB53;
 Tue,  5 Oct 2021 11:37:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v25so26044643wra.2;
 Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
 b=k0XwzTVpq/0gbekSSpKyRcQbF2TyRteAqlNXXqMvrUUPSR7lMN4LqgJy1eKA8McOUb
 NrWtH18QzzKHO+jYzqQhDKVMfd28kdoO3FwSEjeB043Gq9olTXDHLDTVFYIKSEbwoTHx
 v56SHz08Qa7OxWaeHm3TqJ3fKnLOCSkngrdF43DZCCZcrUzykxZ0ufSdOFNxeNO1hqRn
 iqtCBhw+K/qssAiLXsBYJ0aSzRZyXqVPCIurJCc6mOq/uFIBsy7G93HzmeR0VDeAbBmL
 4LpjcPjYsgk9PpLOjxCl9rd1H1E4NNPnwBcSMFEXA4u6mxExDWXVqXFAhhyw0Yy+sggl
 qNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
 b=Y3YaCIjwxKiwIJDMLaIPpkTAmx0BF7MEkf5Yjd7afVuGGIfcaAiJOB0LZCmuc1+sDk
 /4l2s7iEACje+wNGW0x1oG2bMdwRWz70qbWGTobxEGh6dAt1OY4Ux71KtsKkopFCMlQJ
 J0m4QoGYeIrR4WmaMMfWM5qoh7eYB9VVBAK8GzS3EeHIbr36c1jhQzCgKNUr/SKqz6sD
 Ok5UL0b4AhR4Q1AZEfxmZz+5Iy+tddkfATzV+2LsbLJXM1Nq1NoCsOtTCF41y+xi2ODf
 It04WLubOaxj8CAF6gd3zWoRPmAGpbkstuZtV4TE2jSc+jnCDtn2HKbtK7sABYIEDoo3
 Huvg==
X-Gm-Message-State: AOAM5304DaF9tJvH44fOpsBml50APQXT3Vs1Fq7z8Kvonrc+BVVN+ix8
 SPbpounRftDf+R2xXO3A6Zc=
X-Google-Smtp-Source: ABdhPJyFUca4kEvnBulZg25MJLUsViqrz2cxyYESwTcJJxEAQzJy717ramJFMMoYJYI6vKzn+nbNmA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr17828316wrt.188.1633433874061; 
 Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/28] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Tue,  5 Oct 2021 13:37:24 +0200
Message-Id: <20211005113742.1101-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d62b2013c367..3934ee225c78 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

