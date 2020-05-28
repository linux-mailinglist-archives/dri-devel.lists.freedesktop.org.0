Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED71E6176
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A9B6E519;
	Thu, 28 May 2020 12:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7918F6E519;
 Thu, 28 May 2020 12:53:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84DFCAA35;
 Thu, 28 May 2020 12:53:10 +0000 (UTC)
Subject: Re: [PATCH 7/9] drm/shmem-helpers: Redirect mmap for imported dma-buf
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Herring <robh@kernel.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-8-daniel.vetter@ffwll.ch>
 <d6dc2421-b875-7fd7-74a6-ec78aebdcd84@suse.de>
 <CAKMK7uEcP0aj0r-TevAMdz8_fUH_DnJCDfJxiVf1_H+qweS_5Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
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
Message-ID: <742324eb-c063-3148-6802-7fcf447ae741@suse.de>
Date: Thu, 28 May 2020 14:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEcP0aj0r-TevAMdz8_fUH_DnJCDfJxiVf1_H+qweS_5Q@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0104490187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0104490187==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TQyiAQixWTGYjPxuMxfyZX8pfIhOLLZV9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TQyiAQixWTGYjPxuMxfyZX8pfIhOLLZV9
Content-Type: multipart/mixed; boundary="TGHMCy0a1F4w2RjkJMK6pNizs74k30mKg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <742324eb-c063-3148-6802-7fcf447ae741@suse.de>
Subject: Re: [PATCH 7/9] drm/shmem-helpers: Redirect mmap for imported dma-buf
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-8-daniel.vetter@ffwll.ch>
 <d6dc2421-b875-7fd7-74a6-ec78aebdcd84@suse.de>
 <CAKMK7uEcP0aj0r-TevAMdz8_fUH_DnJCDfJxiVf1_H+qweS_5Q@mail.gmail.com>
In-Reply-To: <CAKMK7uEcP0aj0r-TevAMdz8_fUH_DnJCDfJxiVf1_H+qweS_5Q@mail.gmail.com>

--TGHMCy0a1F4w2RjkJMK6pNizs74k30mKg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.05.20 um 21:34 schrieb Daniel Vetter:
> On Wed, May 27, 2020 at 8:32 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi Daniel,
>>
>> what's your plan for this patch set? I'd need this patch for the udl
>> shmem cleanup.
>=20
> I was pinging some people for a tested-by, I kinda don't want to push
> this entirely untested. I think at least one of the rendering drivers
> using shmem would be nice to run this on, I've pinged Rob Herring a
> bit.

OK, makes sense. FWIW I tested the patchset with udl as secondary
adapter. No problems noticed.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
>>> Currently this seems to work by converting the sgt into a pages array=
,
>>> and then treating it like a native object. Do the right thing and
>>> redirect mmap to the exporter.
>>>
>>> With this nothing is calling get_pages anymore on imported dma-buf,
>>> and we can start to remove the use of the ->pages array for that case=
=2E
>>>
>>> v2: Rebase
>>>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm=
/drm_gem_shmem_helper.c
>>> index b9cba5cc61c3..117a7841e284 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -551,6 +551,9 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj=
, struct vm_area_struct *vma)
>>>       /* Remove the fake offset */
>>>       vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
>>>
>>> +     if (obj->import_attach)
>>> +             return dma_buf_mmap(obj->dma_buf, vma, 0);
>>> +
>>>       shmem =3D to_drm_gem_shmem_obj(obj);
>>>
>>>       ret =3D drm_gem_shmem_get_pages(shmem);
>>>
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


--TGHMCy0a1F4w2RjkJMK6pNizs74k30mKg--

--TQyiAQixWTGYjPxuMxfyZX8pfIhOLLZV9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7PtDAACgkQaA3BHVML
eiNb8ggAvudKy0nLjLJaPUfuqIFNobVtPMsq3tbj5d5ErAmj4Iv4A61oWBFK/zML
YwbVk/9Woll+pxdeNH4sgNg4cs+be6vtquVldkCqc5BwQMfs0z7/Tv+N8kn3vau5
eZ4kyrD1H0v6giERuBU3SBnY40YRW+iE9FV6KKtaAQPcDq6z2aSeicsiblR/aU5e
QhQgQQ3v8jw1OEequu+JQs41fkfVmVuSdh7OVezA4zlTDC/F9jdm8qmEoflPjKxZ
va84DRHvEb9mkorrq+7qqjMNZ4JqYBWLTxjjgY1Sxo0/6QyAuM6qznkWn9r7E6D8
rmcCvJ6bEex09Xeq9KBDH4b8eRJ6ug==
=raaC
-----END PGP SIGNATURE-----

--TQyiAQixWTGYjPxuMxfyZX8pfIhOLLZV9--

--===============0104490187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0104490187==--
