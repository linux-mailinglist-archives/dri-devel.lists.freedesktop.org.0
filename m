Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3D408C5A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124566EABA;
	Mon, 13 Sep 2021 13:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2506E19A;
 Mon, 13 Sep 2021 13:17:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u15so8600200wru.6;
 Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
 b=cIaoNW7Pu71uAxZQrsu/xnmOwW4Bc5B869gtUROGkegEYgkxFg9VkD02qtnGbmKz0l
 r7HD1XwBYzQRvbt9qjF9ccsBOGjHtODOy1AGr44+JhyEb4vjHPFdomDedOEniYh8bB6V
 MdVentOMB0CkWNarQsEwl5Ru0CWRr4J+NntBzk7mFYxorok6dnYsv76Wg769nN/H20K/
 zStSwZi9jLzed5G+TRqiV2gHKeqm+0K5eGXNCgISkxmzGkQ4kdBAP6xnUdFrxpYAFHPh
 hGGEAXtwTeUE3L50+GZR/39vCe/CboqjmHuMMYpcZflJl0+JS7herysbSicpKlD1gBg0
 NloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
 b=WXPCvJo1Bu0Q3PIquVRBgCu398DFg0nmExKprArNG+oacJoVUnWy487GcZV7rhvUXs
 IAtU7DkMhSSc0dzswVQJaFhPh6xhH1VgGdtbAvIi9pDQ+tS10N3xqU+kqiy0jA+R2I15
 2uUTwg7IiATNKn+6klJWKeEBRn3K2gJEPZMkrLldYWrsODcvt6vIGGeNgQ0qJb2AqMfL
 sL8fR9SBh7RuqxZTCOAoTt8RcxB8A/iSexK7iq2jEuJxJsrcQX06zBexmgPD+W2e9WPj
 LieY06zsglGutcBwkrpmWV8ta6v2JYWr75LFN+2xOLLUKAR2AAgD+WXyK3Wojfkm62mB
 zDog==
X-Gm-Message-State: AOAM532YbwdDUfjw7/8ukeGXCyOCcGwg73YNLiUfaUK9F9e5ivYVH2Pf
 923tX3jEUUUhV+ZFle7rpzY=
X-Google-Smtp-Source: ABdhPJxLsXI8wPKkwytM0i7YOK1uTgTTkrkYfOP7JpKZmiofMgoeOrjtHMbPc5TauiHJ7pU4s2Wl/A==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr12452364wrs.271.1631539044369; 
 Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Mon, 13 Sep 2021 15:16:50 +0200
Message-Id: <20210913131707.45639-10-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489e22190e29..0a927006ba9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

