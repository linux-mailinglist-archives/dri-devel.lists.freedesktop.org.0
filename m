Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355A2C9C8B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C526E4BA;
	Tue,  1 Dec 2020 09:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC66E4BA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:30:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE6D2AB7F;
 Tue,  1 Dec 2020 09:30:21 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <70e396bf-e8a3-4871-7ad1-4a90298d8461@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <cdf02ecf-6b64-2bf5-0579-26e0dbb806fe@suse.de>
Date: Tue, 1 Dec 2020 10:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <70e396bf-e8a3-4871-7ad1-4a90298d8461@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1185665855=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1185665855==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EDJUsUSamMHXb84uL3CnuyTXgI7KbJsPG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EDJUsUSamMHXb84uL3CnuyTXgI7KbJsPG
Content-Type: multipart/mixed; boundary="8iAI029oBJ66mgP77jUSt3QLPvb8cQseJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Message-ID: <cdf02ecf-6b64-2bf5-0579-26e0dbb806fe@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <70e396bf-e8a3-4871-7ad1-4a90298d8461@amd.com>
In-Reply-To: <70e396bf-e8a3-4871-7ad1-4a90298d8461@amd.com>

--8iAI029oBJ66mgP77jUSt3QLPvb8cQseJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 10:13 schrieb Christian K=C3=B6nig:
> Am 01.12.20 um 09:32 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 30.11.20 um 16:33 schrieb Christian K=C3=B6nig:
>>> Am 30.11.20 um 16:30 schrieb Daniel Vetter:
>>>> On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:
>>>>> Mapping a GEM object's buffer into kernel address space prevents th=
e
>>>>> buffer from being evicted from VRAM, which in turn may result in
>>>>> out-of-memory errors. It's therefore required to only vmap GEM BOs =
for
>>>>> short periods of time; unless the GEM implementation provides=20
>>>>> additional
>>>>> guarantees.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>> =C2=A0 drivers/gpu/drm/drm_prime.c |=C2=A0 6 ++++++
>>>>> =C2=A0 include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
16 ++++++++++++++++
>>>>> =C2=A0 2 files changed, 22 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prim=
e.c
>>>>> index 7db55fce35d8..9c9ece9833e0 100644
>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>>>> =C2=A0=C2=A0 * callback. Calls into &drm_gem_object_funcs.vmap for =
device=20
>>>>> specific handling.
>>>>> =C2=A0=C2=A0 * The kernel virtual address is returned in map.
>>>>> =C2=A0=C2=A0 *
>>>>> + * To prevent the GEM object from being relocated, callers must=20
>>>>> hold the GEM
>>>>> + * object's reservation lock from when calling this function until=
=20
>>>>> releasing the
>>>>> + * mapping. Holding onto a mapping and the associated reservation =

>>>>> lock for an
>>>>> + * unbound time may result in out-of-memory errors. Calls to=20
>>>>> drm_gem_dmabuf_vmap()
>>>>> + * should therefore be accompanied by a call to=20
>>>>> drm_gem_dmabuf_vunmap().
>>>>> + *
>>>>> =C2=A0=C2=A0 * Returns 0 on success or a negative errno code otherw=
ise.
>>>> This is a dma-buf hook, which means just documenting the rules you'd=
=20
>>>> like
>>>> to have here isn't enough. We need to roll this out at the dma-buf=20
>>>> level,
>>>> and enforce it.
>>>>
>>>> Enforce it =3D assert_lock_held
>>>>
>>>> Roll out =3D review everyone. Because this goes through dma-buf it'l=
l=20
>>>> come
>>>> back through shmem helpers (and other helpers and other subsystems) =

>>>> back
>>>> to any driver using vmap for gpu buffers. This includes the media
>>>> subsystem, and the media subsystem definitely doesn't cope with just=

>>>> temporarily mapping buffers. So there we need to pin them, which I=20
>>>> think
>>>> means we'll need 2 version of dma_buf_vmap - one that's temporary an=
d
>>>> requires we hold dma_resv lock, the other requires that the buffer i=
s
>>>> pinned.
>>>
>>> OR start to proper use the dma_buf_pin/dma_buf_unpin functions which =

>>> I added to cover this use case as well.
>>
>> While I generally agree, here are some thoughts:
>>
>> I found all generic pin functions useless, because they don't allow=20
>> for specifying where to pin. With fbdev emulation, this means that=20
>> console buffers might never make it to VRAM for scanout. If anything, =

