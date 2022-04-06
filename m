Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F864F56ED
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834D10F2D5;
	Wed,  6 Apr 2022 07:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D3210F2DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l26so2557210ejx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
 b=mb0AdxY2CKTAKWRQgrzqJv7rg9js3ZTZ7S+m3SBeBYH589ycSUF7/Zx5sFPkaxHlTT
 DL8E5oU4lqA9vKzRr5BKRrvMJfFQpmfQD1DIpNfwKwwItbN4SAX4il/S+nGgDym69zq6
 77gv1VkKwWQQ4NIWNSTlx5qylL5LQdmhY5B94fnHLknpECEGTiB9p0vnMqUCYBy0IpeF
 /YvY75UOYQiRSILQ9sHrnK1PIBp2Sa+u6G3CxedJCEx6t3231WZVOmVT8vjJDA4qI+T4
 kuCdfVJMVYqW4qE41qgTCy+ZTDZ65nNcQJs8To+77s2CU3m2/qsuCXZrzreZ8sAxiARZ
 6Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
 b=S4DzJM8FA3H+/PEZpwkiQ9DDQVqDwU5ZQEJSzUrmNNKvzc6hy63RMvyYGyasRigYvP
 QNE2gr3EZAhXcE9TagTBkxY4S0R/81mV0PCZIGa9IUpGyfXMHMPGCmbrFnbJr49fBQ7w
 BSyo487jgZZsaDb0VKqEPU7gSfZUykoWuef6Ei39Dsyb5yvf6BUijTynGTpFhKGWcSfE
 /YYnE21EjSoMujkJtd9j7m0p4Wb3iEO77yv0w/I9IuZ0GYaHQ6V1an9C2/8GMTpFKp5W
 N5dNHi79x/emy/jB8oigGFPCnOLMQVOuCKFJZYhjRi3Eg3bWIYKecWWxjpgs860uk06N
 1ZgA==
X-Gm-Message-State: AOAM533LcbGu2Eb7g291nkcYALMNsziZylRmDQJDPwnPk4Ei5JAM1nYc
 +tonuFm/ora+2SnhFvpVfPk=
X-Google-Smtp-Source: ABdhPJw4SZP4FwaObQ2NMI86cSc4M9fyZI/w0apvD8LpxzFhfNWQdAg05mcpxfgfA1DlK4pGBgIXxg==
X-Received: by 2002:a17:906:3a4f:b0:6cf:86e0:586c with SMTP id
 a15-20020a1709063a4f00b006cf86e0586cmr7077930ejf.626.1649231513351; 
 Wed, 06 Apr 2022 00:51:53 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/16] drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP
Date: Wed,  6 Apr 2022 09:51:28 +0200
Message-Id: <20220406075132.3263-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
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

