Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C73596D1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529FE6EB86;
	Fri,  9 Apr 2021 07:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CFB6EB86
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:54:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE9A1ABE2;
 Fri,  9 Apr 2021 07:54:04 +0000 (UTC)
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a9d65fa8-6b10-d738-366d-c8254300cb7b@suse.de>
Date: Fri, 9 Apr 2021 09:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
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
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, linux-doc@vger.kernel.org, emil.l.velikov@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1264553499=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1264553499==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6St7p9yCfPYVFtyWEAOQCkVIo9A03GITI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6St7p9yCfPYVFtyWEAOQCkVIo9A03GITI
Content-Type: multipart/mixed; boundary="Zdt4Dc6RsPLYfs8TCN2eWJ4Ojj7nIzjKm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Message-ID: <a9d65fa8-6b10-d738-366d-c8254300cb7b@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
In-Reply-To: <YG7RgQfj0yZHbL6L@phenom.ffwll.local>

--Zdt4Dc6RsPLYfs8TCN2eWJ4Ojj7nIzjKm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 11:48 schrieb Daniel Vetter:
> On Thu, Mar 18, 2021 at 11:29:15AM +0100, Thomas Zimmermann wrote:
>> Platform devices might operate on firmware framebuffers, such as VESA =
or
>> EFI. Before a native driver for the graphics hardware can take over th=
e
>> device, it has to remove any platform driver that operates on the firm=
ware
>> framebuffer. Aperture helpers provide the infrastructure for platform
>> drivers to acquire firmware framebuffers, and for native drivers to re=
move
>> them later on.
>>
>> It works similar to the related fbdev mechanism. During initialization=
, the
>> platform driver acquires the firmware framebuffer's I/O memory and pro=
vides
>> a callback to be removed. The native driver later uses this informatio=
n to
>> remove any platform driver for it's framebuffer I/O memory.
>>
>> The aperture removal code is integrated into the existing code for rem=
oving
>> conflicting framebuffers, so native drivers use it automatically.
>>
>> v2:
>> 	* rename plaform helpers to aperture helpers
>> 	* tie to device lifetime with devm_ functions
>> 	* removed unsued remove() callback
>> 	* rename kickout to detach
>> 	* make struct drm_aperture private
>> 	* rebase onto existing drm_aperture.h header file
>> 	* use MIT license only for simplicity
>> 	* documentation
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
>=20
> Bunch of bikesheds for your considerations below, but overall lgtm.
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Cheers, Daniel
>=20
>> ---
>>   Documentation/gpu/drm-internals.rst |   6 +
>>   drivers/gpu/drm/Kconfig             |   7 +
>>   drivers/gpu/drm/Makefile            |   1 +
>>   drivers/gpu/drm/drm_aperture.c      | 287 ++++++++++++++++++++++++++=
++
>>   include/drm/drm_aperture.h          |  38 +++-
>>   5 files changed, 338 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/drm_aperture.c
>>
>> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/d=
rm-internals.rst
>> index 4c7642d2ca34..06af044c882f 100644
>> --- a/Documentation/gpu/drm-internals.rst
>> +++ b/Documentation/gpu/drm-internals.rst
>> @@ -78,9 +78,15 @@ DRM_IOCTL_VERSION ioctl.
>>   Managing Ownership of the Framebuffer Aperture
>>   ----------------------------------------------
>>  =20
>> +.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
>> +   :doc: overview
>> +
>>   .. kernel-doc:: include/drm/drm_aperture.h
>>      :internal:
>>  =20
>> +.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
>> +   :export:
>> +
>>   Device Instance and Driver Handling
>>   -----------------------------------
>>  =20
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 1461652921be..b9d3fb91d22d 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -221,6 +221,13 @@ config DRM_SCHED
>>   	tristate
>>   	depends on DRM
>>  =20
>> +config DRM_APERTURE
>> +	bool
>> +	depends on DRM
>> +	help
>> +	  Controls ownership of graphics apertures. Required to
>> +	  synchronize with firmware-based drivers.
>=20
> Uh I'm not a big fan of Kconfig and .ko modules for every little helper=

> code. Imo just stuff this into the drm kms helpers and done. Or stuff i=
t
> into drm core code, I think either is a good case for this. Everything =
is
> its own module means we need to EXPORT_SYMBOL more stuff, and then driv=
ers
> get funny ideas about using these internals ...

The code lives in the DRM core module. There's no extra ko file. But I'd =

like to keep the Kconfig option. The aperture helpers will only be=20
required if there are generic drivers in the kernel and for many systems =

this is not the case.

Best regards
Thomas

