Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134C413886
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257776E9C7;
	Tue, 21 Sep 2021 17:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979B06E9BC;
 Tue, 21 Sep 2021 17:37:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d6so41375057wrc.11;
 Tue, 21 Sep 2021 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=h7aWFD+PuXjbmRX3VotvrSo1eGQ9b4/D6z3u2RBc7nF/p9Q8pGGt8wCirYKhydLZbh
 56n2fuwcu7ieonzQ+WeS3T/iBMyRSDxDfA6wSUMLqZdS39Gf8yWiu9KgYD2VJwpY/LVq
 4PtaQAQyDYchHHzd+qETppCMxu9E1vpOGn7zlKXJ+540EKsj18c5mXHmrVEOxy/51kcn
 FvANxPcTH9LZu7Nexi4iTrtxHCh4cYokAO/x3MGw+YMCAckk9V1Mgl/ZXoipVOX4c2Ha
 DaabBD89vP9E1qJ177UIKGU7nf8sbG9EtW8OrPw+0tKCkFvyyE1iDwnCVl/Ead4UdrFb
 vVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=OtSZ+smBKaN1bhnP655naHpK3iyuTgLuz+On3OFFtn3XOj88EByXmJnnG9NTkw98C4
 cUsc2H+qpAUAxVwhXJg7yLdRQjPHY+z7Veo9zx6zQbVtU65DbJ2GI7NoASFg2QtJspVx
 XpdqdssigPNXxk673gReBDuwsNuZjDU683eHBLBD80EtoMP+WvKY9suwMBFrCQt41jl1
 mWilC46EFT11hoX+uxI5r+3W4PqE6sRKF19Dgb+RgWg8dpS2Xlk6seyPMceOk+/xl9xp
 P6mhpfQk6G5YHpWcBgagfisIWF+uivbSA4FTTSeUtU8Fl2FNomAt36Y7qHMfGLw7bw3M
 z0oQ==
X-Gm-Message-State: AOAM530ixhW4KUMRjQqHRjnsf1nb0QyLKv7i2/I3gBQMviKnPKv71JvT
 UZ4HPQo8DwAvXJ7+oQDUMhs=
X-Google-Smtp-Source: ABdhPJwuU2dsXpBoxIjBquv0otOKHcIDlb4fqCEVICYLhfwpq5O4jStIhLoDxEEYt7EXLlnyghpt2w==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr5873639wmi.157.1632245830102; 
 Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Tue, 21 Sep 2021 19:36:42 +0200
Message-Id: <20210921173659.246165-9-christian.koenig@amd.com>
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

