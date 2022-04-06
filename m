Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DA4F56EF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3704810F39F;
	Wed,  6 Apr 2022 07:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFD010F2DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r10so1625857eda.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=QkYCMDaex9iMc3I5U2HPtKDq5CCEZTZiyTPn1+1QH4Y=;
 b=MzprqERIC3apf11ECRVowfPv0BsgQDCdIs1e6unRz1VV0l5K4Uf9qdfLBmWXz7LaSh
 20aRH4DXnOfQiRz05YbqNlUIO+0//VXR+wmlkF+23bvb07EJTdbwJfRhNG9gBZlgr9nP
 5qiuTqpdwoZywxP0AoxthkCPVDB08AIoF2SHP1i3mL0eY5J/8AQNUu2QtW1XxOlSqR6G
 kuHdVnfJ27Uc9kB0XSgsyXFsAjYyXEZTtwIMqCG3dr4XaDO9Nmfp/pCGM0FjQbcLazqY
 rZtt1MxeeIEUgibJvMB0QJpKZQq2TgNLiUZ9RqP/S/IzYBxxiuOuM2wyK4wtLvq8AGml
 4f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=QkYCMDaex9iMc3I5U2HPtKDq5CCEZTZiyTPn1+1QH4Y=;
 b=MWF79WRRYi5D9OT3tAC6VoVtPO9LlsKfKxlaNUvf51wJDjmIMtIF4Q0uNiDWZNPjQ8
 4LT4vbKLY+RRR7yrwXPSaZVRARZ0FrpcwmGrBVPElENwwhs3SHCi2eDwn7X4PXCcEnRb
 /atqIOsRZLBE4aRY1qCaYvI1UZuv0k1B7zVwZ27e5weCGm4B1x060JkrvSKnNanzAOHl
 1Dd7wIrd1H0k6IimYCYJAaBcpLAkdAL3m4dr84+EvWePqGYqt2ZEwt7DGhlAUOW+CJpw
 5jhS2fPpmwri6Hgj7g9NCo3zdanMbiMrm4METwU/LSFTD8XpZ0r6vuCerAoC2IWPkrpp
 mMoQ==
X-Gm-Message-State: AOAM533a2sUFB0kFw6jx2/+KC1k+1FuVAaKuoxo+8mmGmSJF9IBV2Qo+
 jLMBIAwAgyKL6aQb1QMXDWU=
X-Google-Smtp-Source: ABdhPJwkwN/SAfq68rl1H7bzvD2cNxUTlYCM3TKxtzR6Gr+56IYAZMd8VjlGLNWhQh47NYxHx0zN4Q==
X-Received: by 2002:a05:6402:5243:b0:419:52a1:a743 with SMTP id
 t3-20020a056402524300b0041952a1a743mr7508972edd.269.1649231510949; 
 Wed, 06 Apr 2022 00:51:50 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/16] RDMA: use DMA_RESV_USAGE_KERNEL
Date: Wed,  6 Apr 2022 09:51:26 +0200
Message-Id: <20220406075132.3263-11-christian.koenig@amd.com>
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

We only need to wait for kernel submissions here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/infiniband/core/umem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f9901d273b8e..fce80a4a5147 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -68,7 +68,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * the migration.
 	 */
 	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
-				     DMA_RESV_USAGE_WRITE,
+				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
-- 
2.25.1

