Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BAD948251
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BEF10E162;
	Mon,  5 Aug 2024 19:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SbKL2r9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056FB10E162;
 Mon,  5 Aug 2024 19:29:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475CGdmg011139;
 Mon, 5 Aug 2024 19:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=S0AtNKk8MgKd5RsrdlExTWug
 p9dANfpCxV33c79s4Vg=; b=SbKL2r9YTtcSogQXn9DUULVlwST9EqM+mIFBY4QN
 ldQWIv8k21VQ2yX+1CxVFF8LyU7MQqgcojvw51cTW5m7tCO0iEZiymA5vS80yGb9
 iDgAJ3XpMGXizYFR0zTZb9lSddOkaM1uGgr1IzNkJlhy+rh8Yac80HBNQyFGYokJ
 G6iyrnOiiZ0FIZ3itPfPf2Q9IJnT62CrDThCxbF7KpEwntVEgrPlcMv8Cb4avEdO
 7hxkmBlvoRgNE2dLoygXHHTn8b+hGDcPky5Q+osr9YiULZRAKnbjTAP/Zazls6GL
 9cN66wDNhpM52KgIVPlVsDMJRnTWzUgx+vguwYjt2O3dwQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6n49w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 19:29:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475JTBDY024368
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 19:29:11 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 12:29:07 -0700
Date: Tue, 6 Aug 2024 00:59:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Message-ID: <20240805192903.vjsjahbl4t5z5vzp@hu-akhilpo-hyd.qualcomm.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711100038.268803-4-vladimir.lypak@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uPeaNoU42T7ZtgDeSsRPE8CHNrbCdBmh
X-Proofpoint-GUID: uPeaNoU42T7ZtgDeSsRPE8CHNrbCdBmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408050137
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

On Thu, Jul 11, 2024 at 10:00:20AM +0000, Vladimir Lypak wrote:
> On A5XX GPUs when preemption is used it's invietable to enter a soft
> lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
> This appears as full UI lockup and not detected as GPU hang (because
> it's not). This happens due to not triggering preemption when it was
> needed. Sometimes this state can be recovered by some new submit but
> generally it won't happen because applications are waiting for old
> submits to retire.
> 
> One of the reasons why this happens is a race between a5xx_submit and
> a5xx_preempt_trigger called from IRQ during submit retire. Former thread
> updates ring->cur of previously empty and not current ring right after
> latter checks it for emptiness. Then both threads can just exit because
> for first one preempt_state wasn't NONE yet and for second one all rings
> appeared to be empty.
> 
> To prevent such situations from happening we need to establish guarantee
> for preempt_trigger to be called after each submit. To implement it this
> patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
> should switch to non-empty or higher priority ring. Also we find next
> ring in new preemption state "EVALUATE". If the thread that updated some
> ring with new submit sees this state it should wait until it passes.
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>

I didn't go through the other thread with Connor completely, but can you
please check if the below chunk is enough instead of this patch?

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f58dd564d122..d69b14ebbe44 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -47,9 +47,8 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)

        spin_lock_irqsave(&ring->preempt_lock, flags);
        wptr = get_wptr(ring);
-       spin_unlock_irqrestore(&ring->preempt_lock, flags);
-
        gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
+       spin_unlock_irqrestore(&ring->preempt_lock, flags);
 }

 /* Return the highest priority ringbuffer with something in it */
@@ -188,6 +187,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
        update_wptr(gpu, a5xx_gpu->cur_ring);

        set_preempt_state(a5xx_gpu, PREEMPT_NONE);
+
+       a5xx_preempt_trigger(gpu);
 }

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
>  3 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 6c80d3003966..266744ee1d5f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>  	}
>  
>  	a5xx_flush(gpu, ring, true);
> -	a5xx_preempt_trigger(gpu);
> +	a5xx_preempt_trigger(gpu, true);
>  
>  	/* we might not necessarily have a cmd from userspace to
>  	 * trigger an event to know that submit has completed, so
> @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	a5xx_flush(gpu, ring, false);
>  
>  	/* Check to see if we need to start preemption */
> -	a5xx_preempt_trigger(gpu);
> +	a5xx_preempt_trigger(gpu, true);
>  }
>  
>  static const struct adreno_five_hwcg_regs {
> @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>  		a5xx_gpmu_err_irq(gpu);
>  
>  	if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> -		a5xx_preempt_trigger(gpu);
> +		a5xx_preempt_trigger(gpu, false);
>  		msm_gpu_retire(gpu);
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> index c7187bcc5e90..1120824853d4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
>   * through the process.
>   *
>   * PREEMPT_NONE - no preemption in progress.  Next state START.
> - * PREEMPT_START - The trigger is evaulating if preemption is possible. Next
> - * states: TRIGGERED, NONE
> + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possible. Next
> + * states: START, ABORT
>   * PREEMPT_ABORT - An intermediate state before moving back to NONE. Next
>   * state: NONE.
> + * PREEMPT_START - The trigger is preparing for preemption. Next state:
> + * TRIGGERED
>   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
>   * states: FAULTED, PENDING
>   * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
> @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
>  
>  enum preempt_state {
>  	PREEMPT_NONE = 0,
> -	PREEMPT_START,
> +	PREEMPT_EVALUATE,
>  	PREEMPT_ABORT,
> +	PREEMPT_START,
>  	PREEMPT_TRIGGERED,
>  	PREEMPT_FAULTED,
>  	PREEMPT_PENDING,
> @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
>  
>  void a5xx_preempt_init(struct msm_gpu *gpu);
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
>  void a5xx_preempt_irq(struct msm_gpu *gpu);
>  void a5xx_preempt_fini(struct msm_gpu *gpu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 67a8ef4adf6b..f8d09a83c5ae 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
>  }
>  
>  /* Try to trigger a preemption switch */
> -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
>  	unsigned long flags;
>  	struct msm_ringbuffer *ring;
> +	enum preempt_state state;
>  
>  	if (gpu->nr_rings == 1)
>  		return;
>  
>  	/*
> -	 * Try to start preemption by moving from NONE to START. If
> -	 * unsuccessful, a preemption is already in flight
> +	 * Try to start preemption by moving from NONE to EVALUATE. If current
> +	 * state is EVALUATE/ABORT we can't just quit because then we can't
> +	 * guarantee that preempt_trigger will be called after ring is updated
> +	 * by new submit.
>  	 */
> -	if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
> +	state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> +			       PREEMPT_EVALUATE);
> +	while (new_submit && (state == PREEMPT_EVALUATE ||
> +			      state == PREEMPT_ABORT)) {
> +		cpu_relax();
> +		state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> +				       PREEMPT_EVALUATE);
> +	}
> +
> +	if (state != PREEMPT_NONE)
>  		return;
>  
>  	/* Get the next ring to preempt to */
> @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
>  		return;
>  	}
>  
> +	set_preempt_state(a5xx_gpu, PREEMPT_START);
> +
>  	/* Make sure the wptr doesn't update while we're in motion */
>  	spin_lock_irqsave(&ring->preempt_lock, flags);
>  	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
> @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
>  	update_wptr(gpu, a5xx_gpu->cur_ring);
>  
>  	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> +
> +	a5xx_preempt_trigger(gpu, false);
>  }
>  
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> -- 
> 2.45.2
> 
