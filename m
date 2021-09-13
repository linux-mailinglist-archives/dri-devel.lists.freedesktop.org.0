Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A1408C5C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828F6EC9E;
	Mon, 13 Sep 2021 13:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165186E1A5;
 Mon, 13 Sep 2021 13:17:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b6so14629697wrh.10;
 Mon, 13 Sep 2021 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
 b=j5ApZPjuGQSysR3D2rbwxwT0NziPLN8aIS6xGHDYJfIEG6npP+fSZzcA8ChWpt/NSn
 pyu7jaEzbr61aIbCz5NzAjJb5bxa93okLzdjBXmjA+0jfBhVGDNeWorL+VF8iAbr0x9d
 j1HkejHfFZBHRhqNBbAn7/VPD2OOS5BFGEEoYzqaKL39WDWiQj7FmDhVvnYITRWVR8OZ
 tO1e/mQPZgSSIICro0jrgr/Axg1xFFZ9OKPqro0uSM9R4dyCWbfV9UY3jjkr066gZCce
 tiQV3Lt415N8gpXIpqW4Ru0VYj/IpX/YjXX5KQrVUhUtzMsY1CoiaTCNVOruh+NDrs1l
 qZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
 b=5BojaabEak5RpX7j9H+4VE3r7x5WZdiIe2TejNI7G2C7i17bYD8X12zUsUOy/dfF9y
 l9Br3I60pmkyp11vZvJ0nyuvCBMqNe5Qv3rFh5QmHs5SDdmoSfXfdSJlZfBcGK/RVTfp
 SJK1GIze1V3udkJU8OaBugIM3JWO+wmOA4rdUObjE/MGdLkIX7RZRBPNIFHYOWyCL08W
 lGJYfYQMAR+uKExHPIiM2l8iEbYmL6vR3/0wRbu3CW9imwmCaNi4qDkSvKY+ZR70tFAc
 DNXYzPJ/Xba4fXTugjlWWFled6fNdZVvXDAdmW52OyQrWmvPiXVH7jr3TXBBFKTL9OPY
 0+Sg==
X-Gm-Message-State: AOAM531PP04owmaK4qbmw84EYFvMRkFm9cOoW68EuGhhRyoJFj6TRCVH
 f6IqFyGUPHZOqbh/iPPCNtE=
X-Google-Smtp-Source: ABdhPJxX0s81w0+HJgCXtbBFD53hSzsmklMXxNzsAXztcryHleJTU3rmTPSVM5YgEFZEVyP0HdEfLQ==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr9243123wrn.238.1631539060549; 
 Mon, 13 Sep 2021 06:17:40 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 22/26] drm/nouveau: use the new iterator in nouveau_fence_sync
Date: Mon, 13 Sep 2021 15:17:03 +0200
Message-Id: <20210913131707.45639-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 48 +++++++------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 05d0b3eb3690..dc8d7ca1e239 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -339,14 +339,15 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 }
 
 int
-nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
+nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
+		   bool exclusive, bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
 	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	struct nouveau_fence *f;
-	int ret = 0, i;
+	int ret;
 
 	if (!exclusive) {
 		ret = dma_resv_reserve_shared(resv, 1);
@@ -355,10 +356,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-
-	if (fence) {
+	dma_resv_for_each_fence(resv, &cursor, exclusive, fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
@@ -366,41 +364,19 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		if (f) {
 			rcu_read_lock();
 			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
+			if (prev && (prev == chan ||
+				     fctx->sync(f, prev, chan) == 0))
 				must_wait = false;
 			rcu_read_unlock();
 		}
 
-		if (must_wait)
+		if (must_wait) {
 			ret = dma_fence_wait(fence, intr);
-
-		return ret;
-	}
-
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
+			if (ret)
+				return ret;
 		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
 	}
-
-	return ret;
+	return 0;
 }
 
 void
-- 
2.25.1

