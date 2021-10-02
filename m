Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEC41FEC5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341976E053;
	Sat,  2 Oct 2021 23:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448C6E048
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:43:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y23so19441298lfj.7
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yFmuyFIbVn7VdGil6arszv4U78PVs7ha5E+FdkUpQro=;
 b=ryarz8ImKFeJcmktlcnTO+7fpdIL92jAAHDUmxDk4FyVI2Q2KlHrThK1dWbsUJyuRu
 Dr63+4rouwOERPQkF0wSmPwWAFfC4nMzm9vN+SYd2/N01YuRoajo7vk5qPhKh+16HYzD
 yM/MN0IIZra43vgnf2N0hELlyLxrC8/1HVZEaFwQCuBSRvniUjX0qVkxdsrZTuH5AuWN
 9R3yD3pAcFfBYY7GYYQFmWgl2voLqiQOcryis4htxyr38FJzIdFyh5eHOdECAgQ+ArSa
 R4zyjDOYQN2g0NYMKgbYFdSlvc2h2V/s6kTrcW9OIabmr2HO/gprdxr5NjpnfiYCQqPL
 eCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFmuyFIbVn7VdGil6arszv4U78PVs7ha5E+FdkUpQro=;
 b=j9P/EoOtu5/4enpFF0Q3nF2L4/OlsBQuW5UevvznBOqxnfMih9F+Mz0sk8Teg1XBAg
 AM7UGSDkZJTK9W2dJN1rMtNxj2cF1WZIJ9dDzPwSFSAvovnD3WyK9hMDRawJUljNB9Mo
 ogbguNdWcMPepFPHL2rDSaeXHDS6uDtlT8BSx5+RPMqTP1kbvtogl9ncuKgXWEe5rd8b
 lAsqu6mOlgxcILU2pDOTkCo5IR2qgSfiXkZN1+1rRLbMWyKaABd+MV/VJqsTpfvS1waz
 ezBrDCrKhwxrKCM5JhNnWR/XbektdX4qchhYAXVFEXcGRQ6VXkh1tWI4TMo9zdTXMl7H
 aL0g==
X-Gm-Message-State: AOAM530LQ9jx7F3IQ51nc1qN7CZWbaONfw+rsfYDzYLp9mktwcfqmDKq
 ABACW52FZiAR0X1r54gXc163nA==
X-Google-Smtp-Source: ABdhPJxfVHKTvP/nCvaBBstidOInydHI2Dz7CPdAz5Aetr5aasdgikUG9t+klAJGbROOmvlktYbEtw==
X-Received: by 2002:a2e:4a19:: with SMTP id x25mr6292646lja.114.1633218209460; 
 Sat, 02 Oct 2021 16:43:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a16sm1165315lfr.186.2021.10.02.16.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 16:43:28 -0700 (PDT)
Subject: Re: [V2] drm: msm: adreno: use IS_ERR() instead of null pointer check
To: Wang Qing <wangqing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jcrouse@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Sharat Masetty
 <smasetty@codeaurora.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b48957cb-f835-cfa4-34f7-0ab2f96474ed@linaro.org>
Date: Sun, 3 Oct 2021 02:43:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
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

On 07/11/2020 06:19, Wang Qing wrote:
> a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(), so
> we should use IS_ERR() instead of null pointer check and IS_ERR_OR_NULL().

Not quite. a6xx_gmu_get_mmio() can return NULL, as it uses ioremap() 
internally. And ioremap returns NULL in case of error. So the proper 
check should be IS_ERR_OR_NULL().

> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 491fee4..82420f7
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>   	uint32_t pdc_address_offset;
>   
> -	if (!pdcptr || !seqptr)
> +	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
>   		goto err;
>   
>   	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> @@ -580,9 +580,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	wmb();
>   
>   err:
> -	if (!IS_ERR_OR_NULL(pdcptr))
> +	if (!IS_ERR(pdcptr))
>   		iounmap(pdcptr);
> -	if (!IS_ERR_OR_NULL(seqptr))
> +	if (!IS_ERR(seqptr))
>   		iounmap(seqptr);
>   }
>   
> 


-- 
With best wishes
Dmitry
