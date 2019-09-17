Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B9EB4AC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8F66EB94;
	Tue, 17 Sep 2019 09:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5196EB94
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28068B6F4;
 Tue, 17 Sep 2019 09:38:30 +0000 (UTC)
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
 <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
 <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>
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
Message-ID: <8b8ce387-1b3c-0a9c-3aaf-6294b3b81018@suse.de>
Date: Tue, 17 Sep 2019 11:38:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1423934926=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1423934926==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xcBYZojvDfoFex0FuyRwVGgUIB7FAb0EG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xcBYZojvDfoFex0FuyRwVGgUIB7FAb0EG
Content-Type: multipart/mixed; boundary="z8LzN3XfT59kzP8u0OVSCtdI40idw3XEd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Message-ID: <8b8ce387-1b3c-0a9c-3aaf-6294b3b81018@suse.de>
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
 <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
 <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>
In-Reply-To: <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>

--z8LzN3XfT59kzP8u0OVSCtdI40idw3XEd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gerd

Am 17.09.19 um 10:34 schrieb Gerd Hoffmann:
> On Fri, Sep 13, 2019 at 03:05:34PM +0200, Thomas Zimmermann wrote:
>=20
>>> +void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_a=
rea_struct *vma)
>>> +{
>>> +	vma->vm_ops =3D &ttm_bo_vm_ops;
>>> +
>>> +	/*
>>> +	 * Note: We're transferring the bo reference to
>>> +	 * vma->vm_private_data here.
>>> +	 */
>>> +
>>> +	vma->vm_private_data =3D bo;
>>> +
>>> +	/*
>>> +	 * We'd like to use VM_PFNMAP on shared mappings, where
>>> +	 * (vma->vm_flags & VM_SHARED) !=3D 0, for performance reasons,
>>> +	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
>>> +	 * bad for performance. Until that has been sorted out, use
>>> +	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>>> +	 */
>>> +	vma->vm_flags |=3D VM_MIXEDMAP;
>>> +	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_mmap_vma_setup);
>>
>> To me, this function looks like an internal helper that should rather
>> remain internal.
>=20
> Well, I'm moving that to a helper exactly to avoid drm gem ttm helpers
> messing with ttm internals.  To not them initialize vm_flags for
> example, and to avoid exporting ttm_bo_vm_ops.  Also to make sure ttm b=
o
> vma's are initialized the same way no matter which code path was taken
> to mmap the object.

It may not be worth blocking on this, so

  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

But I still think it's not a good interface because it exposes internal
details.

Please consider another idea: how about splitting off the ttm_bo_get()
and vma-flags setup of ttm_fbdev_mmap() into a separate function, like th=
is:

void ttm_bo_mmap_refed(vma, bo)
{
	ttm_bo_get(bo)
	ttm_bo_mmap_vma_setup(vma);
}
EXPORT_SYMBOL(ttm_bo_mmap_refed)

int ttm_fbdev_mmap(vma, bo)
{
        if (vma->vm_pgoff !=3D 0)
                return -EACCES;
	ttm_bo_mmap_refed(vma, bo);
	return 0;
}

That would allow to keep _vma_setup() an internal function.

ttm_fbdev_mmap() sounds like it is only for fbdev and the only user is
amdgpu. Can it be moved out of ttm entirely?

Best regards
Thomas

>> As mentioned in my reply to patch 5, maybe re-using
>> ttm_fbdev_mmap() could help.
>=20
> No, the check in that function prevents that from working.
>=20
> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--z8LzN3XfT59kzP8u0OVSCtdI40idw3XEd--

--xcBYZojvDfoFex0FuyRwVGgUIB7FAb0EG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2AqZEACgkQaA3BHVML
eiPJ0ggAnM+WlLYkjAcYW6bwUEv+i+YP7J0X/Ffdu3OiWGM4+Mbh71BejKrlbmfG
mKrWR2TBAu/UZTctmqwKNwP/yjmc7d/pjfcGUpKw17aDCwwT6ZYr2PEjgi1yOyym
wpYfG/yldlsvbutl8PfNZFlmS5QLyaeJeG/q4l9x7Fe83loNIa62zSW8RhU2Ar0U
sNgG+/gU7UL2VPxfhWiIDznB9NL+oCZD/Ec4PWU/jXj5/mQT/dfHYAU3RtreDHcB
PzRG4T8fvVHnoYcjuhE2vUVgKPlEc6w8a6G6syRpeydwAr/T3sJgE9SzyIswbTqG
rugdli0jsXAQhqQ4s+xuVxDuxpIl0w==
=jKnm
-----END PGP SIGNATURE-----

--xcBYZojvDfoFex0FuyRwVGgUIB7FAb0EG--

--===============1423934926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1423934926==--
