Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB986F47FE
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 18:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C2010E098;
	Tue,  2 May 2023 16:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F410E098;
 Tue,  2 May 2023 16:09:56 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-24ded4b33d7so2066084a91.3; 
 Tue, 02 May 2023 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683043796; x=1685635796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ptDvwkDRf8ObhvSOwyQg6eM98sWTyAdcBLxunDzT4/Q=;
 b=I6jeZ/ilRu61CJGPkewQd5ckji494RXSK4tjlfW3RUXCQ8fq2cPtxBUZ4IwVTiKp5u
 RcJe1BZ93BAbM5DeocsTP0z9dWVkl9adzMWVPRpP6nV75tiDGgx0hV3uDh+Qa+uIFP0n
 bujCL8XD94uXAfUoJztpdJpmQB62wgVAewun/uB/wvS7swiWMcerxg9zK9TTTcu1l11r
 ttYr7JDdhpY3BKEjFiikj2kLFkWliECUiWUliIG186N2p0bvp9dOwS01uL2R9sodve0U
 hL4CRQ60epCQfDo5saLCijjO5Tbw66zCc1E5I6itAYcqSOekRhB2+fSf5prqTGoxq4Qs
 d0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043796; x=1685635796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ptDvwkDRf8ObhvSOwyQg6eM98sWTyAdcBLxunDzT4/Q=;
 b=XgP0F/uC3D1F7B68/knOOM9ueYb98BBq7rqlojWenEMUWq7zQtmhEE3jUb9pA/sE9y
 4Wylrc0Y4zK/oBjzBfg0lbYQkN7/amLHKLyZvSY5pbpN6m3OCAZNi7mfmUbWiUi+s3Tp
 4ZQdlSsGzpNfxw3t5sjobGj4HvL+EbL7fKi9ulLzApQucuY0baGSAE/ulu1qt4PZM8UA
 mKpUh7XIMhJWG/YfbXNl48FBL4VBCQ0MThNRv87p30KrzCESZam5F/dlhuH5YLh3yue4
 w5QRsQ7RvMKyNv/4JEA/VH5/0wTeOKJCILdk+OZ1uiUV8m1qJ8n9KGCsY9vrerWk29lv
 cLQg==
X-Gm-Message-State: AC+VfDzKl0UEWcPK9CFKMBD8vOJqcMkDtq13oYduKNDqOxNZXUmAnCeM
 eduj1RailLu2H8PyBd8Qib3/R2VTjsI=
X-Google-Smtp-Source: ACHHUZ7/SR/EIzNLSBaIwWXnGdWH+wPk46JqjklNVRkl5EW8iNrCmxqTVwJA1Knq91jeiLVCwsg4Bg==
X-Received: by 2002:a17:90a:3906:b0:24e:12f4:b74f with SMTP id
 y6-20020a17090a390600b0024e12f4b74fmr5249153pjb.20.1683043795714; 
 Tue, 02 May 2023 09:09:55 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 9-20020a17090a0f0900b0024c1f1cdf98sm8120109pjy.13.2023.05.02.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:09:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
Date: Tue,  2 May 2023 09:09:47 -0700
Message-Id: <20230502160950.1758826-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When the special handling of qcom,adreno-smmu was moved into
qcom_smmu_create(), it was overlooked that we didn't have all the
required entries in qcom_smmu_impl_of_match.  So we stopped getting
adreno_smmu_priv on sc7180, breaking per-process pgtables.

Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d1b296b95c86..88c89424485b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -512,20 +512,25 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6350-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
+	/*
+	 * Should come after the qcom,smmu-500 fallback so smmu-500 variants of
+	 * adreno-smmu get qcom_adreno_smmu_500_impl:
+	 */
+	{ .compatible = "qcom,adreno-smmu", .data = &qcom_smmu_v2_data },
 	{ }
 };
 
 #ifdef CONFIG_ACPI
 static struct acpi_platform_list qcom_acpi_platlist[] = {
 	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
 	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
 	{ }
 };
 #endif
-- 
2.39.2

