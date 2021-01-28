Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C111307E6D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 19:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED66E204;
	Thu, 28 Jan 2021 18:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Thu, 28 Jan 2021 18:52:32 UTC
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D726E204
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 18:52:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611859954; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=b0ntJB4qfOgKJiEtDgMOm5VkaY7ULbHbLFdGGfjh+FQ=;
 b=Sa3SUdLdZdCSpxcnn8+TVGb3U6aCFcX16XH+KMxdQZd9PiimAhdVSIK46UiAlzlEqHcIBic5
 sqmrsHMBQWU2dcxKYoatG1O+pEsmtgiX/0wVm/4XdHEMWx9+Gws1Xk8+MtP/DnO8Vc+p77zZ
 Mu4iTLyABGXw8KKQva5K418+BBk=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 601306ab9137d6636dc9b5a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 18:47:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7528DC43466; Thu, 28 Jan 2021 18:47:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D21A1C43461;
 Thu, 28 Jan 2021 18:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D21A1C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 28 Jan 2021 11:47:03 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/3] drm/msm: Fix race of GPU init vs timestamp power
 management.
Message-ID: <20210128184702.GB29306@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20210127233946.1286386-1-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127233946.1286386-1-eric@anholt.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 03:39:44PM -0800, Eric Anholt wrote:
> We were using the same force-poweron bit in the two codepaths, so they
> could race to have one of them lose GPU power early.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Cc: stable@vger.kernel.org # v5.9

You can add:
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")

Because that was my ugly.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 ++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  4 ++--
>  3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 78836b4fb98e..378dc7f190c3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -264,6 +264,16 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
>  		}
>  		name = "GPU_SET";
>  		break;
> +	case GMU_OOB_PERFCOUNTER_SET:
> +		if (gmu->legacy) {
> +			request = GMU_OOB_PERFCOUNTER_REQUEST;
> +			ack = GMU_OOB_PERFCOUNTER_ACK;
> +		} else {
> +			request = GMU_OOB_PERFCOUNTER_REQUEST_NEW;
> +			ack = GMU_OOB_PERFCOUNTER_ACK_NEW;
> +		}
> +		name = "PERFCOUNTER";
> +		break;
>  	case GMU_OOB_BOOT_SLUMBER:
>  		request = GMU_OOB_BOOT_SLUMBER_REQUEST;
>  		ack = GMU_OOB_BOOT_SLUMBER_ACK;
> @@ -302,9 +312,14 @@ int _a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state, char
>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  {
>  	if (!gmu->legacy) {
> -		WARN_ON(state != GMU_OOB_GPU_SET);
> -		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> -			1 << GMU_OOB_GPU_SET_CLEAR_NEW);
> +		if (state == GMU_OOB_GPU_SET) {
> +			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> +				1 << GMU_OOB_GPU_SET_CLEAR_NEW);
> +		} else {
> +			WARN_ON(state != GMU_OOB_PERFCOUNTER_SET);
> +			gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> +				1 << GMU_OOB_PERFCOUNTER_CLEAR_NEW);
> +		}
>  		return;
>  	}
>  
> @@ -313,6 +328,10 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
>  			1 << GMU_OOB_GPU_SET_CLEAR);
>  		break;
> +	case GMU_OOB_PERFCOUNTER_SET:
> +		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> +			1 << GMU_OOB_PERFCOUNTER_CLEAR);
> +		break;
>  	case GMU_OOB_BOOT_SLUMBER:
>  		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
>  			1 << GMU_OOB_BOOT_SLUMBER_CLEAR);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index c6d2bced8e5d..9fa278de2106 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -156,6 +156,7 @@ enum a6xx_gmu_oob_state {
>  	GMU_OOB_BOOT_SLUMBER = 0,
>  	GMU_OOB_GPU_SET,
>  	GMU_OOB_DCVS_SET,
> +	GMU_OOB_PERFCOUNTER_SET,
>  };
>  
>  /* These are the interrupt / ack bits for each OOB request that are set
> @@ -190,6 +191,13 @@ enum a6xx_gmu_oob_state {
>  #define GMU_OOB_GPU_SET_ACK_NEW		31
>  #define GMU_OOB_GPU_SET_CLEAR_NEW	31
>  
> +#define GMU_OOB_PERFCOUNTER_REQUEST	17
> +#define GMU_OOB_PERFCOUNTER_ACK		25
> +#define GMU_OOB_PERFCOUNTER_CLEAR	25
> +
> +#define GMU_OOB_PERFCOUNTER_REQUEST_NEW	28
> +#define GMU_OOB_PERFCOUNTER_ACK_NEW	30
> +#define GMU_OOB_PERFCOUNTER_CLEAR_NEW	30
>  
>  void a6xx_hfi_init(struct a6xx_gmu *gmu);
>  int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c8a9010c1a1d..7424a70b9d35 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1177,12 +1177,12 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
>  	/* Force the GPU power on so we can read this register */
> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>  
>  	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
>  		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
>  
> -	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>  	return 0;
>  }
>  
> -- 
> 2.30.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
