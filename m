Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFEE42DB39
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E396EB1A;
	Thu, 14 Oct 2021 14:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C96EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:13:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u18so27111451lfd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mPHb2hx0sfWR9f6qb39jfc2B/9EpjbwMaysbXJnZmqQ=;
 b=i00gdk+k6Di/6Uhs+xHpBM7Vz7FqWJce2Ss/829bgNY8njQClQ6hJQgWC1UA72miis
 Rn9NtW7d7rDBHRVyhg6MyutfwTtI8fSgvTa6mIKloQvgkdDBZE17Ax4U7UEpYBomS7TZ
 jcqV/MV6Ci43kBdJwArUTP42udxtb/EAWV/DPD0oN94GLtmf5MVVUQnxjQFh/hm1zljZ
 2nBeZkjo3tr90DhCBzxobRzVyOT3875yHFQqE+xPMKT6ofrZ9A0oegq//GhMsxvHJ4uu
 8IU5DxwEcmTZgHDMHeioXC84YFpP028WcgjRVJX9oML9+Fu5Foxxi6RGE7yPhcaTJ7PS
 036g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mPHb2hx0sfWR9f6qb39jfc2B/9EpjbwMaysbXJnZmqQ=;
 b=Mo1BK6coUuFFCWJRC6M+aI2u36X0H/1loCU0gj7G5gpDO/lv3p6a1quuGHHiJQWJkr
 MPYQ1rHm1pIrXfUVXElA17D3vhHjSYF42kd++c2HuTZv2YQYndR1+tFOAP22O6UBT0HD
 ktyqN+YGArMdLqhkcjs6GPTTPAjNmLv9HAhm4ThSu9G+d/uDUCLMQ7hsjgQRyBC6K5G7
 Psh/PHu/Vdw0xrk6SHuv7joKp7/moZVIn+Xxd6Wg9HJmH6hKbHC6v9oUfXugIQX7atn6
 c6T2/P4PK43dCllXv9PQRiVS9kr4qyM6mxiEJ7tkZo2HZH5cqs2yOlmtiO1Lq/9kSfxA
 rGiw==
X-Gm-Message-State: AOAM532anu+g6Nw6phQS4XE+KGCAWY9xYfmQ/awdA4tH7Shlp1J+7d1o
 hwjf1vdDG6zFl0ZO6rMcS6r09A==
X-Google-Smtp-Source: ABdhPJx/tnCMs/UheIphCGmhXc1nhoSH2IBSPnU9k73oo5IAxKNDzBENOmHAn4+XLXLVGTDjZwKprQ==
X-Received: by 2002:a19:761a:: with SMTP id c26mr3922280lff.242.1634220783726; 
 Thu, 14 Oct 2021 07:13:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s7sm234940lfe.258.2021.10.14.07.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 07:13:03 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] drm/msm/disp/dpu1: Add support for DSC in
 topology
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-10-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
Date: Thu, 14 Oct 2021 17:13:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-10-vkoul@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2021 10:08, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions upto 4k. For more resolutions like 8k this won't
> work.
> 
> Also, it is better to use 2 LMs and DSC instances as half width results
> in lesser power consumption as compared to single LM, DSC at full width.
> 
> The panel has been tested only with 2,2,1 configuration, so for
> now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since
> RFC:
>   - Add more details in changelog
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index aac51c1bdf94..70f57a071165 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -538,6 +538,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   			struct drm_display_mode *mode)
>   {
>   	struct msm_display_topology topology = {0};
> +	struct drm_encoder *drm_enc;
> +	struct msm_drm_private *priv;
>   	int i, intf_count = 0;
>   
>   	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -572,8 +574,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive upto (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;

So, here you'd set the topology.num_rm.

> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> 


-- 
With best wishes
Dmitry
