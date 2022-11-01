Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8FA6152AB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 21:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31C10E424;
	Tue,  1 Nov 2022 20:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327B10E406;
 Tue,  1 Nov 2022 20:03:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1JsAui027526; Tue, 1 Nov 2022 20:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rMAQr0h+bK7jIkLU2FgSnd26AU1dkIsaqK/M0szhDsA=;
 b=nbU8tXbmfg/hiFWUT6mvZszKhw9Q9ZLUCPdSmazOjJ+OkfzflloVxMV9YVnVx6PMdy7f
 Z6sKXzi7KllaXjH7xZKMpQrJLxGSeDH00tOyQgPPP+qY0QnjfG8FbgQ3e/YRrhkO95xI
 hCpSSFgajnVt7Qh9Um/Tfm0vNPILUMKjsFrjDiJjXuFi+kHtG3+3NwN4kIeSqPIrBivR
 Vm72k0OCt4fSVj3+tuKlEL/dqyyak844C4Yq+NBK2dX94n0gfKzdAY/S+FBKPglVm+SR
 5fEZKYwyIQuAj0GECbXqI6RW24joLEB+V51uGC/3zCyl880jPEURdGXl4Jb7xXHNKxEy Lw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk7qfr9cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 20:03:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A1K3TlP022580
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 1 Nov 2022 20:03:29 GMT
Received: from [10.216.52.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 1 Nov 2022
 13:03:24 -0700
Message-ID: <28c6f233-4386-27e6-7ff4-227e2a126b1e@quicinc.com>
Date: Wed, 2 Nov 2022 01:33:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] drm/msm/adreno: Simplify read64/write64 helpers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20221031225414.1280169-1-robdclark@gmail.com>
 <20221031225414.1280169-2-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221031225414.1280169-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DwWBCP6u2PPsr6Bt85hkWFEOM02Gk2L-
X-Proofpoint-ORIG-GUID: DwWBCP6u2PPsr6Bt85hkWFEOM02Gk2L-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_09,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010143
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vladimir
 Lypak <vladimir.lypak@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/2022 4:24 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> The _HI reg is always following the _LO reg, so no need to pass these
