Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B127A9BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 10:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFF66E10B;
	Mon, 28 Sep 2020 08:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C32A6E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:40:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BD44B295;
 Mon, 28 Sep 2020 08:40:29 +0000 (UTC)
Subject: Re: [PATCH 8/9] drm: Add infrastructure for platform devices
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-9-tzimmermann@suse.de>
 <20200629092741.GR3278063@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a43a9c67-a659-fb85-928d-0e51e6ec3479@suse.de>
Date: Mon, 28 Sep 2020 10:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200629092741.GR3278063@phenom.ffwll.local>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0875250816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0875250816==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="41D7CsztXTAoOBI1mwJPuCr7wDIbyxV28"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--41D7CsztXTAoOBI1mwJPuCr7wDIbyxV28
Content-Type: multipart/mixed; boundary="3iL9DFLkqrxmaNSMp1U3PiIjVyoQyFFiC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 kraxel@redhat.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 sam@ravnborg.org, emil.l.velikov@gmail.com, noralf@tronnes.org,
 geert+renesas@glider.be, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <a43a9c67-a659-fb85-928d-0e51e6ec3479@suse.de>
Subject: Re: [PATCH 8/9] drm: Add infrastructure for platform devices
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-9-tzimmermann@suse.de>
 <20200629092741.GR3278063@phenom.ffwll.local>
In-Reply-To: <20200629092741.GR3278063@phenom.ffwll.local>

--3iL9DFLkqrxmaNSMp1U3PiIjVyoQyFFiC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.06.20 um 11:27 schrieb Daniel Vetter:
> On Thu, Jun 25, 2020 at 02:00:10PM +0200, Thomas Zimmermann wrote:
>> Platform devices might operate on firmware framebuffers, such as VESA =
or
>> EFI. Before a native driver for the graphics hardware can take over th=
e
>> device, it has to remove any platform driver that operates on the firm=
ware
>> framebuffer. Platform helpers provide the infrastructure for platform
>> drivers to acquire firmware framebuffers, and for native drivers to re=
move
>> them lateron.
>>
>> It works similar to the related fbdev mechanism. During initialization=
, the
>> platform driver acquires the firmware framebuffer's I/O memory and pro=
vides
>> a callback to be removed. The native driver later uses this inforamtio=
n to
>> remove any platform driver for it's framebuffer I/O memory.
>>
>> The platform helper's removal code is integrated into the existing cod=
e for
>> removing conflicting fraembuffers, so native drivers use it automatica=
lly.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I have some ideas for how to do this a notch cleaner in the next patch.=

> Maybe best to discuss the actual implmenentation stuff there.
>=20
> Aside from that usual nits:
> - kerneldoc for these please, pulled into drm-kms.rst.
> - naming isn't super ocd with drm_platform.c but that prefix not used, =
but
>   I also don't have better ideas.

I was never really happy with the naming either. Maybe call it aperture
helpers with drm_aperture_ and CONFIG_DRM_APERTURE_HELPER?

> - I think the functions from drm_fb_helper.h for removing other
>   framebuffers should be moved here, and function name prefix adjusted
>   acoordingly
>=20
> I'm wondering about the locking and deadlock potential here, is lockdep=

> all happy with this?

I haven't seen any complains, but I'll double check.

Best regards
Thomas

