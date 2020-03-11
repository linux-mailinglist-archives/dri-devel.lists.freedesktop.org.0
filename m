Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97226181542
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F96E966;
	Wed, 11 Mar 2020 09:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A706E95B;
 Wed, 11 Mar 2020 09:48:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53BF6AC5C;
 Wed, 11 Mar 2020 09:48:04 +0000 (UTC)
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
 <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>
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
Message-ID: <c97fe1fb-f5a0-e246-d40c-6f2087e68c05@suse.de>
Date: Wed, 11 Mar 2020 10:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0582576916=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0582576916==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5TgBDgzRDAcAZBrDQmr7AUnu3odj5w6A3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5TgBDgzRDAcAZBrDQmr7AUnu3odj5w6A3
Content-Type: multipart/mixed; boundary="kYC5bvk9dXUuSdX3WxoS4avW5Kd8s92V8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <c97fe1fb-f5a0-e246-d40c-6f2087e68c05@suse.de>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
 <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>
In-Reply-To: <72e4842d-6657-bea2-12dc-28128308fdbc@suse.de>

--kYC5bvk9dXUuSdX3WxoS4avW5Kd8s92V8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 11.03.20 um 10:07 schrieb Thomas Zimmermann:
> Hi Daniel
>=20
> Am 02.03.20 um 23:25 schrieb Daniel Vetter:
>> We have lots of these. And the cleanup code tends to be of dubious
>> quality. The biggest wrong pattern is that developers use devm_, which=

