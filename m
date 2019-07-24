Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CC73446
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75496E56B;
	Wed, 24 Jul 2019 16:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5A6E56B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:55:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FE39AE37;
 Wed, 24 Jul 2019 16:55:05 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/vram: Provide vmap and vunmap operations for GEM
 VRAM objects
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190724113020.3752-1-tzimmermann@suse.de>
 <20190724113020.3752-2-tzimmermann@suse.de>
 <CAKMK7uHoRUicAODYQ2Jc7o743_1fMfrUqZrLdDP7Hpf--gt3Tw@mail.gmail.com>
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
Message-ID: <ccb094c7-b3a4-067a-5ee3-985b24ae6491@suse.de>
Date: Wed, 24 Jul 2019 18:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHoRUicAODYQ2Jc7o743_1fMfrUqZrLdDP7Hpf--gt3Tw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1704807959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1704807959==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BxTga9wR4uS0xXoxuXVwdd8NfuBLYR15q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BxTga9wR4uS0xXoxuXVwdd8NfuBLYR15q
Content-Type: multipart/mixed; boundary="LiG9F5B8J4ta7KXoyvRQciANifWSIEVx4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Airlie <airlied@redhat.com>, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <ccb094c7-b3a4-067a-5ee3-985b24ae6491@suse.de>
Subject: Re: [PATCH 1/3] drm/vram: Provide vmap and vunmap operations for GEM
 VRAM objects
References: <20190724113020.3752-1-tzimmermann@suse.de>
 <20190724113020.3752-2-tzimmermann@suse.de>
 <CAKMK7uHoRUicAODYQ2Jc7o743_1fMfrUqZrLdDP7Hpf--gt3Tw@mail.gmail.com>
In-Reply-To: <CAKMK7uHoRUicAODYQ2Jc7o743_1fMfrUqZrLdDP7Hpf--gt3Tw@mail.gmail.com>

