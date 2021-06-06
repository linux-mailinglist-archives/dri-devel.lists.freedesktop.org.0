Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDB39CE82
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 12:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2016E497;
	Sun,  6 Jun 2021 10:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CED6E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 10:03:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b11so16526197edy.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=reCaOiS5oovNonK+oIEwI0YUolyY3qyhwqVKx8y4qUA=;
 b=YMj4kS8C/F1JS1bw3BRI0QD21gj5bfCC6XAArgNIaoD6dv3VzEBCYCxre4AoFJFQFs
 aA/vtjI+6BTPcJamwX5Z6/yTr07El4FGt0qejh3KdsFuKvc1y42DmMuACXq3CvwrkiZG
 fAjR6+ZK7DZQhxHJfaifoRJIKaRw1KPJEEzGLN+QJEhIZdFE2wYUQce0hR4yEjZhs8vx
 dCBxG9Ye8GIVV0f0IDtg8h7Qe0bq364oODR8JPEhxzVgpHUAOg9UGjmtvQE/0//BWHfn
 xAH2ITlScVWkrnV655NPPl1eAtXIV79YxnYcKPhJArx/suYnx+ecmuiYJ9QnEaolm/Qn
 Qlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reCaOiS5oovNonK+oIEwI0YUolyY3qyhwqVKx8y4qUA=;
 b=MzTmd2qwKga1dfGC/KSMx5h1t0b8L7cpc5qTHut9V1F8pZrCvS5Mo2Ul/1KH2J9TK8
 SrQ3hWvfZR6oZOWbqwR9aHuKjQeVuQe1qEiVkirr7xKXcTsOj5wjUDf2JwhbEfR3yRjq
 7JIyp8f5ZoKQ0BEjNJQR6PtC2WlSl00tZbvF6/tSi9QmC1vvAujv3NDCPdi4c9eHDNU7
 D6GKIcsZMemTDHV0ivuIifP7qYdGrFQIipzpJic7QYJGLbzqBbk8YDlx/7tPfgI0j4xj
 ZLg3fqLiQ75lGeQGcoNQy6mL+fkjUaZoheeBBwl3hlCUzrZuI6XX1Jx0xaN+kx9Zc4mn
 33xg==
X-Gm-Message-State: AOAM530oEBTd91CLKNvqF96As9DXzZ/xT8N4h/SZO12TdoVGstkd80vS
 Ye9DI/5nX0U4ewL7cSvUD1E=
X-Google-Smtp-Source: ABdhPJzlu69bSwMt3wpKnYGWB0vT9OqFDBrP8ya2fZ+HNd4T/GwvMoiiOc59eb9y/dPJwSqrX1rwng==
X-Received: by 2002:aa7:c445:: with SMTP id n5mr14591993edr.64.1622973797989; 
 Sun, 06 Jun 2021 03:03:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78a4:bc57:b741:16b2])
 by smtp.gmail.com with ESMTPSA id r12sm6077531edv.82.2021.06.06.03.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 03:03:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: drop workaround for adding page table clears
 as shared fence
Date: Sun,  6 Jun 2021 12:03:12 +0200
Message-Id: <20210606100312.119176-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606100312.119176-1-christian.koenig@amd.com>
References: <20210606100312.119176-1-christian.koenig@amd.com>
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

We no longer need to add the exclusive fence as shared fence as
welldrm/amdgpu: drop workaround for adding page table clears as shared
fence

We no longer need to add the exclusive fence as shared fence as well..

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1c3e3b608332..156c39cd858d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	INIT_LIST_HEAD(&duplicates);
 
 	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
+	tv.num_shared = 1;
 	list_add(&tv.head, &list);
 
 	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
@@ -226,12 +226,6 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	fence = dma_resv_excl_fence(bo->tbo.base.resv);
-	if (fence) {
-		amdgpu_bo_fence(bo, fence, true);
-		fence = NULL;
-	}
-
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
 	if (r || !fence)
 		goto out_unlock;
-- 
2.25.1

