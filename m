Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C618367BD7E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44D10E39C;
	Wed, 25 Jan 2023 20:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8C10E18C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FddS8pQv/6N7S7CMs/WawleURHMuXHTM9+g9+0jG880=;
 b=Q4DqmMj2qG61SlFw8qecn3Zv3ANavPIkleUeaqKg3lhum5sea6L8QtfPvyqngR5LL4vUeNV90m09p
 uonsBiiKhXq8Pk7KocmQNCqG/ABZZ0gmWkhRuK508C1z/FPUxdGpn4Y4c3R51yU65h2v3iqC1XGhYw
 UUXjUuRZcKK7Zzu3aUyu2cbEaj6f0eZwKYd2y+q446pSkaw+YF0whvhAY4FVvF7cBSxSFzzku8h7RI
 qtz9sDUumNfpmPAlb1Hs8II2CEMT1P4iUgG5HdAGjVBTaLISGdeSZbitv7apTi1raOCH9jG1gsq1t2
 krPmMWYJSnswQQ6WRPKS3C68eOlqFnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FddS8pQv/6N7S7CMs/WawleURHMuXHTM9+g9+0jG880=;
 b=8xlT7TEKGtLozhjeIkvi2rGfmQKeQK7NF0ZFx3Gf7Wf3kJllRuw4VQMYF7cfSsp56qg37EFB7iOLW
 ezqMK+kDQ==
X-HalOne-ID: e844ec46-9cf2-11ed-a54d-3df7d73157c4
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id e844ec46-9cf2-11ed-a54d-3df7d73157c4;
 Wed, 25 Jan 2023 20:57:43 +0000 (UTC)
Date: Wed, 25 Jan 2023 21:57:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 02/10] drm/client: Add hotplug_failed flag
Message-ID: <Y9GXxcwSnuftoUQh@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125200415.14123-3-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jan 25, 2023 at 09:04:07PM +0100, Thomas Zimmermann wrote:
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper,
I failed to find where we clear the pointers. What do I miss?
(I had assumed we would stop clearing the pointers after this change).

	Sam

which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_client.c        | 5 +++++
>  drivers/gpu/drm/drm_fbdev_generic.c | 4 ----
>  include/drm/drm_client.h            | 8 ++++++++
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 09ac191c202d..009e7b10455c 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -208,8 +208,13 @@ void drm_client_dev_hotplug(struct drm_device *dev)
>  		if (!client->funcs || !client->funcs->hotplug)
>  			continue;
>  
> +		if (client->hotplug_failed)
> +			continue;
> +
>  		ret = client->funcs->hotplug(client);
>  		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
> +		if (ret)
> +			client->hotplug_failed = true;
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 3d455a2e3fb5..135d58b8007b 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -382,10 +382,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	struct drm_device *dev = client->dev;
>  	int ret;
>  
> -	/* Setup is not retried if it has failed */
> -	if (!fb_helper->dev && fb_helper->funcs)
> -		return 0;
> -
>  	if (dev->fb_helper)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 4fc8018eddda..39482527a775 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -106,6 +106,14 @@ struct drm_client_dev {
>  	 * @modesets: CRTC configurations
>  	 */
>  	struct drm_mode_set *modesets;
> +
> +	/**
> +	 * @hotplug failed:
> +	 *
> +	 * Set by client hotplug helpers if the hotplugging failed
> +	 * before. It is usually not tried again.
> +	 */
> +	bool hotplug_failed;
>  };
>  
>  int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
> -- 
> 2.39.0
