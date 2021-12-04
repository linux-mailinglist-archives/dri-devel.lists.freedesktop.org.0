Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA224693BB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159737AB7F;
	Mon,  6 Dec 2021 10:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1698 seconds by postgrey-1.36 at gabe;
 Sat, 04 Dec 2021 13:11:11 UTC
Received: from mail.sig21.net (mail.sig21.net [217.197.84.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AF16EE97
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 13:11:11 +0000 (UTC)
Received: from localhorst ([127.0.0.1])
 by mail.sig21.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <js@sig21.net>)
 id 1mtULv-0001cO-Gx ; Sat, 04 Dec 2021 13:41:19 +0100
Received: from js by abc.local with local (Exim 4.95)
 (envelope-from <js@sig21.net>) id 1mtULp-0005XL-2J;
 Sat, 04 Dec 2021 13:41:13 +0100
Date: Sat, 4 Dec 2021 13:41:13 +0100
From: Johannes Stezenbach <js@sig21.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] Revert "drm/fb-helper: improve DRM fbdev emulation
 device names"
Message-ID: <Yath6T5ET17GbkI7@sig21.net>
References: <20211020165740.3011927-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020165740.3011927-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 20, 2021 at 06:57:40PM +0200, Javier Martinez Canillas wrote:
> This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.
> 
> That change attempted to improve the DRM drivers fbdev emulation device
> names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.
> 
> But unfortunately, there are user-space programs such as pm-utils that
> match against the fbdev names and so broke after the mentioned commit.
> 
> Since the names in /proc/fb are used by tools that consider it an uAPI,
> let's restore the old names even when this lead to silly names like the
> one mentioned above.

I would like to ask about the fate of this patch. It doesn't
seem to have been picked up by anyone, does it?


Thanks,
Johannes


> Fixes: b3484d2b03e4 ("drm/fb-helper: improve DRM fbdev emulation device names")
> Reported-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
> 
> Changes in v2:
> - Add a comment explaining that the current /proc/fb names are an uAPI.
> - Add a Fixes: tag so it can be cherry-picked by stable kernels.
> - Add Ville Syrjälä's Reviewed-by tag.
> 
>  drivers/gpu/drm/drm_fb_helper.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8e7a124d6c5a..22bf690910b2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1743,7 +1743,13 @@ void drm_fb_helper_fill_info(struct fb_info *info,
>  			       sizes->fb_width, sizes->fb_height);
>  
>  	info->par = fb_helper;
> -	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
> +	/*
> +	 * The DRM drivers fbdev emulation device name can be confusing if the
> +	 * driver name also has a "drm" suffix on it. Leading to names such as
> +	 * "simpledrmdrmfb" in /proc/fb. Unfortunately, it's an uAPI and can't
> +	 * be changed due user-space tools (e.g: pm-utils) matching against it.
> +	 */
> +	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
>  		 fb_helper->dev->driver->name);
>  
>  }
> -- 
> 2.31.1
> 
> 
