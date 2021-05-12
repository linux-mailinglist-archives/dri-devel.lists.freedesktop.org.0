Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894E37B631
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD906E207;
	Wed, 12 May 2021 06:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2D6E0DE;
 Wed, 12 May 2021 06:34:38 +0000 (UTC)
Received: from Normandy.localdomain (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 46A19B00592;
 Wed, 12 May 2021 08:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620801276;
 bh=Qh+Kw2XY7YRpt085r9aB8KMAvN5of6Ggxs62130FJgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9ybmQbeZM9xf5k940y/d2LGUSVyIOO/dlHj260THvJM90r3FOKT3Rbz7FzabOsqA
 2sVnNGIyLsn6LRFB2A4Ta27pF6LgJ0d8EPQTSjbjQr1gm6o89G1AWLnCJJrxsKH6WM
 w+rtj11qHNpkO8ca5g9o2ZSO2qq7ZPxnR0/s2Z5Q9kXuZmonNE8x0HW8PlXXJcC+u2
 n7NuG5zodut+SBm+ZRuuJ18jthZzgIR76gmVQs4TNno0pCkSs4obNu3lWGozVEGpVq
 zTDgklteO/9qzR4WNGqPUqM23LmOirPrpI0+JnWgbAThNLzAIBXyMpqMBOVtHUxQHU
 Jc+5DFO/vLjDw==
Date: Wed, 12 May 2021 08:34:18 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [Nouveau] [PATCH v2 2/2] drm/nouveau: Fix error return code in
 nouveau_backlight_init()
Message-ID: <20210512063418.mgec2b5x73n6iwr6@Normandy.localdomain>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511082841.4181-3-thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Pierre Moreau <pierre.morrow@free.fr>

On 2021-05-11 — 16:28, Zhen Lei wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Suggested-by: Pierre Moreau <pierre.morrow@free.fr>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index d1c998e645fb4b6..f0856adbe775624 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -47,20 +47,20 @@ struct nouveau_backlight {
>  	int id;
>  };
>  
> -static bool
> +static int
>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>  			   struct nouveau_backlight *bl)
>  {
>  	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
>  
>  	if (nb < 0)
> -		return false;
> +		return nb;
>  	if (nb > 0)
>  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>  	else
>  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
>  	bl->id = nb;
> -	return true;
> +	return 0;
>  }
>  
>  static int
> @@ -273,7 +273,8 @@ nouveau_backlight_init(struct drm_connector *connector)
>  	if (!bl)
>  		return -ENOMEM;
>  
> -	if (!nouveau_get_backlight_name(backlight_name, bl)) {
> +	ret = nouveau_get_backlight_name(backlight_name, bl);
> +	if (ret) {
>  		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
>  		goto fail_alloc;
>  	}
> -- 
> 2.26.0.106.g9fadedd
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