>> ties the release action to the underlying struct device, whereas
>> all the userspace visible stuff attached to a drm_device can long
>> outlive that one (e.g. after a hotunplug while userspace has open
>> files and mmap'ed buffers). Give people what they want, but with more
>> correctness.
>>
>> Mostly copied from devres.c, with types adjusted to fit drm_device and=

>> a few simplifications - I didn't (yet) copy over everything. Since
>> the types don't match code sharing looked like a hopeless endeavour.
>>
>> For now it's only super simplified, no groups, you can't remove
>> actions (but kfree exists, we'll need that soon). Plus all specific to=

>> drm_device ofc, including the logging. Which I didn't bother to make
>> compile-time optional, since none of the other drm logging is compile
>> time optional either.
>>
>> One tricky bit here is the chicken&egg between allocating your
>> drm_device structure and initiliazing it with drm_dev_init. For
>> perfect onion unwinding we'd need to have the action to kfree the
>> allocation registered before drm_dev_init registers any of its own
>> release handlers. But drm_dev_init doesn't know where exactly the
>> drm_device is emebedded into the overall structure, and by the time it=

>> returns it'll all be too late. And forcing drivers to be able clean up=

>> everything except the one kzalloc is silly.
>>
>> Work around this by having a very special final_kfree pointer. This
>> also avoids troubles with the list head possibly disappearing from
>> underneath us when we release all resources attached to the
>> drm_device.
>>
>> v2: Do all the kerneldoc at the end, to avoid lots of fairly pointless=

>> shuffling while getting everything into shape.
>>
>> v3: Add static to add/del_dr (Neil)
>> Move typo fix to the right patch (Neil)
>>
>> v4: Enforce contract for drmm_add_final_kfree:
>>
>> Use ksize() to check that the drm_device is indeed contained somewhere=

>> in the final kfree(). Because we need that or the entire managed
>> release logic blows up in a pile of use-after-frees. Motivated by a
>> discussion with Laurent.
>>
>> v5: Review from Laurent:
>> - %zu instead of casting size_t
>> - header guards
>> - sorting of includes
>> - guarding of data assignment if we didn't allocate it for a NULL
>>   pointer
>> - delete spurious newline
>> - cast void* data parameter correctly in ->release call, no idea how
>>   this even worked before
>>
>> v3: Review from Sam
>> - Add the kerneldoc for the managed sub-struct back in, even if it
>>   doesn't show up in the generated html somehow.
>> - Explain why __always_inline.
>> - Fix bisectability around the final kfree() in drm_dev_relase(). This=

>>   is just interim code which will disappear again.
>> - Some whitespace polish.
>> - Add debug output when drmm_add_action or drmm_kmalloc fail.
>>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Neil Armstrong <narmstrong@baylibre.com
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> ---
>>  Documentation/gpu/drm-internals.rst |   6 +
>>  drivers/gpu/drm/Makefile            |   3 +-
>>  drivers/gpu/drm/drm_drv.c           |  12 ++
>>  drivers/gpu/drm/drm_internal.h      |   3 +
>>  drivers/gpu/drm/drm_managed.c       | 186 +++++++++++++++++++++++++++=
+
>>  include/drm/drm_device.h            |  15 +++
>>  include/drm/drm_managed.h           |  30 +++++
>>  include/drm/drm_print.h             |   6 +
>>  8 files changed, 260 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_managed.c
>>  create mode 100644 include/drm/drm_managed.h
>>
>> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/d=
rm-internals.rst
>> index a73320576ca9..a6b6145fda78 100644
>> --- a/Documentation/gpu/drm-internals.rst
>> +++ b/Documentation/gpu/drm-internals.rst
>> @@ -132,6 +132,12 @@ be unmapped; on many devices, the ROM address dec=
oder is shared with
>>  other BARs, so leaving it mapped could cause undesired behaviour like=

>>  hangs or memory corruption.
>> =20
>> +Managed Resources
>> +-----------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_managed.c
>> +   :doc: managed resources
>> +
>>  Bus-specific Device Registration and PCI Support
>>  ------------------------------------------------
>> =20
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 7f72ef5e7811..183c60048307 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -17,7 +17,8 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
>>  		drm_plane.o drm_color_mgmt.o drm_print.o \
>>  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>>  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>> -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
>> +		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
>> +		drm_managed.o
>> =20
>>  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_contex=
t.o drm_dma.o drm_scatter.o drm_lock.o
>>  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 9fcd6ab3c154..153050fc926c 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -629,6 +629,9 @@ int drm_dev_init(struct drm_device *dev,
>>  	dev->dev =3D get_device(parent);
>>  	dev->driver =3D driver;
>> =20
>> +	INIT_LIST_HEAD(&dev->managed.resources);
>> +	spin_lock_init(&dev->managed.lock);
>> +
>>  	/* no per-device feature limits by default */
>>  	dev->driver_features =3D ~0u;
>> =20
>> @@ -828,8 +831,17 @@ static void drm_dev_release(struct kref *ref)
>>  		dev->driver->release(dev);
>>  	} else {
>>  		drm_dev_fini(dev);
>> +	}
>> +
>> +	drm_managed_release(dev);
>> +
>> +	if (!dev->driver->release && !dev->managed.final_kfree) {
>> +		WARN_ON(!list_empty(&dev->managed.resources));
>>  		kfree(dev);
>>  	}
>> +
>> +	if (dev->managed.final_kfree)
>> +		kfree(dev->managed.final_kfree);
>>  }
>> =20
>>  /**
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inte=
rnal.h
>> index aeec2e68d772..8c2628dfc6c7 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -89,6 +89,9 @@ void drm_prime_remove_buf_handle_locked(struct drm_p=
rime_file_private *prime_fpr
>>  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>>  void drm_minor_release(struct drm_minor *minor);
>> =20
>> +/* drm_managed.c */
>> +void drm_managed_release(struct drm_device *dev);
>> +
>>  /* drm_vblank.c */
>>  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int=
 pipe);
