Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD419482BE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A010E29F;
	Mon,  5 Aug 2024 19:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="URXr4DmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABD010E29B;
 Mon,  5 Aug 2024 19:59:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475BCegj019139;
 Mon, 5 Aug 2024 19:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3PdDIjWS8xAAF2r3L9gl7F8m
 AHgdHD0vb2Ts7ffC658=; b=URXr4DmKc1CTdCKsJdcohR/6JZe5zwVmKYrmwHJH
 TtQsmWdq3l8zWv/VhL7q2R78ThjGZJIfQWRkJRl0uHJWp15XYcYrQGsOzl86HIkO
 wP1+SD7JBFDni3U8qBtAMHJ6jLfBowIBmRSX14CsuM9UfiNsdJzdWtoLmifzM+dF
 kv594u9GnQsCcKxjyCjXhnNmatk6+scLK5hyrEyodBFJTOWEvjAE2GElz+3xAAYh
 DB83Qy4BFDeTzpBVpnrbvm4NRWASg4Chnbjj5raRB1Itv+rN4ZuA+yqaGDbeI7hD
 57nTx/ShLMkuFnNX/v9NoDWaBknTuyc1ZLnwBZIk2q3Hug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scs2w1nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 19:59:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475Jx6Qq009040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 19:59:06 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 12:59:01 -0700
Date: Tue, 6 Aug 2024 01:28:57 +0530
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
Subject: Re: [PATCH 4/4] drm/msm/a5xx: workaround early ring-buffer emptiness
 check
Message-ID: <20240805195857.elrbquiazekg6j6p@hu-akhilpo-hyd.qualcomm.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-5-vladimir.lypak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711100038.268803-5-vladimir.lypak@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: j8dBPWIPyBwfOh1OxVP-5lC3tyvVI30j
X-Proofpoint-GUID: j8dBPWIPyBwfOh1OxVP-5lC3tyvVI30j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050141
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

On Thu, Jul 11, 2024 at 10:00:21AM +0000, Vladimir Lypak wrote:
> There is another cause for soft lock-up of GPU in empty ring-buffer:
> race between GPU executing last commands and CPU checking ring for
> emptiness. On GPU side IRQ for retire is triggered by CACHE_FLUSH_TS
> event and RPTR shadow (which is used to check ring emptiness) is updated
> a bit later from CP_CONTEXT_SWITCH_YIELD. Thus if GPU is executing its
> last commands slow enough or we check that ring too fast we will miss a
> chance to trigger switch to lower priority ring because current ring isn't
> empty just yet. This can escalate to lock-up situation described in
> previous patch.
> To work-around this issue we keep track of last submit sequence number
> for each ring and compare it with one written to memptrs from GPU during
> execution of CACHE_FLUSH_TS event.
> 

This is interesting! Is this just theoretical or are you able to hit
this race on your device (after picking other fixes in this series)?

-Akhil.

> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 4 ++++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 1 +
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 266744ee1d5f..001f11f5febc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -65,6 +65,8 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = submit->ring;
>  	struct drm_gem_object *obj;
>  	uint32_t *ptr, dwords;
> @@ -109,6 +111,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>  		}
>  	}
>  
> +	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
>  	a5xx_flush(gpu, ring, true);
>  	a5xx_preempt_trigger(gpu, true);
>  
> @@ -210,6 +213,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	/* Write the fence to the scratch register */
>  	OUT_PKT4(ring, REG_A5XX_CP_SCRATCH_REG(2), 1);
>  	OUT_RING(ring, submit->seqno);
> +	a5xx_gpu->last_seqno[ring->id] = submit->seqno;
>  
>  	/*
>  	 * Execute a CACHE_FLUSH_TS event. This will ensure that the
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> index 1120824853d4..7269eaab9a7a 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> @@ -34,6 +34,7 @@ struct a5xx_gpu {
>  	struct drm_gem_object *preempt_counters_bo[MSM_GPU_MAX_RINGS];
>  	struct a5xx_preempt_record *preempt[MSM_GPU_MAX_RINGS];
>  	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
> +	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
>  
>  	atomic_t preempt_state;
>  	struct timer_list preempt_timer;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index f8d09a83c5ae..6bd92f9b2338 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -55,6 +55,8 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  /* Return the highest priority ringbuffer with something in it */
>  static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
>  	unsigned long flags;
>  	int i;
>  
> @@ -64,6 +66,8 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
>  
>  		spin_lock_irqsave(&ring->preempt_lock, flags);
>  		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
> +		if (!empty && ring == a5xx_gpu->cur_ring)
> +			empty = ring->memptrs->fence == a5xx_gpu->last_seqno[i];
>  		spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
>  		if (!empty)
> -- 
> 2.45.2
> 
