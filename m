Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E086FCB71
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AD310E279;
	Tue,  9 May 2023 16:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266B610E1B4;
 Tue,  9 May 2023 16:37:20 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so5701750a12.2; 
 Tue, 09 May 2023 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683650239; x=1686242239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=mZZAJf8CDVLdRsIa/eB31WvC02gURKhS4JsgGIM1FMEfS0TPzOSNr2ofLgpB/7d36u
 t+huw2YXaVGECPsBBtfOGhjyjvU670c59fAbXlO8Yz+yLMEUksGNyv+BRDQD8VIZFfkh
 mghLEYlEXXdGTtZG9Ss2M4RDBoz3VsqKzX4/E8mXGpRx7MCzH6pSJS/kmC3o3x8ob2+r
 FaoysUGQAZtMPp33CmjiOwLcYoRVcG/j5VesdRfj9iwmMnTVtHtTdQnXLroAzQ5BYpuw
 Dk4me3Nis+OCHDDn/PHz6ClQak2AclwSy1vmc119W+tNEFEBpb/qq08kUvh8KKxLAnzZ
 bRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650239; x=1686242239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osWWYYQseCvJCBZt1Q3stKtUhhbUrnP9MQ0pNGBM3gY=;
 b=HBlerQq2UVdJY1u8xDzd7QRw5OYzi3/B4sdiCwliybJABxQON7a/kz6obyKp/gwdF2
 hAkepP4gGsWsADH/88j1jLLdVsBE0hRdHGYsSOzOOoUuSuD6Z7aPd4iPKPJA/n9RVcX+
 xxYh8+oYLKXJeCyeaAe0GDX4lY4FUzRozqLtNdq3dGAqJoCso30CtbBydiEauQDBaMdr
 EDFIrrMF7MBy8pBiSLke60GJnFn0CJzdU+HLdApZwcDV5duF3u+8yRscrDiagtPbjhf5
 ePDwtb7cpAqL5mUuPKaWBTJffCNS9wenSvrBuz7XcRpgn4jWIENjKtaaniH2NBABE+lO
 67Nw==
X-Gm-Message-State: AC+VfDzeuefjdKKpPLw6qgu61gvNbyETqNHo5eRmn0Par351PiNP8B/C
 IQPg6dD8W/SHLbYq73L3i6vZRqqPoWY=
X-Google-Smtp-Source: ACHHUZ5LYRtJdAdxjy+ccn4spz1/vSAxQC2cahvFcQb+ES2TNjUqZm2oJKcFVWN0/5kCALhertuX3Q==
X-Received: by 2002:a17:902:b110:b0:1aa:f6ed:973d with SMTP id
 q16-20020a170902b11000b001aaf6ed973dmr12646582plr.55.1683650239053; 
 Tue, 09 May 2023 09:37:19 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001a217a7a11csm1812272pls.131.2023.05.09.09.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:37:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] drm/msm: Be more shouty if per-process pgtables aren't
 working
Date: Tue,  9 May 2023 09:37:11 -0700
Message-Id: <20230509163712.376117-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509163712.376117-1-robdclark@gmail.com>
References: <20230509163712.376117-1-robdclark@gmail.com>
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

