Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9674F56EE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D5110F2E6;
	Wed,  6 Apr 2022 07:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8610F2CF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c42so1611947edf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
 b=m45yI34uQpnjsbj/CK/S/s10GOm1qrhfHeCivIXcYt/JY7+ArzPyb0ldnSiaAga4KQ
 FjkaH7rWctcvpWbPvRGFKYVdXdgg14m0hz6QdFvsy4GmL2g/iyNu5EyFWQ2WKdEgYhr4
 5Zufxf0P3LO4lzfNhxHI2ZQmpnTBjl6RYFhcRuWgS2anoeBWjUGjepBFFNBmfQXNz13B
 Vh61iEc01NfOcQArvtos+8yU4tNSPQYL3JjquPZxTbFetNHeD0JOgnx7lGHoey1pmGX2
 BJlrHg0tRADT1esVMU+rTWFhn4uvDw2+uLqy8SjFuR/N+SAqx+Yk+OSs9zIXIYPiqaOo
 gctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
 b=sefO9sRvr/XuYgDGHLgpuqCvqHb919ll+8+FPKkrvjTdn/aMvmPwXNLgJbcmMX8ar7
 ltd5UlIMn3d39BTed5xj2Gq4AkTvpmlGCAEcsbiqLfYCXPcUZiXXUiULk/W3gVZLBgJp
 K9pqYVIAOwULSAguIiYF6LnHGkff71Zffl+iMkqfsUez1rC45AmEawZbiPUbto3vBwRX
 8AfwFbs4CE3zXwn4Qg/4wuq4DhTzdo5XKyF+lTxp9jsHj34/dXR6qksydIjwPSeSVs6Y
 FKv3VMUoHaWKKeuPw4/hDE22aj7X2i1SZD1uSyvSH1JTjvSmHqANO8qiW7a6Xx/vF15F
 L5+g==
X-Gm-Message-State: AOAM532NMG704rBzkUPy8PeGuckwKzdSnSa2dJwPX1NuRsFPcAptFpbH
 q5GBgHCrtMPUayjVeBVTOpPVUJhaj+elGg==
X-Google-Smtp-Source: ABdhPJxgUcyAOftnNC3PCszcagE1rViRD0AHO1fCQXA1qI4ZJQEeTDg6MLncWjiDfvBK4xNvkaTk6g==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id
 l8-20020aa7cac8000000b00410cc6c6512mr7331599edt.408.1649231509646; 
 Wed, 06 Apr 2022 00:51:49 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/16] drm/nouveau: only wait for kernel fences in
 nouveau_bo_vm_cleanup
Date: Wed,  6 Apr 2022 09:51:25 +0200
Message-Id: <20220406075132.3263-10-christian.koenig@amd.com>
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

Don't wait for user space submissions. I'm not 100% sure if that is
correct, but it seems to match what the code initially intended.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..13deb6c70ba6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -962,10 +962,10 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 	struct dma_fence *fence;
 	int ret;
 
-	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRITE,
+	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				     &fence);
 	if (ret)
-		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE,
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
-- 
2.25.1

