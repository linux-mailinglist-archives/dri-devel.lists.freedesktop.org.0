Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C03D1706
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 21:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2FB6ECE3;
	Wed, 21 Jul 2021 19:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 441 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jul 2021 19:26:42 UTC
Received: from smtp119.ord1c.emailsrvr.com (smtp119.ord1c.emailsrvr.com
 [108.166.43.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAAB6ECE3;
 Wed, 21 Jul 2021 19:26:42 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp15.relay.ord1c.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id AE7BD20245; 
 Wed, 21 Jul 2021 15:19:19 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct
 pages upon creation
Date: Wed, 21 Jul 2021 12:18:55 -0700
Message-ID: <1839899.5eojKT8Dyj@mizzik>
In-Reply-To: <20210715101536.2606307-4-matthew.auld@intel.com>
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5739491.D0ShQg1dhF";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 6156cfba-c837-4735-a561-4dbc9dab694c-1-1
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
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart5739491.D0ShQg1dhF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct pages upon creation
Date: Wed, 21 Jul 2021 12:18:55 -0700
Message-ID: <1839899.5eojKT8Dyj@mizzik>
In-Reply-To: <20210715101536.2606307-4-matthew.auld@intel.com>
References: <20210715101536.2606307-1-matthew.auld@intel.com> <20210715101536.2606307-4-matthew.auld@intel.com>

Thanks for this!  Series is:

Acked-by: Kenneth Graunke <kenneth@whitecape.org>

https://gitlab.freedesktop.org/kwg/mesa/-/commits/iris-userptr-probe
is an untested branch that uses the new probe API in Mesa.

On Thursday, July 15, 2021 3:15:35 AM PDT Matthew Auld wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>=20
> Jason Ekstrand requested a more efficient method than userptr+set-domain
> to determine if the userptr object was backed by a complete set of pages
> upon creation. To be more efficient than simply populating the userptr
> using get_user_pages() (as done by the call to set-domain or execbuf),
> we can walk the tree of vm_area_struct and check for gaps or vma not
> backed by struct page (VM_PFNMAP). The question is how to handle
> VM_MIXEDMAP which may be either struct page or pfn backed...
>=20
> With discrete are going to drop support for set_domain(), so offering a
> way to probe the pages, without having to resort to dummy batches has
> been requested.
>=20
> v2:
> - add new query param for the PROPBE flag, so userspace can easily
>   check if the kernel supports it(Jason).
> - use mmap_read_{lock, unlock}.
> - add some kernel-doc.
>=20
> Testcase: igt/gem_userptr_blits/probe
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 40 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_getparam.c        |  3 ++
>  include/uapi/drm/i915_drm.h                 | 18 ++++++++++
>  3 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 56edfeff8c02..fd6880328596 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -422,6 +422,33 @@ static const struct drm_i915_gem_object_ops i915_gem=
_userptr_ops =3D {
> =20
>  #endif
> =20
> +static int
> +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long len)
> +{
> +	const unsigned long end =3D addr + len;
> +	struct vm_area_struct *vma;
> +	int ret =3D -EFAULT;
> +
> +	mmap_read_lock(mm);
> +	for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> +		if (vma->vm_start > addr)
> +			break;
> +
> +		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> +			break;
> +
> +		if (vma->vm_end >=3D end) {
> +			ret =3D 0;
> +			break;
> +		}
> +
> +		addr =3D vma->vm_end;
> +	}
> +	mmap_read_unlock(mm);
> +
> +	return ret;
> +}
> +
>  /*
>   * Creates a new mm object that wraps some normal memory from the process
>   * context - user memory.
> @@ -477,7 +504,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>  	}
> =20
>  	if (args->flags & ~(I915_USERPTR_READ_ONLY |
> -			    I915_USERPTR_UNSYNCHRONIZED))
> +			    I915_USERPTR_UNSYNCHRONIZED |
> +			    I915_USERPTR_PROBE))
>  		return -EINVAL;
> =20
>  	if (i915_gem_object_size_2big(args->user_size))
> @@ -504,6 +532,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>  			return -ENODEV;
>  	}
> =20
> +	if (args->flags & I915_USERPTR_PROBE) {
> +		/*
> +		 * Check that the range pointed to represents real struct
> +		 * pages and not iomappings (at this moment in time!)
> +		 */
> +		ret =3D probe_range(current->mm, args->user_ptr, args->user_size);
> +		if (ret)
> +			return ret;
> +	}
> +
>  #ifdef CONFIG_MMU_NOTIFIER
>  	obj =3D i915_gem_object_alloc();
>  	if (obj =3D=3D NULL)
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/=
i915_getparam.c
> index 24e18219eb50..d6d2e1a10d14 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -163,6 +163,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void =
*data,
>  	case I915_PARAM_PERF_REVISION:
>  		value =3D i915_perf_ioctl_version();
>  		break;
> +	case I915_PARAM_HAS_USERPTR_PROBE:
> +		value =3D true;
> +		break;
>  	default:
>  		DRM_DEBUG("Unknown parameter %d\n", param->param);
>  		return -EINVAL;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index e20eeeca7a1c..2e4112bf4d38 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
>   */
>  #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> =20
> +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> +#define I915_PARAM_HAS_USERPTR_PROBE 56
> +
>  /* Must be kept compact -- no holes and well documented */
> =20
>  typedef struct drm_i915_getparam {
> @@ -2178,12 +2181,27 @@ struct drm_i915_gem_userptr {
>  	 * through the GTT. If the HW can't support readonly access, an error is
>  	 * returned.
>  	 *
> +	 * I915_USERPTR_PROBE:
> +	 *
> +	 * Probe the provided @user_ptr range and validate that the @user_ptr is
> +	 * indeed pointing to normal memory and that the range is also valid.
> +	 * For example if some garbage address is given to the kernel, then this
> +	 * should complain.
> +	 *
> +	 * Returns -EFAULT if the probe failed.
> +	 *
> +	 * Note that this doesn't populate the backing pages.
> +	 *
> +	 * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PROBE
> +	 * returns a non-zero value.
> +	 *
>  	 * I915_USERPTR_UNSYNCHRONIZED:
>  	 *
>  	 * NOT USED. Setting this flag will result in an error.
>  	 */
>  	__u32 flags;
>  #define I915_USERPTR_READ_ONLY 0x1
> +#define I915_USERPTR_PROBE 0x2
>  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
>  	/**
>  	 * @handle: Returned handle for the object.
>=20


--nextPart5739491.D0ShQg1dhF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmD4cx8ACgkQW1vaBx1J
zDiuNg/8CgLBUyZImwRDjD5tKKn2m8MIRrIzPpNQlBdoMDQhHmkQXGY5dnonM2ex
3QMlJ0mfLSutsayeVf8z9lOS798obk0Sr29t193Ht/AQzLBslZ9vmuQjdMRVEbil
Zm66eHNp/UAtlpmgdHvujVki8adC5+t4R/5Xa1GY4pWohzlSXaFEwKJjfO9dJdTO
z68HaLtId30IgVQfHTP81DsTfr605N9lSkqNoMAJUKnabFANLgCjXRmRDBb9EGZP
t1qP57fFfRskBsQzo8jG60dghLk1iKHj3LKzDkiX0wJWTxE/Hh+XzLjo9lEAvEkS
L5hMakB6qEFnT3Pa+X2Z2SHcer7WC7Dy7XjdT2rb/+lsrlkMTAXLsRYKVM8lES58
DIndvRJFdkCrh4kCa9UR0uiZhMUNtiFVkFrmYtjXO205mVxhtyriNdoY8Kfikrnx
rNaUK20BuPaKf6mM/IxcjaCXwJ06AhWIsIVuFFwaoZhO6iTb6ZsjTu6AEHeNDQ+K
34l0Gi2BWHnhSm1VkFh/scZWE828QmTWq8OLgp74a/7nYyiNI5CCrPC526rtvPKs
YO0FFvlD7U37rQSXHrBnfyepnOlMWFsrMoRSWIod01+Y5VzJhvu2XM5s1AySg4vy
drxXPVL++sHTFRG4qAyqJABWYy8yaHAeEX+9NC6Z+DdeqW6mvlQ=
=b+LC
-----END PGP SIGNATURE-----

--nextPart5739491.D0ShQg1dhF--



