Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FADFF119
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5338941D;
	Tue, 30 Apr 2019 07:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EDB8941D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:18:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A390AE00;
 Tue, 30 Apr 2019 07:18:47 +0000 (UTC)
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
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
Message-ID: <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
Date: Tue, 30 Apr 2019 09:18:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190429195855.GA6610@ravnborg.org>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 kraxel@redhat.com, zourongrong@gmail.com, Jerry.Zhang@amd.com,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1240229623=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1240229623==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xit3RCnHY8XTMjh0mRw3hyQ8zpSuopoc7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xit3RCnHY8XTMjh0mRw3hyQ8zpSuopoc7
Content-Type: multipart/mixed; boundary="etPEHzNQVyLzy4n5Euy9XT1zKbTfUgZm9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
 hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
In-Reply-To: <20190429195855.GA6610@ravnborg.org>

--etPEHzNQVyLzy4n5Euy9XT1zKbTfUgZm9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the feedback.

Am 29.04.19 um 21:58 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Some minor things and some bikeshedding too.
>=20
> One general^Wbikeshedding thing - unint32_t is used in many places.
> And then s64 in one place.
> Seems like two concepts are mixed.
> Maybe be consistent and use u32, s32 everywhere?

The DRM API already has a mixture of such types and I tried to use the
type that best fits the current context. But yeah, I don't mind some
consistency. I'll see if I can replace some of these instances.

>> +config DRM_GEM_VRAM_HELPER
>> +	bool
>> +	depends on DRM
>> +	select DRM_VRAM_HELPER
>> +	help
>> +	  Choose this if you need the GEM VRAM helper functions
>> +
> I cannot remember how select will deal with symbols whos has
> a  "depends on".
> But if I recall correct then the "depends on" will be ignored
> or in best case trigger a warning.
> In other words - when we have symbols we select they should not
> have a depends on.
>=20
> What can be done is something like:
>=20
> symbol foo
> 	bool
>=20
> symbol bar
> 	depends on foo
>=20
>=20
> symbol foobar
> 	bool "This is what you need - select me"
> 	select foo
>=20
> So when one chooses "foobar" then we will select "foo" and this will
> satisfy bar.
>=20
> But maybe this rambling is irrelevant - maybe check what we do with
> other selectable symbols in DRM.

It may not strictly be necessary here, but the other helpers' symbols
depend on DRM. I'd like to keep it consistent unless there's a strong
reason not to.

>=20
>=20
>> +/**
>> + * DOC: overview
>> + *
>> + * This library provides a GEM object that is backed by VRAM. It
>> + * can be used for simple framebuffer devices with dedicated memory.
>> + */
> It is likely only me, but...
> I could use a short explanation what is GEM and maybe also VRAM.
>=20
> VRAM as video RAM, but maybe there is more constraints?
> (When I first looked at DRM I wondered what you used Virtual RAM for.
> But thats a long time ago so it counts only as a funny story.

OK :)

>> +/*
>> + * Buffer-object helpers
>> + */
>> +
>> +/**
>> + * struct drm_gem_vram_object - GEM object backed by VRAM
>> + * @gem:	GEM object
>> + * @bo:		TTM buffer object
>> + * @kmap:	Mapping information for @bo
>> + * @placement:	TTM placement information. Supported placements are \
>> +	%TTM_PL_VRAM and %TTM_PL_SYSTEM
>> + * @placements:	TTM placement information.
>> + * @pin_count:	Pin counter
>> + *
>> + * The type struct drm_gem_vram_object represents a GEM object that i=
s
>> + * backed by VRAM. It can be used for simple frambuffer devices with
>> + * dedicated memory. The buffer object can be evicted to system memor=
y if
>> + * video memory becomes scarce.
>> + */
>> +struct drm_gem_vram_object {
>> +        struct drm_gem_object gem;
>> +        struct ttm_buffer_object bo;
>> +        struct ttm_bo_kmap_obj kmap;
>> +
>> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
>> +        struct ttm_placement placement;
>> +        struct ttm_place placements[3];
>> +
>> +        int pin_count;
>> +};
> Use tabs for indent - not spaces.
> Ask checkpatch if anything similar needs to be adjusted.

Oh well, I should have checked this. Thanks for reporting.

>> +
>> +/**
>> + * Returns the container of type &struct drm_gem_vram_object
>> + * for field bo.
>> + * @bo:		the VRAM buffer object
>> + * Returns:	The containing GEM VRAM object
>> + */
>> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
>> +	struct ttm_buffer_object *bo)
>> +{
>> +	return container_of(bo, struct drm_gem_vram_object, bo);
>> +}
> Indent funny. USe same indent as used in other parts of file for
> function arguments.

If I put the argument next to the function's name, it will exceed the
80-character limit. From the coding-style document, I could not see what
to do in this case. One solution would move the return type to a
separate line before the function name. I've not seen that anywhere in
the source code, so moving the argument onto a separate line and
indenting by one tab appears to be the next best solution. Please let me
know if there's if there's a preferred style for cases like this one.

Best regards
Thomas

>> +
>> +/**
>> + * Returns the container of type &struct drm_gem_vram_object
>> + * for field gem.
>> + * @gem:	the GEM object
>> + * Returns:	The containing GEM VRAM object
>> + */
>> +static inline struct drm_gem_vram_object* drm_gem_vram_of_gem(
>> +	struct drm_gem_object *gem)
>> +{
>> +	return container_of(gem, struct drm_gem_vram_object, gem);
>> +}
> ditto
>=20
>> +
>> +struct drm_gem_vram_object* drm_gem_vram_create(struct drm_device *de=
v,
>> +						struct ttm_bo_device* bdev,
>> +						unsigned long size,
>> +						uint32_t pg_align,
>> +						bool interruptible);
>=20
> Here is is "normal"
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--etPEHzNQVyLzy4n5Euy9XT1zKbTfUgZm9--

--xit3RCnHY8XTMjh0mRw3hyQ8zpSuopoc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzH9tUACgkQaA3BHVML
eiNxUgf+Pk9Wu1dk8fgOwMzVNWv3Ug2w7cZQZspRqhuOo0EPwIMe5xlOJECaFVWk
wz+LA1bzfk6Fd3wXuo6IYmZqLyPcAIsp2eAMDIfGaGpiY6S3C5hC9U6PJFhepvh5
IKVE3w0nSpX+KPnGJw/68wSzzTxrYO0T266oXJtVCNBzvGfpPoeTbyf9nBz7pN9h
ly/S/prgXM7eHoezLgO/pbBRVdH52EhmIcD40EughYP3nTufcpWNgts2AFhvAyEV
8xEFy53M24gx8rdODBBK+YqhC8ALX6WppzNhocg6WZQzRvnq0CBJybTIJWNNSxFl
g2SNTYbDWaOVZJ4lxAMWvTXLOJ+cuQ==
=8LwP
-----END PGP SIGNATURE-----

--xit3RCnHY8XTMjh0mRw3hyQ8zpSuopoc7--

--===============1240229623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1240229623==--
