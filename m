Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE733AB23B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBAB6E13A;
	Thu, 17 Jun 2021 11:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45B46E115
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id n20so3452508edv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0rYVC8GXBvPHta5OQekqQaFTSxF/VrC5pz+9u8ViMZg=;
 b=Zm8qe0yqyJBtIYxx3yuZlWXCq7HjCj79xa6qOLkjBQ0ny6jlNUSeRumUFr5yLlW/eP
 t9MIUL1gtlbyyxx5LXxBlTZxfwwCCCRJwLlMmyObBGpNu3dVMAIFP6DFnEN1umkjFLk1
 qfBqYYLAaTa6qXninH7jyFhqCqABPSCaTAKpLqKJWduNzIApctuezdpbHyUBe7ESPOc1
 IsXe8/WJgv+CmJpRPzoGj5hr+paO4xWKnrd9GSqdBWGnPVXC5LP4uSSZ06djxIz4Ax6w
 qRhm2Urf5kYXD64HOixSMCdg+hXtC8lsvFXkkW+9u2EIz3pftnahDxTTUGp45qwQP1Bl
 TdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rYVC8GXBvPHta5OQekqQaFTSxF/VrC5pz+9u8ViMZg=;
 b=NL3yLFld3G9S9kqx9klYnNy9n3jvIDmGecaYsgmQALlIaAZNd/pXDFu22iTXA6HFVb
 Ui3ytuQbZDbNs8e11rU+/hlDqIdObWb2bI5RLwxZySHuoD8MlNd7sgxBwabJsN0SolYX
 lK4PZracgoXK8MzlCGwKUOJVoEu39Fim9Xhhb1ZBMoh2B6Z/NA9OyV5d1tTHttnC28gY
 9dd9kTGblJIMcIytTcn3peMWyXalU2Xo3R37UQxDTnm2l3d78YWiHrmkLyd/f1VDSaSY
 eCNRgKjosuWkp2cLfD52v2mhgf6ceMYCgDM5N5/KUf1qpaxc4+3GXJwbnRMhTpzHfbAj
 zaUA==
X-Gm-Message-State: AOAM533YZDESUrlWETdNbhlZO71NlMoPg4AIvTrVmZedQT+UkwkPBTyn
 ek9gUd3bxL/Oy/OKunHQhn8=
X-Google-Smtp-Source: ABdhPJwMPY8wEtDDMVVnoIX7OfvIzuomuMkBFiT0fIuMQDUKJLRIJm09Yp32F0OTRw91VHHDmWIhVw==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr5689376edu.346.1623928567467; 
 Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 09/16] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Thu, 17 Jun 2021 13:15:51 +0200
Message-Id: <20210617111558.28486-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
index db53fecca696..15edb308e5a9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -256,19 +256,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
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

