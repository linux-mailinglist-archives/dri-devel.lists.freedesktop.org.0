Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6E39FA16
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55CF6EC14;
	Tue,  8 Jun 2021 15:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3946EC14
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:12:51 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 q5-20020a9d66450000b02903f18d65089fso4414312otm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jLZz8dzHlQ+AV6IoDKBfN+/3ntQe2P3ozAhZeHyJVDw=;
 b=C15S/npOIAjr9axAaMOZI+vxBdvmqGHUPsVuEX/23duKWM6xoPSxaCBMepBmp5R3ZJ
 GJBRtrHNSMRJBfDhR0vyyclDa9+tDwNiKik7aWNPh/plgD0z69a1lF0sekAQkU5wjF7E
 vOualVuatrHlB8JuC7WC631oVyxXfJiR8ikfTE8rD7oNrdQbdskUBNRrt+J6Q+swyJVR
 jQAHCn3BY92uL+VWKBgqUq0jusiojxRs5nRiXRw0Rjw5CGWR6RU5/7furSKXn09WCg4a
 CPU2+D/aEypfya31PmJXEiBRSSoiHzifvzv6s+ePEEGJNabjXqZc5VbEThCDI61xUA4p
 Kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jLZz8dzHlQ+AV6IoDKBfN+/3ntQe2P3ozAhZeHyJVDw=;
 b=sRckADup5S2TzL10YCevYfoYR5wOlsmvIB9MlKXftJ8klaO6Zwe5YVd9xJKssevzOu
 ZhzhRZWIW33se0yFw3PKRfOv7Iik9BZx2Mipmx7bHkD2xRV6RIWIGfxVnknQfWyGBl5i
 N+Vf3cHtkcSqQStu+VpclBPy8OB4iQ+Jgyea8aVLd2a9MIsOYA/faprpcQFZFRB7pOn8
 5h1RVk6PwEhS+Rt6A26jqoLaXrp5Byo8j86zOvH40ZsSsKk1d9cbvhd7bj+yac5+tXji
 26qh2Rh4DV4WDHHfKfNMDC7BE6X6llYuLjovJc5wSE7Zq+r0zHXtUr458zxMMI6dz1YC
 sXFA==
X-Gm-Message-State: AOAM533sIpKu4KUo+4BzgbAiQvToagyoR8faiX43zVcaSnv+X0IIiWyN
 njmv8N1RDdzVOYMVvajt4tR68A==
X-Google-Smtp-Source: ABdhPJwt7XU1qU6Pz9bihvnRwa1+UoxpK1O95QAnqnQnKpQzcsyjCIk4woOFVTDy9+6WS9wBtGtpDQ==
X-Received: by 2002:a9d:738b:: with SMTP id j11mr18313188otk.228.1623165170954; 
 Tue, 08 Jun 2021 08:12:50 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id 7sm3059791oti.30.2021.06.08.08.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:12:50 -0700 (PDT)
Date: Tue, 8 Jun 2021 09:12:47 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 5/6] drm/msm: Add crashdump support for stalled SMMU
Message-ID: <20210608151247.u3uxznfoek7trxiv@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210601224750.513996-1-robdclark@gmail.com>
 <20210601224750.513996-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601224750.513996-7-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 03:47:24PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For collecting devcoredumps with the SMMU stalled after an iova fault,
> we need to skip the parts of the GPU state which are normally collected
> with the hw crashdumper, since with the SMMU stalled the hw would be
> unable to write out the requested state to memory.

On a5xx and a6xx you can query RBBM_STATUS3 bit 24 to see if the IOMMU is
stalled.  That could be an alternative option to adding the "stalled"
infrastructure across all targets.

