Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFA1A0AE7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 12:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AC86E819;
	Tue,  7 Apr 2020 10:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFF36E81B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 10:16:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BCA0120021;
 Tue,  7 Apr 2020 12:16:02 +0200 (CEST)
Date: Tue, 7 Apr 2020 12:16:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/10] drm/fb-helper: Remove return value from
 drm_fbdev_generic_setup()
Message-ID: <20200407101601.GB12686@ravnborg.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406134405.6232-11-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=rYlgagNWpvDK6VdGh8kA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Mon, Apr 06, 2020 at 03:44:05PM +0200, Thomas Zimmermann wrote:
> Generic fbdev emulation is a DRM client. Drivers should invoke the
> setup function, but not depend on its success. Hence remove the return
> value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

If this goes in as-is then it is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

You could apply the series now to avoid letting a doc update
postponse the others.
And then make the doc update a follow-up patch.

	Sam


> ---
>  drivers/gpu/drm/drm_fb_helper.c | 18 ++++++++----------
>  include/drm/drm_fb_helper.h     |  5 +++--
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 165c8dab50797..24db97eee53d4 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2186,11 +2186,9 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>   * Setup will be retried on the next hotplug event.
>   *
>   * The fbdev is destroyed by drm_dev_unregister().
> - *
> - * Returns:
> - * Zero on success or negative error code on failure.
>   */
> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +void drm_fbdev_generic_setup(struct drm_device *dev,
> +			     unsigned int preferred_bpp)
>  {
>  	struct drm_fb_helper *fb_helper;
>  	int ret;
> @@ -2198,17 +2196,19 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  	WARN(dev->fb_helper, "fb_helper is already set!\n");
>  
>  	if (!drm_fbdev_emulation)
> -		return 0;
> +		return;
>  
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -	if (!fb_helper)
> -		return -ENOMEM;
> +	if (!fb_helper) {
> +		drm_err(dev, "Failed to allocate fb_helper\n");
> +		return;
> +	}
>  
>  	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>  	if (ret) {
>  		kfree(fb_helper);
>  		drm_err(dev, "Failed to register client: %d\n", ret);
> -		return ret;
> +		return;
>  	}
>  
>  	if (!preferred_bpp)
> @@ -2222,8 +2222,6 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>  
>  	drm_client_register(&fb_helper->client);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
>  
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 208dbf87afa3e..fb037be83997d 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -269,7 +269,8 @@ int drm_fb_helper_debug_leave(struct fb_info *info);
>  void drm_fb_helper_lastclose(struct drm_device *dev);
>  void drm_fb_helper_output_poll_changed(struct drm_device *dev);
>  
> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp);
> +void drm_fbdev_generic_setup(struct drm_device *dev,
> +			     unsigned int preferred_bpp);
>  #else
>  static inline void drm_fb_helper_prepare(struct drm_device *dev,
>  					struct drm_fb_helper *helper,
> @@ -443,7 +444,7 @@ static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
>  {
>  }
>  
> -static inline int
> +static inline void
>  drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  {
>  	return 0;
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
