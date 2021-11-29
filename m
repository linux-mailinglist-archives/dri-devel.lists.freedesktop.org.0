Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A7461492
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5156FA68;
	Mon, 29 Nov 2021 12:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B96FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u1so36212176wru.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=NXIfDAaQ1BF3hKDmfKrx0LttajQYL6RtJf+1p4ZsPv5RL37K0ane91/wkNiQgVwuhL
 or7BDdF/S85jyaKQwg1yNxzqZ/0f1mULxLUk47jbvZ2rA6+6J9/b8ECML9A5Wg+bifpR
 /gyWBOFGUNo8PGVwHJdqSBeD3J0Bivf4n9LwUsrI6AqDmDQrCJAKjXAGdSJnp8pPa8WE
 6TZPEya5D9AAeLQVuOqwZXm43sTfKcmWtWs8UfTvEZVOv5F5g+ZtKdjBrE7DmWoYhjjQ
 iH7OMOnACRfw/KyjPgkjqEnsuA6qrI/ltnYGlaXZkyayoCzpcnq+kmy9Y5h161C6AwM1
 c/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=yuRskUY/G6bv9VD/obNNIB/XEvz1hC8qRdcbo4pxqC6ip32JJdyKt2LqoCpi4HMxOf
 xur/Tx8JsG5TPOCbBcDlf5Iuq0mepzaDfR/2hmjAeLFhY7Y9vlCU5lyeTl6rW2NHOQM4
 +OdotSXxVDeGU8NidYS8IoMsRab9aUdkdlqyrS3N0Q+9HRyMSVDW/RoFd7I7bxsKRTZv
 JidoRodu+ifCucdDD4yx4tXlvyWizrl4jt5u8hVMVMQ4oblgp4avqqC62/jjQ/lP2ZKn
 +jWwuRrC0AGMU+zCvNKrWk8/YLI3c3Fyh+FGCxZD5Sfxiv4C1ugQ4P8oHQM4/lIZk3iE
 Uv3w==
X-Gm-Message-State: AOAM532dA+SBcIRAD79oJDnoIKsyeh8vtswbVSml3Jqw8VNQPA5ayjQF
 YmXXb6cPIFxgR/nLMaPjhS0=
X-Google-Smtp-Source: ABdhPJyh5pEO5g2mwwyaLStXH0XC8zZcDrYA7MtxctYQ2fN21UoLzY9IpgPMs/eB69iqJMqY5fnNeg==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr34055061wrr.450.1638187637034; 
 Mon, 29 Nov 2021 04:07:17 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 14/28] drm/amdgpu: remove excl as shared workarounds
Date: Mon, 29 Nov 2021 13:06:45 +0100
Message-Id: <20211129120659.1815-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was added because of the now dropped shared on excl dependency.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0311d799a010..53e407ea4c89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1275,14 +1275,11 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		/*
 		 * Work around dma_resv shortcommings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence, but first add the submission as shared fence to make
-		 * sure that shared fences never signal before the exclusive
-		 * one.
+		 * fence.
 		 */
 		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
 				     dma_fence_get(p->fence), 1);
 
-		dma_resv_add_shared_fence(resv, p->fence);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1e63ba4c54a..85d31d85c384 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
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

