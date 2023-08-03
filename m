Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B376E335
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF7A10E5C8;
	Thu,  3 Aug 2023 08:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232C310E5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:35:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bded9d93dso17904266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691051718; x=1691656518;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nym283wLVf/ofUyIRllrpdMxMhpWulj6DQA5tLBOCs=;
 b=U1btXfNHgkSw67b9y5Ateu4cMgn1vtw7k2bxBzgT7E5JMW/kySvRli/gC4fFOoE4VC
 Vi8SFXnpnCvX2xKUxS1X/aT0Ijy1YGR7akJjwAcRrcbmDkSDi+wEtHV0ftZ8qS6MjqGA
 zvXfos5vDZDGf+RhpEj29P+Y4/lCsFQ+98jdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051718; x=1691656518;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+nym283wLVf/ofUyIRllrpdMxMhpWulj6DQA5tLBOCs=;
 b=PWrV9p0GqnOaN7rGC/obHHcn1AN4vcSM+8lvrbZoh13jckqO1eZxiYP5YVSgtHT62x
 dZfvMdXxqgKy41s0QyFcfW3U05zZFw4hXhVWLdFDVKED5oRFR53Pvx/GTC429aZ+iSqA
 Ila5b3GrI0pO01W64Zk9fkbc935NXT7PbsZsyQCVxHEN1NEb6TaVOgHEumzlhC6jocNx
 ql414qJvdaZck1cKOLrstDHVUFDCPW6Xg68GsTEjgEQ/VYL+4YU9DeKUiDjRRv2DURFA
 MphF9IvJyEhq15AyrVDCavy7bv756qAuf8130UCIaZMuo/+0r6B2yNplSe28fNJmYGbk
 azlQ==
X-Gm-Message-State: ABy/qLbtBVogGX2lTpyJbSYZFo5CeuO07tQikOMu8xQzT1QjKlsG/oeD
 GmhMyaI24EP9wi4+CbrYblzKOlz4Rasf9/Duxtg=
X-Google-Smtp-Source: APBJJlHR5HZIx8b6Bh12zKXRTxSAfFBj8gJM1k630umLgblmMmLiGD1pmEbvvLNQvVT3Eye0kTiaOQ==
X-Received: by 2002:a17:906:5303:b0:99b:4670:aca9 with SMTP id
 h3-20020a170906530300b0099b4670aca9mr11386895ejo.1.1691051718456; 
 Thu, 03 Aug 2023 01:35:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709065f9200b0099c53c44083sm1218165eju.79.2023.08.03.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:35:17 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:35:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC] drm/msm: Disallow relocs on a6xx+
Message-ID: <ZMtmw8pzLXy/ndCw@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230802221047.9944-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802221047.9944-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 03:10:44PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Mesa stopped using these pretty early in a6xx bringup.  Take advantage
> of this to disallow some legacy UABI.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> So, it was late 2018 when mesa stopped using relocs.  At that point a6xx
> support was still in a pretty early state.  I guess you _could_ use such
> an old version of mesa with a6xx hw.. but you really shouldn't.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Might be good to cite the mesa commit that removed the a6xx reloc code in
the commit message.
-Sima

> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 ++
>  drivers/gpu/drm/msm/msm_gem_submit.c    | 10 ++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ba35c2a87021..695cce82d914 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1078,6 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	adreno_gpu->info = config->info;
>  	adreno_gpu->chip_id = config->chip_id;
>  
> +	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
> +
>  	/* Only handle the core clock when GMU is not in use (or is absent). */
>  	if (adreno_has_gmu_wrapper(adreno_gpu) ||
>  	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 63c96416e183..3b908f9f5493 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -882,6 +882,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		if (submit->valid)
>  			continue;
>  
> +		if (!gpu->allow_relocs) {
> +			if (submit->cmd[i].nr_relocs) {
> +				DRM_ERROR("relocs not allowed\n");
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +
> +			continue;
> +		}
> +
>  		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
>  				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
>  		if (ret)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 7a4fa1b8655b..4252e3839fbc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -285,6 +285,15 @@ struct msm_gpu {
>  	/* True if the hardware supports expanded apriv (a650 and newer) */
>  	bool hw_apriv;
>  
> +	/**
> +	 * @allow_relocs: allow relocs in SUBMIT ioctl
> +	 *
> +	 * Mesa won't use relocs for driver version 1.4.0 and later.  This
> +	 * switch-over happened early enough in mesa a6xx bringup that we
> +	 * can disallow relocs for a6xx and newer.
> +	 */
> +	bool allow_relocs;
> +
>  	struct thermal_cooling_device *cooling;
>  };
>  
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
