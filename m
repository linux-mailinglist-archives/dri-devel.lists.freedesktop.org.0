Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC074B2642
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CC510EBCA;
	Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E51610EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y22so10769742eju.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
 b=oauqku5IdpBm58qIim7aQuJ2BgR0oiXNUVRBx2uRK3AkU43BHx4uLKvIOuA/NV6kH5
 +zN8zjC9CMOr6GdrjGFU5O0AAQe/ORJ/Bf0zVnYrDEV1fTR9JCbkcz2fIqAv+07DqUdj
 pzrnSJjQyKK0ubmiukqPSX+xpcETQgwW2BNshch8HVYIE4JZfcyORxf5oIMo34+ywNnm
 jUq2nPv4WF5aTGLMtKnHIItrr6BcVHzDrAphM7FpabDPcMWXTcUfJOV0rC2/ssZ0olsu
 CgoF5HCxJJ4PhetnpkFvXs91thDDEkGkhbcO6Eg60IuAl8TVr402RH9O1oVgL2ezbEYY
 jCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
 b=cd6G64WDbQcza91g53OwVjQCV5dy/iiQ3kMp6jpgSpd7WvtCcQ98Lh600xGYwRTJ9b
 K5WLBYy4frD5f2/zcnC13UP3dLCikkdPRORMyuJ93NSMm6pQ8SfXpnLi1iwp9Ho6PnvY
 mN8oxOwRF1AclJllsptQp4pk30DRuv5vA/ZSInWR0OQuKVG2nF532UPcRXafSRYI36EJ
 sxhWigJFf33D2kHcol6D46b6fZSWdtVgTgzq7S0oFZem+RkrXw2GVPILlsz+JWKuW3po
 wvWsvtNPP9GE9koDciIlGJT1CNvYNYHDuyS3H5wk8HF5Oc6mWcAak42wNQ6fvkOgbsxz
 LIOw==
X-Gm-Message-State: AOAM532XNyABdxjvflBuNLhAtYC1fj8w8UjIB4sljsGUl8kMr1lsvkLR
 WMLl+9Jk+YfL8X/v8Kr+hz4=
X-Google-Smtp-Source: ABdhPJxzLcM38PwBEuuKRgjrM2xM6VqP4aLqGyIkzANt6eYO9mvt8osJ9I2eYyXlzDdUOB09h112MQ==
X-Received: by 2002:a17:906:6495:: with SMTP id
 e21mr1247086ejm.117.1644583810779; 
 Fri, 11 Feb 2022 04:50:10 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting the
 fence
Date: Fri, 11 Feb 2022 13:49:44 +0100
Message-Id: <20220211125003.918447-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