>=20
>> +
>>   source "drivers/gpu/drm/i2c/Kconfig"
>>  =20
>>   source "drivers/gpu/drm/arm/Kconfig"
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 5eb5bf7c16e3..c9ecb02df0f3 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) +=3D drm_agpsupport.o
>>   drm-$(CONFIG_PCI) +=3D drm_pci.o
>>   drm-$(CONFIG_DEBUG_FS) +=3D drm_debugfs.o drm_debugfs_crc.o
>>   drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) +=3D drm_edid_load.o
>> +drm-$(CONFIG_DRM_APERTURE) +=3D drm_aperture.o
>>  =20
>>   drm_vram_helper-y :=3D drm_gem_vram_helper.o
>>   obj-$(CONFIG_DRM_VRAM_HELPER) +=3D drm_vram_helper.o
>> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aper=
ture.c
>> new file mode 100644
>> index 000000000000..4b02b5fed0a1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_aperture.c
>> @@ -0,0 +1,287 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#include <linux/device.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_aperture.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_print.h>
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * A graphics device might be supported by different drivers, but onl=
y one
>> + * driver can be active at any given time. Many systems load a generi=
c
>> + * graphics drivers, such as EFI-GOP or VESA, early during the boot p=
rocess.
>> + * During later boot stages, they replace the generic driver with a d=
edicated,
>> + * hardware-specific driver. To take over the device the dedicated dr=
iver
>> + * first has to remove the generic driver. DRM aperture functions man=
age
>> + * ownership of DRM framebuffer memory and hand-over between drivers.=

