Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A161529C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 20:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24F10E417;
	Tue,  1 Nov 2022 19:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBF310E406;
 Tue,  1 Nov 2022 19:54:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1JsfFZ025427; Tue, 1 Nov 2022 19:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6zxzczJROcEEGeZcE8UuaeXsk7nWV0majcan5zRwn0E=;
 b=DUKuKruHRhJNq/45ObDtqGsJi60nX7PnGiidoQjyzuRNPIDDb3boSaykFLGzgp2HPSWs
 hMhHqUnkFk59PEJ7znYJAVANTZoLTqVOxCgfggRAWeEDXx0ziDQ9AXPPxK/hLJvgWbaT
 ZeahVf4Z2uAibNOMs8EwJdB0trAT9REulJvJ0v0PKRCRWTzU8QAQj1iko03pLHBco0MX
 8iN/dkoHsUWoy0vcXotaGmbOKO90Cmvi1nkcWuYQkXXSRo6ee0+6rf3xSb1iVkmIZioX
 LTJN1S9R5Ym2Z9Ms9/omZJOuVuBqJl0alka25oDzVeqO3qMyKfXocp5hW7SXOfSAgevt ZA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk7qng8kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 19:54:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A1JsdhX005617
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 1 Nov 2022 19:54:39 GMT
Received: from [10.216.52.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 1 Nov 2022
 12:54:12 -0700
Message-ID: <fa56debb-41cb-6b91-3f22-f41ffca98fdc@quicinc.com>
Date: Wed, 2 Nov 2022 01:24:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] drm/msm: Hangcheck progress detection
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20221031225414.1280169-1-robdclark@gmail.com>
 <20221031225414.1280169-3-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221031225414.1280169-3-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BdB8hmq7x0ki3f4p7LzCxtiayf25gJFa
X-Proofpoint-GUID: BdB8hmq7x0ki3f4p7LzCxtiayf25gJFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_09,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010141
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Douglas
 Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/2022 4:24 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> If the hangcheck timer expires, check if the fw's position in the
> cmdstream has advanced (changed) since last timer expiration, and
> allow it up to three additional "extensions" to it's alotted time.
> The intention is to continue to catch "shader stuck in a loop" type
> hangs quickly, but allow more time for things that are actually
> making forward progress.
>
> Because we need to sample the CP state twice to detect if there has
> not been progress, this also cuts the the timer's duration in half.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h         |  8 ++++++-
>   drivers/gpu/drm/msm/msm_gpu.c         | 20 +++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.h         |  5 +++-
>   drivers/gpu/drm/msm/msm_ringbuffer.h  | 24 +++++++++++++++++++
>   5 files changed, 88 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1ff605c18ee6..3b8fb7a11dff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1843,6 +1843,39 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
>   }
>   
> +static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	struct msm_cp_state cp_state = {
> +		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
> +		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
> +		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
> +		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
> +	};
> +	bool progress;
> +
> +	/*
> +	 * Adjust the remaining data to account for what has already been
> +	 * fetched from memory, but not yet consumed by the SQE.
> +	 *
> +	 * This is not *technically* correct, the amount buffered could
> +	 * exceed the IB size due to hw prefetching ahead, but:
> +	 *
> +	 * (1) We aren't trying to find the exact position, just whether
> +	 *     progress has been made
> +	 * (2) The CP_REG_TO_MEM at the end of a submit should be enough
> +	 *     to prevent prefetching into an unrelated submit.  (And
> +	 *     either way, at some point the ROQ will be full.)
> +	 */
> +	cp_state.ib1_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB1_STAT) >> 16;
> +	cp_state.ib2_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB1_STAT) >> 16;
REG_A6XX_CP_CSQ_IB1_STAT -> REG_A6XX_CP_CSQ_IB2_STAT

