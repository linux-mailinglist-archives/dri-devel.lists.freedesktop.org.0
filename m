Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFCA6F4800
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 18:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D3410E2E5;
	Tue,  2 May 2023 16:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2910E2B5;
 Tue,  2 May 2023 16:09:58 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5144043d9d1so2768706a12.3; 
 Tue, 02 May 2023 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683043797; x=1685635797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Jhmn/igXsSQ1CgSsPa7t8gOoGNkMRgv5IZ8g6dlT48=;
 b=pJzuaACIWttjwELslkpHg1tCXmshS+yvKzlM2sclBeAZBqaktTCJdD8yhUTXg6i86o
 kkwivrOJHKBy0LnooQV+X+6wciXVy1C8bgD6obbCrIovO4o7JCJyWvxNBWuuNZQdyXMh
 ghBFTeWdu9LakvzS/7diA7EcEe5Y3IGFSGBdFG6gVFR36kYEii+W1Ln4aQrRVDL2vY6H
 ateJACxLjPKew3Jlx77UBG5H8o/1WKbDKyW1ehws+4PP0j+NpmwJuhW9aOMcN+rRUeYY
 RxY/MSmjaciiP9i16n2WmasfMoM65dS36Y6GCusdODbbUoFwHQFWd8EseLIOad7WuW8R
 O72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043797; x=1685635797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Jhmn/igXsSQ1CgSsPa7t8gOoGNkMRgv5IZ8g6dlT48=;
 b=EGNtkvVFQQ1h8LdlPkqQ8obh9/HXA/UstOuYixAFsJi9pTkKQumZbZ4zOCm9wjE+s0
 PC+jklAQqRS5Y9jiOeTivrd+jIsv02E+3bZiADUiz/V2kPt1gnXQracjCA7q7tksceTP
 nXxlqrG4cH8qwH1rwwo2iEQ8BW9YNzCml3BCs9riVNXD7RWZpkVgPvT8JqQkP2krXoqk
 XS+ISBBWQSV5tluYmtcUFFmQWqxfWjA3eYNGjmqVoPoL2+biZsECK750tffoBq72jLM6
 J1Q/c4eFaDX8v8JXplYZk7VXUF16XqGCrUPowhlMVVtnd38xr4DvEh3MsRzrD9UI+evl
 gZ5Q==
X-Gm-Message-State: AC+VfDwX0RwBDBlP4f++mMDxN3Vc/+pLDdpVKwrLvPEGs9m+0pyY1qro
 dyFs4QgUTnVzdktollB+xzY5pw7k2XI=
X-Google-Smtp-Source: ACHHUZ4S2jGKgufIL9tpXhjYzZqUINYF6azJ3+MOLssaF0FK1bp3oJJJR7P9lf0iUWJblNhY54sFLw==
X-Received: by 2002:a05:6a20:d69a:b0:ee:2bc1:6e01 with SMTP id
 it26-20020a056a20d69a00b000ee2bc16e01mr18312922pzb.24.1683043797412; 
 Tue, 02 May 2023 09:09:57 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u29-20020a056a00099d00b0063d2bb0d107sm22055505pfg.64.2023.05.02.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:09:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] drm/msm: Be more shouty if per-process pgtables aren't
 working
Date: Tue,  2 May 2023 09:09:48 -0700
Message-Id: <20230502160950.1758826-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502160950.1758826-1-robdclark@gmail.com>
References: <20230502160950.1758826-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 418e1e06cdde..1b7792d35860 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -224,24 +224,25 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
 	struct msm_iommu_pagetable *pagetable;
 	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
 	struct io_pgtable_cfg ttbr0_cfg;
 	int ret;
 
+
 	/* Get the pagetable configuration from the domain */
 	if (adreno_smmu->cookie)
 		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
-	if (!ttbr1_cfg)
+	if (WARN_ON_ONCE(!ttbr1_cfg))
 		return ERR_PTR(-ENODEV);
 
 	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
 	if (!pagetable)
 		return ERR_PTR(-ENOMEM);
 
 	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
 		MSM_MMU_IOMMU_PAGETABLE);
 
 	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
-- 
2.39.2

