Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F317C6BD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AC26ED5C;
	Fri,  6 Mar 2020 20:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764AA6ED5C;
 Fri,  6 Mar 2020 20:05:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 17BEE20020;
 Fri,  6 Mar 2020 21:04:58 +0100 (CET)
Date: Fri, 6 Mar 2020 21:04:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 26/51] drm: Manage drm_mode_config_init with drmm_
Message-ID: <20200306200456.GB13014@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-27-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-27-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=SJz97ENfAAAA:8 a=QyXUC8HyAAAA:8 a=RnyrHZYZsAbYOj90BakA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Mon, Mar 02, 2020 at 11:26:06PM +0100, Daniel Vetter wrote:
> drm_mode_config_cleanup is idempotent, so no harm in calling this
> twice. This allows us to gradually switch drivers over by removing
> explicit drm_mode_config_cleanup calls.
> =

> With this step it's now also possible that (at least for simple
> drivers) automatic resource cleanup can be done correctly without a
> drm_driver->release hook. Therefore allow this now in
> devm_drm_dev_init().
> =

> Also with drmm_ explicit drm_driver->release hooks are kinda not the
> best option: Drivers can always just register their current release
> hook with drmm_add_action, but even better they could split them up to
> simplify the unwinding for the driver load failure case. So deprecate
> that hook to discourage future users.
> =

> v2: Fixup the example in the kerneldoc too.
> =

> v3:
> - For paranoia, double check that minor->dev =3D=3D dev in the release
>   hook, because I botched the pointer math in the drmm library.
> - Call drm_mode_config_cleanup when drmm_add_action fails, we'd be
>   missing some mutex_destroy and ida_cleanup otherwise (Laurent)
> =

> v4: Add a drmm_add_action_or_reset (like devm_ has) to encapsulate this
> pattern (Noralf).
> =

> v5: Fix oversight in the new drmm_add_action_or_reset macro (Noralf)
> =

> v4: Review from Sam:
> - drmm_mode_config_init wrapper (also suggested by Thomas)
> - improve commit message, explain better why ->relase is deprecated

The idea was to rename drm_mode_config_init() to
drmm_mode_config_init().
And then provide a wrapper for backward compatibility.
- So the kernel-doc documented function in drm_mode_config.c is the
  recommened choice
- And the wrapper in drm_mode_config.h was only for backward
  compatibility

In other words - the wrapper should be an undocumented:
static inline int drm_mode_config_init(struct drm_device *dev)
{
	return drmm_mode_config_init(dev);
}

When all users have transitioned to drmm_mode_config_init()
then the wrapper could be dropped.

With this fixed, or a good reason not to do so:

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> =

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c         | 23 +++++++----------------
>  drivers/gpu/drm/drm_managed.c     | 14 ++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c | 13 ++++++++++++-
>  include/drm/drm_managed.h         |  7 +++++++
>  include/drm/drm_mode_config.h     | 19 ++++++++++++++++++-
>  5 files changed, 58 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c709a0ce018c..a82702d0c2fb 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -98,6 +98,8 @@ static void drm_minor_alloc_release(struct drm_device *=
dev, void *data)
>  	struct drm_minor *minor =3D data;
>  	unsigned long flags;
>  =

> +	WARN_ON(dev !=3D minor->dev);
> +
>  	put_device(minor->kdev);
>  =

>  	spin_lock_irqsave(&drm_minor_lock, flags);
> @@ -267,8 +269,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   * The following example shows a typical structure of a DRM display driv=
er.
>   * The example focus on the probe() function and the other functions tha=
t is
> - * almost always present and serves as a demonstration of devm_drm_dev_i=
nit()
> - * usage with its accompanying drm_driver->release callback.
> + * almost always present and serves as a demonstration of devm_drm_dev_i=
nit().
>   *
>   * .. code-block:: c
>   *
> @@ -278,16 +279,8 @@ void drm_minor_release(struct drm_minor *minor)
>   *		struct clk *pclk;
>   *	};
>   *
> - *	static void driver_drm_release(struct drm_device *drm)
> - *	{
> - *		struct driver_device *priv =3D container_of(...);
> - *
> - *		drm_mode_config_cleanup(drm);
> - *	}
> - *
>   *	static struct drm_driver driver_drm_driver =3D {
>   *		[...]
> - *		.release =3D driver_drm_release,
>   *	};
>   *
>   *	static int driver_probe(struct platform_device *pdev)
> @@ -312,7 +305,9 @@ void drm_minor_release(struct drm_minor *minor)
>   *		}
>   *		drmm_add_final_kfree(drm, priv);
>   *
> - *		drm_mode_config_init(drm);
> + *		ret =3D drm_mode_config_init(drm);
> + *		if (ret)
> + *			return ret;
>   *
>   *		priv->userspace_facing =3D drmm_kzalloc(..., GFP_KERNEL);
>   *		if (!priv->userspace_facing)
> @@ -710,8 +705,7 @@ static void devm_drm_dev_init_release(void *data)
>   * @driver: DRM driver
>   *
>   * Managed drm_dev_init(). The DRM device initialized with this function=
 is
