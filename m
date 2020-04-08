Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB71A1D97
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B726E9D5;
	Wed,  8 Apr 2020 08:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEEC6E9D5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:50:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 26E6420027;
 Wed,  8 Apr 2020 10:50:51 +0200 (CEST)
Date: Wed, 8 Apr 2020 10:50:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/10] drm/fb-helper: Remove return value from
 drm_fbdev_generic_setup()
Message-ID: <20200408085044.GA23972@ravnborg.org>
References: <20200408082641.590-1-tzimmermann@suse.de>
 <20200408082641.590-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408082641.590-11-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8 a=20KFwNOVAAAA:8 a=WWwATztPrksA4Y1E-tMA:9
 a=QzO-csg1wH-vQt3R:21 a=suLgOCcywbrmcIq3:21 a=wPNLvfGTeEIA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

You missed my ack on the first 9 patches:
https://lore.kernel.org/dri-devel/20200407101354.GA12686@ravnborg.org/
Not that it matters as others have acked/reviewed them.

On Wed, Apr 08, 2020 at 10:26:41AM +0200, Thomas Zimmermann wrote:
> Generic fbdev emulation is a DRM client. Drivers should invoke the
> setup function, but not depend on its success. Hence remove the return
> value.
> =

> v2:
> 	* warn if fbdev device has not been registered yet
> 	* document the new behavior
> 	* convert the existing warning to the new dev_ interface
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 25 +++++++++++++------------
>  include/drm/drm_fb_helper.h     |  5 +++--
>  2 files changed, 16 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 165c8dab50797..97f5e43837486 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2169,7 +2169,9 @@ static const struct drm_client_funcs drm_fbdev_clie=
nt_funcs =3D {
>   *                 @dev->mode_config.preferred_depth is used if this is =
zero.
>   *
>   * This function sets up generic fbdev emulation for drivers that suppor=
ts
> - * dumb buffers with a virtual address and that can be mmap'ed.
> + * dumb buffers with a virtual address and that can be mmap'ed. It's sup=
posed
> + * to run after the DRM driver registered the new DRM device with
> + * drm_dev_register().
OR maybe be more explicit - something like:
drm_fbdev_generic_setup() shall be called after the DRM is registered
with drm_dev_register().

Either way is fine.

	Sam

>   *
>   * Restore, hotplug events and teardown are all taken care of. Drivers t=
hat do
>   * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() them=
selves.
> @@ -2186,29 +2188,30 @@ static const struct drm_client_funcs drm_fbdev_cl=
ient_funcs =3D {
>   * Setup will be retried on the next hotplug event.
>   *
>   * The fbdev is destroyed by drm_dev_unregister().
> - *
> - * Returns:
> - * Zero on success or negative error code on failure.
>   */
> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferr=
ed_bpp)
> +void drm_fbdev_generic_setup(struct drm_device *dev,
> +			     unsigned int preferred_bpp)
>  {
>  	struct drm_fb_helper *fb_helper;
>  	int ret;
>  =

> -	WARN(dev->fb_helper, "fb_helper is already set!\n");
> +	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> +	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
>  =

>  	if (!drm_fbdev_emulation)
> -		return 0;
> +		return;
>  =

>  	fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -	if (!fb_helper)
> -		return -ENOMEM;
> +	if (!fb_helper) {
> +		drm_err(dev, "Failed to allocate fb_helper\n");
> +		return;
> +	}
>  =

>  	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_cl=
ient_funcs);
>  	if (ret) {
>  		kfree(fb_helper);
>  		drm_err(dev, "Failed to register client: %d\n", ret);
> -		return ret;
> +		return;
>  	}
>  =

>  	if (!preferred_bpp)
> @@ -2222,8 +2225,6 @@ int drm_fbdev_generic_setup(struct drm_device *dev,=
 unsigned int preferred_bpp)
>  		drm_dbg_kms(dev, "client hotplug ret=3D%d\n", ret);
>  =

>  	drm_client_register(&fb_helper->client);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
>  =

> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 208dbf87afa3e..fb037be83997d 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -269,7 +269,8 @@ int drm_fb_helper_debug_leave(struct fb_info *info);
>  void drm_fb_helper_lastclose(struct drm_device *dev);
>  void drm_fb_helper_output_poll_changed(struct drm_device *dev);
>  =

> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferr=
ed_bpp);
> +void drm_fbdev_generic_setup(struct drm_device *dev,
> +			     unsigned int preferred_bpp);
>  #else
>  static inline void drm_fb_helper_prepare(struct drm_device *dev,
>  					struct drm_fb_helper *helper,
> @@ -443,7 +444,7 @@ static inline void drm_fb_helper_output_poll_changed(=
struct drm_device *dev)
>  {
>  }
>  =

> -static inline int
> +static inline void
>  drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_b=
pp)
>  {
>  	return 0;
> -- =

> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