>>  void drm_vblank_cleanup(struct drm_device *dev);
>> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manag=
ed.c
>> new file mode 100644
>> index 000000000000..57dc79fa90af
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_managed.c
>> @@ -0,0 +1,186 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2020 Intel
>> + *
>> + * Based on drivers/base/devres.c
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <linux/list.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +
>> +/**
>> + * DOC: managed resources
>> + *
>> + * Inspired by struct &device managed resources, but tied to the life=
time of
>> + * struct &drm_device, which can outlive the underlying physical devi=
ce, usually
>> + * when userspace has some open files and other handles to resources =
still open.
>> + */
>> +struct drmres_node {
>> +	struct list_head	entry;
>> +	drmres_release_t	release;
>> +	const char		*name;
>> +	size_t			size;
>> +};
>=20
> At a later point, we could have debugfs for instances of this data
> structure. There's already a name field.
>=20
>> +
>> +struct drmres {
>> +	struct drmres_node		node;
>> +	/*
>> +	 * Some archs want to perform DMA into kmalloc caches
>> +	 * and need a guaranteed alignment larger than
>> +	 * the alignment of a 64-bit integer.
>> +	 * Thus we use ARCH_KMALLOC_MINALIGN here and get exactly the same
>> +	 * buffer alignment as if it was allocated by plain kmalloc().
>> +	 */
>> +	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
>> +};
>> +
>> +void drm_managed_release(struct drm_device *dev)
>> +{
>> +	struct drmres *dr, *tmp;
>> +
>> +	drm_dbg_drmres(dev, "drmres release begin\n");
>> +	list_for_each_entry_safe(dr, tmp, &dev->managed.resources, node.entr=
y) {
>> +		drm_dbg_drmres(dev, "REL %p %s (%zu bytes)\n",
>> +			       dr, dr->node.name, dr->node.size);
>> +
>> +		if (dr->node.release)
>> +			dr->node.release(dev, dr->node.size ? *(void **)&dr->data : NULL);=

>> +
>> +		list_del(&dr->node.entry);
>> +		kfree(dr);
>> +	}
>> +	drm_dbg_drmres(dev, "drmres release end\n");
>> +}
>> +
>> +/*
>> + * Always inline so that kmallc_track_caller tracks the actual intere=
sting
>=20
> 'kmalloc_node_track_caller'
>=20
>> + * caller outside of drm_managed.c.
>> + */
>> +static __always_inline struct drmres * alloc_dr(drmres_release_t rele=
ase,
>> +						size_t size, gfp_t gfp, int nid)
>> +{
>> +	size_t tot_size;
>> +	struct drmres *dr;
>> +
>> +	/* We must catch any near-SIZE_MAX cases that could overflow. */
>> +	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
>> +		return NULL;
>> +
>> +	dr =3D kmalloc_node_track_caller(tot_size, gfp, nid);
>> +	if (unlikely(!dr))
>> +		return NULL;
>> +
>> +	memset(dr, 0, offsetof(struct drmres, data));
>> +
>> +	INIT_LIST_HEAD(&dr->node.entry);
>> +	dr->node.release =3D release;
>> +	dr->node.size =3D size;
>> +
>> +	return dr;
>> +}
>> +
>> +static void del_dr(struct drm_device *dev, struct drmres *dr)
>> +{
>> +	list_del_init(&dr->node.entry);
>> +
>> +	drm_dbg_drmres(dev, "DEL %p %s (%lu bytes)\n",
>> +		       dr, dr->node.name, (unsigned long) dr->node.size);
>> +}
>> +
>> +static void add_dr(struct drm_device *dev, struct drmres *dr)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&dev->managed.lock, flags);
>> +	list_add(&dr->node.entry, &dev->managed.resources);
>> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
>> +
>> +	drm_dbg_drmres(dev, "ADD %p %s (%lu bytes)\n",
>> +		       dr, dr->node.name, (unsigned long) dr->node.size);
>=20
> If the insert code blows up, it might be helpful to have this message i=
n
> the log already. So should this message be located before the code for
> inserting the entry?
>=20
>> +}
>> +
>> +void drmm_add_final_kfree(struct drm_device *dev, void *parent)
>=20
> Can you come up with better names? 'final_kfree' sounds like a function=