>> the policy should be that pin always pins in HW-accessible memory.
>=20
> Yes, completely agree. The major missing part here are some kind of=20
> usage flags what we want to do with the buffer.

Not sure, but wasn't that not wanted by someone? I don't really remember.=


Given Daniel's reply about pin, it really feels like we have=20
contradicting policies for this interface.

>=20
>>
>> Pin has quite a bit of overhead (more locking, buffer movement), so it=
=20
>> should be the second choice after regular vmap. To make both work=20
>> together, pin probably relies on holding the reservation lock internal=
ly.
>=20
> There is a dma_resv_assert_held() at the beginning of those two functio=
ns.
>=20
>>
>> Therefore I think we still would want some additional helpers, such as=
:
>>
>> =C2=A0 pin_unlocked(), which acquires the resv lock, calls regular pin=
 and=20
>> then drops the resv lock. Same for unpin_unlocked()
>>
>> =C2=A0 vmap_pinned(), which enforces that the buffer has been pinned a=
nd=20
>> then calls regalar vmap. Same for vunmap_pinned()
>=20
> I would rather open code that in each driver, hiding the locking logic =

> in some midlayer is usually not a good idea.

These helpers are less about hiding logic and more about making drivers=20
do the right thing. The idea behind pin_unlocked() is that it drops the=20
reservation lock immediately before returning. I suspect that some=20
driver might not do that with an open-coded version. And vmap_pinned()=20
does check for the BO to be pinned. Regular vmap would assert for the=20
reservation lock instead.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> A typical pattern with these functions would look like this.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object bo;
>> =C2=A0=C2=A0=C2=A0=C2=A0dma_buf_map map;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0init() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_unlocked(bo);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmap_pinned(bo, map);
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0worker() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 begin_cpu_access()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // access bo via map
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end_cpu_access()
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0fini() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vunmap_pinned(bo, map);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unpin_unlocked(bo);
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0init()
>> =C2=A0=C2=A0=C2=A0=C2=A0while (...) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 worker()
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>> =C2=A0=C2=A0=C2=A0=C2=A0fini()
>>
>> Is that reasonable for media drivers?
>>
>> Best regards
>> Thomas
>>
>>
>>>
>>> Cheers,
>>> Christian.
>>>
>>>>
>>>> That's what I meant with that this approach here is very sprawling :=
-/
>>>> -Daniel
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


--8iAI029oBJ66mgP77jUSt3QLPvb8cQseJ--

--EDJUsUSamMHXb84uL3CnuyTXgI7KbJsPG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GDSwFAwAAAAAACgkQlh/E3EQov+Co
Lw//YzC2m9bJ1Jk2Uq+3X0ZN9jxOYs6DliDNv0MtYAi6SJrVt7mRVOGbmH0FbJU3tPoRpFUkELeP
tRv5TsRSny+WJbKKbllkEbTNYWhun60Y43TLXvYml5bB6v9lC40zyx8rNwDFvI4xdqiiEfTZ2x0r
GMMHrp4vtoTT+Kkv5LQYMt2mCIaZVOnMebfXBk8ZDliV60U/e0GiDdnQLSaxZ7Fj5YWZtmMk3g4m
h8vjrqidZonUJENblud/B1WKPl8pGmt+2+8gtv97GFmbabUvrqyJqwpK56kZLZexyksZLRYFfTVE
ug8opcU3o39d2SYGb0KGatXLCJFBniUyVMC7Yqx1wFtn9igjJ5hkYYTRXk+Bm6EwiBXhIjUvUCMf
mUeUm/vxnDxZqHluTaxnFomQEhFqWYmRdOOz2xrbMbGYLTL+XeFXkUwnv3zu01KoSEHzvOFNCDVf
8NGdnGuFbFs9Us/lfz01YWKZvdoiwGfDjF7dT5tbkvMcyW8ZSo0dOk7+Qv/2US26bWvu2OghgqXM
bJoKzNsN3DuOQAPKa84B3mzM+tjOsPTJArgi8TX3f5w/px3BfaOeMF/MsY/ooMEQl+BiD73n35qq
CVIHy6JeWFzs5vHnbAnKd0y1ZEqZwmUsNZxg2e6x97exzqg9P/CS3zUqp/gROH+GVL+kQJGWX/yg
DGA=
=Dg+G
-----END PGP SIGNATURE-----

--EDJUsUSamMHXb84uL3CnuyTXgI7KbJsPG--

--===============1185665855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1185665855==--
