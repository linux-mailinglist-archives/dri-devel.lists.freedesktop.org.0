Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A822C9D6C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851A36E4CA;
	Tue,  1 Dec 2020 09:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974DF6E4CA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:40:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EDE5ACD5;
 Tue,  1 Dec 2020 09:40:21 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
Date: Tue, 1 Dec 2020 10:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============0394411724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0394411724==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xq0rigkKXjpv9evbDAVS4ZF5IpariWd4f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xq0rigkKXjpv9evbDAVS4ZF5IpariWd4f
Content-Type: multipart/mixed; boundary="pJ5zNfKs8iPdMWifA6siVGLlewD8iqpim";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
In-Reply-To: <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>

--pJ5zNfKs8iPdMWifA6siVGLlewD8iqpim
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 10:10 schrieb Daniel Vetter:
> On Tue, Dec 1, 2020 at 9:32 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
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
>>>>> short periods of time; unless the GEM implementation provides addit=
ional
>>>>> guarantees.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_prime.c |  6 ++++++
>>>>>    include/drm/drm_gem.h       | 16 ++++++++++++++++
>>>>>    2 files changed, 22 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prim=
e.c
>>>>> index 7db55fce35d8..9c9ece9833e0 100644
>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>>>>     * callback. Calls into &drm_gem_object_funcs.vmap for device
>>>>> specific handling.
>>>>>     * The kernel virtual address is returned in map.
>>>>>     *
>>>>> + * To prevent the GEM object from being relocated, callers must ho=
ld
>>>>> the GEM
>>>>> + * object's reservation lock from when calling this function until=

>>>>> releasing the
>>>>> + * mapping. Holding onto a mapping and the associated reservation
>>>>> lock for an
>>>>> + * unbound time may result in out-of-memory errors. Calls to
>>>>> drm_gem_dmabuf_vmap()
>>>>> + * should therefore be accompanied by a call to
>>>>> drm_gem_dmabuf_vunmap().
>>>>> + *
>>>>>     * Returns 0 on success or a negative errno code otherwise.
>>>> This is a dma-buf hook, which means just documenting the rules you'd=
 like
>>>> to have here isn't enough. We need to roll this out at the dma-buf l=
evel,
>>>> and enforce it.
>>>>
>>>> Enforce it =3D assert_lock_held
>>>>
>>>> Roll out =3D review everyone. Because this goes through dma-buf it'l=
l come
>>>> back through shmem helpers (and other helpers and other subsystems) =
back
>>>> to any driver using vmap for gpu buffers. This includes the media
>>>> subsystem, and the media subsystem definitely doesn't cope with just=

>>>> temporarily mapping buffers. So there we need to pin them, which I t=
hink
>>>> means we'll need 2 version of dma_buf_vmap - one that's temporary an=
d
>>>> requires we hold dma_resv lock, the other requires that the buffer i=
s
>>>> pinned.
>>>
>>> OR start to proper use the dma_buf_pin/dma_buf_unpin functions which =
I
>>> added to cover this use case as well.
>>
>> While I generally agree, here are some thoughts:
>>
>> I found all generic pin functions useless, because they don't allow fo=
r
>> specifying where to pin. With fbdev emulation, this means that console=

>> buffers might never make it to VRAM for scanout. If anything, the poli=
cy
>> should be that pin always pins in HW-accessible memory.
>>
>> Pin has quite a bit of overhead (more locking, buffer movement), so it=

>> should be the second choice after regular vmap. To make both work
>> together, pin probably relies on holding the reservation lock internal=
ly.
>>
>> Therefore I think we still would want some additional helpers, such as=
:
>>
>>     pin_unlocked(), which acquires the resv lock, calls regular pin an=
d
>> then drops the resv lock. Same for unpin_unlocked()
>>
>>     vmap_pinned(), which enforces that the buffer has been pinned and
>> then calls regalar vmap. Same for vunmap_pinned()
>>
>> A typical pattern with these functions would look like this.
>>
>>          drm_gem_object bo;
>>          dma_buf_map map;
>>
>>          init() {
>>                  pin_unlocked(bo);
>>                  vmap_pinned(bo, map);
>>          }
>>
>>          worker() {
>>                  begin_cpu_access()
>>                  // access bo via map
>>                  end_cpu_access()
>>          }
>>
>>          fini() {
>>                  vunmap_pinned(bo, map);
>>                  unpin_unlocked(bo);
>>          }
>>
>>          init()
>>          while (...) {
>>                  worker()
>>          }
>>          fini()
>>
>> Is that reasonable for media drivers?
>=20
> So media drivers go through dma-buf, which means we always pin into
> system memory. Which I guess for vram-only display drivers makes no
> sense and should be rejected, but we still need somewhat consistent
> rules.
>=20
> The other thing is that if you do a dma_buf_attach without dynamic
> mode, dma-buf will pin things for you already. So in many cases it

Do you have a pointer to code that illustrates this well?

