Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4696FC65
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3709210E5C4;
	Fri,  6 Sep 2024 19:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gVk54nLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A5F10E03E;
 Fri,  6 Sep 2024 19:55:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868n8c1019634;
 Fri, 6 Sep 2024 19:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hsuoyTKX0PaReUajRPdNN4Mw
 IxCZX3IHBdgP9qX13oY=; b=gVk54nLK47sCOSmyA0mfjsmd83DejCcpEKs949KI
 8B89dHindDqT9mDCwoF9pgG51cExhVh9SyxiV2F3WtFTzcHeYpVJLvyAfZQ/iYUj
 yezjouQQl+nCxYHnbaJh7u+H7Imi1/lqOPmuCtIX+4s8vdYjxilJ/2hOgKNjLI4U
 TSahjcOuAlelQ1eQLThqtWCo0deaOg+4goCAq+r76FSbjUMEWD/53oQIPNm/VfvA
 5znQMFmZH2lyBv+EhylhEaBq2l2lb4BDxrj5PgB5pFx9wBHPE2DRW0yIFbBwzb59
 EMLi+XyybcQcH/pnhP1RDdLM7JQgIyIAvcBYH38SRtOIQA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu3abu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 19:54:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486JssU3008443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 19:54:54 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 12:54:48 -0700
Date: Sat, 7 Sep 2024 01:24:44 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
Message-ID: <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oBmnq6QLvtnrWGK37p-1R1iQhoc6dyIX
X-Proofpoint-GUID: oBmnq6QLvtnrWGK37p-1R1iQhoc6dyIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060147
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

On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 391 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 844 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index f5e2838c6a76..32e915109a59 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,6 +23,7 @@ adreno-y := \
>  	adreno/a6xx_gpu.o \
>  	adreno/a6xx_gmu.o \
>  	adreno/a6xx_hfi.o \
> +	adreno/a6xx_preempt.o \
>  
>  adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 32a4faa93d7f..ed0b138a2d66 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,83 @@
>  
>  #define GPU_PAS_ID 13
>  
> +/* IFPC & Preemption static powerup restore list */
> +static const uint32_t a7xx_pwrup_reglist[] = {
> +	REG_A6XX_UCHE_TRAP_BASE,
> +	REG_A6XX_UCHE_TRAP_BASE + 1,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_CACHE_WAYS,
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A6XX_RB_NC_MODE_CNTL,
> +	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> +	REG_A7XX_GRAS_NC_MODE_CNTL,
> +	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
> +	REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A6XX_UCHE_CLIENT_PF,

REG_A6XX_TPL1_DBG_ECO_CNTL1 here. A friendly warning, missing a register
in this list (and the below list) will lead to a very frustrating debug.

> +};
> +
> +static const uint32_t a7xx_ifpc_pwrup_reglist[] = {
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),
> +	REG_A6XX_CP_PROTECT(2),
> +	REG_A6XX_CP_PROTECT(3),
> +	REG_A6XX_CP_PROTECT(4),
> +	REG_A6XX_CP_PROTECT(5),
> +	REG_A6XX_CP_PROTECT(6),
> +	REG_A6XX_CP_PROTECT(7),
> +	REG_A6XX_CP_PROTECT(8),
> +	REG_A6XX_CP_PROTECT(9),
> +	REG_A6XX_CP_PROTECT(10),
> +	REG_A6XX_CP_PROTECT(11),
> +	REG_A6XX_CP_PROTECT(12),
> +	REG_A6XX_CP_PROTECT(13),
> +	REG_A6XX_CP_PROTECT(14),
> +	REG_A6XX_CP_PROTECT(15),
> +	REG_A6XX_CP_PROTECT(16),
> +	REG_A6XX_CP_PROTECT(17),
> +	REG_A6XX_CP_PROTECT(18),
> +	REG_A6XX_CP_PROTECT(19),
> +	REG_A6XX_CP_PROTECT(20),
> +	REG_A6XX_CP_PROTECT(21),
> +	REG_A6XX_CP_PROTECT(22),
> +	REG_A6XX_CP_PROTECT(23),
> +	REG_A6XX_CP_PROTECT(24),
> +	REG_A6XX_CP_PROTECT(25),
> +	REG_A6XX_CP_PROTECT(26),
> +	REG_A6XX_CP_PROTECT(27),
> +	REG_A6XX_CP_PROTECT(28),
> +	REG_A6XX_CP_PROTECT(29),
> +	REG_A6XX_CP_PROTECT(30),
> +	REG_A6XX_CP_PROTECT(31),
> +	REG_A6XX_CP_PROTECT(32),
> +	REG_A6XX_CP_PROTECT(33),
> +	REG_A6XX_CP_PROTECT(34),
> +	REG_A6XX_CP_PROTECT(35),
> +	REG_A6XX_CP_PROTECT(36),
> +	REG_A6XX_CP_PROTECT(37),
> +	REG_A6XX_CP_PROTECT(38),
> +	REG_A6XX_CP_PROTECT(39),
> +	REG_A6XX_CP_PROTECT(40),
> +	REG_A6XX_CP_PROTECT(41),
> +	REG_A6XX_CP_PROTECT(42),
> +	REG_A6XX_CP_PROTECT(43),
> +	REG_A6XX_CP_PROTECT(44),
> +	REG_A6XX_CP_PROTECT(45),
> +	REG_A6XX_CP_PROTECT(46),
> +	REG_A6XX_CP_PROTECT(47),
> +	REG_A6XX_CP_AHB_CNTL,
> +};
> +
> +
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -68,6 +145,8 @@ static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  
>  static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	uint32_t wptr;
>  	unsigned long flags;
>  
> @@ -81,12 +160,26 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	/* Make sure to wrap wptr if we need to */
>  	wptr = get_wptr(ring);
>  
> -	spin_unlock_irqrestore(&ring->preempt_lock, flags);
> -
>  	/* Make sure everything is posted before making a decision */
>  	mb();

