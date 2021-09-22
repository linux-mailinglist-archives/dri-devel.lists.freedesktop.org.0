Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDB4144CF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C500D6EB3E;
	Wed, 22 Sep 2021 09:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5382E6EB2C;
 Wed, 22 Sep 2021 09:10:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g16so4727027wrb.3;
 Wed, 22 Sep 2021 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=p1aWdYCX0A7sl4/OuPKLQ6GGaAsvzD4Pl3fyVne6sSEKFdRmPP3sZ/LJwrmMb1V2Rf
 JslKSDJyv6t5W28HUYO5VZig+N7iU5IVZwtyVwJH31eL0nCdGOrJXFtzQRfWBRw24+qN
 vP88ss2M+nBPG7QhBnJP/hAYQ1W3D4qUBT34Oi7xha2tNWAB7oPhFTIPmW5Q8RxxmQjb
 QTargXdqdBxV3LxxtMkiSsFpRR3+l7Q4BKeH1xh2Lvenm5Fnkmnp8+TPKHY2B92QZ/7E
 MT742SRn357rX5KhLx3bc6/queufAtZMzTf5ekv/aL7X+ACvWauj2E/nI107DUOm1wvF
 lVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=G2SyPmOnmfymnwW6foSSxEYsjAViTWhFwg01et/h+DTeSLp/mwHrpg1xJd3MgQ0Vt8
 552fVw3OBxaOAJ/r2rAxvGCpuh3rF3ZkQ3o0QjH9yXKdIPNxCzUnBRBD2/gjvEwzx8WP
 kV3jnpOGEayvo1EKxI8LQqOz8dKTHYIfuvXZeGSpum6GZAvZ92MjhL6i6oSv61j3PMvF
 pb1a+cqA6pp8g+Gg4Zk9tnlnnC3jUJDlVnrJnGetcLATc9/sfA2/YRRB7nd8jGi5At9Y
 +9ihusPFOwXSx5rpFFU0hl7nmRvtjDnhljwJBlnTxh4vYK94b2vUHqrb7eR0q8CMOXzu
 8zHw==
X-Gm-Message-State: AOAM532v7GjX85MVBKZ4O6LLMHsopI41rGa5bxhual92y87k/SgDCBc3
 Sod0ATc44uQ9MGW0V6GmzyQ=
X-Google-Smtp-Source: ABdhPJx6fujbe63qhq8I1nP2U9AzCMD5hqPeuISDYeRieWnjmp1o6rnpaUfZe61wMlhJncPS3WIUUg==
X-Received: by 2002:a1c:2351:: with SMTP id j78mr9251338wmj.40.1632301855727; 
 Wed, 22 Sep 2021 02:10:55 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Wed, 22 Sep 2021 11:10:27 +0200
Message-Id: <20210922091044.2612-10-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1129e17e9f09..4511cd15c3a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_iter resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1349,14 +1348,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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
+	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