Jordan
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  5 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 43 ++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_debugfs.c           |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c               |  7 ++--
>  drivers/gpu/drm/msm/msm_gpu.h               |  2 +-
>  9 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index bdc989183c64..d2c31fae64fd 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -434,7 +434,7 @@ static void a2xx_dump(struct msm_gpu *gpu)
>  	adreno_dump(gpu);
>  }
>  
> -static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
> +static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
>  {
>  	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 4534633fe7cd..b1a6f87d74ef 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -464,7 +464,7 @@ static void a3xx_dump(struct msm_gpu *gpu)
>  	adreno_dump(gpu);
>  }
>  
> -static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
> +static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
>  {
>  	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 82bebb40234d..22780a594d6f 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -549,7 +549,7 @@ static const unsigned int a405_registers[] = {
>  	~0 /* sentinel */
>  };
>  
> -static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
> +static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
>  {
>  	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a0eef5d9b89b..2e7714b1a17f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1519,7 +1519,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
>  	msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
>  }
>  
> -static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
> +static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
>  {
>  	struct a5xx_gpu_state *a5xx_state = kzalloc(sizeof(*a5xx_state),
>  			GFP_KERNEL);
> @@ -1536,7 +1536,8 @@ static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
>  	a5xx_state->base.rbbm_status = gpu_read(gpu, REG_A5XX_RBBM_STATUS);
>  
>  	/* Get the HLSQ regs with the help of the crashdumper */
> -	a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
> +	if (!stalled)
> +		a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
>  
>  	a5xx_set_hwcg(gpu, true);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ce0610c5256f..e0f06ce4e1a9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -86,7 +86,7 @@ unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p);
>  
> -struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
> +struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu, bool stalled);
>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>  
>  #endif /* __A6XX_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index c1699b4f9a89..d0af68a76c4f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -833,6 +833,21 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
>  				a6xx_state, &a6xx_vbif_reglist,
>  				&a6xx_state->registers[index++]);
>  
> +	if (!dumper) {
> +		/*
> +		 * We can't use the crashdumper when the SMMU is stalled,
> +		 * because the GPU has no memory access until we resume
> +		 * translation (but we don't want to do that until after
> +		 * we have captured as much useful GPU state as possible).
> +		 * So instead collect registers via the CPU:
> +		 */
> +		for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
> +			a6xx_get_ahb_gpu_registers(gpu,
> +				a6xx_state, &a6xx_reglist[i],
> +				&a6xx_state->registers[index++]);
> +		return;
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
>  		a6xx_get_crashdumper_registers(gpu,
>  			a6xx_state, &a6xx_reglist[i],
> @@ -903,9 +918,9 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>  	a6xx_state->nr_indexed_regs = count;
>  }
>  
> -struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> +struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
>  {
> -	struct a6xx_crashdumper dumper = { 0 };
> +	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
> @@ -928,14 +943,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>  	/* Get the banks of indexed registers */
>  	a6xx_get_indexed_registers(gpu, a6xx_state);
>  
> -	/* Try to initialize the crashdumper */
> -	if (!a6xx_crashdumper_init(gpu, &dumper)) {
> -		a6xx_get_registers(gpu, a6xx_state, &dumper);
> -		a6xx_get_shaders(gpu, a6xx_state, &dumper);
> -		a6xx_get_clusters(gpu, a6xx_state, &dumper);
> -		a6xx_get_dbgahb_clusters(gpu, a6xx_state, &dumper);
> +	/*
> +	 * Try to initialize the crashdumper, if we are not dumping state
> +	 * with the SMMU stalled.  The crashdumper needs memory access to
> +	 * write out GPU state, so we need to skip this when the SMMU is
> +	 * stalled in response to an iova fault
> +	 */
> +	if (!stalled && !a6xx_crashdumper_init(gpu, &_dumper)) {
> +		dumper = &_dumper;
> +	}
> +
> +	a6xx_get_registers(gpu, a6xx_state, dumper);
> +
> +	if (dumper) {
> +		a6xx_get_shaders(gpu, a6xx_state, dumper);
> +		a6xx_get_clusters(gpu, a6xx_state, dumper);
> +		a6xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
>  
> -		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
> +		msm_gem_kernel_put(dumper->bo, gpu->aspace, true);
>  	}
>  
>  	if (snapshot_debugbus)
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 7a2b53d35e6b..90558e826934 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -77,7 +77,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>  		goto free_priv;
>  
>  	pm_runtime_get_sync(&gpu->pdev->dev);
> -	show_priv->state = gpu->funcs->gpu_state_get(gpu);
> +	show_priv->state = gpu->funcs->gpu_state_get(gpu, false);
>  	pm_runtime_put_sync(&gpu->pdev->dev);
>  
>  	mutex_unlock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index fa7691cb4614..4d280bf446e6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -381,7 +381,8 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
>  }
>  
>  static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> -		struct msm_gem_submit *submit, char *comm, char *cmd)
> +		struct msm_gem_submit *submit, char *comm, char *cmd,
> +		bool stalled)
>  {
>  	struct msm_gpu_state *state;
>  
> @@ -393,7 +394,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  	if (gpu->crashstate)
>  		return;
>  
> -	state = gpu->funcs->gpu_state_get(gpu);
> +	state = gpu->funcs->gpu_state_get(gpu, stalled);
>  	if (IS_ERR_OR_NULL(state))
>  		return;
>  
> @@ -519,7 +520,7 @@ static void recover_worker(struct kthread_work *work)
>  
>  	/* Record the crash state */
>  	pm_runtime_get_sync(&gpu->pdev->dev);
> -	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
> +	msm_gpu_crashstate_capture(gpu, submit, comm, cmd, false);
>  	pm_runtime_put_sync(&gpu->pdev->dev);
>  
>  	kfree(cmd);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 7a082a12d98f..c15e5fd675d2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -60,7 +60,7 @@ struct msm_gpu_funcs {
>  	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
>  #endif
>  	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
> -	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
> +	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu, bool stalled);
>  	int (*gpu_state_put)(struct msm_gpu_state *state);
>  	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
>  	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
> -- 
> 2.31.1
> 
