Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85D2C98F1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23C26E4B7;
	Tue,  1 Dec 2020 08:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466666E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:15:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D8FDAC2F;
 Tue,  1 Dec 2020 08:15:11 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <b940ba0c-8c8e-7f8f-8545-9ff6f10959e2@suse.de>
Date: Tue, 1 Dec 2020 09:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130153048.GS401619@phenom.ffwll.local>
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
Cc: hdegoede@redhat.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0088023830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0088023830==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x3AMs3fEYTpWNSY0vdYuabPdxX3IJqiIk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x3AMs3fEYTpWNSY0vdYuabPdxX3IJqiIk
Content-Type: multipart/mixed; boundary="mcWyBTCEkV9sfx4uXVeOUgojYW8xfUKUS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hdegoede@redhat.com, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 christian.koenig@amd.com
Message-ID: <b940ba0c-8c8e-7f8f-8545-9ff6f10959e2@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
In-Reply-To: <20201130153048.GS401619@phenom.ffwll.local>

--mcWyBTCEkV9sfx4uXVeOUgojYW8xfUKUS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 30.11.20 um 16:30 schrieb Daniel Vetter:
> On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:
>> Mapping a GEM object's buffer into kernel address space prevents the
>> buffer from being evicted from VRAM, which in turn may result in
>> out-of-memory errors. It's therefore required to only vmap GEM BOs for=

>> short periods of time; unless the GEM implementation provides addition=
al
>> guarantees.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_prime.c |  6 ++++++
>>   include/drm/drm_gem.h       | 16 ++++++++++++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=

>> index 7db55fce35d8..9c9ece9833e0 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>    * callback. Calls into &drm_gem_object_funcs.vmap for device specif=
ic handling.
>>    * The kernel virtual address is returned in map.
>>    *
>> + * To prevent the GEM object from being relocated, callers must hold =
the GEM
>> + * object's reservation lock from when calling this function until re=
leasing the
>> + * mapping. Holding onto a mapping and the associated reservation loc=
k for an
>> + * unbound time may result in out-of-memory errors. Calls to drm_gem_=
dmabuf_vmap()
>> + * should therefore be accompanied by a call to drm_gem_dmabuf_vunmap=
().
>> + *
>>    * Returns 0 on success or a negative errno code otherwise.
>=20
> This is a dma-buf hook, which means just documenting the rules you'd li=
ke
> to have here isn't enough. We need to roll this out at the dma-buf leve=
l,
> and enforce it.
>=20

The documentation for GEM vmap callbacks point here, so it was a good=20
point to start.

I know about the dependencies on dmabuf. But fixing everything now is=20
unrealistic. My hope for this patch is that we can find the necessary=20
rules and document them.

> Enforce it =3D assert_lock_held

That's probably the final step of many.

Best regards
Thomas

>=20
> Roll out =3D review everyone. Because this goes through dma-buf it'll c=
ome
> back through shmem helpers (and other helpers and other subsystems) bac=
k
> to any driver using vmap for gpu buffers. This includes the media
> subsystem, and the media subsystem definitely doesn't cope with just
> temporarily mapping buffers. So there we need to pin them, which I thin=
k
> means we'll need 2 version of dma_buf_vmap - one that's temporary and
> requires we hold dma_resv lock, the other requires that the buffer is
> pinned.
>=20
> That's what I meant with that this approach here is very sprawling :-/
> -Daniel
>=20
>>    */
>>   int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map =
*map)
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 5e6daa1c982f..7c34cd5ec261 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>   	 * Returns a virtual address for the buffer. Used by the
>>   	 * drm_gem_dmabuf_vmap() helper.
>>   	 *
>> +	 * Notes to implementors:
>> +	 *
>> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
>> +	 *   called frequently and should optimize for this case.
>> +	 *
>> +	 * - Implemenations may expect the caller to hold the GEM object's
>> +	 *   reservation lock to protect against concurrent calls and reloca=
tion
>> +	 *   of the GEM object.
>> +	 *
>> +	 * - Implementations may provide additional guarantees (e.g., workin=
g
>> +	 *   without holding the reservation lock).
>> +	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also drm_gem_dmabuf_vmap()
>>   	 */
>>   	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>>  =20
>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>   	 * drm_gem_dmabuf_vunmap() helper.
>>   	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also @vmap.
>>   	 */
>>   	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map)=
;
>>  =20
>> --=20
>> 2.29.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mcWyBTCEkV9sfx4uXVeOUgojYW8xfUKUS--

--x3AMs3fEYTpWNSY0vdYuabPdxX3IJqiIk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/F+44FAwAAAAAACgkQlh/E3EQov+A8
CRAAiWD98GoRNHzmzIWo6fCndhDPkoD0txFo1Rm2qoGTH4tW6u4ZDEHXVE91RhxKCORNCQKxfkS/
SFIHdAl00ihuyG1SLohQrxeRbUZz7rHgfp/Ej6xnLX3foVL0BWnzGuEaCJRQjWySsvhLUZTVwvjX
9odpDbiDAiua1RUQ8zsx5GeerlFXYUSNEYsm8oPt/P0vjkP9cUO364BMVoS1GEMKHQ+Y/pI6kL9k
VzvcAnBOdFiVzE0EYnpq+Z4EdeYL5h72LO4ZZUSWmqjXU2BO47qh2lk3MlXGa+bz+VG2cIeyKrNX
VzbchpQXDG3OxlIwpc0FwHOceAlkDeB9vhCJ/OoYU0ZOkxQAsiYY+yIwB3R5L01bVy5vqgn6jLmd
tk0oAsy7Rga/Gx3mkvRUr77UlX3uorWqPrOLCv17/RGCsd9NQ3ovX9iFyeqSCq1lxj+jJpRk8XOo
AhQbFiSs6mHvJ3TsejSFdHnVVGzyHNYW/13h6tjLJafurLeo9EQ/YSZBDpFJhXte5Bvyolb/0cnU
hFE+KynEPpw2kU9+WiRFk47iFqWVG06JauOxg7NqbcWvGTZB16XOfJE7iFR76+wZkyuxF2KIIDsB
EwFxXKLVM23kXmYiIKn8IFfXzx2GPBroY8zRBjVZ7vOMotpmPFwyweRXOEEqIfws/3Nwncphya/G
nuM=
=0iac
-----END PGP SIGNATURE-----

--x3AMs3fEYTpWNSY0vdYuabPdxX3IJqiIk--

--===============0088023830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0088023830==--
