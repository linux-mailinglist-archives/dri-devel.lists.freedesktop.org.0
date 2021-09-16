Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730140D8A1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ADA6ECF6;
	Thu, 16 Sep 2021 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EEB6ECE7;
 Thu, 16 Sep 2021 11:30:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4232353wml.3; 
 Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fH2la9ERLn922MNwdjpBzucxgwCx4MWLLwnxQZAkV2A=;
 b=QygDHeC9HsVEtELC3djbtZW6/0UMFEgNYKIXOY5ItCyz+1xafW/q/R2sJcJb8+Cn3O
 GDSnKG+cFou9ZzvIbvJgDf1cAdsyAfisFunb9pfcUc5n6/XNpVTLLAhflx62HXJPijos
 H8pEY1imBFv+eRQxkBc6uyflXxV9Hv75wsQO5fDKxRoZwh8TUQxjYufMBqg7q0msEavO
 Kn/oD58ImLwQbjh2Fwidp3TA4A9EBP1CSdGQQIV/dL15JPxPyPV3RxLOoovLApguCDB2
 NIH/Tz7fjTf8crcBPzJgv7LxbG0EBJoS3iJJYocFx8kkGyz6sM/LMSgTG16LRnJqBXIh
 sV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fH2la9ERLn922MNwdjpBzucxgwCx4MWLLwnxQZAkV2A=;
 b=7dZjwuDXzhqt0ZZk7+G3R/albMQO0TKbhC9yVCE2GytBICp7mfjmeOuLtwG/ngg/YC
 0Bt2+WGTeMgt1QCCT/Z8Ry1KsOzbVbpbG+lx+VHJrB6lfoZDr/soDeUcgEPSClp6LISl
 UPnkBBqtGIGuxNTkcpHxS+ugWjEeQmRYdk6kjwr9s1GYcpE8fDrXWyAEQdEY4SO50Dov
 8FC9EhahKSIpFAepXXHCayFunkauNNFMXh9jPBVjbD+sIk+uU4rw357Ler0kBo99hT1q
 uG/bPTL2IcMC9MXZpRS1mFg3LxP619Zqfd+HHw8EEvi+BBaIfIeCNXD7j4TR5cu+HE0q
 Uy4w==
X-Gm-Message-State: AOAM530H5d0NH0XF/G+67VDVKIg/h42FtKzQfJAr8jv+uCEAYmclIY2s
 utwO48eXjQ1rcf3q8/O5vmQ=
X-Google-Smtp-Source: ABdhPJx8rGNiCUwWUC8lksSU3s2LHyKP4S7ovy1WxAHJ8ow8lfQ9S4SfWYyXUenSQuBU1zVE92+Rwg==
X-Received: by 2002:a1c:d2:: with SMTP id 201mr4420740wma.67.1631791852124;
 Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Thu, 16 Sep 2021 13:30:23 +0200
Message-Id: <20210916113042.3631-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..d5912f5b5953 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,19 +269,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_for_each_fence_unlocked(resv, &cursor, true, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-- 
2.25.1

