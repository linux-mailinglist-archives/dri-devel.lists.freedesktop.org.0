Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA812C9985
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C716E4AF;
	Tue,  1 Dec 2020 08:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFEC6E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:32:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FD23AC2F;
 Tue,  1 Dec 2020 08:32:36 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
Date: Tue, 1 Dec 2020 09:32:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Type: multipart/mixed; boundary="===============1937788386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1937788386==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="81ZQMXyGzy09hGb9DEcwo9h28YlNqw9Kh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--81ZQMXyGzy09hGb9DEcwo9h28YlNqw9Kh
Content-Type: multipart/mixed; boundary="R9TFzLgjz7t4sVLMzVOnqgikb4zdGSUTW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Message-ID: <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
In-Reply-To: <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>

--R9TFzLgjz7t4sVLMzVOnqgikb4zdGSUTW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 16:33 schrieb Christian K=C3=B6nig:
> Am 30.11.20 um 16:30 schrieb Daniel Vetter:
>> On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:
>>> Mapping a GEM object's buffer into kernel address space prevents the
>>> buffer from being evicted from VRAM, which in turn may result in
>>> out-of-memory errors. It's therefore required to only vmap GEM BOs fo=
r
>>> short periods of time; unless the GEM implementation provides additio=
nal
>>> guarantees.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 drivers/gpu/drm/drm_prime.c |=C2=A0 6 ++++++
>>> =C2=A0 include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16=
 ++++++++++++++++
>>> =C2=A0 2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.=
c
>>> index 7db55fce35d8..9c9ece9833e0 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>> =C2=A0=C2=A0 * callback. Calls into &drm_gem_object_funcs.vmap for de=
vice=20
>>> specific handling.
>>> =C2=A0=C2=A0 * The kernel virtual address is returned in map.
>>> =C2=A0=C2=A0 *
>>> + * To prevent the GEM object from being relocated, callers must hold=
=20
>>> the GEM
>>> + * object's reservation lock from when calling this function until=20
>>> releasing the
>>> + * mapping. Holding onto a mapping and the associated reservation=20
>>> lock for an
>>> + * unbound time may result in out-of-memory errors. Calls to=20
>>> drm_gem_dmabuf_vmap()
>>> + * should therefore be accompanied by a call to=20
>>> drm_gem_dmabuf_vunmap().
>>> + *
>>> =C2=A0=C2=A0 * Returns 0 on success or a negative errno code otherwis=
e.
>> This is a dma-buf hook, which means just documenting the rules you'd l=
ike
>> to have here isn't enough. We need to roll this out at the dma-buf lev=
el,
>> and enforce it.
>>
>> Enforce it =3D assert_lock_held
>>
>> Roll out =3D review everyone. Because this goes through dma-buf it'll =
come
>> back through shmem helpers (and other helpers and other subsystems) ba=
ck
>> to any driver using vmap for gpu buffers. This includes the media
>> subsystem, and the media subsystem definitely doesn't cope with just
>> temporarily mapping buffers. So there we need to pin them, which I thi=
nk
>> means we'll need 2 version of dma_buf_vmap - one that's temporary and
>> requires we hold dma_resv lock, the other requires that the buffer is
>> pinned.
>=20
> OR start to proper use the dma_buf_pin/dma_buf_unpin functions which I =

> added to cover this use case as well.

While I generally agree, here are some thoughts:

I found all generic pin functions useless, because they don't allow for=20
specifying where to pin. With fbdev emulation, this means that console=20
buffers might never make it to VRAM for scanout. If anything, the policy =

should be that pin always pins in HW-accessible memory.

Pin has quite a bit of overhead (more locking, buffer movement), so it=20
should be the second choice after regular vmap. To make both work=20
together, pin probably relies on holding the reservation lock internally.=


Therefore I think we still would want some additional helpers, such as:

   pin_unlocked(), which acquires the resv lock, calls regular pin and=20
