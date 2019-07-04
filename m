Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16245F3BF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D36E26F;
	Thu,  4 Jul 2019 07:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6A76E26F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 07:31:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F06FACC5;
 Thu,  4 Jul 2019 07:31:12 +0000 (UTC)
Subject: Re: [PATCH 1/5] drm/client: Support unmapping of DRM client buffers
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <20190703083302.2609-2-tzimmermann@suse.de>
 <458e7d7d-3aa5-5d45-6c5c-62fadd9e4e91@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <db996d99-61a2-7529-63c1-226123cf0baa@suse.de>
Date: Thu, 4 Jul 2019 09:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <458e7d7d-3aa5-5d45-6c5c-62fadd9e4e91@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============0762311076=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0762311076==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sly6dSTEO1ExB8Z4ZvqDMnjcoDJc0GjoW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sly6dSTEO1ExB8Z4ZvqDMnjcoDJc0GjoW
Content-Type: multipart/mixed; boundary="AAYT1TAsgQuJrqGpwA1VD3lmeJVFLLECD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <db996d99-61a2-7529-63c1-226123cf0baa@suse.de>
Subject: Re: [PATCH 1/5] drm/client: Support unmapping of DRM client buffers
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <20190703083302.2609-2-tzimmermann@suse.de>
 <458e7d7d-3aa5-5d45-6c5c-62fadd9e4e91@tronnes.org>
In-Reply-To: <458e7d7d-3aa5-5d45-6c5c-62fadd9e4e91@tronnes.org>

--AAYT1TAsgQuJrqGpwA1VD3lmeJVFLLECD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.07.19 um 16:07 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 03.07.2019 10.32, skrev Thomas Zimmermann:
>> DRM clients, such as the fbdev emulation, have their buffer objects
>> mapped by default. Mapping a buffer implicitly prevents its relocation=
=2E
>> Hence, the buffer may permanently consume video memory while it's
>> allocated. This is a problem for drivers of low-memory devices, such a=
s
>> ast, mgag200 or older framebuffer hardware, which will then not have
>> enough memory to display other content (e.g., X11).
>>
>> This patch introduces drm_client_buffer_vmap() and _vunmap(). Internal=