This looks unnecessary.

>  
> -	gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +	/* Update HW if this is the current ring and we are not in preempt*/
> +	if (!a6xx_in_preempt(a6xx_gpu)) {
> +		/*
> +		 * Order the reads of the preempt state and cur_ring. This
> +		 * matches the barrier after writing cur_ring.
> +		 */
> +		rmb();

we can use the lighter smp variant here.

> +
> +		if (a6xx_gpu->cur_ring == ring)
> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +		else
> +			ring->skip_inline_wptr = true;
> +	} else {
> +		ring->skip_inline_wptr = true;
> +	}
> +
> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  }
>  
>  static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,

set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
not. This is currently not tracked separately for each ring. Can you
please check that?

I wonder why that didn't cause any gpu errors in testing. Not sure if I
am missing something.

>  
>  	/*
>  	 * Write the new TTBR0 to the memstore. This is good for debugging.
> +	 * Needed for preemption
>  	 */
> -	OUT_PKT7(ring, CP_MEM_WRITE, 4);
> +	OUT_PKT7(ring, CP_MEM_WRITE, 5);
>  	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
>  	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
>  	OUT_RING(ring, lower_32_bits(ttbr));
> -	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
> +	OUT_RING(ring, upper_32_bits(ttbr));
> +	OUT_RING(ring, ctx->seqno);
>  
>  	/*
>  	 * Sync both threads after switching pagetables and enable BR only
> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	a6xx_flush(gpu, ring);
>  }
>  
> +static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> +		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
> +{
> +	u64 preempt_offset_priv_secure;
> +
> +	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
> +
> +	OUT_RING(ring, SMMU_INFO);
> +	/* don't save SMMU, we write the record from the kernel instead */
> +	OUT_RING(ring, 0);
> +	OUT_RING(ring, 0);
> +
> +	/* privileged and non secure buffer save */
> +	OUT_RING(ring, NON_SECURE_SAVE_ADDR);
> +	OUT_RING(ring, lower_32_bits(
> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE));
> +	OUT_RING(ring, upper_32_bits(
> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE));
> +	OUT_RING(ring, SECURE_SAVE_ADDR);
> +	preempt_offset_priv_secure =
> +		PREEMPT_OFFSET_PRIV_SECURE(a6xx_gpu->base.info->preempt_record_size);
> +	OUT_RING(ring, lower_32_bits(
> +		a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure));
> +	OUT_RING(ring, upper_32_bits(
> +		a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure));
> +
> +	/* user context buffer save, seems to be unnused by fw */
> +	OUT_RING(ring, NON_PRIV_SAVE_ADDR);
> +	OUT_RING(ring, 0);
> +	OUT_RING(ring, 0);
> +
> +	OUT_RING(ring, COUNTER);
> +	/* seems OK to set to 0 to disable it */
> +	OUT_RING(ring, 0);
> +	OUT_RING(ring, 0);
> +}
> +
>  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
> @@ -283,6 +415,13 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>  	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
>  
> +	/*
> +	 * If preemption is enabled, then set the pseudo register for the save
> +	 * sequence
> +	 */
> +	if (gpu->nr_rings > 1)
> +		a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);

Can we move this after set_pagetable()?

