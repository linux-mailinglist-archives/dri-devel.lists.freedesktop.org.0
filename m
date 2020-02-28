Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D576D1731C9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581E16EDFC;
	Fri, 28 Feb 2020 07:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE876EDFC;
 Fri, 28 Feb 2020 07:30:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59C1CB1EF;
 Fri, 28 Feb 2020 07:30:44 +0000 (UTC)
Subject: Re: [PATCH 26/51] drm: Manage drm_mode_config_init with drmm_
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-27-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <895afc5f-e8a2-8698-f90b-8a00906988e6@suse.de>
Date: Fri, 28 Feb 2020 08:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227181522.2711142-27-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, m.felsch@pengutronix.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============2026401878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2026401878==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="upteQFS0xnC10YwzEkkr8tqULvveuZ2zz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--upteQFS0xnC10YwzEkkr8tqULvveuZ2zz
Content-Type: multipart/mixed; boundary="S2bFu1L66VD202iCGiby9mwLmi0M93ZoK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter
 <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <895afc5f-e8a2-8698-f90b-8a00906988e6@suse.de>
Subject: Re: [PATCH 26/51] drm: Manage drm_mode_config_init with drmm_
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-27-daniel.vetter@ffwll.ch>
In-Reply-To: <20200227181522.2711142-27-daniel.vetter@ffwll.ch>

--S2bFu1L66VD202iCGiby9mwLmi0M93ZoK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 27.02.20 um 19:14 schrieb Daniel Vetter:
> drm_mode_config_cleanup is idempotent, so no harm in calling this
> twice. This allows us to gradually switch drivers over by removing
> explicit drm_mode_config_cleanup calls.
>=20
> With this step it's not also possible that (at least for simple
> drivers) automatic resource cleanup can be done correctly without a
> drm_driver->release hook. Therefore allow this now in
> devm_drm_dev_init().
>=20
> Also with drmm_ explicit drm_driver->release hooks are kinda not the
> best option, so deprecate that hook to discourage future users.
>=20
> v2: Fixup the example in the kerneldoc too.
>=20
> v3:
> - For paranoia, double check that minor->dev =3D=3D dev in the release
>   hook, because I botched the pointer math in the drmm library.
> - Call drm_mode_config_cleanup when drmm_add_action fails, we'd be
>   missing some mutex_destroy and ida_cleanup otherwise (Laurent)
>=20
> v4: Add a drmm_add_action_or_reset (like devm_ has) to encapsulate this=

> pattern (Noralf).
>=20
> v5: Fix oversight in the new add_action_or_reset macro (Noralf)
>=20
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c         | 23 +++++++----------------
>  drivers/gpu/drm/drm_managed.c     | 14 ++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c | 13 ++++++++++++-
>  include/drm/drm_managed.h         |  7 +++++++
>  include/drm/drm_mode_config.h     |  2 +-
>  5 files changed, 41 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf40864d4a6..bb326b9bcde0 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -98,6 +98,8 @@ static void drm_minor_alloc_release(struct drm_device=
 *dev, void *data)
>  	struct drm_minor *minor =3D data;
>  	unsigned long flags;
> =20
> +	WARN_ON(dev !=3D minor->dev);
> +
>  	put_device(minor->kdev);
> =20
>  	spin_lock_irqsave(&drm_minor_lock, flags);
> @@ -267,8 +269,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   * The following example shows a typical structure of a DRM display dr=
iver.
>   * The example focus on the probe() function and the other functions t=
hat is
> - * almost always present and serves as a demonstration of devm_drm_dev=
_init()
> - * usage with its accompanying drm_driver->release callback.
> + * almost always present and serves as a demonstration of devm_drm_dev=
_init().
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
>   * Managed drm_dev_init(). The DRM device initialized with this functi=
on is
> - * automatically put on driver detach using drm_dev_put(). You must su=
pply a
> - * &drm_driver.release callback to control the finalization explicitly=
=2E
> + * automatically put on driver detach using drm_dev_put().
>   *
>   * RETURNS:
>   * 0 on success, or error code on failure.
> @@ -722,9 +716,6 @@ int devm_drm_dev_init(struct device *parent,
>  {
>  	int ret;
> =20
> -	if (WARN_ON(!driver->release))
> -		return -EINVAL;
> -
>  	ret =3D drm_dev_init(dev, driver, parent);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> index 626656369f0b..6376be01bbc8 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -134,6 +134,20 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
> =20
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
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mo=
de_config.c
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
> @@ -373,6 +374,11 @@ static int drm_mode_create_standard_properties(str=
uct drm_device *dev)
>  	return 0;
>  }
> =20
> +static void drm_mode_config_init_release(struct drm_device *dev, void =
*ptr)
> +{
> +	drm_mode_config_cleanup(dev);
> +}
> +
>  /**
>   * drm_mode_config_init - initialize DRM mode_configuration structure
>   * @dev: DRM device
> @@ -384,8 +390,10 @@ static int drm_mode_create_standard_properties(str=
uct drm_device *dev)
>   * problem, since this should happen single threaded at init time. It =
is the
>   * driver's problem to ensure this guarantee.
>   *
> + * Cleanup is automatically handled through registering drm_mode_confi=
g_cleanup
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

It might be a bit late in the review cycle, but could this function be
renamed to drmm_mode_config_init() to reflect the garbage-collected
implementation?

Best regards
Thomas

> =20
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 2b1ba2ad5582..1e6291407586 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -18,6 +18,13 @@ int __must_check __drmm_add_action(struct drm_device=
 *dev,
>  				   drmres_release_t action,
>  				   void *data, const char *name);
> =20
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
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_confi=
g.h
> index 3bcbe30339f0..160a3e4b51c3 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -929,7 +929,7 @@ struct drm_mode_config {
>  	const struct drm_mode_config_helper_funcs *helper_private;
>  };
> =20
> -void drm_mode_config_init(struct drm_device *dev);
> +int drm_mode_config_init(struct drm_device *dev);
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--S2bFu1L66VD202iCGiby9mwLmi0M93ZoK--

--upteQFS0xnC10YwzEkkr8tqULvveuZ2zz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5YwZ8ACgkQaA3BHVML
eiMEZAf/SELGzQlAQ5CyDBiQwWCLEQQGWNeXoV7dEThI0PF3rllxlx9KSdA7g6dO
izEedY19NIv87xZ1wdNxoisRCb+bG+d6a3c1v7WUySjgDZY5URm5RZitbrajq0hQ
RFBBkwi8W3y5SX3TyjrGS3zyE8IRtHwWjw+WWyP4Jo6fmhGIX//IFywcMP5BQCW7
qhKv8w35UauWIXW5aadywjJl+tW+K0LkQbVMzY4LGck5prT8eTocO+DmhMEfB41Z
ce5VYMgQVBysgy6A6vXmfbzccmx6dXNDXzvY9iPY0u885Jz82h8VxEgYqteLBA0B
STD0ocl+NhmdBLMcSWlTZhM+sWl4uQ==
=BTQp
-----END PGP SIGNATURE-----

--upteQFS0xnC10YwzEkkr8tqULvveuZ2zz--

--===============2026401878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2026401878==--
