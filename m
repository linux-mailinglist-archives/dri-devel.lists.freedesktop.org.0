Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F93A94FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDFA6E52C;
	Wed, 16 Jun 2021 08:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3DD6E527
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ba2so1567288edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eOLQYHUi8EbWMSyj8fpL7+TUOhuUkdVsm2sbvIBW7rQ=;
 b=peIJ6pH3RtosgHbcBzthWIHp5Ht3/i9wko21RYQ4Wwjat8wwNDxFQLd+PS9YmzbNn6
 zYW9IB3T/spJ9QbFwbV1eQFf0KyS1qSyk/N2KYypvl3q+WP6vULhFB6zQ/r4/8pBgIlx
 nCD3ORHu2xcgasBZuy2uKg9TdsycDRBe0Ooqre8wVRqK27vy9bx/meJJciYH9ebkUC61
 7CdfbPXBFbuzxTxe7HGoqdktglROg90cs7h7L1O/vT1vHc/Tp4AIPeMeQ/Gi/jd/8BS6
 wilmsl8Et949y7ZreBxhqO+RmJgtPtm+V3RK4bpOAziaE/HSriApWjAfJNqWKk3OOzDB
 c4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOLQYHUi8EbWMSyj8fpL7+TUOhuUkdVsm2sbvIBW7rQ=;
 b=LU6P8DwKAkfdRUPFtSYotXavGrc9YWZuo98G8L6La/7A0chEfWHYrEe8jZ9o2Je2A+
 UiC5hr7uM9IELd7ayeUkkXyvNLZQTXzCeMZAUZkQGQNXmVxPIlWaosGJXhwgFxhdCtCq
 avWpv36Q7BWjbCigSzKmXXclCPyqsuY6OMBk8R2kLabvB0WdQ72QTZiUDcVw52bYEFqH
 20u/gOAL+7+XfupX2BhtngfEJffAkg5UQW2a8LVt7eZXg+HNHAWSSK7Q6VKdYw/aG7oz
 kD06V5HtRYSL4/VZpC+KSXQNQ55iq1tPdWjX5HBqyf4VmM56UJaU0yYaKNR5p/oxx66D
 iBlg==
X-Gm-Message-State: AOAM5308m/EuYLG/2s72oOCBugRzximSfWs/jByKy77ECAfNJ6L0YjhM
 0jzaexw6XSbAe5VZEbPUUTs=
X-Google-Smtp-Source: ABdhPJxTFpqW21OrNereNEfws2tTVm4Wn0Se9rWNC+9t5y4vIFlD5DkHnDgU/63ucoG65cOJGMdm8A==
X-Received: by 2002:a05:6402:54f:: with SMTP id
 i15mr2671173edx.339.1623832023875; 
 Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 6/7] drm/amdgpu: drop workaround for adding page table clears
 as shared fence
Date: Wed, 16 Jun 2021 10:26:54 +0200
Message-Id: <20210616082655.111001-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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
index 0780e8d18992..d7baa207f391 100644
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

