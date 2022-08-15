Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716F5A002B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6EBD1F3;
	Wed, 24 Aug 2022 17:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D415D2535
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:47 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gb36so15014340ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zSvHFbj8Jj/2GkiIIoYhX+QU8HIZGxASz4FTnsYcUx4=;
 b=b+Q5+wFGGksYwZtt1FeXdtb7ZsyE22vcbktnpj7oRh79K59zu79nbJGkjnQZxg3Z9g
 Kp9lLqT4RX4EbIbEUk9fTahuuKkffLkZxyBSadfI01Uf7BRPR3H49rfqW0X8qGSyn1hO
 fln9wIKVHq9aJuojwGiaB3iL2dpAZv8bn5OhkwrmES3AGmmrY6RFA0p4QykvnAnzlni1
 nqoQiLar2ktSbDeTIjrka/U6WYTgXxGh6J+/jeM2Gl1mSkggARv54TaUdbCy3P6tOOHK
 lkkbVqgG0x0EkJy/gPnXSIQulbuuQ3JFUnMvUYuP5tbM7la1pku5RYDo3SQNW47z5SiB
 9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zSvHFbj8Jj/2GkiIIoYhX+QU8HIZGxASz4FTnsYcUx4=;
 b=iEKT++48XZOLFWNlXCXk0KBkSxdNQwQMqpVLX2Hf5hh1FQ8k9EYWPWtWok9H4n0q1X
 nOESYPCpw4ZByoUcuj+b0kGP+NLLPuHgpzfK6yozo11GpYAr2UztlHuELvRK3DS4ckua
 6bCwKLUqDI/TXo2lnO6GjWCaDn67B761/tqy02f3wwAYetmxi/DFPrYTnNTpt1pt+i5D
 0yohUiPk85MPF591RWTBtvRYaCgLD0zRPMbtvDEtdiZiSIpt+7fG0/Cwe0+ib93cLJZ6
 YPXu2r8UPAxBrWqCz9fxWu1Qs7c0iMzeYhLrgV/uNsd939cVqYB7hivdToNevEBJnGw6
 ftaQ==
X-Gm-Message-State: ACgBeo301IAZReXtA281ppp66Bl4b4rFSICY/6HTzFzdx8/X/10rbCjz
 c+P0wZHPPozJn7LZEN+95kho+2H9CzE=
X-Google-Smtp-Source: AA6agR5sLv5R200TiIV01qALOlgTK39MUE2zE2VAkakvC+MOzIBtnOvZN5JAgxYze8EjFz62TSZsNw==
X-Received: by 2002:a17:907:7284:b0:731:82a3:16e3 with SMTP id
 dt4-20020a170907728400b0073182a316e3mr11538548ejc.30.1660589985895; 
 Mon, 15 Aug 2022 11:59:45 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP
Date: Mon, 15 Aug 2022 20:59:33 +0200
Message-Id: <20220815185940.4744-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
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
index cbd593f7d553..85eb68ec692e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -297,7 +297,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 */
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
-				replacement, DMA_RESV_USAGE_READ);
+				replacement, DMA_RESV_USAGE_BOOKKEEP);
 	dma_fence_put(replacement);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 1fd3cbca20a2..03ec099d64e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -112,7 +112,8 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 		swap(p->vm->last_unlocked, tmp);
 		dma_fence_put(tmp);
 	} else {
-		amdgpu_bo_fence(p->vm->root.bo, f, true);
+		dma_resv_add_fence(p->vm->root.bo->tbo.base.resv, f,
+				   DMA_RESV_USAGE_BOOKKEEP);
 	}
 
 	if (fence && !p->immediate)
-- 
2.25.1