> +
>  	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
>  
>  	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> @@ -376,6 +515,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_RING(ring, upper_32_bits(rbmemptr(ring, bv_fence)));
>  	OUT_RING(ring, submit->seqno);
>  
> +	a6xx_gpu->last_seqno[ring->id] = submit->seqno;
> +
>  	/* write the ringbuffer timestamp */
>  	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
>  	OUT_RING(ring, CACHE_CLEAN | CP_EVENT_WRITE_0_IRQ | BIT(27));
> @@ -389,10 +530,32 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_PKT7(ring, CP_SET_MARKER, 1);
>  	OUT_RING(ring, 0x100); /* IFPC enable */
>  
> +	/* If preemption is enabled */
> +	if (gpu->nr_rings > 1) {
> +		/* Yield the floor on command completion */
> +		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
> +
> +		/*
> +		 * If dword[2:1] are non zero, they specify an address for
> +		 * the CP to write the value of dword[3] to on preemption
> +		 * complete. Write 0 to skip the write
> +		 */
> +		OUT_RING(ring, 0x00);
> +		OUT_RING(ring, 0x00);
> +		/* Data value - not used if the address above is 0 */
> +		OUT_RING(ring, 0x01);
> +		/* generate interrupt on preemption completion */
> +		OUT_RING(ring, 0x00);
> +	}
> +
> +
>  	trace_msm_gpu_submit_flush(submit,
>  		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
>  
>  	a6xx_flush(gpu, ring);
> +
> +	/* Check to see if we need to start preemption */
> +	a6xx_preempt_trigger(gpu);
>  }
>  
>  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
> @@ -588,6 +751,89 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
>  }
>  
> +static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct adreno_reglist_list reglist[2];
> +	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
> +	struct cpu_gpu_lock *lock = ptr;
> +	u32 *dest = (u32 *)&lock->regs[0];
> +	int i, j;
> +
This sequence is required only once. We can use a flag to check and bail out
next time.

