Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F940F7CC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF3D6EC59;
	Fri, 17 Sep 2021 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C89A6EC42;
 Fri, 17 Sep 2021 12:35:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t8so14940358wrq.4;
 Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=SO70r9SPYDkl1XMyj0huOLAPFmdIU/7ZO4zWgU5Dpzy/bzQ61KlGNo+7xBceV6FSYt
 WD85kj6Xps1VCNe86OkoRhxHupXCOMn7cHcN0DhQxvTonVh6UDNa57vqXq3qX3DSz1C0
 f/6dyrUP2wNRzXywrxwrPvLNBcm06YANoVsLplyOwFjI9j9k0eac4xfrq2dRwb96RPGS
 h/MiUpKGX/oXEGmw0a14vepokZKAGGPUrljQaRA6i6K7CQxp4A5wMWuXSd+pITu9LMh0
 Klcskx3eZ2JCYh9HjIfjMjRWAzsScG1CgngpNL6EKl8AnKuvQS+JZhixWztoI7IUb4Ce
 yNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
 b=JoOhJMZxsw4wTlCNNSGPhA45qbICRULpXeNWPQD5mF8Kwv2rPqYV3VaFdeLTTzWZRx
 TBotGhFz73wmikEXv5UQ1Ly7KbgzznG+W8YFoLijq8RViJcdafv3U4fCftjg1cmDsmo7
 z6zLDVu6P5jSsij2tg3hWgCPOxjOWOa6crJF1rfUOi6o2482cTB0PcNDjISmg7n/alkj
 iWLvo6snHOFYbUWVxtTypXwpHrhFeWapEcUr5dnHqv2yKycu9AKpD++U9oIg8bJwoAGd
 ZjgG0NOjM+rgQmeEI1azPvettxwpF6EvEgUv9S9U74dCa61iev+0Hlb4uUHOWZHXpO1l
 NRtA==
X-Gm-Message-State: AOAM532/sbwDDLsMxQwAE03nPQ9e6U8NuJq93s5opJud6d0Za3kukIZ9
 bFKwul2j5Q/3u4RQdijTwQ8=
X-Google-Smtp-Source: ABdhPJwOJvxsaerqCyTR6Vw7gWrPLu9hZ8OXjaUvsKD7Ysuf/lHgKybjHvCLAxaiBnBfnGjpX897ug==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr11699354wrc.162.1631882123948; 
 Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Fri, 17 Sep 2021 14:34:56 +0200
Message-Id: <20210917123513.1106-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