>> DRM clients can use these functions to unmap and remap buffer objects
>> as needed.
>>
>> There's no reference counting for vmap operations. Callers are expecte=
d
>> to either keep buffers mapped (as it is now), or call vmap and vunmap
>> in pairs around code that accesses the mapped memory.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_client.c | 71 +++++++++++++++++++++++++++++++----=
-
>>  include/drm/drm_client.h     |  3 ++
>>  2 files changed, 64 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
=2Ec
>> index 410572f14257..d04660c4470a 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -235,7 +235,8 @@ static void drm_client_buffer_delete(struct drm_cl=
ient_buffer *buffer)
>>  {
>>  	struct drm_device *dev =3D buffer->client->dev;
>> =20
>> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> +	if (buffer->vaddr)
>=20
> No need for this, drm_gem_vunmap() has a NULL check.
>=20
>> +		drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> =20
>>  	if (buffer->gem)
>>  		drm_gem_object_put_unlocked(buffer->gem);
>> @@ -281,6 +282,43 @@ drm_client_buffer_create(struct drm_client_dev *c=
lient, u32 width, u32 height, u
>> =20
>>  	buffer->gem =3D obj;
>> =20
>> +	vaddr =3D drm_client_buffer_vmap(buffer);
>=20
> I think we should change this and _not_ vmap on buffer creation.
> Eventually we'll get bootsplash and console clients and they will also
> have to deal with these low memory devices. AFAICS the only client that=

> will need a virtual address at all times is the fbdev client when it
> doesn't use a shadow buffer.

Exactly my thoughts. I didn't want to overload the patch set with
changing clients to not map the buffer by default. But since you mention
it...

Best regards
Thomas

>=20
>> +	if (IS_ERR(vaddr)) {
>> +		ret =3D PTR_ERR(vaddr);
>> +		goto err_delete;
>> +	}
>> +
>> +	return buffer;
>> +
>> +err_delete:
>> +	drm_client_buffer_delete(buffer);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +/**
>> + * drm_client_buffer_vmap - Map DRM client buffer into address space
>> + * @buffer: DRM client buffer
>> + *
>> + * This function maps a client buffer into kernel address space. If t=
he
>> + * buffer is already mapped, it returns the mapping's address.
>> + *
>> + * Client buffer mappings are not ref'counted. Each call to
>> + * drm_client_buffer_vmap() should be followed by a call to
>> + * drm_client_buffer_vunmap(); or the client buffer should be mapped
>> + * throughout its lifetime. The latter is the default.
>> + *
>> + * Returns:
>> + *	The mapped memory's address
>> + */
>> +void *
>> +drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>> +{
>> +	void *vaddr;
>> +
>> +	if (buffer->vaddr)
>> +		return buffer->vaddr;
>> +
>>  	/*
>>  	 * FIXME: The dependency on GEM here isn't required, we could
>>  	 * convert the driver handle to a dma-buf instead and use the
>> @@ -289,21 +327,34 @@ drm_client_buffer_create(struct drm_client_dev *=
client, u32 width, u32 height, u
>>  	 * fd_install step out of the driver backend hooks, to make that
>>  	 * final step optional for internal users.
>>  	 */
>> -	vaddr =3D drm_gem_vmap(obj);
>> -	if (IS_ERR(vaddr)) {
>> -		ret =3D PTR_ERR(vaddr);
>> -		goto err_delete;
>> -	}
>> +	vaddr =3D drm_gem_vmap(buffer->gem);
>> +	if (IS_ERR(vaddr))
>> +		return vaddr;
>> =20
>>  	buffer->vaddr =3D vaddr;
>> =20
>> -	return buffer;
>> +	return vaddr;
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_vmap);
>> =20
>> -err_delete:
>> -	drm_client_buffer_delete(buffer);
>> +/**
>> + * drm_client_buffer_vunmap - Unmap DRM client buffer
>> + * @buffer: DRM client buffer
>> + *
>> + * This function removes a client buffer's memory mmapping. This
>> + * function is only required by clients that manage their buffers
>> + * by themselves. By default, DRM client buffers are mapped throughou=
t
>> + * their entire lifetime.
>> + */
>> +void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>> +{
>> +	if (!buffer->vaddr)
>=20
> No need for a NULL check here either.
>=20
> Noralf.
>=20
>> +		return;
>> =20
>> -	return ERR_PTR(ret);
>> +	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> +	buffer->vaddr =3D NULL;
>>  }
>> +EXPORT_SYMBOL(drm_client_buffer_vunmap);
>> =20
>>  static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
>>  {
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 72d51d1e9dd9..e1db1d9da0bf 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -149,6 +149,9 @@ struct drm_client_buffer {
>>  struct drm_client_buffer *
>>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 widt=
h, u32 height, u32 format);
>>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);=

>> +void *
>> +drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>> +void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>> =20
>>  int drm_client_modeset_create(struct drm_client_dev *client);
>>  void drm_client_modeset_free(struct drm_client_dev *client);
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--AAYT1TAsgQuJrqGpwA1VD3lmeJVFLLECD--

--sly6dSTEO1ExB8Z4ZvqDMnjcoDJc0GjoW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0dqz4ACgkQaA3BHVML
eiOYgwf6AwcYz+ep3XjNFog7hjm3Bwmd6cDE1rNQRdwC6rQFf3z7Jgl1xTImbrxT
BfYlMEHF+YxouKqj30dB0GxFs7gjwt0bum+N/IygFumjvJ0hVCjvyKOPZAc1t1Aq
/QrgNnczDAiY8E4ao7tDXpdXFFaqYmwu/Kj6wXaKOgJNnV5EAmlmj8tVMKGnN3c6
KOZQ2eG4U4DDp1nFjenXCsm1WOPUilFFIKp04D8nX5VEHBnqvvz47QXyPfCujAEt
qASJ4rOzcC+ecNNW4q6rYmT8cCvsN6XMLKVXAJ7DEUxtmu18Np1LYZOBC6RlakRH
qRok0/cyReOEUW103F+yjF9Pe3eUHA==
=XpJR
-----END PGP SIGNATURE-----

--sly6dSTEO1ExB8Z4ZvqDMnjcoDJc0GjoW--

--===============0762311076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0762311076==--