> offsets seprately.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +--
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++++++-------------
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 24 ++++++------------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +--
>   drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++-----
>   6 files changed, 27 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 7cb8d9849c07..a10feb8a4194 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -606,8 +606,7 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
>   
>   static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   {
> -	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO,
> -		REG_A4XX_RBBM_PERFCTR_CP_0_HI);
> +	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 3dcec7acb384..ba22d3c918bc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -605,11 +605,9 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
>   		a5xx_ucode_check_version(a5xx_gpu, a5xx_gpu->pfp_bo);
>   	}
>   
> -	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO,
> -		REG_A5XX_CP_ME_INSTR_BASE_HI, a5xx_gpu->pm4_iova);
> +	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO, a5xx_gpu->pm4_iova);
>   
> -	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO,
> -		REG_A5XX_CP_PFP_INSTR_BASE_HI, a5xx_gpu->pfp_iova);
> +	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO, a5xx_gpu->pfp_iova);
>   
>   	return 0;
>   }
> @@ -868,8 +866,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>   	 * memory rendering at this point in time and we don't want to block off
>   	 * part of the virtual memory space.
>   	 */
> -	gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
> -		REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
> +	gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
>   	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
>   
>   	/* Put the GPU into 64 bit by default */
> @@ -908,8 +905,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>   		return ret;
>   
>   	/* Set the ringbuffer address */
> -	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
> -		gpu->rb[0]->iova);
> +	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, gpu->rb[0]->iova);
>   
>   	/*
>   	 * If the microcode supports the WHERE_AM_I opcode then we can use that
> @@ -936,7 +932,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>   		}
>   
>   		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
> -			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
> +			    shadowptr(a5xx_gpu, gpu->rb[0]));
>   	} else if (gpu->nr_rings > 1) {
>   		/* Disable preemption if WHERE_AM_I isn't available */
>   		a5xx_preempt_fini(gpu);
> @@ -1239,9 +1235,9 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>   		gpu_read(gpu, REG_A5XX_RBBM_STATUS),
>   		gpu_read(gpu, REG_A5XX_CP_RB_RPTR),
>   		gpu_read(gpu, REG_A5XX_CP_RB_WPTR),
> -		gpu_read64(gpu, REG_A5XX_CP_IB1_BASE, REG_A5XX_CP_IB1_BASE_HI),
> +		gpu_read64(gpu, REG_A5XX_CP_IB1_BASE),
>   		gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
> -		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE, REG_A5XX_CP_IB2_BASE_HI),
> +		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
>   		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>   
>   	/* Turn off the hangcheck timer to keep it from bothering us */
> @@ -1427,8 +1423,7 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>   
>   static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   {
> -	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
> -		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
> +	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
>   
>   	return 0;
>   }
> @@ -1465,8 +1460,7 @@ static int a5xx_crashdumper_run(struct msm_gpu *gpu,
>   	if (IS_ERR_OR_NULL(dumper->ptr))
>   		return -EINVAL;
>   
> -	gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO,
> -		REG_A5XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
> +	gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
>   
>   	gpu_write(gpu, REG_A5XX_CP_CRASH_DUMP_CNTL, 1);
>   
> @@ -1666,8 +1660,7 @@ static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>   {
>   	u64 busy_cycles;
>   
> -	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
> -			REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
> +	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO);
>   	*out_sample_rate = clk_get_rate(gpu->core_clk);
>   
>   	return busy_cycles;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 8abc9a2b114a..7658e89844b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -137,7 +137,6 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
>   
>   	/* Set the address of the incoming preemption record */
>   	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_LO,
> -		REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_HI,
>   		a5xx_gpu->preempt_iova[ring->id]);
>   
>   	a5xx_gpu->next_ring = ring;
> @@ -211,8 +210,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
>   	}
>   
>   	/* Write a 0 to signal that we aren't switching pagetables */
> -	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO,
> -		REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_HI, 0);
> +	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO, 0);
>   
>   	/* Reset the preemption state */
>   	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..1ff605c18ee6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -247,8 +247,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	OUT_RING(ring, submit->seqno);
>   
>   	trace_msm_gpu_submit_flush(submit,
> -		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -			REG_A6XX_CP_ALWAYS_ON_COUNTER_HI));
> +		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO));
>   
>   	a6xx_flush(gpu, ring);
>   }
> @@ -947,8 +946,7 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
>   		}
>   	}
>   
> -	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE,
> -		REG_A6XX_CP_SQE_INSTR_BASE+1, a6xx_gpu->sqe_iova);
> +	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>   
>   	return 0;
>   }
> @@ -999,8 +997,7 @@ static int hw_init(struct msm_gpu *gpu)
>   	 * memory rendering at this point in time and we don't want to block off
>   	 * part of the virtual memory space.
>   	 */
> -	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
> -		REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
> +	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
>   	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
>   
>   	/* Turn on 64 bit addressing for all blocks */
> @@ -1049,11 +1046,9 @@ static int hw_init(struct msm_gpu *gpu)
>   
>   	if (!adreno_is_a650_family(adreno_gpu)) {
>   		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
> -		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
> -			REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
> +		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>   
>   		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
> -			REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
>   			0x00100000 + adreno_gpu->gmem - 1);
>   	}
>   
> @@ -1145,8 +1140,7 @@ static int hw_init(struct msm_gpu *gpu)
>   		goto out;
>   
>   	/* Set the ringbuffer address */
> -	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
> -		gpu->rb[0]->iova);
> +	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>   
>   	/* Targets that support extended APRIV can use the RPTR shadow from
>   	 * hardware but all the other ones need to disable the feature. Targets
> @@ -1178,7 +1172,6 @@ static int hw_init(struct msm_gpu *gpu)
>   		}
>   
>   		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
> -			REG_A6XX_CP_RB_RPTR_ADDR_HI,
>   			shadowptr(a6xx_gpu, gpu->rb[0]));
>   	}
>   
> @@ -1499,9 +1492,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>   		gpu_read(gpu, REG_A6XX_RBBM_STATUS),
>   		gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
>   		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
> -		gpu_read64(gpu, REG_A6XX_CP_IB1_BASE, REG_A6XX_CP_IB1_BASE_HI),
> +		gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>   		gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
> -		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE, REG_A6XX_CP_IB2_BASE_HI),
> +		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>   		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>   
>   	/* Turn off the hangcheck timer to keep it from bothering us */
> @@ -1712,8 +1705,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   	/* Force the GPU power on so we can read this register */
>   	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>   
> -	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -			    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
>   
>   	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index a5c3d1ed255a..a023d5f962dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -147,8 +147,7 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
>   	/* Make sure all pending memory writes are posted */
>   	wmb();
>   
> -	gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO,
> -		REG_A6XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
> +	gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
>   
>   	gpu_write(gpu, REG_A6XX_CP_CRASH_DUMP_CNTL, 1);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 58a72e6b1400..585fd9c8d45a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -540,7 +540,7 @@ static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
>   	msm_rmw(gpu->mmio + (reg << 2), mask, or);
>   }
>   
> -static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
> +static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
>   {
>   	u64 val;
>   
> @@ -558,17 +558,17 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
>   	 * when the lo is read, so make sure to read the lo first to trigger
>   	 * that
>   	 */
> -	val = (u64) msm_readl(gpu->mmio + (lo << 2));
> -	val |= ((u64) msm_readl(gpu->mmio + (hi << 2)) << 32);
> +	val = (u64) msm_readl(gpu->mmio + (reg << 2));
> +	val |= ((u64) msm_readl(gpu->mmio + ((reg + 1) << 2)) << 32);
>   
>   	return val;
>   }
>   
> -static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
> +static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
>   {
>   	/* Why not a writeq here? Read the screed above */
> -	msm_writel(lower_32_bits(val), gpu->mmio + (lo << 2));
> -	msm_writel(upper_32_bits(val), gpu->mmio + (hi << 2));
> +	msm_writel(lower_32_bits(val), gpu->mmio + (reg << 2));
> +	msm_writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
>   }
>   
>   int msm_gpu_pm_suspend(struct msm_gpu *gpu);

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
