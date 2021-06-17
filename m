Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504853AB241
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1788C6E8F2;
	Thu, 17 Jun 2021 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD7A6E115
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id my49so9189719ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f1nM/lpdSyfhiokJoYKLwhEgbv1/4gmOk1Dy2ivEHic=;
 b=A/XrqU2+MWOuAkqSgZ6QRPi/OX8NnlSLG59pLX7MWTJdq/uJfCYBGgj1uNqm7KnshJ
 ONHeTwD04CBs29Zlu+QbB018Sjbj1EbD2PRqZl9cKBh9SMmhDZBsCQ46OxPgp1o8Qq3w
 pms9himFZh0TiGjmbDTagV+cT2IlGLWj033t58n/sVW92evl7E/bIIeKVakNk8213Kzl
 UTL+AemGi/lA9fyKp0bn74Khf/YY4mATHujl7EeUiZ+n3ts5rQ09gb7MWWAyOeljamEW
 VF9NakYitalSgDIqNGl7UvP+t0K2cS4irujtjxI07D3cwQaBxKs0atuYZ9O1iAdeGK0k
 9j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1nM/lpdSyfhiokJoYKLwhEgbv1/4gmOk1Dy2ivEHic=;
 b=i8q6ALI659a+FR+BekMmBmglRXl8JZQ3JIc9VtR48p+W1AwOQQO4Gw5mLZN7iU5SaW
 apTC7AG2TPW2mvPiAt0uxim3Tksx9vvARTnTSWwECdJDrLuXEbP9j9HlC01Mk6vRSCgn
 BJbyL5YjQ6x//PlSNIAyeZVKWjE1P6RsA/zFa3U1F7CjFxJ1424sJOnznozDMiZ7otOH
 osqHxSVEyCRYaeqpW3jGHu1TgJowJI5cAFJJi6SPLEjDigy7IWxZHPMtZq/FjoRpHJb7
 2D41TIG+cBdDs7iT4+5PGiZM/n9ZW2L7RK8K1zg6sAl1RRqvsXqD9nRLs68HyGIrQrHO
 3uUg==
X-Gm-Message-State: AOAM532zYZj9HVH38rL8n7SPjkR1LKUM9fAAdSXoLff3hMU8AtzHrLp7
 91oIoii3EBW2n5pCKdy0doYQP6AYqcA=
X-Google-Smtp-Source: ABdhPJwpl+Y35NzWtOSjv3T8c0k5bgUp2ObFD77ixFfDk+LP3QdJI72JcZJK2ppOJ0uA8hoXgx4CfQ==
X-Received: by 2002:a17:906:86cc:: with SMTP id
 j12mr4762643ejy.548.1623928569570; 
 Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 12/16] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Thu, 17 Jun 2021 13:15:54 +0200
Message-Id: <20210617111558.28486-13-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 80dff29f2bc7..d86b0cbff889 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1334,10 +1334,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_cursor resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1351,14 +1350,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

