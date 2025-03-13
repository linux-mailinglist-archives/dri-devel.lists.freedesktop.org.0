Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79715A6026A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 21:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E95010E074;
	Thu, 13 Mar 2025 20:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o6BS8g21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4710E074
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3csgnhFEzwaOuJh37jg6K7sqTieaPk1JraZ2D+RP4Y=; b=o6BS8g21ylJampQeHlSm8ga+RO
 7J8leguurGoEFYjdWpNFpqchlWE1yX5yUzaM6hncjbrFuDwcLRLIVzZyop123QqzQULjodZJlNIPZ
 5DmFMkhjHqSiKKNEbd7AiVnRhDI6me46dmzNr1wzOgGTkJTMMcwa3oAH8MiOlgybju8ENfojXjKtS
 Dmc1Pn5pgXb+dhaXQX6GbxHbvunqWhvhxp6V9pZOtnjE/Ts+Hd1uQTfTXFTvMMDfwU6n1GYPlpn/a
 1luwpS3vXT5vSDYKftgtVl/ovoFb70dAX1Zm73iZYXqrtUUaq97T4ltCFn2M+Vm4VFcQytguwgA0M
 D2QqM1EA==;
Received: from [189.7.87.170] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tsp2u-008K8s-M5; Thu, 13 Mar 2025 21:20:54 +0100
Message-ID: <0d0addae-c83c-408f-9094-e9c734855438@igalia.com>
Date: Thu, 13 Mar 2025 17:20:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/v3d: Don't run jobs that have errors flagged
 in its fence
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com, stable@vger.kernel.org
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
 <20250313-v3d-gpu-reset-fixes-v4-1-c1e780d8e096@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250313-v3d-gpu-reset-fixes-v4-1-c1e780d8e096@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/03/25 11:43, Maíra Canal wrote:
> The V3D driver still relies on `drm_sched_increase_karma()` and
> `drm_sched_resubmit_jobs()` for resubmissions when a timeout occurs.
> The function `drm_sched_increase_karma()` marks the job as guilty, while
> `drm_sched_resubmit_jobs()` sets an error (-ECANCELED) in the DMA fence of
> that guilty job.
> 
> Because of this, we must check whether the job’s DMA fence has been
> flagged with an error before executing the job. Otherwise, the same guilty
> job may be resubmitted indefinitely, causing repeated GPU resets.
> 
> This patch adds a check for an error on the job's fence to prevent running
> a guilty job that was previously flagged when the GPU timed out.
> 
> Note that the CPU and CACHE_CLEAN queues do not require this check, as
> their jobs are executed synchronously once the DRM scheduler starts them.
> 
> Cc: stable@vger.kernel.org
> Fixes: d223f98f0209 ("drm/v3d: Add support for compute shader dispatch.")
> Fixes: 1584f16ca96e ("drm/v3d: Add support for submitting jobs to the TFU.")
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

As patches 1/7 and 2/7 prevent the same faulty job from being
resubmitted in a loop, I just applied them to misc/kernel.git (drm-misc-
fixes).

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 80466ce8c7df669280e556c0793490b79e75d2c7..c2010ecdb08f4ba3b54f7783ed33901552d0eba1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -327,11 +327,15 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
>   	struct drm_device *dev = &v3d->drm;
>   	struct dma_fence *fence;
>   
> +	if (unlikely(job->base.base.s_fence->finished.error))
> +		return NULL;
> +
> +	v3d->tfu_job = job;
> +
>   	fence = v3d_fence_create(v3d, V3D_TFU);
>   	if (IS_ERR(fence))
>   		return NULL;
>   
> -	v3d->tfu_job = job;
>   	if (job->base.irq_fence)
>   		dma_fence_put(job->base.irq_fence);
>   	job->base.irq_fence = dma_fence_get(fence);
> @@ -369,6 +373,9 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>   	struct dma_fence *fence;
>   	int i, csd_cfg0_reg;
>   
> +	if (unlikely(job->base.base.s_fence->finished.error))
> +		return NULL;
> +
>   	v3d->csd_job = job;
>   
>   	v3d_invalidate_caches(v3d);
> 

