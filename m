Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A639583AC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B0510E67F;
	Tue, 20 Aug 2024 10:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q5CPknrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE010E67F;
 Tue, 20 Aug 2024 10:09:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE45760DED;
 Tue, 20 Aug 2024 10:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435B9C4AF0F;
 Tue, 20 Aug 2024 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724148548;
 bh=1NE5pu7o7GuIyFBkJzqmOyYI4zFIM5ZFpXE3QS3bwfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q5CPknrUDKa18aCZr/UWQUezzCrrf7UhLEPinNL7gTGRubeo7l6/T18xq7Udhs00C
 DVFqprCNK2sRbgcD/4Jpq/K8rBWvUIHBn30egApEOpONjMonGR4OvKgyOggKQ1lN0O
 0Sls2zkYU/eDKOmYD+Si6DoDNgBu5ffD+YUEAdvKowI5LEg9zYLH5ADfVecQuT7MOT
 rEly8U31j65WTeLPTgCTEdQ4ruSUxO3ESTBVNwpm0HO2aHOu72skUWWEMuLSLKmqLk
 KkoIfTgeBPnSoDU2ENPL7vXUN5bUBTuCvt5SbRtSkD0hDXcTPqwIul9eaTSbo4iXW5
 pmcN3bzggWBZA==
Message-ID: <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
Date: Tue, 20 Aug 2024 12:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> The bv_fence field of rbmemptrs was being used incorrectly as the BV
> rptr shadow pointer in some places.
> 
> Add a bv_rptr field and change the code to use that instead.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index bcaec86ac67a..32a4faa93d7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* ..which means "always" on A7xx, also for BV shadow */
>  	if (adreno_is_a7xx(adreno_gpu)) {
>  		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
> -			    rbmemptr(gpu->rb[0], bv_fence));
> +			    rbmemptr(gpu->rb[0], bv_rptr));
>  	}
>  
>  	/* Always come up on rb 0 */
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 0d6beb8cd39a..40791b2ade46 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>  	volatile uint32_t rptr;
>  	volatile uint32_t fence;
>  	/* Introduced on A7xx */
> +	volatile uint32_t bv_rptr;

This is never initialized or assigned any value, no?

Konrad