> - * automatically put on driver detach using drm_dev_put(). You must supp=
ly a
> - * &drm_driver.release callback to control the finalization explicitly.
> + * automatically put on driver detach using drm_dev_put().
>   *
>   * RETURNS:
>   * 0 on success, or error code on failure.
> @@ -722,9 +716,6 @@ int devm_drm_dev_init(struct device *parent,
>  {
>  	int ret;
>  =

> -	if (WARN_ON(!driver->release))
> -		return -EINVAL;
> -
>  	ret =3D drm_dev_init(dev, driver, parent);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 0883615c2088..8c5f1f03c485 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -142,6 +142,20 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
>  =

> +int __drmm_add_action_or_reset(struct drm_device *dev,
> +			       drmres_release_t action,
> +			       void *data, const char *name)
> +{
> +	int ret;
> +
> +	ret =3D __drmm_add_action(dev, action, data, name);
> +	if (ret)
> +		action(dev, data);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(__drmm_add_action_or_reset);
> +
>  void drmm_remove_action(struct drm_device *dev,
>  			drmres_release_t action,
>  			void *data)
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 08e6eff6a179..6f7005bc597f 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_print.h>
>  #include <linux/dma-resv.h>
> @@ -373,6 +374,11 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>  	return 0;
>  }
>  =

> +static void drm_mode_config_init_release(struct drm_device *dev, void *p=
tr)
> +{
> +	drm_mode_config_cleanup(dev);
> +}
> +
>  /**
>   * drm_mode_config_init - initialize DRM mode_configuration structure
>   * @dev: DRM device
> @@ -384,8 +390,10 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>   * problem, since this should happen single threaded at init time. It is=
 the
>   * driver's problem to ensure this guarantee.
>   *
> + * Cleanup is automatically handled through registering drm_mode_config_=
cleanup
> + * with drmm_add_action().
>   */
> -void drm_mode_config_init(struct drm_device *dev)
> +int drm_mode_config_init(struct drm_device *dev)
>  {
>  	mutex_init(&dev->mode_config.mutex);
>  	drm_modeset_lock_init(&dev->mode_config.connection_mutex);
> @@ -443,6 +451,9 @@ void drm_mode_config_init(struct drm_device *dev)
>  		drm_modeset_acquire_fini(&modeset_ctx);
>  		dma_resv_fini(&resv);
>  	}
> +
> +	return drmm_add_action_or_reset(dev, drm_mode_config_init_release,
> +					NULL);
>  }
>  EXPORT_SYMBOL(drm_mode_config_init);
>  =

> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 2b1ba2ad5582..1e6291407586 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -18,6 +18,13 @@ int __must_check __drmm_add_action(struct drm_device *=
dev,
>  				   drmres_release_t action,
>  				   void *data, const char *name);
>  =

> +#define drmm_add_action_or_reset(dev, action, data) \
> +	__drmm_add_action_or_reset(dev, action, data, #action)
> +
> +int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
> +					    drmres_release_t action,
> +					    void *data, const char *name);
> +
>  void drmm_remove_action(struct drm_device *dev,
>  			drmres_release_t action,
>  			void *data);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 3bcbe30339f0..aa6288bf04df 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -929,7 +929,24 @@ struct drm_mode_config {
>  	const struct drm_mode_config_helper_funcs *helper_private;
>  };
>  =

> -void drm_mode_config_init(struct drm_device *dev);
> +int drm_mode_config_init(struct drm_device *dev);
> +
> +/**
> + * drmm_mode_config_init - managed DRM mode_configuration structure
> + * 	initialization
> + * @dev: DRM device
> + *
> + * This is a managed version of drm_mode_config_init(). The only differe=
nce is
> + * that this version is annotated with __must_check, to make sure that d=
rivers
> + * can actually rely on the automatic cleanup.
> + *
> + * Returns: 0 on success, negative error value on failure.
> + */
> +static inline __must_check int drmm_mode_config_init(struct drm_device *=
dev)
> +{
> +	return drm_mode_config_init(dev);
> +}
> +
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  =

> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