> +	lock->gpu_req = lock->cpu_req = lock->turn = 0;
> +	lock->ifpc_list_len = ARRAY_SIZE(a7xx_ifpc_pwrup_reglist);
> +	lock->preemption_list_len = ARRAY_SIZE(a7xx_pwrup_reglist);
> +
> +	/* Static IFPC-only registers */
> +	reglist[0].regs = a7xx_ifpc_pwrup_reglist;
> +	reglist[0].count = ARRAY_SIZE(a7xx_ifpc_pwrup_reglist);
> +	lock->ifpc_list_len = reglist[0].count;
> +
> +	/* Static IFPC + preemption registers */
> +	reglist[1].regs = a7xx_pwrup_reglist;
> +	reglist[1].count = ARRAY_SIZE(a7xx_pwrup_reglist);
> +	lock->preemption_list_len = reglist[1].count;
> +
> +	/*
> +	 * For each entry in each of the lists, write the offset and the current
> +	 * register value into the GPU buffer
> +	 */
> +	for (i = 0; i < 2; i++) {
> +		const u32 *r = reglist[i].regs;
> +
> +		for (j = 0; j < reglist[i].count; j++) {
> +			*dest++ = r[j];
> +			*dest++ = gpu_read(gpu, r[j]);
> +		}
> +	}
> +
> +	/*
> +	 * The overall register list is composed of
> +	 * 1. Static IFPC-only registers
> +	 * 2. Static IFPC + preemption registers
> +	 * 3. Dynamic IFPC + preemption registers (ex: perfcounter selects)
> +	 *
> +	 * The first two lists are static. Size of these lists are stored as
> +	 * number of pairs in ifpc_list_len and preemption_list_len
> +	 * respectively. With concurrent binning, Some of the perfcounter
> +	 * registers being virtualized, CP needs to know the pipe id to program
> +	 * the aperture inorder to restore the same. Thus, third list is a
> +	 * dynamic list with triplets as
> +	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
> +	 * stored as number for triplets in dynamic_list_len.
> +	 */
> +	lock->dynamic_list_len = 0;
> +}
> +
> +static int a7xx_preempt_start(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct msm_ringbuffer *ring = gpu->rb[0];
> +
> +	if (gpu->nr_rings <= 1)
> +		return 0;
> +
> +	/* Turn CP protection off */
> +	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> +	OUT_RING(ring, 0);
> +
> +	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
> +
> +	/* Yield the floor on command completion */
> +	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
> +	OUT_RING(ring, 0x00);
> +	OUT_RING(ring, 0x00);
> +	OUT_RING(ring, 0x01);

Looks like kgsl use 0x00 here. Not sure if that matters!

> +	/* Generate interrupt on preemption completion */
> +	OUT_RING(ring, 0x00);
> +
> +	a6xx_flush(gpu, ring);
> +
> +	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> +}
> +
>  static int a6xx_cp_init(struct msm_gpu *gpu)
>  {
>  	struct msm_ringbuffer *ring = gpu->rb[0];
> @@ -619,6 +865,8 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
>  
>  static int a7xx_cp_init(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = gpu->rb[0];
>  	u32 mask;
>  
> @@ -626,6 +874,8 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>  	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>  	OUT_RING(ring, BIT(27));
>  
> +	a7xx_patch_pwrup_reglist(gpu);
> +

Looks out of place. I guess you kept it here to avoid an extra a7x
check. At least we should move this before the above pm4 packets.

>  	OUT_PKT7(ring, CP_ME_INIT, 7);
>  
>  	/* Use multiple HW contexts */
> @@ -656,11 +906,11 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>  
>  	/* *Don't* send a power up reg list for concurrent binning (TODO) */
>  	/* Lo address */
> -	OUT_RING(ring, 0x00000000);
> +	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
>  	/* Hi address */
> -	OUT_RING(ring, 0x00000000);
> +	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
>  	/* BIT(31) set => read the regs from the list */
> -	OUT_RING(ring, 0x00000000);
> +	OUT_RING(ring, BIT(31));
>  
>  	a6xx_flush(gpu, ring);
>  	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> @@ -784,6 +1034,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>  	}
>  
> +	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
> +							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
> +							 gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
> +							 &a6xx_gpu->pwrup_reglist_iova);
> +
> +	if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
> +		return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
> +
> +	msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglist");
> +
>  	return 0;
>  }
>  
> @@ -1127,6 +1387,8 @@ static int hw_init(struct msm_gpu *gpu)
>  	if (a6xx_gpu->shadow_bo) {
>  		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
>  			shadowptr(a6xx_gpu, gpu->rb[0]));
> +		for (unsigned int i = 0; i < gpu->nr_rings; i++)
> +			a6xx_gpu->shadow[i] = 0;
>  	}
>  
>  	/* ..which means "always" on A7xx, also for BV shadow */
> @@ -1135,6 +1397,8 @@ static int hw_init(struct msm_gpu *gpu)
>  			    rbmemptr(gpu->rb[0], bv_rptr));
>  	}
>  
> +	a6xx_preempt_hw_init(gpu);
> +
>  	/* Always come up on rb 0 */
>  	a6xx_gpu->cur_ring = gpu->rb[0];
>  
> @@ -1180,6 +1444,10 @@ static int hw_init(struct msm_gpu *gpu)
>  out:
>  	if (adreno_has_gmu_wrapper(adreno_gpu))
>  		return ret;
> +
> +	/* Last step - yield the ringbuffer */
> +	a7xx_preempt_start(gpu);
> +
>  	/*
>  	 * Tell the GMU that we are done touching the GPU and it can start power
>  	 * management
> @@ -1557,8 +1825,13 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>  		a7xx_sw_fuse_violation_irq(gpu);
>  
> -	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> +	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
>  		msm_gpu_retire(gpu);
> +		a6xx_preempt_trigger(gpu);
> +	}
> +
> +	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
> +		a6xx_preempt_irq(gpu);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -2331,6 +2604,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  				a6xx_fault_handler);
>  
>  	a6xx_calc_ubwc_config(adreno_gpu);
> +	/* Set up the preemption specific bits and pieces for each ringbuffer */
> +	a6xx_preempt_init(gpu);
>  
>  	return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index e3e5c53ae8af..da10060e38dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -12,6 +12,31 @@
>  
>  extern bool hang_debug;
>  
> +struct cpu_gpu_lock {
> +	uint32_t gpu_req;
> +	uint32_t cpu_req;
> +	uint32_t turn;
> +	union {
> +		struct {
> +			uint16_t list_length;
> +			uint16_t list_offset;
> +		};
> +		struct {
> +			uint8_t ifpc_list_len;
> +			uint8_t preemption_list_len;
> +			uint16_t dynamic_list_len;
> +		};
> +	};
> +	uint64_t regs[62];
> +};
> +
> +struct adreno_reglist_list {
> +	/** @reg: List of register **/
> +	const u32 *regs;
> +	/** @count: Number of registers in the list **/
> +	u32 count;
> +};
> +
>  /**
>   * struct a6xx_info - a6xx specific information from device table
>   *
> @@ -31,6 +56,20 @@ struct a6xx_gpu {
>  	uint64_t sqe_iova;
>  
>  	struct msm_ringbuffer *cur_ring;
> +	struct msm_ringbuffer *next_ring;
> +
> +	struct drm_gem_object *preempt_bo[MSM_GPU_MAX_RINGS];
> +	void *preempt[MSM_GPU_MAX_RINGS];
> +	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
> +	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
> +
> +	atomic_t preempt_state;
> +	spinlock_t eval_lock;
> +	struct timer_list preempt_timer;
> +
> +	unsigned int preempt_level;
> +	bool uses_gmem;
> +	bool skip_save_restore;
>  
>  	struct a6xx_gmu gmu;
>  
> @@ -38,6 +77,10 @@ struct a6xx_gpu {
>  	uint64_t shadow_iova;
>  	uint32_t *shadow;
>  
> +	struct drm_gem_object *pwrup_reglist_bo;
> +	void *pwrup_reglist_ptr;
> +	uint64_t pwrup_reglist_iova;
> +
>  	bool has_whereami;
>  
>  	void __iomem *llc_mmio;
> @@ -49,6 +92,105 @@ struct a6xx_gpu {
>  
>  #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
>  
> +/*
> + * In order to do lockless preemption we use a simple state machine to progress
> + * through the process.
> + *
> + * PREEMPT_NONE - no preemption in progress.  Next state START.
> + * PREEMPT_START - The trigger is evaluating if preemption is possible. Next
> + * states: TRIGGERED, NONE
> + * PREEMPT_FINISH - An intermediate state before moving back to NONE. Next
> + * state: NONE.
> + * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
> + * states: FAULTED, PENDING
> + * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
> + * recovery.  Next state: N/A
> + * PREEMPT_PENDING: Preemption complete interrupt fired - the callback is
> + * checking the success of the operation. Next state: FAULTED, NONE.
> + */
> +
> +enum a6xx_preempt_state {
> +	PREEMPT_NONE = 0,
> +	PREEMPT_START,
> +	PREEMPT_FINISH,
> +	PREEMPT_TRIGGERED,
> +	PREEMPT_FAULTED,
> +	PREEMPT_PENDING,
> +};
> +
> +/*
> + * struct a6xx_preempt_record is a shared buffer between the microcode and the
> + * CPU to store the state for preemption. The record itself is much larger
> + * (2112k) but most of that is used by the CP for storage.
> + *
> + * There is a preemption record assigned per ringbuffer. When the CPU triggers a
> + * preemption, it fills out the record with the useful information (wptr, ring
> + * base, etc) and the microcode uses that information to set up the CP following
> + * the preemption.  When a ring is switched out, the CP will save the ringbuffer
> + * state back to the record. In this way, once the records are properly set up
> + * the CPU can quickly switch back and forth between ringbuffers by only
> + * updating a few registers (often only the wptr).
> + *
> + * These are the CPU aware registers in the record:
> + * @magic: Must always be 0xAE399D6EUL
> + * @info: Type of the record - written 0 by the CPU, updated by the CP
> + * @errno: preemption error record
> + * @data: Data field in YIELD and SET_MARKER packets, Written and used by CP
> + * @cntl: Value of RB_CNTL written by CPU, save/restored by CP
> + * @rptr: Value of RB_RPTR written by CPU, save/restored by CP
> + * @wptr: Value of RB_WPTR written by CPU, save/restored by CP
> + * @_pad: Reserved/padding
> + * @rptr_addr: Value of RB_RPTR_ADDR_LO|HI written by CPU, save/restored by CP
> + * @rbase: Value of RB_BASE written by CPU, save/restored by CP
> + * @counter: GPU address of the storage area for the preemption counters

doc missing for bv_rptr_addr.

> + */
> +struct a6xx_preempt_record {
> +	u32 magic;
> +	u32 info;
> +	u32 errno;
> +	u32 data;
> +	u32 cntl;
> +	u32 rptr;
> +	u32 wptr;
> +	u32 _pad;
> +	u64 rptr_addr;
> +	u64 rbase;
> +	u64 counter;
> +	u64 bv_rptr_addr;
> +};
> +
> +#define A6XX_PREEMPT_RECORD_MAGIC 0xAE399D6EUL
> +
> +#define PREEMPT_RECORD_SIZE_FALLBACK(size) \
> +	((size) == 0 ? 4192 * SZ_1K : (size))
> +
> +#define PREEMPT_OFFSET_SMMU_INFO 0
> +#define PREEMPT_OFFSET_PRIV_NON_SECURE (PREEMPT_OFFSET_SMMU_INFO + 4096)
> +#define PREEMPT_OFFSET_PRIV_SECURE(size) \
> +	(PREEMPT_OFFSET_PRIV_NON_SECURE + PREEMPT_RECORD_SIZE_FALLBACK(size))
> +#define PREEMPT_SIZE(size) \
> +	(PREEMPT_OFFSET_PRIV_SECURE(size) + PREEMPT_RECORD_SIZE_FALLBACK(size))
> +
> +/*
> + * The preemption counter block is a storage area for the value of the
> + * preemption counters that are saved immediately before context switch. We
> + * append it on to the end of the allocation for the preemption record.
> + */
> +#define A6XX_PREEMPT_COUNTER_SIZE (16 * 4)
> +
> +#define A6XX_PREEMPT_USER_RECORD_SIZE (192 * 1024)

