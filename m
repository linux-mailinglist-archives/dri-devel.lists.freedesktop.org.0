Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4F275BBD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D646E928;
	Wed, 23 Sep 2020 15:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC5C86E928;
 Wed, 23 Sep 2020 15:24:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75450113E;
 Wed, 23 Sep 2020 08:24:57 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 739473F718;
 Wed, 23 Sep 2020 08:24:55 -0700 (PDT)
Subject: Re: [PATCHv5 5/6] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
Date: Wed, 23 Sep 2020 16:24:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-GB
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 iommu@lists.linux-foundation.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-22 07:18, Sai Prakash Ranjan wrote:
> Use table and of_match_node() to match qcom implementation
> instead of multiple of_device_compatible() calls for each
> QCOM SMMU implementation.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index d199b4bff15d..ce78295cfa78 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -9,6 +9,13 @@
>   
>   #include "arm-smmu.h"
>   
> +static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> +	{ .compatible = "qcom,sc7180-smmu-500" },
> +	{ .compatible = "qcom,sdm845-smmu-500" },
> +	{ .compatible = "qcom,sm8150-smmu-500" },
> +	{ .compatible = "qcom,sm8250-smmu-500" },
> +	{ }
> +};

Can you push the table itself into arm-smmu-qcom? That way you'll be 
free to add new SoCs willy-nilly without any possibility of conflicting 
with anything else.

Bonus points if you can fold in the Adreno variant and keep everything 
together ;)

Robin.

>   static int arm_smmu_gr0_ns(int offset)
>   {
> @@ -217,10 +224,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
>   		return nvidia_smmu_impl_init(smmu);
>   
> -	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
> +	if (of_match_node(qcom_smmu_impl_of_match, np))
>   		return qcom_smmu_impl_init(smmu);
>   
>   	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
