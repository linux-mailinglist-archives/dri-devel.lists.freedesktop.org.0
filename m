Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71477944D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C2710E6B5;
	Fri, 11 Aug 2023 16:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3F310E6B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:23:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe82ac3ab4so3332524e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771020; x=1692375820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hqzfx48+4bGEQ1sZCe8YnSKBTocZAhGI3MQXtEYWZBE=;
 b=pDwdIQtwpAy5gwScoUCpKPDoulw1HZVu9xB39OdbB8j1OoQ/kX6uIGJ90le/tUyo0w
 BFPJbbk4uNsfSALbk/0tkwFQfpujpmfXyIAoIWrv+EYJ+7g2oo18HOixp3X1Z+KKarFr
 zNaH3QZ1zqymrJX/U3lmSxpF0VEOVklcwOqmlbIIRP9R44VNWBnrnR/347nCaXLY1AvA
 z+vZPjzJ7rXNWGjyeli8mBvM4lionUf9jdHqV/CyTdJXn7uGsEfYUBT2zZKUNtJiDeJG
 sRwvR/bYnNQ9rnr30RzddiNOX2I2GexPqHGQ+pL3nVhQEeTHjFTWiF4gdiBqjxY6Z9Lq
 //9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771020; x=1692375820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hqzfx48+4bGEQ1sZCe8YnSKBTocZAhGI3MQXtEYWZBE=;
 b=cULLyxU/ekoXnabNfgVHBpRZDWzbsSyyEKG7JbFjQk2YpUiclcJ3h9g0vXVM+XG0Bq
 sYVxLk5Hd+WHGZZsEWlru5q2FVeXbuOMXdhm885uMo8aT2wrqOjU6cgPzpMg0a1blSA1
 ANKX7bINDQQU/9KC6AUgMyXW8PK5/ujMkeBPzn4l25eP8zYWiQ7q/aII/Ywax6zbpZU5
 CH/9P60cA3H4OsjkO1gtLjOMP6b7ZjljglPk4ufTksZbbJ2maLWJWOuMYpxck4exsQW5
 +jplm7+25DpugfJrUPFHTC8T5DNmpdoNg33JCwt2ukkxN4x43m02poHyMNvlr+cI9QNu
 VV3g==
X-Gm-Message-State: AOJu0Yz21Srn+O8R4IRmG06UwNbYHjTMIafcyi8WSs8F/gk43T5MCwCA
 EHZ/xOLRnNT0hm6GCrWICLI=
X-Google-Smtp-Source: AGHT+IHC13cbClzY90Y55unkxCOoWrmOntuVE/+/Y9XeBTdh/V0ucptEYX5I1jxE2ifwnmqZ6ceLcg==
X-Received: by 2002:a05:6512:2804:b0:4f3:d682:7b1c with SMTP id
 cf4-20020a056512280400b004f3d6827b1cmr2272410lfb.45.1691771020463; 
 Fri, 11 Aug 2023 09:23:40 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 v7-20020ac25587000000b004fe3229e584sm768475lfg.270.2023.08.11.09.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:23:40 -0700 (PDT)
Message-ID: <37cf3e0d-5a30-466f-86d3-cda077c3921f@gmail.com>
Date: Fri, 11 Aug 2023 19:25:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/bridge: tc358768: Cleanup PLL calculations
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-3-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-3-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/2023 13:44, Tomi Valkeinen wrote:
> As is quite common, some of TC358768's PLL register fields are to be
> programmed with (value - 1). Specifically, the FBD and PRD, multiplier
> and divider, are such fields.
> 
> However, what the driver currently does is that it considers that the
> formula used for PLL rate calculation is:
> 
> RefClk * [(FBD + 1)/ (PRD + 1)] * [1 / (2^FRS)]
> 
> where FBD and PRD are values directly from the registers, while a more
> sensible way to look at it is:
> 
> RefClk * FBD / PRD * (1 / (2^FRS))
> 
> and when the FBD and PRD values are written to the registers, they will
> be subtracted by one.
> 
> Change the driver accordingly, as it simplifies the PLL code.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index b668f77673c3..d5831a1236e9 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -316,7 +316,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
>  
>  	target_pll = tc358768_pclk_to_pll(priv, mode->clock * 1000);
>  
> -	/* pll_clk = RefClk * [(FBD + 1)/ (PRD + 1)] * [1 / (2^FRS)] */
> +	/* pll_clk = RefClk * FBD / PRD * (1 / (2^FRS)) */
>  
>  	for (i = 0; i < ARRAY_SIZE(frs_limits); i++)
>  		if (target_pll >= frs_limits[i])
> @@ -336,19 +336,19 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
>  	best_prd = 0;
>  	best_fbd = 0;
>  
> -	for (prd = 0; prd < 16; ++prd) {
> -		u32 divisor = (prd + 1) * (1 << frs);
> +	for (prd = 1; prd <= 16; ++prd) {
> +		u32 divisor = prd * (1 << frs);
>  		u32 fbd;
>  
> -		for (fbd = 0; fbd < 512; ++fbd) {
> +		for (fbd = 1; fbd <= 512; ++fbd) {
>  			u32 pll, diff, pll_in;
>  
> -			pll = (u32)div_u64((u64)refclk * (fbd + 1), divisor);
> +			pll = (u32)div_u64((u64)refclk * fbd, divisor);
>  
>  			if (pll >= max_pll || pll < min_pll)
>  				continue;
>  
> -			pll_in = (u32)div_u64((u64)refclk, prd + 1);
> +			pll_in = (u32)div_u64((u64)refclk, prd);
>  			if (pll_in < 4000000)
>  				continue;
>  
> @@ -611,7 +611,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
>  		mode->clock * 1000);
>  
>  	/* PRD[15:12] FBD[8:0] */
> -	tc358768_write(priv, TC358768_PLLCTL0, (prd << 12) | fbd);
> +	tc358768_write(priv, TC358768_PLLCTL0, ((prd - 1) << 12) | (fbd - 1));
>  
>  	/* FRS[11:10] LBWS[9:8] CKEN[4] RESETB[1] EN[0] */
>  	tc358768_write(priv, TC358768_PLLCTL1,
> 

-- 
Péter
