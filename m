Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576B4F7AB9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B526D10E6F1;
	Thu,  7 Apr 2022 09:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B561D10E58D;
 Thu,  7 Apr 2022 09:00:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d7so5568523edn.11;
 Thu, 07 Apr 2022 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
 b=l2gjx89JUUtewB70mA2emV55sPZiTfAi1iEeA9vMVFBvGhGRfb5pueQojIJxWZ2CUv
 cMXLooNuYPfOgXmDvsDzpMIwkdeaISPyy2/s4xZEF22nv4BqiYRhWJ29tTGizcZqDtc5
 LISUMM2tv7hWHZYeP5J3gkjwXgrMlZkMXvtIOcOK9oK2KVubkeZ1vCpi0Om+drJq/4Iv
 XtGDB6y8hzgZkcQ10/ufDpNfgN04DK/n5Gldbyt7aJNaYIzcgyDvvvHgaZ97AY9/xEwS
 PYtX5LpOPCufWjFmaI3c5QF/FHPOz6N+lorzoO8MSxc+yKxWmv/M2E7kcyIEmAGokuIM
 KTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
 b=uz0wQZ6XX6HDsdVvz3TJjKjcRUlR9Zk/HVmnWD74+w2QV7JGjUEBNO6juCUc4YRxMu
 9nAcyBKuwbH7OqJ73Q09lVC2jjF3zOlmSt/+QZ304aIGwtiOdQEWGIJ7P7Dzrq/C4fyH
 vHeR+GW6Ikg0mIenmfqJk0/XROO6AntZCjFVOkszrEFyaTds5fzVKpUdGn2QoniqnpLA
 RjLYTT3iuBa5YbRWmCW32/h+joohffqCkIwwTDPoROoOgGdzxPamZn6ncu1TTKyuT7hk
 HB5VVhKpsxA6s5chnl5AjEm96hx7adHqFIYpkz+bJu57HMf925r5QreuxA5YiA3cMoMq
 jozA==
X-Gm-Message-State: AOAM5317fz+ptCObzZmLyBMc1gv0VgZ2/FFp0gLM5VFNpPnsJPxjmhs6
 YPK8mmud4jEIYkgrEMV4Om4=
X-Google-Smtp-Source: ABdhPJz10luuyog+RiWlnfRijKPRqrjTT5XDcO7k91kIKNaQlGO+86J2TKiPrmCi9PjeJ0hM4s96Sg==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr13097363edc.232.1649322001125; 
 Thu, 07 Apr 2022 02:00:01 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:00:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/15] drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP
Date: Thu,  7 Apr 2022 10:59:41 +0200
Message-Id: <20220407085946.744568-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DMA_RESV_USAGE_BOOKKEEP for VM page table updates and KFD preemption fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5031e26e6716..808e21dcb517 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 */
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
-				replacement, DMA_RESV_USAGE_READ);
+				replacement, DMA_RESV_USAGE_BOOKKEEP);
 	dma_fence_put(replacement);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index dbb551762805..9485b541947e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -112,7 +112,8 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 		swap(p->vm->last_unlocked, f);
 		dma_fence_put(tmp);
 	} else {
-		amdgpu_bo_fence(p->vm->root.bo, f, true);
+		dma_resv_add_fence(p->vm->root.bo->tbo.base.resv, f,
+				   DMA_RESV_USAGE_BOOKKEEP);
 	}
 
 	if (fence && !p->immediate)
-- 
2.25.1