>> + *
>> + * DRM drivers should call drm_fb_helper_remove_conflicting_framebuff=
ers()
>> + * at the top of their probe function. The function removes any gener=
ic
>> + * driver that is currently associated with the given framebuffer mem=
ory.
>> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as =
in the
>> + * example given below.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
>> + *	{
>> + *		struct apertures_struct *ap;
>> + *		bool primary =3D false;
>> + *		int ret;
>> + *
>> + *		ap =3D alloc_apertures(1);
>> + *		if (!ap)
>> + *			return -ENOMEM;
>> + *
>> + *		ap->ranges[0].base =3D pci_resource_start(pdev, 0);
>> + *		ap->ranges[0].size =3D pci_resource_len(pdev, 0);
>> + *
>> + *	#ifdef CONFIG_X86
>> + *		primary =3D pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_R=
OM_SHADOW;
>> + *	#endif
>> + *		ret =3D drm_fb_helper_remove_conflicting_framebuffers(ap, "exampl=
e driver", primary);
>> + *		kfree(ap);
>> + *
>> + *		return ret;
>> + *	}
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		int ret;
>> + *
>> + *		// Remove any generic drivers...
>> + *		ret =3D remove_conflicting_framebuffers(pdev);
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		// ... and initialize the hardware.
>> + *		...
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + * For PCI devices it is often sufficient to use drm_fb_helper_remove=
_conflicting_pci_framebuffers()
>> + * and let it detect the framebuffer apertures automatically.
>=20
> Maybe just me, but to avoid overstretching the attention spawn of doc
> readers I'd avoid this example here. And maybe make the recommendation
> stronger, e.g. "PCI device drivers can avoid open-coding
> remove_conflicting_framebuffers() by calling
> drm_fb_helper_remove_conflicting_pci_framebuffers()."
>=20
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		int ret;
>> + *
>> + *		// Remove any generic drivers...
>> + *		ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "=
example driver");
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		// ... and initialize the hardware.
>> + *		...
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + * Drivers that are susceptible to being removed be other drivers, su=
ch as
>> + * generic EFI or VESA drivers, have to register themselves as owners=
 of their
>> + * given framebuffer memory. Ownership of the framebuffer memory is a=
chived
>> + * by calling devm_aperture_acquire(). On success, the driver is the =
owner
>> + * of the framebuffer range. The function fails if the framebuffer is=
 already
>> + * by another driver. See below for an example.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>> + *		.detach =3D ...
>=20
> Is there really value in allowing/forcing drivers to set up their own
> detach ops? You already make this specific to struct drm_device, an
> implementation that just calls drm_dev_unplug feels like the right thin=
g
> to do?
>=20
> Or maybe we should tie this more into the struct device mode and force =
an
> unload that way? That way devm cleanup would work as one expects, and
> avoid the need for anything specific (hopefully) in this detach callbac=
k.
>=20
> Just feels a bit like we're reinventing half of the driver model here,
> badly.
>=20
>> + *	};
>> + *
>> + *	static int acquire_framebuffers(struct drm_device *dev, struct pci=
_dev *pdev)
>> + *	{
>> + *		resource_size_t start, len;
>> + *		struct drm_aperture *ap;
>> + *
>> + *		base =3D pci_resource_start(pdev, 0);
>> + *		size =3D pci_resource_len(pdev, 0);
>> + *
>> + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
>> + *		if (IS_ERR(ap))
>> + *			return PTR_ERR(ap);
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		struct drm_device *dev;
>> + *		int ret;
>> + *
>> + *		// ... Initialize the device...
>> + *		dev =3D devm_drm_dev_alloc();
>> + *		...
>> + *
>> + *		// ... and acquire ownership of the framebuffer.
>> + *		ret =3D acquire_framebuffers(dev, pdev);
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + * The generic driver is now subject to forced removal by other drive=
rs. This
>> + * is when the detach function in struct &drm_aperture_funcs comes in=
to play.
>> + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers(=
) et al
>> + * for the registered framebuffer range, the DRM core calls struct
>> + * &drm_aperture_funcs.detach and the generic driver has to onload it=
self. It
>> + * may not access the device's registers, framebuffer memory, ROM, et=
c after
>> + * detach returned. If the driver supports hotplugging, detach can be=
 treated
>> + * like an unplug event.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static void detach_from_device(struct drm_device *dev,
>> + *				       resource_size_t base,
>> + *				       resource_size_t size)
>> + *	{
>> + *		// Signal unplug
>> + *		drm_dev_unplug(dev);
>> + *
>> + *		// Maybe do other clean-up operations
>> + *		...
>> + *	}
>> + *
>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>> + *		.detach =3D detach_from_device,
>> + *	};
>> + */
>> +
>> +/**
>> + * struct drm_aperture - Represents a DRM framebuffer aperture
>> + *
>> + * This structure has no public fields.
>> + */
>> +struct drm_aperture {
>> +	struct drm_device *dev;
>> +	resource_size_t base;
>> +	resource_size_t size;
>> +
>> +	const struct drm_aperture_funcs *funcs;
>> +
>> +	struct list_head lh;
>> +};
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
>> +static void devm_aperture_acquire_release(void *data)
>> +{
>> +	struct drm_aperture *ap =3D data;
>> +	bool detached =3D !ap->dev;
>> +
>> +	if (!detached)
>=20
> Uh this needs a comment that if ap->dev is NULL then we're called from
> drm_aperture_detach_drivers() and hence the lock is already held.
>=20
>> +		mutex_lock(&drm_apertures_lock);
>=20
> and an
>=20
> 	else
> 		locdep_assert_held(&drm_apertures_lock);
>=20
> here to check that. I was scratching my head first quite a bit how you'=
d
> solve the deadlock, this is a neat solution (much simpler than anything=
 I
> came up with in my head). But needs comments.
>=20
>> +
>> +	list_del(&ap->lh);
>> +
>> +	if (!detached)
>> +		mutex_unlock(&drm_apertures_lock);
>> +}
>> +
>> +/**
>> + * devm_aperture_acquire - Acquires ownership of a framebuffer on beh=
alf of a DRM driver.
>> + * @dev:	the DRM device to own the framebuffer memory
>> + * @base:	the framebuffer's byte offset in physical memory
>> + * @size:	the framebuffer size in bytes
>> + * @funcs:	callback functions
>> + *
>> + * Installs the given device as the new owner. The function fails if =
the
>> + * framebuffer range, or parts of it, is currently owned by another d=
river.
>> + * To evict current owners, callers should use
>> + * drm_fb_helper_remove_conflicting_framebuffers() et al. before call=
ing this
>> + * function. Acquired apertures are released automatically if the und=
erlying
>> + * device goes away.
>> + *
>> + * Returns:
>> + * An instance of struct &drm_aperture on success, or a pointer-encod=
ed
>> + * errno value otherwise.
>> + */
>> +struct drm_aperture *
>> +devm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs)
>> +{
>> +	size_t end =3D base + size;
>> +	struct list_head *pos;
>> +	struct drm_aperture *ap;
>> +	int ret;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each(pos, &drm_apertures) {
>> +		ap =3D container_of(pos, struct drm_aperture, lh);
>> +		if (overlap(base, end, ap->base, ap->base + ap->size))
>> +			return ERR_PTR(-EBUSY);
>> +	}
>> +
>> +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
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
>> +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquire_rel=
ease, ap);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return ap;
>> +}
>> +EXPORT_SYMBOL(devm_aperture_acquire);
>> +
>> +void drm_aperture_detach_drivers(resource_size_t base, resource_size_=
t size)
>> +{
>> +	resource_size_t end =3D base + size;
>> +	struct list_head *pos, *n;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each_safe(pos, n, &drm_apertures) {
>> +		struct drm_aperture *ap =3D
>> +			container_of(pos, struct drm_aperture, lh);
>> +		struct drm_device *dev =3D ap->dev;
>> +
>> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
>> +			continue;
>> +
>> +		ap->dev =3D NULL; /* detach from device */
>> +		if (drm_WARN_ON(dev, !ap->funcs->detach))
>> +			continue;
>> +		ap->funcs->detach(dev, ap->base, ap->size);
>> +	}
>> +
>> +	mutex_unlock(&drm_apertures_lock);
>> +}
>> +EXPORT_SYMBOL(drm_aperture_detach_drivers);
>=20
> Is this just exported because of the inline functions in the headers? I=
mo
> better to make them proper functions (they're big after your patch&not
> perf critical, so not good candidates for inlining anyway).
>=20
>> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
>> index 13766efe9517..696cec75ef78 100644
>> --- a/include/drm/drm_aperture.h
>> +++ b/include/drm/drm_aperture.h
>> @@ -4,8 +4,30 @@
>>   #define _DRM_APERTURE_H_
>>  =20
>>   #include <linux/fb.h>
>> +#include <linux/pci.h>
>>   #include <linux/vgaarb.h>
>>  =20
>> +struct drm_aperture;
>> +struct drm_device;
>> +
>> +struct drm_aperture_funcs {
>> +	void (*detach)(struct drm_device *dev, resource_size_t base, resourc=
e_size_t size);
>> +};
>> +
>> +struct drm_aperture *
>> +devm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs);
>> +
>> +#if defined(CONFIG_DRM_APERTURE)
>> +void drm_aperture_detach_drivers(resource_size_t base, resource_size_=
t size);
>> +#else
>> +static inline void
>> +drm_aperture_detach_drivers(resource_size_t base, resource_size_t siz=
e)
>> +{
>> +}
>> +#endif
>> +
>>   /**
>>    * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-c=
onfigured framebuffers
>>    * @a: memory range, users of which are to be removed
>> @@ -20,6 +42,11 @@ static inline int
>>   drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struc=
t *a,
>>   					      const char *name, bool primary)
>>   {
>> +	int i;
>> +
>> +	for (i =3D 0; i < a->count; ++i)
>> +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
>> +
>>   #if IS_REACHABLE(CONFIG_FB)
>>   	return remove_conflicting_framebuffers(a, name, primary);
>>   #else
>> @@ -43,7 +70,16 @@ static inline int
>>   drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pd=
ev,
>>   						  const char *name)
>>   {
>> -	int ret =3D 0;
>> +	resource_size_t base, size;
>> +	int bar, ret =3D 0;
>> +
>> +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>> +			continue;
>> +		base =3D pci_resource_start(pdev, bar);
>> +		size =3D pci_resource_len(pdev, bar);
>> +		drm_aperture_detach_drivers(base, size);
>> +	}
>>  =20
>>   	/*
>>   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> --=20
>> 2.30.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Zdt4Dc6RsPLYfs8TCN2eWJ4Ojj7nIzjKm--

--6St7p9yCfPYVFtyWEAOQCkVIo9A03GITI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwCBsFAwAAAAAACgkQlh/E3EQov+DB
KQ//bQHHadnj5Xp87OpDVBJy0NJftQl3Kmbv5d+8hRyRJ3i5BpG3FN4gCFnn/FsQXEE/SB8TbLeQ
V1B/ruOb2FmJ6ErEjtpguGUi4zsA6YO7ZGam5EZQsCEDHF/37LmKtUBNuoOgA+td1/Ebpxar2ihD
quZcxTYPiVXAbG0yPUqn0OqXFhd+Ixop7QJXVBADaDt2VmiHY502aICjESDGKIBRpWjxtX1l3B8D
vCk8gwJQa9Pd/BE4eJra8v5fEDkqDKIEnhMt6ejH+jw9LTzrefN7SoxMZMET74ZHXo9vpmmegrug
bCAuz+elFz+DedHyR9ZNDUi9JIuSYick0RUwp+jOshpsONuNR0rcY9QVuHAKGcTndvzxhZRu1rE1
o7EfROvVFSwcyktOzgy1KD5IhroaSLbEGms9CLH/dreGFUYC5TzzmFVvdnSLn8wTZ0W6YVyxPin3
oW79+yFk+wYF8lpLXvVXgs5l+nHr8qJTjMR0hCJSnOI1Ut2k19W8gD+KBRIuNuWrgmcxk4AFZO+g
1uhi1RDrqL2NLI5IMtO4i/3Z/M6NQ6yZep0SdChc0Cmm1isYmQu1Q9iznfiDNdB/3B5/cFMvQ5mo
vF5wy8PuzU3OKgpCU/+gYKtNd2T0MJW3stZeTmC5LSRi1feEBWdY97eXQ5RpFtAUxGmZtBgqT6D3
keI=
=Nv1S
-----END PGP SIGNATURE-----

--6St7p9yCfPYVFtyWEAOQCkVIo9A03GITI--

--===============1264553499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1264553499==--
