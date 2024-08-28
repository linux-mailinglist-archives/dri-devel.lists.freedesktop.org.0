Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F92963303
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360DD10E5E2;
	Wed, 28 Aug 2024 20:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YWnETyzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF6010E5E2;
 Wed, 28 Aug 2024 20:54:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMH9T019451;
 Wed, 28 Aug 2024 20:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +P5WYitcoq3XvPB7O8epxydnV7BcDeTbxoMdSCYchEs=; b=YWnETyzHMaRXYNk6
 viormWOWROXgJ/jJ27nResZdCS0WZTCIM+lPRxOcMmHv7qBsxGPK+xyglBVtsXO8
 Zf9uGPOfDO5bLT1PDY2YQIQv0Why1eriiPDEVQWSqa5fzYwG2taHOZnzAF69xmBw
 NMIVirGBPy8cwkKT3FatwgUhuZ68KMRhT8IunZgQ2LjVduE4GOZZXc/rXfIaoq/J
 QM5m5/AjX3Q9mt3NdWwCbaCMrfxsKuPj9f7NKU/hOQAk8DoOQXW3QtE9sZmUqj0e
 YD6Fpiohp6pDHmuvq2VpcDskVYO1tQp4p6JCGkrJVON6Q5xQYGMZBy0hy9/irmhF
 /+YeBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putk3kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 20:54:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKs3S7007863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 20:54:03 GMT
Received: from [10.71.111.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 13:54:02 -0700
Message-ID: <96c8d16c-071b-4462-bd10-2791404fdb1a@quicinc.com>
Date: Wed, 28 Aug 2024 13:54:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: add support for virtual planes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-10-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-10-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4_FjgocgzoPiH6KLXDXbzNyJm91b13O_
X-Proofpoint-ORIG-GUID: 4_FjgocgzoPiH6KLXDXbzNyJm91b13O_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280151
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



On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> Only several SSPP blocks support such features as YUV output or scaling,
> thus different DRM planes have different features.  Properly utilizing
> all planes requires the attention of the compositor, who should
> prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
> to end up in a situation when all featureful planes are already
> allocated for simple windows, leaving no spare plane for YUV playback.
> 
> To solve this problem make all planes virtual. Each plane is registered
> as if it supports all possible features, but then at the runtime during
> the atomic_check phase the driver selects backing SSPP block for each
> plane.
> 
> As the planes are attached to the CRTC and not the the encoder, the
> SSPP blocks are also allocated per CRTC ID (all other resources are
> currently allocated per encoder ID). This also matches the hardware
> requirement, where both rectangles of a single SSPP can only be used
> with the LM pair.
> 
> Note, this does not provide support for using two different SSPP blocks
> for a single plane or using two rectangles of an SSPP to drive two
> planes. Each plane still gets its own SSPP and can utilize either a solo
> rectangle or both multirect rectangles depending on the resolution.
> 
> Note #2: By default support for virtual planes is turned off and the
> driver still uses old code path with preallocated SSPP block for each
> plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
> kernel parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 236 ++++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  16 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  77 ++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  27 ++++
>   7 files changed, 391 insertions(+), 29 deletions(-)
> 

<snip>

> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> +					struct dpu_global_state *global_state,
> +					struct drm_crtc *crtc,
> +					struct dpu_rm_sspp_requirements *reqs)
> +{
> +	uint32_t crtc_id = crtc->base.id;
> +	unsigned int weight, best_weight = UINT_MAX;
> +	struct dpu_hw_sspp *hw_sspp;
> +	unsigned long mask = 0;
> +	int i, best_idx = -1;
> +
> +	/*
> +	 * Don't take cursor feature into consideration until there is proper support for SSPP_CURSORn.
> +	 */
> +	mask |= BIT(DPU_SSPP_CURSOR);
> +
> +	if (reqs->scale)
> +		mask |= BIT(DPU_SSPP_SCALER_RGB) |
> +			BIT(DPU_SSPP_SCALER_QSEED2) |
> +			BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE);
> +
> +	if (reqs->yuv)
> +		mask |= BIT(DPU_SSPP_CSC) |
> +			BIT(DPU_SSPP_CSC_10BIT);
> +
> +	if (reqs->rot90)
> +		mask |= BIT(DPU_SSPP_INLINE_ROTATION);
> +
> +	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
> +		if (!rm->hw_sspp[i])
> +			continue;
> +
> +		if (global_state->sspp_to_crtc_id[i])
> +			continue;
> +
> +		hw_sspp = rm->hw_sspp[i];
> +
> +		/* skip incompatible planes */
> +		if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
> +			continue;
> +
> +		if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
> +			continue;
> +
> +		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
> +			continue;
> +
> +		/*
> +		 * For non-yuv, non-scaled planes prefer simple (DMA or RGB)
> +		 * plane, falling back to VIG only if there are no such planes.
> +		 *
> +		 * This way we'd leave VIG sspps to be later used for YUV formats.
> +		 */
> +		weight = hweight64(hw_sspp->cap->features & ~mask);
> +		if (weight < best_weight) {
> +			best_weight = weight;
> +			best_idx = i;
> +		}
> +	}

As commented in the earlier version, we need to stop using hweight as a 
means of identifying the SSPP type and just use type and feature bits 
instead.
