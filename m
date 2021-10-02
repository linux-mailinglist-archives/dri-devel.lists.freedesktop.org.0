Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8641FDE9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 21:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183356E02D;
	Sat,  2 Oct 2021 19:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2DC6E02D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 19:48:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u18so53248152lfd.12
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3v/geDj0uGsJ/NYH2t8jxZkd5djSTKuilXHwfdzt1Cc=;
 b=RHg/dSVzLyBV46OXc3FslmwBEmjnSZ551iVREvMg49ZnxMhGpK8IqjAlYnyuzz4VyA
 qDY03Z7ywArwD0J+/I7fU1CqVSTlzISn0nvICz84CkGqS3CEuyMkUYZybqK1ZbROgm83
 JoP6GmR/pLdjYA2ySMpbLnVq3xpW5Fw7voH/YA4xt2g98PJUTVJHjSnZWChxzIk+Rpoa
 BnXuNaAkHfh72cSHr2qMgkLivgXC+PjpgY9Y8t/siTpdwusB9OxwokOeMqk4B/WkuwkF
 79JaNsd0T1XrCNrANY/O++5vhdtYtl4SSE//KL2AOD3Yd8q7vxa/DveK4vOwzOdEB0sa
 hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3v/geDj0uGsJ/NYH2t8jxZkd5djSTKuilXHwfdzt1Cc=;
 b=kUtr216b7SfjpmG7v3R74RN3Pb/8WoyRV8fyg8IQbMJC+83zNzHqHPCJLWC9yGXCWf
 UoilkiaA8Ef0ysS9neZs4c4pCuWcdaOZf0MaHnAO96CVG5nU2Mvavn2AEvET/q5ENVtc
 3cgdcbcL+5bGQdgzVRk+H2kEaeky9Tqz1kkrseiPOmbWrqbs9PR7EF97ni4CZOrMnB1k
 0KBWt2v2IK6RkTzo4Ext2vNquwxDCTWN4y+CDFUZwhhSec4h7puuLAAGvxw6X7VEn7Wr
 ChyhBgsjcxSoWjCFk9+ljOojNYTB/Xlfvz8YlKX8rib9kXCDLTw7m7C+C8TveEVTSV+y
 CmkA==
X-Gm-Message-State: AOAM532thZkcQBnm9JdpihbDHTPlP08h8QQ3z/Y8ypcVOsg9ghd73Crq
 h9jhWRr+rAnIxfUsi28Gk04/ZCekXmYASg==
X-Google-Smtp-Source: ABdhPJwLnDBY0HJqJaaf7DmtwiIdW9JIcvRLJwkpht+8jNm1I/nya8rzp3SvoRS6VNc2NJxlBiCI8Q==
X-Received: by 2002:a2e:1557:: with SMTP id 23mr5644871ljv.84.1633204115051;
 Sat, 02 Oct 2021 12:48:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e23sm632330lfn.215.2021.10.02.12.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 12:48:34 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/mdp4: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
To: Xu Wang <vulab@iscas.ac.cn>, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
 tzimmermann@suse.de, sam@ravnborg.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201231094155.25481-1-vulab@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3809d7e9-3aa6-8ac0-c1ea-88b63a3d6d63@linaro.org>
Date: Sat, 2 Oct 2021 22:48:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20201231094155.25481-1-vulab@iscas.ac.cn>
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

On 31/12/2020 12:41, Xu Wang wrote:
> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 3d729270bde1..696a22d571ad 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -207,12 +207,9 @@ int mdp4_disable(struct mdp4_kms *mdp4_kms)
>   	DBG("");
>   
>   	clk_disable_unprepare(mdp4_kms->clk);
> -	if (mdp4_kms->pclk)
> -		clk_disable_unprepare(mdp4_kms->pclk);
> -	if (mdp4_kms->lut_clk)
> -		clk_disable_unprepare(mdp4_kms->lut_clk);
> -	if (mdp4_kms->axi_clk)
> -		clk_disable_unprepare(mdp4_kms->axi_clk);
> +	clk_disable_unprepare(mdp4_kms->pclk);
> +	clk_disable_unprepare(mdp4_kms->lut_clk);
> +	clk_disable_unprepare(mdp4_kms->axi_clk);
>   
>   	return 0;
>   }
> @@ -222,12 +219,9 @@ int mdp4_enable(struct mdp4_kms *mdp4_kms)
>   	DBG("");
>   
>   	clk_prepare_enable(mdp4_kms->clk);
> -	if (mdp4_kms->pclk)
> -		clk_prepare_enable(mdp4_kms->pclk);
> -	if (mdp4_kms->lut_clk)
> -		clk_prepare_enable(mdp4_kms->lut_clk);
> -	if (mdp4_kms->axi_clk)
> -		clk_prepare_enable(mdp4_kms->axi_clk);
> +	clk_prepare_enable(mdp4_kms->pclk);
> +	clk_prepare_enable(mdp4_kms->lut_clk);
> +	clk_prepare_enable(mdp4_kms->axi_clk);
>   
>   	return 0;
>   }
> 


-- 
With best wishes
Dmitry