Unused.

> +
> +struct a7xx_cp_smmu_info {
> +	u32 magic;
> +	u32 _pad4;
> +	u64 ttbr0;
> +	u32 asid;
> +	u32 context_idr;
> +	u32 context_bank;
> +};
> +
> +#define GEN7_CP_SMMU_INFO_MAGIC 0x241350d5UL
> +
>  /*
>   * Given a register and a count, return a value to program into
>   * REG_CP_PROTECT_REG(n) - this will block both reads and writes for
> @@ -106,6 +248,25 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>  
> +void a6xx_preempt_init(struct msm_gpu *gpu);
> +void a6xx_preempt_hw_init(struct msm_gpu *gpu);
> +void a6xx_preempt_trigger(struct msm_gpu *gpu);
> +void a6xx_preempt_irq(struct msm_gpu *gpu);
> +void a6xx_preempt_fini(struct msm_gpu *gpu);
> +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> +		struct msm_gpu_submitqueue *queue);
> +void a6xx_preempt_submitqueue_close(struct msm_gpu *gpu,
> +		struct msm_gpu_submitqueue *queue);
> +
> +/* Return true if we are in a preempt state */
> +static inline bool a6xx_in_preempt(struct a6xx_gpu *a6xx_gpu)
> +{
> +	int preempt_state = atomic_read(&a6xx_gpu->preempt_state);

I think we should keep a matching barrier before the 'read' similar to the one used in the
set_preempt_state helper.

> +
> +	return !(preempt_state == PREEMPT_NONE ||
> +			preempt_state == PREEMPT_FINISH);
> +}
> +
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		       bool suspended);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> new file mode 100644
> index 000000000000..1caff76aca6e
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2023 Collabora, Ltd. */
> +/* Copyright (c) 2024 Valve Corporation */
> +
> +#include "msm_gem.h"
> +#include "a6xx_gpu.h"
> +#include "a6xx_gmu.xml.h"
> +#include "msm_mmu.h"
> +
> +/*
> + * Try to transition the preemption state from old to new. Return
> + * true on success or false if the original state wasn't 'old'
> + */
> +static inline bool try_preempt_state(struct a6xx_gpu *a6xx_gpu,
> +		enum a6xx_preempt_state old, enum a6xx_preempt_state new)
> +{
> +	enum a6xx_preempt_state cur = atomic_cmpxchg(&a6xx_gpu->preempt_state,
> +		old, new);
> +
> +	return (cur == old);
> +}
> +
> +/*
> + * Force the preemption state to the specified state.  This is used in cases
> + * where the current state is known and won't change
> + */
> +static inline void set_preempt_state(struct a6xx_gpu *gpu,
> +		enum a6xx_preempt_state new)
> +{
> +	/*
> +	 * preempt_state may be read by other cores trying to trigger a
> +	 * preemption or in the interrupt handler so barriers are needed
> +	 * before...
> +	 */
> +	smp_mb__before_atomic();
> +	atomic_set(&gpu->preempt_state, new);
> +	/* ... and after*/
> +	smp_mb__after_atomic();
> +}
> +
> +/* Write the most recent wptr for the given ring into the hardware */
> +static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	unsigned long flags;
> +	uint32_t wptr;
> +
> +	if (!ring)