>=20
> Cheers, Daniel
>=20
>> ---
>>  drivers/gpu/drm/Kconfig        |   6 ++
>>  drivers/gpu/drm/Makefile       |   1 +
>>  drivers/gpu/drm/drm_platform.c | 118 ++++++++++++++++++++++++++++++++=
+
>>  include/drm/drm_fb_helper.h    |  18 ++++-
>>  include/drm/drm_platform.h     |  42 ++++++++++++
>>  5 files changed, 184 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_platform.c
>>  create mode 100644 include/drm/drm_platform.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index c4fd57d8b717..e9d6892f9d38 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -229,6 +229,12 @@ config DRM_SCHED
>>  	tristate
>>  	depends on DRM
>> =20
>> +config DRM_PLATFORM_HELPER
>> +	bool
>> +	depends on DRM
>> +	help
>> +	  Helpers for DRM platform devices
>> +
>>  source "drivers/gpu/drm/i2c/Kconfig"
>> =20
>>  source "drivers/gpu/drm/arm/Kconfig"
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 2c0e5a7e5953..8ceb21d0770a 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) +=3D drm_agpsupport.o
>>  drm-$(CONFIG_PCI) +=3D drm_pci.o
>>  drm-$(CONFIG_DEBUG_FS) +=3D drm_debugfs.o drm_debugfs_crc.o
>>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) +=3D drm_edid_load.o
>> +drm-$(CONFIG_DRM_PLATFORM_HELPER) +=3D drm_platform.o
>> =20
>>  drm_vram_helper-y :=3D drm_gem_vram_helper.o
>>  obj-$(CONFIG_DRM_VRAM_HELPER) +=3D drm_vram_helper.o
>> diff --git a/drivers/gpu/drm/drm_platform.c b/drivers/gpu/drm/drm_plat=
form.c
>> new file mode 100644
>> index 000000000000..09a2f2a31aa5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_platform.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_platform.h>
>> +
>> +static LIST_HEAD(drm_apertures);
>> +
>> +static DEFINE_MUTEX(drm_apertures_lock);
>> +
>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>> +		    resource_size_t base2, resource_size_t end2)
>> +{
>> +	return (base1 < end2) && (end1 > base2);
>> +}
>> +
>> +static struct drm_aperture *
>> +drm_aperture_acquire(struct drm_device *dev,
>> +		     resource_size_t base, resource_size_t size,
>> +		     const struct drm_aperture_funcs *funcs)
>> +{
>> +	size_t end =3D base + size;
>> +	struct list_head *pos;
>> +	struct drm_aperture *ap;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each(pos, &drm_apertures) {
>> +		ap =3D container_of(pos, struct drm_aperture, lh);
>> +		if (overlap(base, end, ap->base, ap->base + ap->size))
>> +			return ERR_PTR(-EBUSY);
>> +	}
>> +
>> +	ap =3D drmm_kzalloc(dev, sizeof(*ap), GFP_KERNEL);
>> +	if (!ap)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ap->dev =3D dev;
>> +	ap->base =3D base;
>> +	ap->size =3D size;
>> +	ap->funcs =3D funcs;
>> +	INIT_LIST_HEAD(&ap->lh);
>> +
>> +	list_add(&ap->lh, &drm_apertures);
>> +
>> +	mutex_unlock(&drm_apertures_lock);
>> +
>> +	return ap;
>> +}
>> +
>> +static void drm_aperture_release(struct drm_aperture *ap)
>> +{
>> +	bool kicked_out =3D ap->kicked_out;
>> +
>> +	if (!kicked_out)
>> +		mutex_lock(&drm_apertures_lock);
>> +
>> +	list_del(&ap->lh);
>> +	if (ap->funcs->release)
>> +		ap->funcs->release(ap);
>> +
>> +	if (!kicked_out)
>> +		mutex_unlock(&drm_apertures_lock);
>> +}
>> +
>> +static void drm_aperture_acquire_release(struct drm_device *dev, void=
 *ptr)
>> +{
>> +	struct drm_aperture *ap =3D ptr;
>> +
>> +	drm_aperture_release(ap);
>> +}
>> +
>> +struct drm_aperture *
>> +drmm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs)
>> +{
>> +	struct drm_aperture *ap;
>> +	int ret;
>> +
>> +	ap =3D drm_aperture_acquire(dev, base, size, funcs);
>> +	if (IS_ERR(ap))
>> +		return ap;
>> +	ret =3D drmm_add_action_or_reset(dev, drm_aperture_acquire_release, =
ap);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return ap;
>> +}
>> +EXPORT_SYMBOL(drmm_aperture_acquire);
>> +
>> +void drm_kickout_apertures_at(resource_size_t base, resource_size_t s=
ize)
>> +{
>> +	resource_size_t end =3D base + size;
>> +	struct list_head *pos, *n;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each_safe(pos, n, &drm_apertures) {
>> +		struct drm_aperture *ap =3D
>> +			container_of(pos, struct drm_aperture, lh);
>> +
>> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
>> +			continue;
>> +
>> +		ap->kicked_out =3D true;
>> +		if (ap->funcs->kickout)
>> +			ap->funcs->kickout(ap);
>> +		else
>> +			drm_dev_put(ap->dev);
>> +	}
>> +
>> +	mutex_unlock(&drm_apertures_lock);
>> +}
>> +EXPORT_SYMBOL(drm_kickout_apertures_at);
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h=

