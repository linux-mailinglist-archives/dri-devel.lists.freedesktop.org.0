Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75995BF96
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 22:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318910E0DA;
	Thu, 22 Aug 2024 20:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cFFyeyuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD49010E0D2;
 Thu, 22 Aug 2024 20:34:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MACTBV029158;
 Thu, 22 Aug 2024 20:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BPxAlT+tRjlhmKxEHYvrHQUR
 U/2LRCMPb+ZpasSAVuI=; b=cFFyeyuT+pQda/3Q6XcHXMp4106+PzyPJQqGlJhz
 xBQ5qAAsCg3y/cwOWWi1Nlkb6k5FL/Yavho95OqD2WEy9dzKWQgORu5Gb9GbvwwL
 gCQ+DhoWW23YurVlzFU+WJ8qYxlp79BSS69PQL9xUDNblrWI5cP1o6RU2eC9dBQ4
 h4ZBdfz2JDYKJp/hzpnkyf/Z/z1lAwWbnK5Gz8Bd1tT28pZyjxth5ZL0P9o6go7i
 TkcOo5T1SmEFvlD13Rpl9qYI+HFOeb8jipnBts4HKzdzbZvE31dct1F31IR5zorq
 xABvFkcGTS4rGltOtJXL5xohiZTiKjRDlRu/g7WDaef6Xg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4159ade7ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 20:34:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MKY9Og022939
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 20:34:09 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 13:34:05 -0700
Date: Fri, 23 Aug 2024 02:04:01 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Mostafa Saleh <smostafa@google.com>,
 "Will Deacon" <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER
 for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
Message-ID: <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820171652.145673-5-robdclark@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RA3gRm1gs5mXuRX2CYjzVSUtV0AEWAf_
X-Proofpoint-ORIG-GUID: RA3gRm1gs5mXuRX2CYjzVSUtV0AEWAf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_14,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=844
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220152
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 10:16:47AM -0700, Rob Clark wrote: > From: Rob Clark <robdclark@chromium.org>
> 
> In the case of iova fault triggered devcore dumps, include additional
> debug information based on what we think is the current page tables,
> including the TTBR0 value (which should match what we have in
> adreno_smmu_fault_info unless things have gone horribly wrong), and
> the pagetable entries traversed in the process of resolving the
> faulting iova.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
>  5 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c6626747b98..3848b5a64351 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
>  		drm_printf(p, "  - type=%s\n", info->type);
>  		drm_printf(p, "  - source=%s\n", info->block);
> +
> +		/* Information extracted from what we think are the current
> +		 * pgtables.  Hopefully the TTBR0 matches what we've extracted
> +		 * from the SMMU registers in smmu_info!
> +		 */
> +		drm_puts(p, "pgtable-fault-info:\n");
> +		drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_ttbr0);

"0x" prefix? Otherwise, it is a bit confusing when the below one is
decimal.

> +		drm_printf(p, "  - asid: %d\n", info->asid);
> +		drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
> +			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);

Does crashdec decodes this?

-Akhil.

>  	}
>  
>  	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 3666b42b4ecd..bf2f8b2a7ccc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  	if (submit) {
>  		int i;
>  
> +		if (state->fault_info.ttbr0) {
> +			struct msm_gpu_fault_info *info = &state->fault_info;
> +			struct msm_mmu *mmu = submit->aspace->mmu;
> +
> +			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
> +						   &info->asid);
> +			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
> +		}
> +
>  		state->bos = kcalloc(submit->nr_bos,
>  			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 1f02bb9956be..82e838ba8c80 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
>  	int flags;
>  	const char *type;
>  	const char *block;
> +
> +	/* Information about what we think/expect is the current SMMU state,
> +	 * for example expected_ttbr0 should match smmu_info.ttbr0 which
> +	 * was read back from SMMU registers.
> +	 */
> +	phys_addr_t pgtbl_ttbr0;
> +	u64 ptes[4];
> +	int asid;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 2a94e82316f9..3e692818ba1f 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
>  	return &iommu->domain->geometry;
>  }
>  
> +int
> +msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4])
> +{
> +	struct msm_iommu_pagetable *pagetable;
> +	struct arm_lpae_io_pgtable_walk_data wd = {};
> +
> +	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> +		return -EINVAL;
> +
> +	pagetable = to_pagetable(mmu);
> +
> +	if (!pagetable->pgtbl_ops->pgtable_walk)
> +		return -EINVAL;
> +
> +	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
> +
> +	for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
> +		ptes[i] = wd.ptes[i];
> +
> +	return 0;
> +}
> +
>  static const struct msm_mmu_funcs pagetable_funcs = {
>  		.map = msm_iommu_pagetable_map,
>  		.unmap = msm_iommu_pagetable_unmap,
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 88af4f490881..96e509bd96a6 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
>  
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> -		int *asid);
> +			       int *asid);
> +int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4]);
>  struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
>  
>  #endif /* __MSM_MMU_H__ */
> -- 
> 2.46.0
> 
