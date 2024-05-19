Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93298C9401
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066010E191;
	Sun, 19 May 2024 08:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zJffl2tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764D10E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:38:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so45900601fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716107893; x=1716712693; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uvn7S9N3gs1R0QzYy1uNyet1Yeg7h3PJLDPnNcMfPqM=;
 b=zJffl2tvLmEnjSc/g9XOAmztwwXNi3eS8OwJHnVTBJ21dh57jZGbe/h3ukGrxB/79u
 fxPgiCzzz6JBO7dsGTEfp1OBx8z/9l1KKUp/53v/x1bOZVDa55DbuqQt1xiGDOdYT5NL
 QKBx+cgojuCxXtciVzVGwNNABN7jzGhaVfcqDhrlepwaaXpNkoQaPvhFzCGoCp9OFFV7
 QsasxVafNkvXQBHO6lW62Sycw0yErBeGRofvWVCjSpEOp8J+ov+IAlBokvQdsiOLe/DW
 CfQgg+8kU7nfVscDCG1mpqeUbMUwLcjxaDNXrwj/VZj5K1iL2CAAvTWnnQdx0zLaEQq/
 iWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716107893; x=1716712693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvn7S9N3gs1R0QzYy1uNyet1Yeg7h3PJLDPnNcMfPqM=;
 b=IrfYwkpBrN282OoUWvSprG9AcbJ4HujndKpgt97W4dNngv4bOGFaqTDsw8idTqeGrg
 h42TxrskTbDEid570UIBNA0/cZ2BbBwp5Pg4wbsSHbKhGhN4+sRUQufJFzjzNUhmkZcC
 dbcx95kfnU+32YtIRDGxHhsCXROoTVJMGOHlPSNbhZNVtEi8FFno5bO/VA83zlaSBGed
 CGwPWCxy7ZbtNvHotPywCfHS8upu845Dym3sCPeEINuJxjWpRcV9uod1MVzh1R9aviHt
 J8TQbqOlGMDmXBE2ArN/vB1K+KpKs7OGKkUy5PBXYMLWZuRYvOTag3SL2ZYZp1r7bOm9
 Hxaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPcCY6sQ30hjxnxDF/AVDPhdm8ZhEXxI9ITNmUuwuoZyMb/MlHeYBuHgtvsf6Qhl34jPUqMMJllDu8YnSbogHbGyzDu/6tAz6ldPSO689s
X-Gm-Message-State: AOJu0YzNjcxrUmefWMi9hOHn3jL4tPyWiPdsTpLARDfMI3Bziq0qrcaN
 1/ELH3P2Oct4pJdK0iMX4UvosUTxQPhhZQXiby9aMprCv2bi3K/w0KPjQj2Fe4s=
X-Google-Smtp-Source: AGHT+IGgzh0RQFEUj/vfjQqsWUMRHSlFORbeArQ4XW7evJ1dXUJQ/TVW+RMYFRKn5ItvOp/AT5UuTA==
X-Received: by 2002:a19:381e:0:b0:51c:c1a3:a4f9 with SMTP id
 2adb3069b0e04-5220ff72f76mr15212294e87.64.1716107893329; 
 Sun, 19 May 2024 01:38:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba754sm3826785e87.107.2024.05.19.01.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:38:12 -0700 (PDT)
Date: Sun, 19 May 2024 11:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/msm/iommu: introduce msm_iommu_disp_new()
 for msm_kms
Message-ID: <jqin56krw2rpk4wezuhgql7fhbjfx2ruv2nh7ksuw3dkbbba63@272ulj5n4yk2>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-4-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-4-quic_abhinavk@quicinc.com>
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

On Fri, May 17, 2024 at 04:37:58PM -0700, Abhinav Kumar wrote:
> Introduce a new API msm_iommu_disp_new() for display use-cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index a79cd18bc4c9..3d5c1bb4c013 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -343,6 +343,19 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
>  	return 0;
>  }
>  
> +static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
> +				  unsigned long iova, int flags, void *arg)
> +{
> +	struct msm_iommu *iommu = arg;
> +
> +	if (iommu->base.handler)
> +		return iommu->base.handler(iommu->base.arg, iova, flags, NULL);
> +
> +	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
> +
> +	return 0;

I'd say, drop pr_warn and return -ENOSYS, letting the
arm_smmu_context_fault() report the error.

> +}
> +
>  static void msm_iommu_resume_translation(struct msm_mmu *mmu)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
> @@ -434,6 +447,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  	return &iommu->base;
>  }
>  
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
> +{
> +	struct msm_iommu *iommu;
> +	struct msm_mmu *mmu;
> +
> +	mmu = msm_iommu_new(dev, quirks);
> +	if (IS_ERR_OR_NULL(mmu))
> +		return mmu;
> +
> +	iommu = to_msm_iommu(mmu);
> +	iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, iommu);
> +
> +	return mmu;
> +}
> +
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 88af4f490881..730458d08d6b 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
>  
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
