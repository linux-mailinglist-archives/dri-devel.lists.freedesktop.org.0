Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683545DAD3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 14:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB4D6E5CA;
	Thu, 25 Nov 2021 13:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633266E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 13:18:37 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l9so12478069ljq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 05:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XBFggeh8IckItnr2Q57d0Mkoh9xBKhCLWH6EgGBPIo=;
 b=F0/ENKSmCv+SLaHXwzi0TugpqOvK2WTxkl+OGniIMywaJRz/GiNmXQP56IjV4S4f3I
 bUzwpfIeDw8BzrnYDfyoe/T8n5eNXqmSKeQpHz149MP2CLQzto9BOTOLAghj2IOXiJ82
 Et2VC9w1t8/he3CJZCUp9TGPR5V2pGF2UxByJnekM+FT2N1x82oSb284g9t/xTxLJF1Q
 /X0np7y+e5cNAcgRvcUvlzpzljsOsLkwFHcTuL/J8rtVz9SSaBu6dBww7qB/e9aYHd/z
 0C9cUlvfEEj4h/VujjyV3n9CXdBSCzvDHU57QwyUk1vw/jGZOPtEqoMz9dEgRrTDdxL4
 bVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XBFggeh8IckItnr2Q57d0Mkoh9xBKhCLWH6EgGBPIo=;
 b=HZIVar2meTNcmvLTdp/qkHGnibOIotGlpglXPu1syxNbHoffvUx/8rdOD/0YPBcZjJ
 AVHIP/ESasmtaDPTSJATvjZtldAHOp5580jOMoYMjkEPsrvedvC3jxWt2+SUDY2QXL6q
 gme+s9eMdV1cLZhMQBOdfyDfoTPWPJCP1qiytf7a3oibX/JRztJr4AttGrsf4ykIJB68
 YpK4DS/ceSq4TrXeYtb6oSxu5Y13swY9J0Js7E5iM4nM2epA8M/thgqzCWPSr2AUPGl2
 gMl8pPjlGa80GZ+9OI4/rKBCxtdswsuYcXYxUGc+eVx2eX8pA+TQCdKZnmz2t201CujZ
 KeMg==
X-Gm-Message-State: AOAM531f3qrLtuinbF5G98p1PlafJXStTIDdT8TEhYfe+v7USH6OgWbq
 4xPcXpTB0NW1c9fRBnz4LxrPnQ==
X-Google-Smtp-Source: ABdhPJz7os6YWpibVr7fl1dw2tPzTi3TG/9iIcoH5iXzKc1nYBgzFGeZa1zp0jk73DVdpbBUf9eO7A==
X-Received: by 2002:a05:651c:4ca:: with SMTP id
 e10mr23996491lji.101.1637846315621; 
 Thu, 25 Nov 2021 05:18:35 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k15sm260906lfo.239.2021.11.25.05.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 05:18:35 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Fix potential NULL dereference in DPU
To: Jessica Zhang <jesszhan@codeaurora.org>, freedreno@lists.freedesktop.org
References: <20211020183837.959-1-jesszhan@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c2ca794c-ae89-f018-1476-447bf4b2aba9@linaro.org>
Date: Thu, 25 Nov 2021 16:18:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020183837.959-1-jesszhan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 nganji@codeaurora.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2021 21:38, Jessica Zhang wrote:
> Add NULL checks in KMS CRTC funcs to avoid potential NULL
> dereference.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

I believe that single Fixes is incorrect here. For example snapshot 
support was added later. I'd suggest to split the patch and provide 
correct Fixes tags.

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      | 8 ++++++++

No such file.

>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          | 5 +++++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        | 3 +++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +++
>   drivers/gpu/drm/msm/msm_gpu.c                     | 3 +++
>   5 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index d2457490930b..53d80572181e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -208,8 +208,16 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
>   	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
>   	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
>   			sizeof(struct list_head), GFP_KERNEL);
> +
> +	if (!dpu_kms->irq_obj.irq_cb_tbl)
> +		return;
> +
>   	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
>   			sizeof(atomic_t), GFP_KERNEL);
> +
> +	if (!dpu_kms->irq_obj.irq_counts)
> +		return;
> +
>   	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
>   		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
>   		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..0a1cad0cfcc0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -921,6 +921,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
>   
> +	if (!pstates) {
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
>   	if (!crtc_state->enable || !crtc_state->active) {
>   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>   				crtc->base.id, crtc_state->enable,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69afcbac8..09751b480db5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -92,6 +92,9 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>   	kfree(to_mdp5_plane_state(plane->state));
>   	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
>   
> +	if (!mdp5_state)
> +		return;
> +
>   	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>   		mdp5_state->base.zpos = STAGE_BASE;
>   	else
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index cabe15190ec1..71e209d07120 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -170,6 +170,9 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
>   
>   	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
>   
> +	if (!new_blk)
> +		return;
> +
>   	va_start(va, fmt);
>   
>   	vaf.fmt = fmt;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8a3a592da3a4..ddd23f3a4a99 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -296,6 +296,9 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>   		state->bos = kcalloc(nr,
>   			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>   
> +		if (!state->bos)
> +			return;
> +
>   		for (i = 0; i < submit->nr_bos; i++) {
>   			if (should_dump(submit, i)) {
>   				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
> 


-- 
With best wishes
Dmitry