then drops the resv lock. Same for unpin_unlocked()

   vmap_pinned(), which enforces that the buffer has been pinned and=20
then calls regalar vmap. Same for vunmap_pinned()

A typical pattern with these functions would look like this.

	drm_gem_object bo;
	dma_buf_map map;

	init() {
		pin_unlocked(bo);
		vmap_pinned(bo, map);
	}

	worker() {
		begin_cpu_access()
		// access bo via map
		end_cpu_access()
	}

	fini() {
		vunmap_pinned(bo, map);
		unpin_unlocked(bo);
	}

	init()
	while (...) {
		worker()
	}
	fini()

Is that reasonable for media drivers?

Best regards
Thomas


>=20
> Cheers,
> Christian.
>=20
>>
>> That's what I meant with that this approach here is very sprawling :-/=

>> -Daniel
>>
>>> =C2=A0=C2=A0 */
>>> =C2=A0 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_bu=
f_map=20
>>> *map)
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Returns a virtual address for =
the buffer. Used by the
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmabuf_vmap() helper.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Notes to implementors:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations must expect pairs of @v=
map and @vunmap to be
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 called frequently and should =
optimize for this case.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implemenations may expect the caller to=
 hold the GEM object's
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 reservation lock to protect a=
gainst concurrent calls and=20
>>> relocation
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 of the GEM object.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations may provide additional =
guarantees (e.g.,=20
>>> working
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 without holding the reservati=
on lock).
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is optional.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also drm_gem_dmabuf_vmap()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*vmap)(struct drm_gem_object *obj=
, struct dma_buf_map *map);
>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmabuf_vunmap() helper=
=2E
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is optional.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also @vmap.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*vunmap)(struct drm_gem_object *=
obj, struct dma_buf_map=20
>>> *map);
>>> --=20
>>> 2.29.2
>>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--R9TFzLgjz7t4sVLMzVOnqgikb4zdGSUTW--

--81ZQMXyGzy09hGb9DEcwo9h28YlNqw9Kh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/F/6MFAwAAAAAACgkQlh/E3EQov+CO
FBAAxRFL91nrsQ/w9uuubu+qBdMeasUTcsnid/XbbLFJPejJ793sxeCXm8CZV+IKynahyjV2EfJt
r+8kwyA9rMDVg1nbfe4gUvjWlAssqMmbVfuvG+CVRU84hVNSQwBuJ6Vly3yHUEBv90HJKdxUtdd2
p1sgKLUjJgG6gqjIFx2qSh/1SiE69OGstgk1NV7c18hdr2MleCoGr2dAe+eUH4HKYckbMKLPjePU
rygsPFSCOatzZTdeHDFn427Q6ibuBVXjmTbADN5H7SgphoO/j0xL1XzqEwDIR9//lx3obVnVyYz+
GxHp2ay5RO1Y8QjyH9hbJ3oMMl+kA9qKztU1Xh8M+zpnDAY/dj/WOKRfTpiOoELC7hMiSzuliWqT
pYgY7FGmmTPYRJ791bvyiuVzbDd4IewrABehSGwuLV9WAO46WfD2mO5NciesVEyaGSDPb84cjIxd
m5vjvWN2OPTUCaml+o17RI/Na3keNioIORoatC6q4eaIMfqXY21vuji7BJLAOjTbn97aYOsNbVmq
+g5x+vyMUeIO5i+TLWv2ZGMLF8bvcWnrmIyNYb56mXFfuOe4CcmLb5g00BfASW90nRl61LBrMkDl
rT9+eV7Im7SabS0KiKFc1Xj6IZgSaqHoC3LpHvA1JXHZUC5gzW9KAWAl77Rk+1tMzfAnL+kSEyRv
Juo=
=puGi
-----END PGP SIGNATURE-----

--81ZQMXyGzy09hGb9DEcwo9h28YlNqw9Kh--

--===============1937788386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1937788386==--