>> index 306aa3a60be9..a919b78b1961 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -35,7 +35,9 @@ struct drm_fb_helper;
>>  #include <drm/drm_client.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_device.h>
>> +#include <drm/drm_platform.h>
>>  #include <linux/kgdb.h>
>> +#include <linux/pci.h>
>>  #include <linux/vgaarb.h>
>> =20
>>  enum mode_set_atomic {
>> @@ -465,6 +467,11 @@ static inline int
>>  drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct=
 *a,
>>  					      const char *name, bool primary)
>>  {
>> +	int i;
>> +
>> +	for (i =3D 0; i < a->count; ++i)
>> +		drm_kickout_apertures_at(a->ranges[i].base, a->ranges[i].size);
>> +
>>  #if IS_REACHABLE(CONFIG_FB)
>>  	return remove_conflicting_framebuffers(a, name, primary);
>>  #else
>> @@ -487,7 +494,16 @@ static inline int
>>  drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pde=
v,
>>  						  const char *name)
>>  {
>> -	int ret =3D 0;
>> +	resource_size_t base, size;
>> +	int bar, ret =3D 0;
>> +
>> +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>> +			continue;
>> +		base =3D pci_resource_start(pdev, bar);
>> +		size =3D pci_resource_len(pdev, bar);
>> +		drm_kickout_apertures_at(base, size);
>> +	}
>> =20
>>  	/*
>>  	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> diff --git a/include/drm/drm_platform.h b/include/drm/drm_platform.h
>> new file mode 100644
>> index 000000000000..475e88ee1fbd
>> --- /dev/null
>> +++ b/include/drm/drm_platform.h
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +#ifndef _DRM_PLATFORM_H_
>> +#define _DRM_PLATFORM_H_
>> +
>> +#include <linux/list.h>
>> +#include <linux/types.h>
>> +
>> +struct drm_aperture;
>> +struct drm_device;
>> +
>> +struct drm_aperture_funcs {
>> +	void (*kickout)(struct drm_aperture *ap);
>> +	void (*release)(struct drm_aperture *ap);
>> +};
>> +
>> +struct drm_aperture {
>> +	struct drm_device *dev;
>> +	resource_size_t base;
>> +	resource_size_t size;
>> +
>> +	const struct drm_aperture_funcs *funcs;
>> +
>> +	struct list_head lh;
>> +	bool kicked_out;
>> +};
>> +
>> +struct drm_aperture *
>> +drmm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs);
>> +
>> +#if defined (CONFIG_DRM_PLATFORM_HELPER)
>> +void drm_kickout_apertures_at(resource_size_t base, resource_size_t s=
ize);
>> +#else
>> +static inline void
>> +drm_kickout_apertures_at(resource_size_t base, resource_size_t size)
>> +{
>> +}
>> +#endif
>> +
>> +#endif
>> --=20
>> 2.27.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3iL9DFLkqrxmaNSMp1U3PiIjVyoQyFFiC--

--41D7CsztXTAoOBI1mwJPuCr7wDIbyxV28
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xoXcUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMySwgAt8bRM4aO7K6/wXumfqZ6sFC9eKS6
5D6uioH9af0mfJZQCO8pJ7FLXBAD3qMYxhnZldVuPDW7kxNLWSCnOtEr+olJnkYq
t8uSXzt+/65Ej0nmVg0/ikunvCJC5820rByuAnzNYsQ6D6WHICulzQxa3f6hFJmZ
F2TSekI7mkxktlB3l3Z6DA2U94lUdBTUCz/C7yHFPg78oQLn8ZPKvTZQJcldUEg/
fb32/R1do0oelGUB3gW6rRlL+lTJxBOAqtrgYRIuuIlvN4iaRZ646uxEVJRVwlTX
9S9tSdOLn3dAuC6gxrORgPR7H84l54qy0EU9LnoMTGXQLGNKtVfTvy2ZOg==
=JqPZ
-----END PGP SIGNATURE-----

--41D7CsztXTAoOBI1mwJPuCr7wDIbyxV28--

--===============0875250816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0875250816==--