> could be that we don't need a separate pin (but since the pin is in
> the exporter, not dma-buf layer, we can't check for that). I'm also
> not seeing why existing users need to split up their dma_buf_vmap into
> a pin + vmap, they don't need them separately.

It's two different operations, with pin having some possible overhead=20
and failure conditions. And during the last discussion, pin was say to=20
be for userspace-managed buffers. Kernel code should hold the=20
reservation lock.

For my POV, the current interfaces have no clear policy or semantics.=20
Looking through the different GEM implementations, each one seems to=20
have its own interpretation.

>=20
> I think we could use what we've done for dynamic dma-buf attachment
> (which also change locking rules) and just have new functions for the
> new way (i.e. short term vmap protected by dma_resv lock. Maybe call
> these dma_buf_vmap_local, in the spirit of the new kmap_local which
> are currently under discussion. I think _local suffix is better, for
> otherwise people might do something silly like
>=20
>      dma_resv_lock();
>      dma_buf_vmap_locked();
>      dma_resv_unlock();
>=20
>      /* actual access maybe even in some other thread */
>=20
>     dma_buf_resv_lock();
>     dma_buf_vunmap_unlocked();
>     dma_resv_unlock();
>=20
> _local suffix is better at telling that the resulting pointer has very
> limited use (essentially just local to the calling context, if you
> don't change any locking or anything).

_local sounds good.

Best regards
Thomas

>=20
> I think encouraging importers to call dma_buf_pin/unpin isn't a good
> idea. Yes dynamic ones need it, but maybe we should check for that
> somehow in the exporterd interface (atm only amdgpu is using it).
> -Daniel
>=20
>=20
>=20
>=20
>=20
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
>>>>
>>>>>     */
>>>>>    int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_=
map
>>>>> *map)
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>>>>         * Returns a virtual address for the buffer. Used by the
>>>>>         * drm_gem_dmabuf_vmap() helper.
>>>>>         *
>>>>> +     * Notes to implementors:
>>>>> +     *
>>>>> +     * - Implementations must expect pairs of @vmap and @vunmap to=
 be
>>>>> +     *   called frequently and should optimize for this case.
>>>>> +     *
>>>>> +     * - Implemenations may expect the caller to hold the GEM obje=
ct's
>>>>> +     *   reservation lock to protect against concurrent calls and
>>>>> relocation
>>>>> +     *   of the GEM object.
>>>>> +     *
>>>>> +     * - Implementations may provide additional guarantees (e.g.,
>>>>> working
>>>>> +     *   without holding the reservation lock).
>>>>> +     *
>>>>>         * This callback is optional.
>>>>> +     *
>>>>> +     * See also drm_gem_dmabuf_vmap()
>>>>>         */
>>>>>        int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *=
map);
>>>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>>>>         * drm_gem_dmabuf_vunmap() helper.
>>>>>         *
>>>>>         * This callback is optional.
>>>>> +     *
>>>>> +     * See also @vmap.
>>>>>         */
>>>>>        void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_ma=
p
>>>>> *map);
>>>>> --
>>>>> 2.29.2
>>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pJ5zNfKs8iPdMWifA6siVGLlewD8iqpim--

--xq0rigkKXjpv9evbDAVS4ZF5IpariWd4f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GD4MFAwAAAAAACgkQlh/E3EQov+Cm
8g/8DIJTpzeoZh2t+r0eIaw7YMvWSz7hH6iRpG4aAMTOBNf71QTe6vR5tupvgYujwJSeLBDQM2DD
GAhhF6h7uqs6x99mXDmHIJ4i/IkcixB8T68ylbrVHgIxXYeqsXL2PqTrjlSsKkYeMgDRtI46mPlH
oE8QZRuB4QIwC5BO5HMiMYMUKdw8q30nY+X5xhrT/bdv+8UOBLx33CZR3RgCaamgxcBIWmhETR7i
a9O5f/w7cXlv6gMgRZeRxislYTnrUp1zm70g1pIwwrb3wDy3x/alHFYeD+zTjwEQ5JNiMpOQJNI4
7G5LoUAYjQi7vl9k39S8KDbHfvtRiyTlReOv2LmiJvop+27qvceFk0VNXiir/5hW6t+mUr5oNYuR
Hj6feNPbhO+2gwKwzEeCEt3r2VU4UNWthp8eIILzdvnyZGSGrZyYcUhcu9p+xXEJhQEglL8evZsn
qKupr1k8t7mNgse+Bj7VqLvscTHMf/VwVOlGKqr5RjDomQSAJQTM22pA854R01RibZ/GOl7xJQDF
6uTyLjsMD2m6TR1B7etbRdU2w3gixMyXRlUhpvCQgehU7DRxwAwoknhm34DVqwYVJRfPA/kmzPCZ
9JafRH8MqrNNmKxO/pbQon17M6aDqf+JdJiwNWI7aO4LWARE7sjmK2g3ZeHi05aSsNmxz2HF6a3l
AlA=
=9p/f
-----END PGP SIGNATURE-----

--xq0rigkKXjpv9evbDAVS4ZF5IpariWd4f--

--===============0394411724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0394411724==--
