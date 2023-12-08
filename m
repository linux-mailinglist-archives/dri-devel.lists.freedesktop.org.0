Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82F80AB3B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8A610E2E6;
	Fri,  8 Dec 2023 17:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Fri, 08 Dec 2023 17:53:34 UTC
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B95210EA06
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:53:34 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id Bev8rCdaRbmKlBev9rpX9g; Fri, 08 Dec 2023 18:46:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1702057562;
 bh=ByKgwV0x98pBzWeiac+KymXWEnZBqPMwaQaFwL44V+Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ceq2K8ctrwCikyi2+51iwfoElOvQwgC2ibR4RTajv//9DiURJyAAJYtf2pTjeF1qY
 5nH1RltEGRRtNCe22MWpXGvOEoSvfGDs2xqawkKniJNCxp/D//Szsx4iibWP+So2qf
 R2brmrl2gVxPT5wt5Snwzf9NwRmaRuO8MjbAqWVb6HpsZSkBTpzenHNJ9ZyVUR6za4
 VCJUtbXYRnQPp4WJigV/6GfP7mBMeRc270SAh+xkrrFxWWsdXZLMjuDR5ggn1pXP4K
 Lf6xNqjNpICO1Sa638GGioe60JkFkrLdiwcUoSRy3pOsRcGePjx/sQ4nTvd2vKDXbT
 GYsfc+yWcBixQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 08 Dec 2023 18:46:02 +0100
X-ME-IP: 92.140.202.140
Message-ID: <26dd45f4-8fb7-476f-b8ec-9cb685a138ef@wanadoo.fr>
Date: Fri, 8 Dec 2023 18:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] drm/amd/display: replace kzalloc and memcpy
 with kmemdup
To: yang.guang5@zte.com.cn, harry.wentland@amd.com
References: <202312081044568085747@zte.com.cn>
Content-Language: fr, en-GB
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <202312081044568085747@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 gabe.teeger@amd.com, sunpeng.li@amd.com, cgel.zte@gmail.com,
 qingqing.zhuo@amd.com, xinhui.pan@amd.com, rodrigo.siqueira@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, chen.haonan2@zte.com.cn,
 chiawen.huang@amd.com, wenjing.liu@amd.com, alvin.lee2@amd.com,
 jiang.xuexin@zte.com.cn, alexander.deucher@amd.com, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 08/12/2023 à 03:44, yang.guang5@zte.com.cn a écrit :
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> Convert kzalloc/memcpy operations to memdup makes for
> cleaner code and avoids memcpy() failures

Hi,

usually, function's names are written with () in commit description. 
(i.e. kzalloc()/memcpy()).

memdup should be kmemdup().

Finally the proposed change does not avoid memcpy() failures. Should it 
fail (what does it mean in this context?), kmemdup() would behave 
exactly the same.

> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 76b47f178127..867e1a0fdef6 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2264,12 +2264,10 @@ struct dc_state *dc_copy_state(struct dc_state *src_ctx)
> 
>   #ifdef CONFIG_DRM_AMD_DC_FP
>   	if (new_ctx->bw_ctx.dml2) {
> -		dml2 = kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
> -		if (!dml2)
> -			return NULL;
> -
> -		memcpy(dml2, src_ctx->bw_ctx.dml2, sizeof(struct dml2_context));
> -		new_ctx->bw_ctx.dml2 = dml2;
> +		dml2 = kmemdup(src_ctx->bw_ctx.dml2, sizeof(struct dml2_context), GFP_KERNEL);

sizeof(struct dml2_context) could be sizeof(*dlm2) to be less verbose.

CJ

> +		if (!dml2)
> +			return NULL;
> +		new_ctx->bw_ctx.dml2 = dml2;
>   	}
>   #endif
> 

