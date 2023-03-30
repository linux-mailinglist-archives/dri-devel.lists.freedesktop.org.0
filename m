Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BCE6D046D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47AD10E2FC;
	Thu, 30 Mar 2023 12:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AB810E2C2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:13:29 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A71526E1;
 Thu, 30 Mar 2023 14:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680178408;
 bh=EEsfeAezfNpRz5Ep/KQBvnWp2DzgYCD+mLYXA6Ute7M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGilwWGqrRTzvPXUBQjNj1B6yzItW2DJSf+q6kA1FA7+RDUnIc2svVa006WdGbDjV
 +vCTI7o2VgNupHLvM4Yn1m/fYo6zzJgiUJUxqxGrm18/88Rq2RVVa7CT2373C7cgca
 d4RI2WNgekfgRbLvEOneYypNK4daFcoF477CeQEs=
Message-ID: <719ef7ad-1674-bb29-d2cf-ff7db800686c@ideasonboard.com>
Date: Thu, 30 Mar 2023 15:13:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/6] drm/omapdrm: Initialize fbdev DRM client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-6-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:32, Thomas Zimmermann wrote:
> Initialize the fbdev client in the fbdev code with empty helper
> functions. Also clean up the client. The helpers will later
> implement various functionality of the DRM client. No functional
> changes.

I don't see this doing any cleanups.

I think this could be as well merged to the next patch, as this is such 
a short one.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 33 +++++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 79e417b391bf..f0e35f4764a7 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -221,6 +221,30 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi)
>   	return fbi->par;
>   }
>   
> +/*
> + * struct drm_client
> + */
> +
> +static void omap_fbdev_client_unregister(struct drm_client_dev *client)
> +{ }
> +
> +static int omap_fbdev_client_restore(struct drm_client_dev *client)
> +{
> +	return 0;
> +}
> +
> +static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
> +{
> +	return 0;
> +}
> +
> +static const struct drm_client_funcs omap_fbdev_client_funcs = {
> +	.owner		= THIS_MODULE,
> +	.unregister	= omap_fbdev_client_unregister,
> +	.restore	= omap_fbdev_client_restore,
> +	.hotplug	= omap_fbdev_client_hotplug,
> +};
> +
>   /* initialize fbdev helper */
>   void omap_fbdev_init(struct drm_device *dev)
>   {
> @@ -242,10 +266,14 @@ void omap_fbdev_init(struct drm_device *dev)
>   
>   	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
>   
> -	ret = drm_fb_helper_init(dev, helper);
> +	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
>   	if (ret)
>   		goto fail;
>   
> +	ret = drm_fb_helper_init(dev, helper);
> +	if (ret)
> +		goto err_drm_client_release;
> +
>   	ret = drm_fb_helper_initial_config(helper);
>   	if (ret)
>   		goto fini;
> @@ -254,6 +282,8 @@ void omap_fbdev_init(struct drm_device *dev)
>   
>   fini:
>   	drm_fb_helper_fini(helper);
> +err_drm_client_release:
> +	drm_client_release(&helper->client);
>   fail:
>   	drm_fb_helper_unprepare(helper);
>   	kfree(fbdev);
> @@ -291,6 +321,7 @@ void omap_fbdev_fini(struct drm_device *dev)
>   	if (fb)
>   		drm_framebuffer_remove(fb);
>   
> +	drm_client_release(&helper->client);
>   	drm_fb_helper_unprepare(helper);
>   	kfree(fbdev);
>   