With that, Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil.
> +
> +	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
> +
> +	ring->last_cp_state = cp_state;
> +
> +	return progress;
> +}
> +
>   static u32 a618_get_speed_bin(u32 fuse)
>   {
>   	if (fuse == 0)
> @@ -1961,6 +1994,7 @@ static const struct adreno_gpu_funcs funcs = {
>   		.create_address_space = a6xx_create_address_space,
>   		.create_private_address_space = a6xx_create_private_address_space,
>   		.get_rptr = a6xx_get_rptr,
> +		.progress = a6xx_progress,
>   	},
>   	.get_timestamp = a6xx_get_timestamp,
>   };
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index efcd7260f428..970a1a0ab34f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -226,7 +226,13 @@ struct msm_drm_private {
>   
>   	struct drm_atomic_state *pm_state;
>   
> -	/* For hang detection, in ms */
> +	/**
> +	 * hangcheck_period: For hang detection, in ms
> +	 *
> +	 * Note that in practice, a submit/job will get at least two hangcheck
> +	 * periods, due to checking for progress being implemented as simply
> +	 * "have the CP position registers changed since last time?"
> +	 */
>   	unsigned int hangcheck_period;
>   
>   	/**
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 3dffee54a951..136f5977b0bf 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -500,6 +500,21 @@ static void hangcheck_timer_reset(struct msm_gpu *gpu)
>   			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
>   }
>   
> +static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	if (ring->hangcheck_progress_retries >= DRM_MSM_HANGCHECK_PROGRESS_RETRIES)
> +		return false;
> +
> +	if (!gpu->funcs->progress)
> +		return false;
> +
> +	if (!gpu->funcs->progress(gpu, ring))
> +		return false;
> +
> +	ring->hangcheck_progress_retries++;
> +	return true;
> +}
> +
>   static void hangcheck_handler(struct timer_list *t)
>   {
>   	struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
> @@ -511,9 +526,12 @@ static void hangcheck_handler(struct timer_list *t)
>   	if (fence != ring->hangcheck_fence) {
>   		/* some progress has been made.. ya! */
>   		ring->hangcheck_fence = fence;
> -	} else if (fence_before(fence, ring->fctx->last_fence)) {
> +		ring->hangcheck_progress_retries = 0;
> +	} else if (fence_before(fence, ring->fctx->last_fence) &&
> +			!made_progress(gpu, ring)) {
>   		/* no progress and not done.. hung! */
>   		ring->hangcheck_fence = fence;
> +		ring->hangcheck_progress_retries = 0;
>   		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
>   				gpu->name, ring->id);
>   		DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 585fd9c8d45a..d8f355e9f0b2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -78,6 +78,8 @@ struct msm_gpu_funcs {
>   	struct msm_gem_address_space *(*create_private_address_space)
>   		(struct msm_gpu *gpu);
>   	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> +
> +	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>   };
>   
>   /* Additional state for iommu faults: */
> @@ -236,7 +238,8 @@ struct msm_gpu {
>   	 */
>   #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
>   
> -#define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
> +#define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 250 /* in ms */
> +#define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
>   	struct timer_list hangcheck_timer;
>   
>   	/* Fault info for most recent iova fault: */
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 2a5045abe46e..e3d33bae3380 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -35,6 +35,11 @@ struct msm_rbmemptrs {
>   	volatile u64 ttbr0;
>   };
>   
> +struct msm_cp_state {
> +	uint64_t ib1_base, ib2_base;
> +	uint32_t ib1_rem, ib2_rem;
> +};
> +
I think we can add CP_RB_RPTR too here.
>   struct msm_ringbuffer {
>   	struct msm_gpu *gpu;
>   	int id;
> @@ -64,6 +69,25 @@ struct msm_ringbuffer {
>   	uint64_t memptrs_iova;
>   	struct msm_fence_context *fctx;
>   
> +	/**
> +	 * hangcheck_progress_retries:
> +	 *
> +	 * The number of extra hangcheck duration cycles that we have given
> +	 * due to it appearing that the GPU is making forward progress.
> +	 *
> +	 * If the GPU appears to be making progress (ie. the CP has advanced
> +	 * in the command stream, we'll allow up to DRM_MSM_HANGCHECK_PROGRESS_RETRIES
> +	 * expirations of the hangcheck timer before killing the job.  In other
> +	 * words we'll let the submit run for up to
> +	 * DRM_MSM_HANGCHECK_DEFAULT_PERIOD *  DRM_MSM_HANGCHECK_PROGRESS_RETRIES
> +	 */
> +	int hangcheck_progress_retries;
> +
> +	/**
> +	 * last_cp_state: The state of the CP at the last call to gpu->progress()
> +	 */
> +	struct msm_cp_state last_cp_state;
> +
>   	/*
>   	 * preempt_lock protects preemption and serializes wptr updates against
>   	 * preemption.  Can be aquired from irq context.

