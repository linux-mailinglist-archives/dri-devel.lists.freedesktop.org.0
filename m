Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43425EA31
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FE66E2CD;
	Sat,  5 Sep 2020 20:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC56E267;
 Sat,  5 Sep 2020 20:05:07 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q3so2664493pls.11;
 Sat, 05 Sep 2020 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvFdTPchcbyWEX++eP+RtKIp66/AsHgH2aEoABwhrPw=;
 b=Owm67BOye7cLn9/FM8RhXNLMKAdbSblV5WEyMv7bJR8n9ma1DGn8BAfSLnoMQDMxMt
 EPDu/uwUkDOVTGgmEoieRU+cWIYSRwpP6G179J2U3AyXFcG4RCTV7Omxd2wkMnw2R+v+
 fRwVl1GJL4pcAu5p6rbMdMtSy5hWFVfpMXB3Fi5mveMK8gC97pkmbrGKY/DZmIW3QNIx
 g445ia8irLz4OwfA70RY95WQn+fFk8xzYycE4n89onbedeNxEeQr88b+I+Cj/mOsx3yg
 hpA3R3zMSS120XHism4saTnqpyqyPLWgVOM3h/VOWflTvyH5NhYGduGtkTNrC9FD701Z
 gevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvFdTPchcbyWEX++eP+RtKIp66/AsHgH2aEoABwhrPw=;
 b=cQYMXirjVnISpwrk4EImuYjkxcmvZlq2mLB0kzzoJ4Qg8cl50dPWIIatu4BWRGSITx
 LND3AHLitdB/9XAq0UQQzXa13YWts7vcMVeKqSReudAXNziVZjLSoYTGU2U5gRRxO23L
 r2gNsp7/uT9jsJds3gKC9tYoSinU9wpYKujl/MYgagpTynCtjdgLwSUQbhytQfCrXc4k
 fk7Fo+KypMyFWDLP9loadkRKxYlZFCtrD/2A44FZgn57hafZIUoruxYF7wdRvbwatdqu
 qo1boXDLvX1VP8Hh1ql7X6XU0mCaVMPs5r+jJW7shrXvpc4c2SfkEMzxVLTPRTyNMJHZ
 PWmA==
X-Gm-Message-State: AOAM532zZD5ii/U3P8DdBsAkr7tt4g8np8bBtlH1IJVW2D1GBsZSc7Wg
 riHN/WKv6UG7eM+CHhU/jG0=
X-Google-Smtp-Source: ABdhPJxcnTtjrFZorqcAMTBoFnU7uOJs0ZXz5XW2NjfoAJXt07Zkspj2KF6vavtuzciDC2NujMM/Qw==
X-Received: by 2002:a17:90a:8402:: with SMTP id
 j2mr13744447pjn.153.1599336307437; 
 Sat, 05 Sep 2020 13:05:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 70sm10615253pfu.107.2020.09.05.13.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:05:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 17/20] iommu/arm-smmu: Add a way for implementations to
 influence SCTLR
Date: Sat,  5 Sep 2020 13:04:23 -0700
Message-Id: <20200905200454.240929-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
pending translations are not terminated on iova fault.  Otherwise
a terminated CP read could hang the GPU by returning invalid
command-stream data.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 1e942eed2dfc..0663d7d26908 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -129,6 +129,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
 		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+	smmu_domain->cfg.sctlr_set |= ARM_SMMU_SCTLR_HUPCF;
+
 	/*
 	 * Initialize private interface with GPU:
 	 */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index dad7fa86fbd4..1f06ab219819 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -617,6 +617,9 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= ARM_SMMU_SCTLR_E;
 
+	reg |= cfg->sctlr_set;
+	reg &= ~cfg->sctlr_clr;
+
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 6c5ff9999eae..ddf2ca4c923d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
 #define ARM_SMMU_SCTLR_E		BIT(4)
@@ -341,6 +342,8 @@ struct arm_smmu_cfg {
 		u16			asid;
 		u16			vmid;
 	};
+	u32				sctlr_set;    /* extra bits to set in SCTLR */
+	u32				sctlr_clr;    /* bits to mask in SCTLR */
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
