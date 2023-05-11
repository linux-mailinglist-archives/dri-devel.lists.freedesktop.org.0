Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBBE6FF54E
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD4210E4FC;
	Thu, 11 May 2023 14:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF9F10E4F7;
 Thu, 11 May 2023 14:59:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64384274895so6219116b3a.2; 
 Thu, 11 May 2023 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817153; x=1686409153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxmpm6QJhLjfIu7rdhWCC28olrB5FLthXZJk0Cftfj8=;
 b=EKUXk1wUCFkUgZ4mO/Dxzdegw+zmKOoNYNpA058P6CE1+TGsguw8yR9Wq+esTyeRVl
 JX+/2Og+Kk+6LHAjVUHWV39vnZ4IybuU/wPKCy6YNuqicFZOugXBuLICBVmu4Rka84ru
 d27IjH+XFL2I7Ftfp+etgrKbpZkEwv9kubh+Cln8JQOozf+hOp1G99QaByl0FFmqdSgM
 oIibYbWtBvMVPJ6tn+Pg7SiNDlMbVb+cTKr5qI5BJ4cn0sbRwmDZPR1CemoSwK78ucLs
 GDOAoPTRDaSmkSLz+QcU/ppv0tcWv0y5q83o/xv9NZcngyMpcunQtu48At56mSFnWVOa
 cgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817153; x=1686409153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxmpm6QJhLjfIu7rdhWCC28olrB5FLthXZJk0Cftfj8=;
 b=bXstsz1GmhN/JzEj2JRI9Y94HG1lWN4pVOuk5tFN/yxGxH8PdNozxf2ZvlMQWfzDcZ
 BX7qUUzTEj+gnUEW1Xma4GGnh+uPT0cw5o9Wxju86+2xSg7e6USiRJeeOISxSvD7gqst
 +dNDWfpcULpSNIIw+D73ZCs9TjwfPi9sy0UUOmpIR2jPqSOubzZNE7U5zat3XhBLUKpH
 SWVWQF0KRKXZI4BUlmhoZsEZ7O2+3JSX7DUCa3zlnmx6g0Ow15MiWsMkr5qedfh+5itO
 sMMBcLsFYIeoxLPfd3gF1J7PgY3O/ajujHks0PACTWG4ADmCAvqwz/MdjDS+Fgz4wxT8
 buvA==
X-Gm-Message-State: AC+VfDy2qD3p88wgFemo4RMI4lPTjO+xbTQZ2MpttkvibG9aoJSgpEHr
 4fKFT3ihRRFtV6tx0FdC+FHukYbOKVA=
X-Google-Smtp-Source: ACHHUZ4UChDZreBdWe7eD7dyF2UmkYB9pYAOAMp4I4A3/HPsdFfgnvoASPCeFX9RddExMgANHVAwlw==
X-Received: by 2002:a05:6a00:2401:b0:63b:5501:6795 with SMTP id
 z1-20020a056a00240100b0063b55016795mr27904487pfh.24.1683817152786; 
 Thu, 11 May 2023 07:59:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 i8-20020aa79088000000b006430cb02bd5sm5390140pfa.168.2023.05.11.07.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:59:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v3 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
Date: Thu, 11 May 2023 07:59:05 -0700
Message-Id: <20230511145908.597683-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Rob Clark <robdclark@chromium.org>, Lepton Wu <lepton@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Adam Skladowski <a39.skl@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Elliot Berman <quic_eberman@quicinc.com>,
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
Suggested-by: Lepton Wu <lepton@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d1b296b95c86..66e191773099 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -496,20 +496,21 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 /*
  * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
  * special handling and can not be covered by the qcom,smmu-500 entry.
  */
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc7180-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6350-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
@@ -540,12 +541,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 		/* Match platform for ACPI boot */
 		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
 			return qcom_smmu_create(smmu, &qcom_smmu_500_impl0_data);
 	}
 #endif
 
 	match = of_match_node(qcom_smmu_impl_of_match, np);
 	if (match)
 		return qcom_smmu_create(smmu, match->data);
 
+	/* If you hit this WARN_ON() you are missing an entry in the
+	 * qcom_smmu_impl_of_match[] table, and GPU per-process page-
+	 * tables will be broken.
+	 */
+	WARN_ON(of_device_is_compatible(np, "qcom,adreno-smmu"));
+
 	return smmu;
 }
-- 
2.40.1

