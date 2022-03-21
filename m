Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D54E28AD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F4210E436;
	Mon, 21 Mar 2022 13:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5000610E430
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h23so20206966wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
 b=BeZOzQyTxNdI4cHo3kAnjSyk+1Uoo7bWLwNubN37E4M+JEA7E4ZMt1cLl2pVfVun3Z
 lvPs2aJjVCZt60j/kQcnmDrVB3C41u9PAupknkipPeYOaPeeBgvyCvwIuDE+MzuRtG5n
 SD00rWxu4xXGHBmFeYMSSFR2Zos0hEHeAbILrmLy1iwvmo3Wk1RTu5zbq1OI/haeLGpg
 vAPFYpx3yWg6USdqSzk53Vpei1t5CSyvXjh5Woo+Xl/UFH+DO10h0h7Vii2xtZqYgzog
 sJ4AAWaJ22i9u6Wt/x9Iq8rUneYq3dsxB4oOKNgJK8ubIV6xNvv+eM98coU3tVoGfOWI
 BmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
 b=w7yrZNEjVdzmmy4+vLcNG5LoBVwcDd7ImdgeCBFzDwf4mWyG0DTkFbOjyyKUwOtwrl
 HI9U5Hk45BRwU86DUpBDAL++lPvy4BZzjDAJApp0hUx3k7q+xJV5PoR9TGpFXWlJsfKR
 HvOlNdMRXGM2twd1smTz4mrcGpF/cUcRcyH/mjbkUiV7VO1/STrHFVak/MnZfm4E9vis
 6sIgwM+0VHk3DJJ07uD3Buuvboy1u5dlcyD/w8YP0/Vw0MIg/3AsAoL9f/R9pqm7U6/7
 EA4tVAoCT2S/cnLqlx42GHIwTKLN9HpX7rIkntoTy4jy1HUkGfrIxVCCVSEGOnYnuMox
 3cvw==
X-Gm-Message-State: AOAM531qw27X9ZTe5zWVgGcW57oRaPgk312jBPP8o+PTE4GRYlUwyDZC
 GfUlHlQFg7qC7tj/y45jvSg=
X-Google-Smtp-Source: ABdhPJwcMuF/i5dfyY6n9V+H6t9XfrLdv1W24U8TH6lNcLfnngdykUQgOIkydPBGaI8xlQvzBEDnog==
X-Received: by 2002:a05:6000:1689:b0:204:19f5:541f with SMTP id
 y9-20020a056000168900b0020419f5541fmr2380469wrd.704.1647871140887; 
 Mon, 21 Mar 2022 06:59:00 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting the
 fence
Date: Mon, 21 Mar 2022 14:58:37 +0100
Message-Id: <20220321135856.1331-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Gal Pressman <galpress@amazon.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Maor Gottlieb <maorg@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_resv_wait() instead of extracting the exclusive fence and
waiting on it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Maor Gottlieb <maorg@nvidia.com>
Cc: Gal Pressman <galpress@amazon.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/infiniband/core/umem_dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f0760741f281..d32cd7538835 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
 	struct scatterlist *sg;
-	struct dma_fence *fence;
 	unsigned long start, end, cur = 0;
 	unsigned int nmap = 0;
 	int i;
@@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
-	if (fence)
-		return dma_fence_wait(fence, false);
-
-	return 0;
+	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
+				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
 
-- 
2.25.1

