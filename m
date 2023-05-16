Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F6705A84
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EED10E37C;
	Tue, 16 May 2023 22:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B405A10E06D;
 Tue, 16 May 2023 22:20:46 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-530638a60e1so7192933a12.2; 
 Tue, 16 May 2023 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684275645; x=1686867645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=g/foAuQVywceUd2vkSxoKCros6/PiFyEdDf5xt0p72vPNe9I4bSzLoL/vquN64+kAD
 PIkh7655q/gv4B8jOrPmVQlN/bsS1vdzytkxuf48LAxUxusGEFxr+xwaYdlOxwY72/yU
 Szl7+Z0lsWtCdv9nKJsAYYHnM9MBsgspJF/D+8jB3XYolmMJScMNxoukf/IPm4rfIz/K
 guK7/lKMtpkPlutb6AkiP6MbGLEzrr4gPv1zLv0Nd3h6uk+q8kV2nKJ3BT0uz2IWaeds
 K24z8j6WONz7FwK7TnPP4CIWOUnaWp1+dNOjYb1VCYrdz6QFl7FFkq6ULV9TImhSprkV
 75xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684275645; x=1686867645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=P1ETcNpUPEJQqDkAeGbxncoZ3d3cSbiyAFZtE8hT3udmGm0wDdetEZG8544VxdeXSP
 2x+JzU0Hoqjk7Jd5qp5nAoEg9apwMd4QbAY2CgIztPQ63bIciRgLK1JTrDxXCoCUG6w0
 7T1ewqMppt0/U3b4rcl8ObIrQBTsNWCL4YmiiJjhYOjNo0bE+0zMJLXRsC9gn+Y1Hmw9
 k7UtGtDWLTuy25pPEtavWogEFBjOG8zcpEHQu07WNWy6WJHB6QYngNBIxFQhW+7Um7Vn
 hOnjXTsoDH1amw+m+Vqyp/XOAz3SwXltrsN4z4M3+K/SN0TBJuDhFIqNc/8Kw6VHi1hQ
 kcNQ==
X-Gm-Message-State: AC+VfDwze8t7rvPbLMwcISgkOUWQG94Lmniv0l76l1EoPILkNBHe5iyK
 KGznXcbdgSRPn27V3bzBbjreh5+d7to=
X-Google-Smtp-Source: ACHHUZ56Oy1tbNsnATMkInzMat6wSqCNeaSNNYU8KTeCB983x8CWAKSUxkzxAs2XGLpr4nqa/v4LaA==
X-Received: by 2002:a17:902:d491:b0:1ad:faf7:5c93 with SMTP id
 c17-20020a170902d49100b001adfaf75c93mr13955599plg.5.1684275645520; 
 Tue, 16 May 2023 15:20:45 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b001ac741dfd29sm16001971plf.295.2023.05.16.15.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 15:20:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v4 2/2] drm/msm: Be more shouty if per-process pgtables aren't
 working
Date: Tue, 16 May 2023 15:20:37 -0700
Message-Id: <20230516222039.907690-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516222039.907690-1-robdclark@gmail.com>
References: <20230516222039.907690-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
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