Is this ever true?

> +		return;
> +
> +	spin_lock_irqsave(&ring->preempt_lock, flags);
> +
> +	if (ring->skip_inline_wptr) {
> +		wptr = get_wptr(ring);
> +
> +		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +
> +		ring->skip_inline_wptr = false;
> +	}
> +
> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
> +}
> +
> +/* Return the highest priority ringbuffer with something in it */
> +static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	unsigned long flags;
> +	int i;
> +
> +	for (i = 0; i < gpu->nr_rings; i++) {
> +		bool empty;
> +		struct msm_ringbuffer *ring = gpu->rb[i];
> +
> +		spin_lock_irqsave(&ring->preempt_lock, flags);
> +		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
> +		if (!empty && ring == a6xx_gpu->cur_ring)
> +			empty = ring->memptrs->fence == a6xx_gpu->last_seqno[i];
> +		spin_unlock_irqrestore(&ring->preempt_lock, flags);
> +
> +		if (!empty)
> +			return ring;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void a6xx_preempt_timer(struct timer_list *t)
> +{
> +	struct a6xx_gpu *a6xx_gpu = from_timer(a6xx_gpu, t, preempt_timer);
> +	struct msm_gpu *gpu = &a6xx_gpu->base.base;
> +	struct drm_device *dev = gpu->dev;
> +
> +	if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_FAULTED))
> +		return;
> +
> +	dev_err(dev->dev, "%s: preemption timed out\n", gpu->name);
> +	kthread_queue_work(gpu->worker, &gpu->recover_work);
> +}
> +
> +void a6xx_preempt_irq(struct msm_gpu *gpu)
> +{
> +	uint32_t status;
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct drm_device *dev = gpu->dev;
> +
> +	if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_PENDING))
> +		return;
> +
> +	/* Delete the preemption watchdog timer */
> +	del_timer(&a6xx_gpu->preempt_timer);
> +
> +	/*
> +	 * The hardware should be setting the stop bit of CP_CONTEXT_SWITCH_CNTL
> +	 * to zero before firing the interrupt, but there is a non zero chance
> +	 * of a hardware condition or a software race that could set it again
> +	 * before we have a chance to finish. If that happens, log and go for
> +	 * recovery
> +	 */
> +	status = gpu_read(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL);
> +	if (unlikely(status & A6XX_CP_CONTEXT_SWITCH_CNTL_STOP)) {
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +					  "!!!!!!!!!!!!!!!! preemption faulted !!!!!!!!!!!!!! irq\n");
> +		set_preempt_state(a6xx_gpu, PREEMPT_FAULTED);
> +		dev_err(dev->dev, "%s: Preemption failed to complete\n",
> +			gpu->name);
> +		kthread_queue_work(gpu->worker, &gpu->recover_work);
> +		return;
> +	}
> +
> +	a6xx_gpu->cur_ring = a6xx_gpu->next_ring;
> +	a6xx_gpu->next_ring = NULL;
> +
> +	/* Make sure the write to cur_ring is posted before the change in state */
> +	wmb();