> pointer to an implementation of kfree() and 'parent' sounds like the
> parent device in a device hierarchy.
>=20
> I suggest to rename 'parent' to 'container' and 'final_kfree'
> 'drmm_container'. The function's name could be drmm_dev_set_container()=
=2E
>=20
>> +{
>> +	WARN_ON(dev->managed.final_kfree);
>> +	WARN_ON(dev < (struct drm_device *) parent);
>> +	WARN_ON(dev + 1 >=3D (struct drm_device *) (parent + ksize(parent)))=
;
>> +	dev->managed.final_kfree =3D parent;
>> +}
>> +EXPORT_SYMBOL(drmm_add_final_kfree);
>> +
>> +int __drmm_add_action(struct drm_device *dev,
>> +		      drmres_release_t action,
>> +		      void *data, const char *name)
>=20
> Is there a reason to pass in 'void* data' instead of 'void** datap'? Th=
e
> latter would communicate what this parameter is for and not need void_p=
tr.
>=20
> In any case, there seems to be no interface to remove an added action
> (e.g., __drmm_remove_action()). Please see my comment on drmm_kfree() b=
elow.

Ah, I just saw this was added in patch 22.

And patch 22 made me think that the interface name must clearly
communicate whether the function invokes the release callback or not.

Best regards
Thomas

>=20
> And more generally, do we really need __drmm_add_action() in it's
> current form? I'd change it to __drmm_kmalloc(), which is drmm_kmalloc(=
)
> plus optional release-action and name parameters. And drm_kmalloc()
> would be a simple wrapper in the header file, just like drmm_kcalloc().=

