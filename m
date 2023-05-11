Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D96FF550
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA7B10E4F9;
	Thu, 11 May 2023 14:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519110E4F9;
 Thu, 11 May 2023 14:59:15 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-24dfc3c662eso5994016a91.3; 
 Thu, 11 May 2023 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817155; x=1686409155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=XAwtDDfL4AebuXak7bNPPI87nvTlXoYVEeNLYlT0BUwe4sk+v7jj2fSMAaMAVEkLac
 ASTV+Qd+a+iHRSsrr45q79TD3dqZjxXhxlxvWMDbkTRuogCV00CMQWXjxNJczItOgTLg
 yIXphxYtHPyqzJRpdLXhyd5kbt7fPsdqfPUEjC07crjg5JAzPfBYhLSaXouULyYUbUSb
 yAMWFEkA+uKWjPKiyonpbvNWr5WZeGFVeMqxrMvKzKfS2KZtz78sVhZ1nO2EDLxnlvnb
 5K6F6qy+H8TL5DZ0JLMmh9pfcfZ/e0whO3kjLiwSmpyWIyju/Pm3UibZf+n+1Ksn+Lci
 AmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817155; x=1686409155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=eMYLWFicD34DV4Z5w2+uSyRvp0kQu+HSfkwEXCt3KnNMfQz9jM7fj8plOq3SP5YItJ
 kY9OPnF5JkxMt0iarMmIdC+xj1Wl2TK8cXc88b9Eon+eMvLMkQl/hybLpj0oApqmyTWE
 OzRGknZIBEm9MN4a8C+RiDvsfBw8R6zEHt/ftlmATkmCrCSJQiBMd7XVbIYlWXNtuO4y
 f9ffyPf8ncSR520lXDtAmx62GnZFdcbvPIRbFuMVGiv/dADj0Y7CtPNsdb0MIntjBH5f
 PwTO8xKcT9G8ANJSpXzeasRcH+HsnbtPOXtE8iRYrV86KVqCgazzcq+6yO4HeSg130ew
 gQ+Q==
X-Gm-Message-State: AC+VfDxWVfFMRfEhXATezVal3x00azUzu5C7eb8DggXc4XPKzcwPCKc7
 foYdxMUB7B4wYHBKqrrXMD551n9zVB8=
X-Google-Smtp-Source: ACHHUZ5R5SEh6hgEPBhrxyDoUJPaDfMiz4Rtx25aiaUxPLerkMMf/9r2TREIx7jtkfBBQqUHdw7JYQ==
X-Received: by 2002:a17:90b:1992:b0:24e:55c3:89af with SMTP id
 mv18-20020a17090b199200b0024e55c389afmr21638386pjb.18.1683817154440; 
 Thu, 11 May 2023 07:59:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a17090acb8100b0024e2980574asm15558660pju.4.2023.05.11.07.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:59:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v3 2/2] drm/msm: Be more shouty if per-process pgtables aren't
 working
Date: Thu, 11 May 2023 07:59:06 -0700
Message-Id: <20230511145908.597683-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511145908.597683-1-robdclark@gmail.com>
References: <20230511145908.597683-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Otherwise it is not always obvious if a dt or iommu change is causing us
to fall back to global pgtable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 418e1e06cdde..9b19124c9bd0 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -227,21 +227,26 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
 	struct msm_iommu_pagetable *pagetable;
 	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
 	struct io_pgtable_cfg ttbr0_cfg;
 	int ret;
 
 	/* Get the pagetable configuration from the domain */
 	if (adreno_smmu->cookie)
 		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
-	if (!ttbr1_cfg)
+
+	/*
+	 * If you hit this WARN_ONCE() you are probably missing an entry in
+	 * qcom_smmu_impl_of_match[] in arm-smmu-qcom.c
+	 */
+	if (WARN_ONCE(!ttbr1_cfg, "No per-process page tables"))
 		return ERR_PTR(-ENODEV);
 
 	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
 	if (!pagetable)
 		return ERR_PTR(-ENOMEM);
 
 	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
 		MSM_MMU_IOMMU_PAGETABLE);
 
 	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
-- 
2.40.1