Not needed. set_preempt_state has the necessary barrier.

> +
> +	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> +
> +	update_wptr(gpu, a6xx_gpu->cur_ring);
> +
> +	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> +
> +	/*
> +	 * Retrigger preemption to avoid a deadlock that might occur when preemption
> +	 * is skipped due to it being already in flight when requested.
> +	 */
> +	a6xx_preempt_trigger(gpu);
> +}
> +
> +void a6xx_preempt_hw_init(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int i;
> +
> +	/* No preemption if we only have one ring */
> +	if (gpu->nr_rings == 1)
> +		return;
> +
> +	for (i = 0; i < gpu->nr_rings; i++) {
> +		struct a6xx_preempt_record *record_ptr =
> +			a6xx_gpu->preempt[i] + PREEMPT_OFFSET_PRIV_NON_SECURE;
> +		record_ptr->wptr = 0;
> +		record_ptr->rptr = 0;
> +		record_ptr->rptr_addr = shadowptr(a6xx_gpu, gpu->rb[i]);
> +		record_ptr->info = 0;
> +		record_ptr->data = 0;
> +		record_ptr->rbase = gpu->rb[i]->iova;
> +	}
> +
> +	/* Write a 0 to signal that we aren't switching pagetables */
> +	gpu_write64(gpu, REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, 0);
> +
> +	/* Enable the GMEM save/restore feature for preemption */
> +	gpu_write(gpu, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE, 0x1);
> +
> +	/* Reset the preemption state */
> +	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> +
> +	spin_lock_init(&a6xx_gpu->eval_lock);
> +
> +	/* Always come up on rb 0 */
> +	a6xx_gpu->cur_ring = gpu->rb[0];
> +}
> +
> +void a6xx_preempt_trigger(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u64 preempt_offset_priv_secure;
> +	unsigned long flags;
> +	struct msm_ringbuffer *ring;
> +	unsigned int cntl;
> +
> +	if (gpu->nr_rings == 1)
> +		return;
> +
> +	/*
> +	 * Lock to make sure another thread attempting preemption doesn't skip it
> +	 * while we are still evaluating the next ring. This makes sure the other
> +	 * thread does start preemption if we abort it and avoids a soft lock.
> +	 */
> +	spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
> +
> +	/*
> +	 * Try to start preemption by moving from NONE to START. If
> +	 * unsuccessful, a preemption is already in flight
> +	 */
> +	if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
> +		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> +		return;
> +	}
> +
> +	cntl = A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL(a6xx_gpu->preempt_level);
> +
> +	if (a6xx_gpu->skip_save_restore)
> +		cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_SKIP_SAVE_RESTORE;
> +
> +	if (a6xx_gpu->uses_gmem)
> +		cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_USES_GMEM;
> +
> +	cntl |= A6XX_CP_CONTEXT_SWITCH_CNTL_STOP;
> +
> +	/* Get the next ring to preempt to */
> +	ring = get_next_ring(gpu);
> +
> +	/*
> +	 * If no ring is populated or the highest priority ring is the current
> +	 * one do nothing except to update the wptr to the latest and greatest
> +	 */
> +	if (!ring || (a6xx_gpu->cur_ring == ring)) {
> +		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> +		update_wptr(gpu, a6xx_gpu->cur_ring);
> +		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> +		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> +		return;
> +	}
> +
> +	spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> +
> +	spin_lock_irqsave(&ring->preempt_lock, flags);
> +
> +	struct a7xx_cp_smmu_info *smmu_info_ptr =
> +		a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_SMMU_INFO;
> +	struct a6xx_preempt_record *record_ptr =
> +		a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE;
> +	u64 ttbr0 = ring->memptrs->ttbr0;
> +	u32 context_idr = ring->memptrs->context_idr;
> +
> +	smmu_info_ptr->ttbr0 = ttbr0;
> +	smmu_info_ptr->context_idr = context_idr;
> +	record_ptr->wptr = get_wptr(ring);
> +
> +	/*
> +	 * The GPU will write the wptr we set above when we preempt. Reset
> +	 * skip_inline_wptr to make sure that we don't write WPTR to the same
> +	 * thing twice. It's still possible subsequent submissions will update
> +	 * wptr again, in which case they will set the flag to true. This has
> +	 * to be protected by the lock for setting the flag and updating wptr
> +	 * to be atomic.
> +	 */
> +	ring->skip_inline_wptr = false;
> +
> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
> +
> +	gpu_write64(gpu,
> +		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_INFO);
> +
> +	gpu_write64(gpu,
> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE);
> +
> +	preempt_offset_priv_secure =
> +		PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_record_size);
> +	gpu_write64(gpu,
> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
> +		a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure);