--LiG9F5B8J4ta7KXoyvRQciANifWSIEVx4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.07.19 um 14:00 schrieb Daniel Vetter:
> On Wed, Jul 24, 2019 at 1:30 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> The pattern of temporarily pinning and kmap-ing the BO's memory is
>> common enough to justify helper functions that do and undo these
>> operations.
>>
>> The implementation of vmap and vunmap for GEM VRAM helpers is
>> already in PRIME helpers. The patch moves the operations to separate
>> functions and exports them for general use.
>>
>> The patch also adds a note about possible kmap counting. So far this
>> isn't required by drivers, but more complex use cases might make it
>> necessary.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 55 ++++++++++++++++++++++----=
-
>>  include/drm/drm_gem_vram_helper.h     | 12 ++++++
>>  2 files changed, 57 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index e0fbfb6570cf..54758e4debca 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -340,6 +340,48 @@ void drm_gem_vram_kunmap(struct drm_gem_vram_obje=
ct *gbo)
>>  }
>>  EXPORT_SYMBOL(drm_gem_vram_kunmap);
>>
>> +/**
>> + * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel =
address
>> +       space
>> + * @gem:       The GEM VRAM object to map
>=20
> variable names need to match, kernel-doc should be complaining here.
>=20
>> + *
>> + * The vmap function pins a GEM VRAM object to it's current location,=
 either
>> + * system or video memory, and maps it's buffer into kernel address s=
pace. As
>> + * pinned object cannot be reloacted, you should not permanently pin =
objects.
>=20
> Imo also good to point at the corresponding functions, i.e. reference
> unmap here and in the unmap function reference the map function. And
> please make sure the links work in the generated doc output.
>=20
>> + *
>> + * Returns:
>> + * The buffer's virtual address on success, or
>> + * an ERR_PTR()-encoded error code otherwise.
>> + */
>> +void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>> +{
>> +       int ret;
>> +       void *base;
>> +
>> +       ret =3D drm_gem_vram_pin(gbo, 0);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +       base =3D drm_gem_vram_kmap(gbo, true, NULL);
>> +       if (IS_ERR(base)) {
>> +               drm_gem_vram_unpin(gbo);
>> +               return base;
>> +       }
>> +       return base;
>> +}
>> +EXPORT_SYMBOL(drm_gem_vram_vmap);
>> +
>> +/**
>> + * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
>> + * @gem:       The GEM VRAM object to unmap
>> + * @vaddr:     The mapping's base address
>> + */
>> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr=
)
>> +{
>> +       drm_gem_vram_kunmap(gbo);
>> +       drm_gem_vram_unpin(gbo);
>> +}
>> +EXPORT_SYMBOL(drm_gem_vram_vunmap);
>> +
>>  /**
>>   * drm_gem_vram_fill_create_dumb() - \
>>         Helper for implementing &struct drm_driver.dumb_create
>> @@ -595,17 +637,11 @@ static void drm_gem_vram_object_unpin(struct drm=
_gem_object *gem)
>>  static void *drm_gem_vram_object_vmap(struct drm_gem_object *gem)
>>  {
>>         struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(gem);
>> -       int ret;
>>         void *base;
>>
>> -       ret =3D drm_gem_vram_pin(gbo, 0);
>> -       if (ret)
>> +       base =3D drm_gem_vram_vmap(gbo);
>> +       if (IS_ERR(base))
>>                 return NULL;
>> -       base =3D drm_gem_vram_kmap(gbo, true, NULL);
>> -       if (IS_ERR(base)) {
>> -               drm_gem_vram_unpin(gbo);
>> -               return NULL;
>> -       }
>>         return base;
>>  }
>>
>> @@ -620,8 +656,7 @@ static void drm_gem_vram_object_vunmap(struct drm_=
gem_object *gem,
>>  {
>>         struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(gem);
>>
>> -       drm_gem_vram_kunmap(gbo);
>> -       drm_gem_vram_unpin(gbo);
>> +       drm_gem_vram_vunmap(gbo, vaddr);
>>  }
>>
>>  /*
>> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_v=
ram_helper.h
>> index b41d932eb53a..5192c169cec2 100644
>> --- a/include/drm/drm_gem_vram_helper.h
>> +++ b/include/drm/drm_gem_vram_helper.h
>> @@ -44,6 +44,16 @@ struct drm_gem_vram_object {
>>         struct ttm_placement placement;
>>         struct ttm_place placements[2];
>>
>> +       /* TODO: Maybe implement a map counter.
>=20
> Kerneldoc is missing here. You can use the inline style so that the
> todo comment here is still included.
> -Daniel

Actually, this comment wasn't intended to be in the kernel docs. I guess
I integrate it into the structure's overall documentation then.

Best regards
Thomas

>> +        *
>> +        * So far, drivers based on VRAM helpers don't have overlappin=
g
>> +        * mapping operations. A driver temporarily maps an object and=

>> +        * unmaps it ASAP. This works well for fbdev emulation or curs=
ors.
>> +        *
>> +        * If we ever have a driver with buffer objects that are mappe=
d
>> +        * by multiple code fragments concurrently, we may need a map
>> +        * counter to get the mapping right.
>> +        */
>>         int pin_count;
>>  };
>>
>> @@ -84,6 +94,8 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *g=
bo);
>>  void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
>>                         bool *is_iomem);
>>  void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
>> +void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
>> +void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr=
);
>>
>>  int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>>                                   struct drm_device *dev,
>> --
>> 2.22.0
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--LiG9F5B8J4ta7KXoyvRQciANifWSIEVx4--

--BxTga9wR4uS0xXoxuXVwdd8NfuBLYR15q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04jWcACgkQaA3BHVML
eiMewwf/bcUn37FR5/YzIQEsKi3X9D3nBG9TOZWFa4r94cGu/lZoINL3vLLJBynY
jtc0L+mBqh7MVTQOHMLTfbOSQZQuJEIb8+3yETCU8DWnFb0e7SYtCTF6hWi+iCw9
thGQ6w055t/bpCYU3BvjjbBRqHeImlV2JJtCas3PgV2lz6eHY6gQuGF6dXgcgDf0
OLivk/17qz2FFk4OKQxGFwqcUIYuZN72UvNqLYecvlEb6+iy8VSC5/vtCnHqoORO
XviX/ZcEicwMEKdzbVy1cVrVS4m7mi+3xnOLDBkLwsCyUnNS1uohaO8MPBx6ghvb
VJMF/IkVdNe5yF4tsXhQmOqh/Do0UQ==
=HeyZ
-----END PGP SIGNATURE-----

--BxTga9wR4uS0xXoxuXVwdd8NfuBLYR15q--

--===============1704807959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1704807959==--
