Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA81F19A5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 15:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7985C6E4F3;
	Mon,  8 Jun 2020 13:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0186E4F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 13:05:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F413AD5F;
 Mon,  8 Jun 2020 13:05:48 +0000 (UTC)
Subject: Re: [PATCH 06/14] drm/mgag200: Merge VRAM setup into MM initialization
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-7-tzimmermann@suse.de>
 <20200605143900.GB204352@ravnborg.org>
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
Message-ID: <b44466c9-6a5c-e916-b3a4-104eec977df2@suse.de>
Date: Mon, 8 Jun 2020 15:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605143900.GB204352@ravnborg.org>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1163206356=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1163206356==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YkQO9zLVU2MnuQJ5wDpnNtJCs4YRJVbYr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YkQO9zLVU2MnuQJ5wDpnNtJCs4YRJVbYr
Content-Type: multipart/mixed; boundary="mFHFRMFQgBJ43lQ627yWwMvDnCCl4zRoU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, emil.velikov@collabora.com,
 kraxel@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <b44466c9-6a5c-e916-b3a4-104eec977df2@suse.de>
Subject: Re: [PATCH 06/14] drm/mgag200: Merge VRAM setup into MM
 initialization
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-7-tzimmermann@suse.de>
 <20200605143900.GB204352@ravnborg.org>
In-Reply-To: <20200605143900.GB204352@ravnborg.org>

--mFHFRMFQgBJ43lQ627yWwMvDnCCl4zRoU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.20 um 16:39 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Some parts I did not understand here.
>=20
> On Fri, Jun 05, 2020 at 03:57:55PM +0200, Thomas Zimmermann wrote:
>> The VRAM setup in mgag200_drv.c is part of memory management and
>> should be done in the same place. Merge the code into the memory
>> management's init function.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_main.c | 75 -------------------------=
-
>>  drivers/gpu/drm/mgag200/mgag200_mm.c   | 52 ++++++++++++++++++
>>  2 files changed, 52 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index 3298eff7bd1b4..e9ad783c2b44d 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -12,77 +12,6 @@
>> =20
>>  #include "mgag200_drv.h"
>> =20
>> -static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)=

>> -{
>> -	int offset;
>> -	int orig;
>> -	int test1, test2;
>> -	int orig1, orig2;
>> -	unsigned int vram_size;
>> -
>> -	/* Probe */
>> -	orig =3D ioread16(mem);
>> -	iowrite16(0, mem);
>> -
>> -	vram_size =3D mdev->mc.vram_window;
>> -
>> -	if ((mdev->type =3D=3D G200_EW3) && (vram_size >=3D 0x1000000)) {
>> -		vram_size =3D vram_size - 0x400000;
>> -	}
>> -
>> -	for (offset =3D 0x100000; offset < vram_size; offset +=3D 0x4000) {
>> -		orig1 =3D ioread8(mem + offset);
>> -		orig2 =3D ioread8(mem + offset + 0x100);
>> -
>> -		iowrite16(0xaa55, mem + offset);
>> -		iowrite16(0xaa55, mem + offset + 0x100);
>> -
>> -		test1 =3D ioread16(mem + offset);
>> -		test2 =3D ioread16(mem);
>> -
>> -		iowrite16(orig1, mem + offset);
>> -		iowrite16(orig2, mem + offset + 0x100);
>> -
>> -		if (test1 !=3D 0xaa55) {
>> -			break;
>> -		}
>> -
>> -		if (test2) {
>> -			break;
>> -		}
>> -	}
>> -
>> -	iowrite16(orig, mem);
>> -	return offset - 65536;
>> -}
>> -
>> -/* Map the framebuffer from the card and configure the core */
>> -static int mga_vram_init(struct mga_device *mdev)
>> -{
>> -	struct drm_device *dev =3D mdev->dev;
>> -	void __iomem *mem;
>> -
>> -	/* BAR 0 is VRAM */
>> -	mdev->mc.vram_base =3D pci_resource_start(dev->pdev, 0);
>> -	mdev->mc.vram_window =3D pci_resource_len(dev->pdev, 0);
>> -
>> -	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
>> -				     mdev->mc.vram_window, "mgadrmfb_vram")) {
>> -		DRM_ERROR("can't reserve VRAM\n");
>> -		return -ENXIO;
>> -	}
>> -
>> -	mem =3D pci_iomap(dev->pdev, 0, 0);
>> -	if (!mem)
>> -		return -ENOMEM;
>> -
>> -	mdev->mc.vram_size =3D mga_probe_vram(mdev, mem);
>> -
>> -	pci_iounmap(dev->pdev, mem);
> mem is the result of pci_iomap() - but I do not see any call
> to pci_iomap() in the converted code.
>=20
> mdev->vram is used as argument in new code where mem was used in the ol=
d
> code.
> mdev->vram comes from ioremap(start, len) - will it result in the same?=


Yes. pci_iomap() maps the whole PCI BAR (i.e., 0 in this case) memory.
The driver code reads the bar's start and length, which also covers the
full PCI BAR range. So in the end the probe function runs on the same
range of VRAM.