Secure buffers are not supported currently, so we can skip this and the
context record allocation. Anyway this has to be a separate buffer
mapped in secure pagetable which don't currently have. We can skip the
same in pseudo register packet too.

> +
> +	a6xx_gpu->next_ring = ring;
> +
> +	/* Start a timer to catch a stuck preemption */
> +	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
> +
> +	/* Set the preemption state to triggered */
> +	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
> +
> +	/* Make sure any previous writes to WPTR are posted */
> +	gpu_read(gpu, REG_A6XX_CP_RB_WPTR);
> +
> +	/* Make sure everything is written before hitting the button */
> +	wmb();

This and the above read back looks unnecessary. All writes to gpu are
ordered anyway.

> +
> +	/* Trigger the preemption */
> +	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
> +}
> +
> +static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
> +		struct msm_ringbuffer *ring)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	struct drm_gem_object *bo = NULL;
> +	phys_addr_t ttbr;
> +	u64 iova = 0;
> +	void *ptr;
> +	int asid;
> +
> +	ptr = msm_gem_kernel_new(gpu->dev,
> +		PREEMPT_SIZE(adreno_gpu->info->preempt_record_size),
> +		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);

set a name?

> +
> +	memset(ptr, 0, PREEMPT_SIZE(adreno_gpu->info->preempt_record_size));
> +
> +	if (IS_ERR(ptr))
> +		return PTR_ERR(ptr);
> +
> +	a6xx_gpu->preempt_bo[ring->id] = bo;
> +	a6xx_gpu->preempt_iova[ring->id] = iova;
> +	a6xx_gpu->preempt[ring->id] = ptr;
> +
> +	struct a7xx_cp_smmu_info *smmu_info_ptr = ptr + PREEMPT_OFFSET_SMMU_INFO;
> +	struct a6xx_preempt_record *record_ptr = ptr + PREEMPT_OFFSET_PRIV_NON_SECURE;
> +
> +	msm_iommu_pagetable_params(gpu->aspace->mmu, &ttbr, &asid);
> +
> +	smmu_info_ptr->magic = GEN7_CP_SMMU_INFO_MAGIC;
> +	smmu_info_ptr->ttbr0 = ttbr;
> +	smmu_info_ptr->asid = 0xdecafbad;
> +	smmu_info_ptr->context_idr = 0;
> +
> +	/* Set up the defaults on the preemption record */
> +	record_ptr->magic = A6XX_PREEMPT_RECORD_MAGIC;
> +	record_ptr->info = 0;
> +	record_ptr->data = 0;
> +	record_ptr->rptr = 0;
> +	record_ptr->wptr = 0;
> +	record_ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT;
> +	record_ptr->rbase = ring->iova;
> +	record_ptr->counter = 0;
> +	record_ptr->bv_rptr_addr = rbmemptr(ring, bv_rptr);
> +
> +	return 0;
> +}
> +
> +void a6xx_preempt_fini(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int i;
> +
> +	for (i = 0; i < gpu->nr_rings; i++)
> +		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->aspace);
> +}
> +
> +void a6xx_preempt_init(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int i;
> +
> +	/* No preemption if we only have one ring */
> +	if (gpu->nr_rings <= 1)
> +		return;
> +
> +	for (i = 0; i < gpu->nr_rings; i++) {
> +		if (preempt_init_ring(a6xx_gpu, gpu->rb[i]))
> +			goto fail;
> +	}
> +
> +	/* TODO: make this configurable? */
> +	a6xx_gpu->preempt_level = 1;
> +	a6xx_gpu->uses_gmem = 1;
> +	a6xx_gpu->skip_save_restore = 1;
> +
> +	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
> +
> +	return;
> +fail:

Log an error so that preemption is not disabled silently?

> +	/*
> +	 * On any failure our adventure is over. Clean up and
> +	 * set nr_rings to 1 to force preemption off
> +	 */
> +	a6xx_preempt_fini(gpu);
> +	gpu->nr_rings = 1;
> +
> +	return;
> +}
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 40791b2ade46..7dde6a312511 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -36,6 +36,7 @@ struct msm_rbmemptrs {
>  
>  	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
>  	volatile u64 ttbr0;
> +	volatile u32 context_idr;
>  };
>  
>  struct msm_cp_state {
> @@ -100,6 +101,12 @@ struct msm_ringbuffer {
>  	 * preemption.  Can be aquired from irq context.
>  	 */
>  	spinlock_t preempt_lock;
> +
> +	/*
> +	 * Whether we skipped writing wptr and it needs to be updated in the
> +	 * future when the ring becomes current.
> +	 */
> +	bool skip_inline_wptr;

nit: does 'restore_wptr' makes more sense? Or something better?  Basically, name it based
on the future action?

-Akhil

>  };
>  
>  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> 
> -- 
> 2.46.0
> 
