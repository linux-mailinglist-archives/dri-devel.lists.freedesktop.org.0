Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1B600E50
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679BA10E412;
	Mon, 17 Oct 2022 11:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E115510E41B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NvIypcf++XByC9TgSnVXBr4g6xBHmuiYoS+7+wMkhZo=; b=Wc9+EcO4xnYX8jHmK+Z+Jgxf+b
 qGT9mc00AXjyfUK+e9JOqQkbE4KyL8+WdBt0o96fJU4eaSMCzgnlECL+cDHf0AZ25QxBoO5CmtD0+
 gYzVtkIl90uOC1G9XArgJzXhfnmzD15NzvUSF3z0ozbdSqaXYO8lMwPJuWPPoIMcOrVpC3vM+7adL
 duj/VUCDN3RyhjSiE0bLhG10SxpIy/pQCzbTGNicf6WnD3rdYHwJDdU7b2mPaw5iEFZONMM415+UD
 OO0+KCjjyiyTP802S6RfDaamEuNu7OAm+wbgu1ILmUl4nmqfNoJ1eA4lxdX+fR0Ohsf959nigdulK
 ZCzxjv9A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55615
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okOkU-00066l-LD; Mon, 17 Oct 2022 13:57:38 +0200
Message-ID: <eec0cfc5-79bd-38db-8e8f-033f124cc286@tronnes.org>
Date: Mon, 17 Oct 2022 13:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 4/5] drm/repaper: Implement {begin,end}_fb_access helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, hdegoede@redhat.com, david@lechnology.com,
 airlied@redhat.com, sean@poorly.run
References: <20221017111510.20818-1-tzimmermann@suse.de>
 <20221017111510.20818-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221017111510.20818-5-tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 17.10.2022 13.15, skrev Thomas Zimmermann:
> Call drm_gem_fb_begin_cpu_access() and drm_gem_fb_end_cpu_access() in
> the simple pipe's {begin,end}_fb_access helpers. This allows to abort
> commits correctly after observing an error.
> 
> Remove the corresponding CPU-access calls from the driver's damage
> handler. It runs during the atomic-apply phase when it's already too
> late to handle errors.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index e62f4d16b2c6b..e0f1ac8ab2186 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -539,10 +539,6 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
>  		goto out_exit;
>  	}
>  
> -	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> -	if (ret)
> -		goto out_free;
> -
>  	iosys_map_set_vaddr(&dst, buf);
>  	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
>  	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);

You forgot to remove the drm_gem_fb_end_cpu_access() call here.

> @@ -596,8 +592,6 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
>  			}
>  	}
>  
> -out_free:
> -	kfree(buf);

The kfree() needs to stay.

With that fixed:

Acked-by: Noralf Trønnes <noralf@tronnes.org>

>  out_exit:
>  	drm_dev_exit(idx);
>  
> @@ -839,11 +833,35 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>  		repaper_fb_dirty(state->fb);
>  }
>  
> +static int repaper_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
> +					struct drm_plane_state *plane_state)
> +{
> +	struct drm_framebuffer *fb = plane_state->fb;
> +
> +	if (!fb)
> +		return 0;
> +
> +	return drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static void repaper_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
> +				       struct drm_plane_state *plane_state)
> +{
> +	struct drm_framebuffer *fb = plane_state->fb;
> +
> +	if (!fb)
> +		return;
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
>  static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
>  	.mode_valid = repaper_pipe_mode_valid,
>  	.enable = repaper_pipe_enable,
>  	.disable = repaper_pipe_disable,
>  	.update = repaper_pipe_update,
> +	.begin_fb_access = repaper_pipe_begin_fb_access,
> +	.end_fb_access = repaper_pipe_end_fb_access,
>  };
>  
>  static int repaper_connector_get_modes(struct drm_connector *connector)