>=20
>> +{
>> +	struct drmres *dr;
>> +	void **void_ptr;
>> +
>> +	dr =3D alloc_dr(action, data ? sizeof(void*) : 0,
>> +		      GFP_KERNEL | __GFP_ZERO,
>> +		      dev_to_node(dev->dev));
>> +	if (!dr) {
>> +		drm_dbg_drmres(dev, "failed to add action %s for %p\n",
>> +			       name, data);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dr->node.name =3D name;
>> +	if (data) {
>> +		void_ptr =3D (void **)&dr->data;
>> +		*void_ptr =3D data;
>> +	}
>> +
>> +	add_dr(dev, dr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(__drmm_add_action);
>> +
>> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>> +{
>> +	struct drmres *dr;
>> +
>> +	dr =3D alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
>> +	if (!dr) {
>> +		drm_dbg_drmres(dev, "failed to allocate %zu bytes, %u flags\n",
>> +			       size, gfp);
>> +		return NULL;
>> +	}
>> +	dr->node.name =3D "kmalloc";
>> +
>> +	add_dr(dev, dr);
>> +
>> +	return dr->data;
>> +}
>> +EXPORT_SYMBOL(drmm_kmalloc);
>> +
>> +void drmm_kfree(struct drm_device *dev, void *data)
>=20
> I suggest to wrap this function around an implementatian that calls the=

> optional release action. drmm_kfree() would become a trivial wrapper in=

> the header file.
>=20
> Best regards
> Thomas
>=20
>> +{
>> +	struct drmres *dr_match =3D NULL, *dr;
>> +	unsigned long flags;
>> +
>> +	if (!data)
>> +		return;
>> +
>> +	spin_lock_irqsave(&dev->managed.lock, flags);
>> +	list_for_each_entry(dr, &dev->managed.resources, node.entry) {
>> +		if (dr->data =3D=3D data) {
>> +			dr_match =3D dr;
>> +			del_dr(dev, dr_match);
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
>> +
>> +	if (WARN_ON(!dr_match))
>> +		return;
>> +
>> +	kfree(dr_match);
>> +}
>> +EXPORT_SYMBOL(drmm_kfree);
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index bb60a949f416..d39132b477dd 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -67,6 +67,21 @@ struct drm_device {
>>  	/** @dev: Device structure of bus-device */
>>  	struct device *dev;
>> =20
>> +	/**
>> +	 * @managed:
>> +	 *
>> +	 * Managed resources linked to the lifetime of this &drm_device as
>> +	 * tracked by @ref.
>> +	 */
>> +	struct {
>> +		/** @managed.resources: managed resources list */
>> +		struct list_head resources;
>> +		/** @managed.final_kfree: pointer for final kfree() call */
>> +		void *final_kfree;
>> +		/** @managed.lock: protects @managed.resources */
>> +		spinlock_t lock;
>> +	} managed;
>> +
>>  	/** @driver: DRM driver managing the device */
>>  	struct drm_driver *driver;
>> =20
>> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
>> new file mode 100644
>> index 000000000000..7b5df7d09b19
>> --- /dev/null
>> +++ b/include/drm/drm_managed.h
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#ifndef _DRM_MANAGED_H_
>> +#define _DRM_MANAGED_H_
>> +
>> +#include <linux/gfp.h>
>> +#include <linux/types.h>
>> +
>> +struct drm_device;
>> +
>> +typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
>> +
>> +#define drmm_add_action(dev, action, data) \
>> +	__drmm_add_action(dev, action, data, #action)
>> +
>> +int __must_check __drmm_add_action(struct drm_device *dev,
>> +				   drmres_release_t action,
>> +				   void *data, const char *name);
>> +
>> +void drmm_add_final_kfree(struct drm_device *dev, void *parent);
>> +
>> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __=
malloc;
>> +static inline void *drmm_kzalloc(struct drm_device *dev, size_t size,=
 gfp_t gfp)
>> +{
>> +	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>> +}
>> +
>> +void drmm_kfree(struct drm_device *dev, void *data);
>> +
>> +#endif
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index ca7cee8e728a..1c9417430d08 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -313,6 +313,10 @@ enum drm_debug_category {
>>  	 * @DRM_UT_DP: Used in the DP code.
>>  	 */
>>  	DRM_UT_DP		=3D 0x100,
>> +	/**
>> +	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
>> +	 */
>> +	DRM_UT_DRMRES		=3D 0x200,
>>  };
>> =20
>>  static inline bool drm_debug_enabled(enum drm_debug_category category=
)
>> @@ -442,6 +446,8 @@ void drm_dev_dbg(const struct device *dev, enum dr=
m_debug_category category,
>>  	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>>  #define drm_dbg_dp(drm, fmt, ...)					\
>>  	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
>> +#define drm_dbg_drmres(drm, fmt, ...)					\
>> +	drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>> =20
>> =20
>>  /*
>>
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kYC5bvk9dXUuSdX3WxoS4avW5Kd8s92V8--

--5TgBDgzRDAcAZBrDQmr7AUnu3odj5w6A3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5os88ACgkQaA3BHVML
eiNvfwf+MfNLYoLLUhyjLTehwdkiVqk7x+ievMTv+IB+Jot3Qx4T94SVMTH9MvPp
+SKfdR218LAMIGjgos6qfhki/RyOCudvmT1fyFPZrqOmNJT8vHzgq/qWIepix8GF
FfaLroAUEehG6Gry/CrhW/Tul1IGaY+tjp5nvp5p4jGiwyYc5cJkySqx9WTG5nuc
DQePMQNz12Xxy11aLdt467nKT9mj6rm6iTeYGJQk9+2lT1DSI3skYxn1rc66F9CS
wkcqg4heMDjBoXUY2sqYHZl6gGr1RihTXj/rKpg/M49xwCTF4nl+pbvXzNUslvI4
K/e41hmkeWKA62SZd5KYbRJp0jbeLw==
=A/3B
-----END PGP SIGNATURE-----

--5TgBDgzRDAcAZBrDQmr7AUnu3odj5w6A3--

--===============0582576916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0582576916==--
