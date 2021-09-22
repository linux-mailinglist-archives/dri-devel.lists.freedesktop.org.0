Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294E4144AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9F6EB2C;
	Wed, 22 Sep 2021 09:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79C6EB28;
 Wed, 22 Sep 2021 09:10:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t7so4540236wrw.13;
 Wed, 22 Sep 2021 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=Wmjw1pDUM1dPsRsh0ipZiHtkzQcaJwOirp0OO1edNKKgMQlQbPcuJEaERE1B3p1B3t
 9qHPdmBFLHrytpz7DgGFrq72Vkl4cPAKVfPbF53x+9uiYUhdkt0iUeq66KI9FL1Mkw9S
 Appom2ELN7oFpsPdhN04gy7VhUpYbVUobMkJfTljsfdoNb0RkMYi/akbeqf7OZEBTA2D
 OCnjiKqybrMjS6kTW0A0naVyd/xiGXEK4lE3UZXT661BJY+rOzuAT+eS2Rb5dqVXsne2
 aVLDjnLAUpL/fMOrxs3tIE1axZG4kioyNnrM/0qZf6YKMliPqIqMiLudZjJ4r4rkDD3j
 d6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=dmj7pZ6BiAOUjvkq1B6NBxfnU0FAuRZGrPWXk94+QX+adJSdLD68vjH26MhffnmPQz
 bO3Mou+8DEogPoYC+mA2AWsyzFnFyviYEngKBh/Q7keZc1mQPVCdJKD8KmODmkcXxRnX
 sjCEdJPB09af46Uxqsv1C5nU3pDnzFY+frrfYTBDumxmnqYJq2EaT/8Wr6FftHjqL5BZ
 B3DQR39mNEV302qKci2y4QA7Y3HUdv9wQHphTkTJJRvcj3oBSpi+rQnIm3hjZWCWpBao
 wL4nPCVOGqwt09mRjJ/qGWZFawnM/ZCEVSTjju2JGmhrkUBT93TRbRHRWxO+WFusqDpA
 A+Tw==
X-Gm-Message-State: AOAM531Apjx0VGS8WrpYm4ihcPsie2vmhypuZfHX2lr/nisv0ZSBd8fH
 7qd50lw0Ly7iNOAQNg1NJ/E=
X-Google-Smtp-Source: ABdhPJxLtnVBL2qGTr0DJS7EpEFnWd/DL8VH9t8rWHlTnKyhTQmOFa7YQHWgMljEzUTSmd1Rd0gKeg==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr9111559wmi.157.1632301853482; 
 Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Wed, 22 Sep 2021 11:10:25 +0200
Message-Id: <20210922091044.2612-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
index 3b22c0013dbf..301b0b4b082e 100644
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

