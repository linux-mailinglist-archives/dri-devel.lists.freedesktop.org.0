Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CCA90A43
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750BA10E980;
	Wed, 16 Apr 2025 17:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UJtxB/p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F8310E0AD;
 Wed, 16 Apr 2025 17:39:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mRUG000506;
 Wed, 16 Apr 2025 17:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ndj8UM+Mxb/ahSkh/PywiZoaQY0N9V5UUi6hzmzB6MI=; b=UJtxB/p3ZxKCbvw8
 Wctf1WN0sJZm3BIQ0IIFqp0Y783w9nVQdVd1Yxv43SQFviCxyXs4qi9FCggYfrnv
 0zqtp1SRaev8i7GR8qfr1itx6FiVk7wHc7/4NjWj2m91oPpIsZ4648kGC0D5A9El
 OCOx+LMv8NORq23icGgEQCHnrzd4hbs7G6lVe3b3+ZkGShAuD8lSqGauiBy3GZWJ
 1TqvjSZktPF2qkqfR2RoGaxATjqII5RPpnt/WMvsUTHUSAPWB/OwIYSBEFKRcb+C
 Z3vhZwmelzc4REOyeZBOmNqAGor1KY2TzAphp6En8vGu1OitBejCjiyTAalIfNKW
 dWY4DQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vmeuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Apr 2025 17:39:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GHd3pT025456
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Apr 2025 17:39:03 GMT
Received: from [10.216.6.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 10:38:58 -0700
Message-ID: <1d109f0f-e866-4f87-b8f9-06595dbc51ff@quicinc.com>
Date: Wed, 16 Apr 2025 23:08:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/34] drm/msm: Lazily create context VM
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, "Rob
 Clark" <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-15-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250319145425.51935-15-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Byuu8UTKKi04No4T3oDe73UH5v6D9mSa
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ffeb37 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8
 a=CAjrvC-q03qAXdtm1X8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Byuu8UTKKi04No4T3oDe73UH5v6D9mSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160144
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

On 3/19/2025 8:22 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In the next commit, a way for userspace to opt-in to userspace managed
> VM is added.  For this to work, we need to defer creation of the VM
> until it is needed.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
>  drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
>  5 files changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4811be5a7c29..0b1e2ba3539e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -112,6 +112,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  {
>  	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>  	struct msm_context *ctx = submit->queue->ctx;
> +	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	phys_addr_t ttbr;
>  	u32 asid;
> @@ -120,7 +121,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  	if (ctx->seqno == ring->cur_ctx_seqno)
>  		return;
>  
> -	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
> +	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
>  		return;
>  
>  	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0f71703f6ec7..e4d895dda051 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -351,6 +351,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct drm_device *drm = gpu->dev;
> +	/* Note ctx can be NULL when called from rd_open(): */
> +	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
>  
>  	/* No pointer params yet */
>  	if (*len != 0)
> @@ -396,8 +398,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = 0;
>  		return 0;
>  	case MSM_PARAM_FAULTS:
> -		if (ctx->vm)
> -			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
> +		if (vm)
> +			*value = gpu->global_faults + to_msm_vm(vm)->faults;
>  		else
>  			*value = gpu->global_faults;
>  		return 0;
> @@ -405,14 +407,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = gpu->suspend_count;
>  		return 0;
>  	case MSM_PARAM_VA_START:
> -		if (ctx->vm == gpu->vm)
> +		if (vm == gpu->vm)
>  			return UERR(EINVAL, drm, "requires per-process pgtables");
> -		*value = ctx->vm->mm_start;
> +		*value = vm->mm_start;
>  		return 0;
>  	case MSM_PARAM_VA_SIZE:
> -		if (ctx->vm == gpu->vm)
> +		if (vm == gpu->vm)
>  			return UERR(EINVAL, drm, "requires per-process pgtables");
> -		*value = ctx->vm->mm_range;
> +		*value = vm->mm_range;
>  		return 0;
>  	case MSM_PARAM_HIGHEST_BANK_BIT:
>  		*value = adreno_gpu->ubwc_config.highest_bank_bit;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 6ef29bc48bb0..6fd981ee6aee 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -214,10 +214,29 @@ static void load_gpu(struct drm_device *dev)
>  	mutex_unlock(&init_lock);
>  }
>  
> +/**
> + * msm_context_vm - lazily create the context's VM
> + *
> + * @dev: the drm device
> + * @ctx: the context
> + *
> + * The VM is lazily created, so that userspace has a chance to opt-in to having
> + * a userspace managed VM before the VM is created.
> + *
> + * Note that this does not return a reference to the VM.  Once the VM is created,
> + * it exists for the lifetime of the context.
> + */
> +struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	if (!ctx->vm)

hmm. This is racy and it is in a userspace accessible path!

-Akhil

> +		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
> +	return ctx->vm;
> +}
> +
>  static int context_init(struct drm_device *dev, struct drm_file *file)
>  {
>  	static atomic_t ident = ATOMIC_INIT(0);
> -	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_context *ctx;
>  
>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> @@ -230,7 +249,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
> -	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
>  	file->driver_priv = ctx;
>  
>  	ctx->seqno = atomic_inc_return(&ident);
> @@ -408,7 +426,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>  	 * Don't pin the memory here - just get an address so that userspace can
>  	 * be productive
>  	 */
> -	return msm_gem_get_iova(obj, ctx->vm, iova);
> +	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
>  }
>  
>  static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
> @@ -417,18 +435,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
>  {
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_context *ctx = file->driver_priv;
> +	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
>  
>  	if (!priv->gpu)
>  		return -EINVAL;
>  
>  	/* Only supported if per-process address space is supported: */
> -	if (priv->gpu->vm == ctx->vm)
> +	if (priv->gpu->vm == vm)
>  		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
>  
>  	if (should_fail(&fail_gem_iova, obj->size))
>  		return -ENOMEM;
>  
> -	return msm_gem_set_iova(obj, ctx->vm, iova);
> +	return msm_gem_set_iova(obj, vm, iova);
>  }
>  
>  static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index c65f3a6a5256..9731ad7993cf 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -63,7 +63,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  
>  	kref_init(&submit->ref);
>  	submit->dev = dev;
> -	submit->vm = queue->ctx->vm;
> +	submit->vm = msm_context_vm(dev, queue->ctx);
>  	submit->gpu = gpu;
>  	submit->cmd = (void *)&submit->bos[nr_bos];
>  	submit->queue = queue;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d8425e6d7f5a..c15aad288552 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -362,7 +362,12 @@ struct msm_context {
>  	 */
>  	int queueid;
>  
> -	/** @vm: the per-process GPU address-space */
> +	/**
> +	 * @vm:
> +	 *
> +	 * The per-process GPU address-space.  Do not access directly, use
> +	 * msm_context_vm().
> +	 */
>  	struct drm_gpuvm *vm;
>  
>  	/** @kref: the reference count */
> @@ -447,6 +452,8 @@ struct msm_context {
>  	atomic64_t ctx_mem;
>  };
>  
> +struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
> +
>  /**
>   * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
>   *

