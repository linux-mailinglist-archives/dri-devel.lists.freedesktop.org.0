Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18945EFAFE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DEE10EACA;
	Thu, 29 Sep 2022 16:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0EC10EAC9;
 Thu, 29 Sep 2022 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Xaq4k1m7DmXrhS0yatltQ3u7OYSHA8MZ+pTtIuY0h+o=; b=t2WNTiWbOULZA+DVCue417StiQ
 9U6hQkWbnCD21t9/FLjeLQj4tmLUtClIkf9wAqmQsheoyPFGDQSLjgvdNkQkbwzjjZkDH/526kSiR
 bDBlx0E+ttCTXvW/SidO5w7Bp7BZ/bQpY/WYc8b6kHeCAKFxjOd+0Df1KjGJAxk9ixavA3Tsb7ybh
 YfDQkEWfUbMJgBF/0CIrZHbdMY9szPy3+a8HwgP5daod3Xf6m5SsyeOx285hTuJeKEQgWIcfZdBpS
 aiZTuy0FMI9hopRg5NYdmR7wE7X5rXKWK9G6Lp5bBtrjXuzR6jmPzOCghtyfVczc2GFNJmplq0mEW
 hUfMOASg==;
Received: from [2601:1c2:d80:3110::a2e7]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1odwWm-004EZI-R7; Thu, 29 Sep 2022 16:36:48 +0000
Message-ID: <81f8b954-ebb7-fcb6-4bdf-d5992e2be80a@infradead.org>
Date: Thu, 29 Sep 2022 09:36:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/msm: Fix build break with recent mm tree
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220929161404.2769414-1-robdclark@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220929161404.2769414-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/29/22 09:14, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> 9178e3dcb121 ("mm: discard __GFP_ATOMIC") removed __GFP_ATOMIC,
> replacing it with a check for not __GFP_DIRECT_RECLAIM.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> Sorry, this was reported by Stephen earlier in the month, while
> I was on the other side of the globe and jetlagged.  Unfortunately
> I forgot about it by the time I got back home.  Applying this patch
> after 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
> but before or after 9178e3dcb121 ("mm: discard __GFP_ATOMIC") should
> resolve the build breakage.
> 
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 473ced14e520..8f83454ceedf 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -27,7 +27,7 @@ static bool can_swap(void)
>  
>  static bool can_block(struct shrink_control *sc)
>  {
> -	if (sc->gfp_mask & __GFP_ATOMIC)
> +	if (!(sc->gfp_mask & __GFP_DIRECT_RECLAIM))
>  		return false;
>  	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
>  }

-- 
~Randy
