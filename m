Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8816FF4FD
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699E10E4F0;
	Thu, 11 May 2023 14:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0E10E4F0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 14:51:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9661a1ff1e9so982620166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683816715; x=1686408715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0sCDEYQ+lAwwMEzBoHzHhTtsRYd3XM3A3Tyzt01HFvA=;
 b=mtPBUKQsWIlBp4e49W2yOkynlqDVHyfPbTN2fmMgQkVydDzOWHguXHqbQVzF+v+AAy
 9QG9Bap4DMMbaZTgBgScyK7fzfUv7oi1UazTId8pZ0kF72X6C1Bk0ZRpA/sCRpPSM6c7
 LlDEOs7ZHM4zxnAbSZk556uDtQxp7ZqwAA+8tw0DMcaG7G0x7WhaQBwIIF65AkErvfYg
 Wv9iWoNkWV+w5QkB2iR983OxWYQgJP8KCarY1JD74jznB+tX4BNZhQeo0zvS+ztL+5Hg
 MO1ncCKr8zzLXW6DYTDER1r3r8CUP2eLigJMFOYonulsPfpmApeajTXJYEOaPVN15iwh
 PDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683816715; x=1686408715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0sCDEYQ+lAwwMEzBoHzHhTtsRYd3XM3A3Tyzt01HFvA=;
 b=PfyGSQHdzKQJpYq8jsl2R7vhiJn3T9vPN31nN6piwG6K+6irtt3rj0on1KRObiwJcW
 Zf66w+TMuoyUZnSbSNS5zmbUah9vI11NdkGJDs6LxbCMNLZERb7zHZfvgwPAggU/DmwI
 /rSUojrgBFXY1m97Z1vFZw3JuA7jZHhwCubKJMTACPsZIVRZiom4M8y1dnypq5LSfY6O
 udXQ9HuwIZvJPBD7KfAy7tLfLL+rS0KCS+p+Rf5vBAr94griEB6YaI0HBoCI5tgBuCJc
 Jrfl5b+lWFnAVr4jH/EZFx6017r9xaVqVAAd9VYBfGyiuGOJO2aM3TsJLA7W5u9WLlN3
 U6ew==
X-Gm-Message-State: AC+VfDyv/YdLaA80JTn7T+tjuWIK71ejMLvq8kYiXGRFwDdUkFyWxumO
 PLmmSKcEPDa5hHj/7gC0Et0+ZbmIlVBDG8bBSm29Mw==
X-Google-Smtp-Source: ACHHUZ5v+1zYrVOKi/Ghck/qxazn4S4a54LG3s/j3dKBOosBgCgbc+lcxrX3cV6IcluE1NS3v3DGkoZujZK00d/9fp0=
X-Received: by 2002:a17:907:d09:b0:961:8fcd:53ca with SMTP id
 gn9-20020a1709070d0900b009618fcd53camr21830645ejc.65.1683816715418; Thu, 11
 May 2023 07:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230509163712.376117-1-robdclark@gmail.com>
In-Reply-To: <20230509163712.376117-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 May 2023 17:51:43 +0300
Message-ID: <CAA8EJppVaCuh1kp7842pHt=5sWSBVaf18fZGC6ifmsQKgGNVSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
 Bjorn Andersson <quic_bjorande@quicinc.com>, Emma Anholt <emma@anholt.net>,
 Will Deacon <will@kernel.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux-foundation.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 May 2023 at 19:37, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> When the special handling of qcom,adreno-smmu was moved into
> qcom_smmu_create(), it was overlooked that we didn't have all the
> required entries in qcom_smmu_impl_of_match.  So we stopped getting
> adreno_smmu_priv on sc7180, breaking per-process pgtables.
>
> Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create")
> Suggested-by: Lepton Wu <lepton@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index d1b296b95c86..760d9c43dbd2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -496,20 +496,21 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
>   */
>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>         { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>         { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
>         { .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
>         { .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +       { .compatible = "qcom,sc7180-smmu-v2", .data = &qcom_smmu_v2_data },
>         { .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
>         { .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
>         { .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>         { .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
>         { .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sm6350-smmu-v2", .data = &qcom_smmu_v2_data },
>         { .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> @@ -540,12 +541,14 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>                 /* Match platform for ACPI boot */
>                 if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
>                         return qcom_smmu_create(smmu, &qcom_smmu_500_impl0_data);
>         }
>  #endif
>
>         match = of_match_node(qcom_smmu_impl_of_match, np);
>         if (match)
>                 return qcom_smmu_create(smmu, match->data);
>
> +       WARN_ON(of_device_is_compatible(np, "qcom,adreno-smmu"));

Could you please add a comment here, noting the reason? Or maybe we
should  change that to:
if (WARN_ON(...))
  return ERR_PTR(-EINVAL);

> +
>         return smmu;
>  }
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
