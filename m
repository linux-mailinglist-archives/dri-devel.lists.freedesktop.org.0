Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E005D2C144B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 20:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293D86E077;
	Mon, 23 Nov 2020 19:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7C46E077
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 19:23:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BC92A20060;
 Mon, 23 Nov 2020 20:23:38 +0100 (CET)
Date: Mon, 23 Nov 2020 20:23:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 05/10] drm/fb-helper: Return early in dirty worker
Message-ID: <20201123192337.GD664585@ravnborg.org>
References: <20201120102545.4047-1-tzimmermann@suse.de>
 <20201120102545.4047-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120102545.4047-6-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=N77woC-ckk8JCKGPYDAA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 11:25:40AM +0100, Thomas Zimmermann wrote:
> Returning early in the dirty worker if no update is required makes the
> code more readable. No functional changes are made.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

It is a damage worker (both subject and changelog).

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 87d4759de04a..c9018ffff5f9 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -407,24 +407,23 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
>  	clip->x2 = clip->y2 = 0;
>  	spin_unlock_irqrestore(&helper->damage_lock, flags);
>  
> -	/* call dirty callback only when it has been really touched */
> -	if (clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2) {
> -
> -		/* Generic fbdev uses a shadow buffer */
> -		if (helper->buffer) {
> -			ret = drm_client_buffer_vmap(helper->buffer, &map);
> -			if (ret)
> -				return;
> -			drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
> -		}
> -
> -		if (helper->fb->funcs->dirty)
> -			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> -						 &clip_copy, 1);
> +	/* Call damage handlers only if necessary */
> +	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
> +		return;
>  
> -		if (helper->buffer)
> -			drm_client_buffer_vunmap(helper->buffer);
> +	/* Generic fbdev uses a shadow buffer */
> +	if (helper->buffer) {
> +		ret = drm_client_buffer_vmap(helper->buffer, &map);
> +		if (ret)
> +			return;
> +		drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
>  	}
> +
> +	if (helper->fb->funcs->dirty)
> +		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> +
> +	if (helper->buffer)
> +		drm_client_buffer_vunmap(helper->buffer);
>  }
>  
>  /**
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
