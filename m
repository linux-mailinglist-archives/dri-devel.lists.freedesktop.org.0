Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB74F7AB2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2B10E59D;
	Thu,  7 Apr 2022 09:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD6C10E6DA;
 Thu,  7 Apr 2022 08:59:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d10so5657549edj.0;
 Thu, 07 Apr 2022 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
 b=lBNEaytd0NftSUtsbodZTdCkPUN0fJidaDYSDIU7wlBSbnycDWD4ZJfpyDYcoh5P68
 VZnNNWqkdfMpqZwMyCK0fJTiyqKD6lpCUks+brrYe7GhREaBAMyp5dOJ9rswZuias7BP
 sclBMLrn1V0+NDM4jGcQl5lF2uHQqQNTYKAsNB4AGQQYs8oznj+V72oSQpd+Q0xCcce6
 pjDC7ip5LUJueJNCVBJ5694Ynowl8m+JINS6F+tSGKodZEjGD1qHV8PmcXIZFogAKU14
 eApb0xu3IOdgo50bbUA+oejNFdVwjZ/6aCqX5SPrfJND7syFeG/GJOi0cw2si0m6uHWb
 /Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
 b=1PUa7mO1viLxV2I0ZBtWIpCTCrixnkl+oSFyopQ6SosBK0i/vaG777AMzOao1Wmi3S
 lN5/Xj9PXGULyXVBPpOj+nd66jH3a802XoNDQ6KjAFEuIpvPCviNzSOmN1viwCICgYNr
 hZHMWFcTGysFNbFBjMswHta8rElw6wMY5ETzE/fJVArfgwMGz8qQJvXko3xprzArWDD6
 d438rrn1DbMJivZOSSw0IcPkbZM5ONU4fwxB8+lQlGNk4BldjlA8OC+Fmih9QgdxOJxC
 D58HsVMneQXk9Y7DW8/jlI890YJLcdFCC/XqfMQNc8hN09Z8tNAfq7vXnjJTF9bo+Twq
 NFBQ==
X-Gm-Message-State: AOAM531LVUgI1gHX0EMbxekOWfzLvAsrzXewB+GTTGU66wSmTYFeICkm
 NBMBi2QslseKMGbPVNK+ATU=
X-Google-Smtp-Source: ABdhPJwAA4GW/7bCD+NJa2Rf7+dfYkks4/cwOVV/PXe754GBZwyLuEH5NsnlvI4dzV6afABiYYLXYA==
X-Received: by 2002:a50:c3c6:0:b0:416:293f:1f42 with SMTP id
 i6-20020a50c3c6000000b00416293f1f42mr13006479edf.187.1649321997805; 
 Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/15] drm/nouveau: only wait for kernel fences in
 nouveau_bo_vm_cleanup
Date: Thu,  7 Apr 2022 10:59:38 +0200
Message-Id: <20220407085946.744568-8-christian.koenig@amd.com>
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

