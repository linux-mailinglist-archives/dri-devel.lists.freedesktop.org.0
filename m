Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80A413880
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE586E9C2;
	Tue, 21 Sep 2021 17:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A266B6E9C9;
 Tue, 21 Sep 2021 17:37:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so39817326wrg.5;
 Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=VePXpSNXCwTK5NQ0fCHN0VvxQK/RJqR8uuQ+7WinkOk4JnqT4ta3E4ePLIcwg5K1gG
 Un7iqimOrX8S/QtaB6twwiic17xykFh68tj8EcjBBrYjZBdgG3TQT89RtNBlaYZ9WprC
 hEX7NmJtWqpb6IUdhuKLhrmP5gOcsItiqcZodcdLctFKGDSNsxIWgPwhVa/jCMCtAHgc
 +pAIXpLxIUSq1izgp14q+0rIhzS2/CkJE65YKYBdQ5VeTMI4ZJG1Pw4zi9uT1pYxlk8x
 wcTp1ZjYNCAwPy8mK1WaNbPK3wmz/8+TT6OvZOugu63a2TBHOv6qMoutROi2Q965Ft4T
 IhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
 b=fesfFlDE2SvBQ1Pj7bwH0QfAW31xdc1ZGb4awR8ZDnftZpKC51tU9WGOrfTdW14IIa
 XSjtzvXwK/vI7FKzAZLGBInwWzlMMBZHcjNpbraLCOyGF+NmLKFVMXIFeyn5MyY5PtMb
 d29doZjfByCMIewFeGn6nyi7Y7rytQzHtO29NGcZ0pUxjcf++FVGPgGf4vmhYUKs34Xf
 uoTnXrFPvxzoLCphjSeKfacXZbJmm86y0Jt3tlOnEJnncKYwB1cxRtKn7Er0NI24VcWP
 R+GvGJtQDP3RZL4nSYoSL1FRqM7W4RZVI1XEmbD03vOGuXob+/uyRn3a1vhPi7y3FGJ7
 2Osg==
X-Gm-Message-State: AOAM5324FbUEOpd+T+BTV8kU9CrcuzMheYVbyvVeq6Fz3ipzC3hitGJ9
 7xwwXSWthzKvZS9jDYRLKHk=
X-Google-Smtp-Source: ABdhPJwZXkcoOGg52wUstyhEmW0SBl14bNG6ygc2+W4Cn9IQUk6lNLl53rNUcP3WtzLBLwOzwiXawQ==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr6202904wmd.20.1632245828252; 
 Tue, 21 Sep 2021 10:37:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Tue, 21 Sep 2021 19:36:40 +0200
Message-Id: <20210921173659.246165-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