Best regards
Thomas

>=20
> 	Sam
>=20
>=20
>> -
>> -	return 0;
>> -}
>> -
>>  int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>>  {
>>  	struct mga_device *mdev;
>> @@ -121,10 +50,6 @@ int mgag200_driver_load(struct drm_device *dev, un=
signed long flags)
>>  			mdev->unique_rev_id);
>>  	}
>> =20
>> -	ret =3D mga_vram_init(mdev);
>> -	if (ret)
>> -		return ret;
>> -
>>  	ret =3D mgag200_mm_init(mdev);
>>  	if (ret)
>>  		goto err_mm;
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mg=
ag200/mgag200_mm.c
>> index 73e30901e0631..f56b0456994f4 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mm.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
>> @@ -30,6 +30,49 @@
>> =20
>>  #include "mgag200_drv.h"
>> =20
>> +static size_t mgag200_probe_vram(struct mga_device *mdev, void __iome=
m *mem,
>> +				 size_t size)
>> +{
>> +	int offset;
>> +	int orig;
>> +	int test1, test2;
>> +	int orig1, orig2;
>> +	size_t vram_size;
>> +
>> +	/* Probe */
>> +	orig =3D ioread16(mem);
>> +	iowrite16(0, mem);
>> +
>> +	vram_size =3D size;
>> +
>> +	if ((mdev->type =3D=3D G200_EW3) && (vram_size >=3D 0x1000000))
>> +		vram_size =3D vram_size - 0x400000;
>> +
>> +	for (offset =3D 0x100000; offset < vram_size; offset +=3D 0x4000) {
>> +		orig1 =3D ioread8(mem + offset);
>> +		orig2 =3D ioread8(mem + offset + 0x100);
>> +
>> +		iowrite16(0xaa55, mem + offset);
>> +		iowrite16(0xaa55, mem + offset + 0x100);
>> +
>> +		test1 =3D ioread16(mem + offset);
>> +		test2 =3D ioread16(mem);
>> +
>> +		iowrite16(orig1, mem + offset);
>> +		iowrite16(orig2, mem + offset + 0x100);
>> +
>> +		if (test1 !=3D 0xaa55)
>> +			break;
>> +
>> +		if (test2)
>> +			break;
>> +	}
>> +
>> +	iowrite16(orig, mem);
>> +
>> +	return offset - 65536;
>> +}
>> +
>>  int mgag200_mm_init(struct mga_device *mdev)
>>  {
>>  	struct drm_device *dev =3D mdev->dev;
>> @@ -40,6 +83,11 @@ int mgag200_mm_init(struct mga_device *mdev)
>>  	start =3D pci_resource_start(dev->pdev, 0);
>>  	len =3D pci_resource_len(dev->pdev, 0);
>> =20
>> +	if (!devm_request_mem_region(dev->dev, start, len, "mgadrmfb_vram"))=
 {
>> +		drm_err(dev, "can't reserve VRAM\n");
>> +		return -ENXIO;
>> +	}
>> +
>>  	arch_io_reserve_memtype_wc(start, len);
>> =20
>>  	mdev->fb_mtrr =3D arch_phys_wc_add(start, len);
>> @@ -50,6 +98,10 @@ int mgag200_mm_init(struct mga_device *mdev)
>>  		goto err_arch_phys_wc_del;
>>  	}
>> =20
>> +	mdev->mc.vram_size =3D mgag200_probe_vram(mdev, mdev->vram, len);
>> +	mdev->mc.vram_base =3D start;
>> +	mdev->mc.vram_window =3D len;
>> +
>>  	mdev->vram_fb_available =3D mdev->mc.vram_size;
>> =20
>>  	return 0;
>> --=20
>> 2.26.2

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mFHFRMFQgBJ43lQ627yWwMvDnCCl4zRoU--

--YkQO9zLVU2MnuQJ5wDpnNtJCs4YRJVbYr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7eN6UACgkQaA3BHVML
eiMG+ggAiWt6ytMgYrrt9zf2k2ScB08it2iikxkLwBI6A3VBk9nA+Lb9EkFXOnEP
2eNtgmcFhIGFAjPZ2YbrWb+i3+9Xp6P4fwNYB9obuj76AONdyv4+vGiYdEOHvOgF
a6K3jl4PE9MPYP79E7193NJaymkjh6WFUW47E1A+lT+fAx9A7ovEKEYHUkrVFqcC
0wsuluFM/0YzirTsR2ohqvChtFKbV7DtWsDFJObbfws7pQy925bQ893F9HUuDP/y
TJ8Ohyx4GkXkeP31w7IN5gobMSDL2WjmrvdL2F28WOoyUnI6momUWvTNH0hnj1fO
7P1cuKUI8VtZ/AUKu+ATp6vn3lT1zQ==
=OXQP
-----END PGP SIGNATURE-----

--YkQO9zLVU2MnuQJ5wDpnNtJCs4YRJVbYr--

--===============1163206356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1163206356==--
