Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D731E1C6AA9
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E743A89EB7;
	Wed,  6 May 2020 07:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D689F0A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:59:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE01FAC4A;
 Wed,  6 May 2020 07:59:15 +0000 (UTC)
Subject: Re: [PATCH 4/5] drm/mgag200: Init and finalize devices in
 mgag200_device_{init,fini}()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-5-tzimmermann@suse.de>
 <20200505164900.GE5082@ravnborg.org>
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
Message-ID: <7951499e-949e-e079-8bda-2d760479895e@suse.de>
Date: Wed, 6 May 2020 09:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505164900.GE5082@ravnborg.org>
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0605279353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0605279353==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zIIc3PTvrlmoPyW8GokxhDdJHUNaKZDcS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zIIc3PTvrlmoPyW8GokxhDdJHUNaKZDcS
Content-Type: multipart/mixed; boundary="MwvMYuD77ai7Cqs2OZTyvDLoY38Pto4Ev";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 emil.velikov@collabora.com, cogarre@gmail.com,
 dri-devel@lists.freedesktop.org
Message-ID: <7951499e-949e-e079-8bda-2d760479895e@suse.de>
Subject: Re: [PATCH 4/5] drm/mgag200: Init and finalize devices in
 mgag200_device_{init,fini}()
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-5-tzimmermann@suse.de>
 <20200505164900.GE5082@ravnborg.org>
In-Reply-To: <20200505164900.GE5082@ravnborg.org>

--MwvMYuD77ai7Cqs2OZTyvDLoY38Pto4Ev
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 05.05.20 um 18:49 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, May 05, 2020 at 11:56:48AM +0200, Thomas Zimmermann wrote:
>> Device initialization is now done in mgag200_device_init(). Specifical=
ly,
>> the function allocates the DRM device and sets up the respective field=
s
>> in struct mga_device.
>>
>> A call to mgag200_device_fini() finalizes struct mga_device.
>>
>> The old function mgag200_driver_load() and mgag200_driver_unload() wer=
e
>> left over from the DRM driver's load callbacks and have now been remov=
ed.
>=20
> Not too big fan of this patch, due to the changes allocation.
> I would prefer if you merged patch 4+5 and then take it from there.
>=20
> You have patch 1+2+3 and they are now reviewed so why not push them
> and work on top of them.

Good idea. I'll do this and postpone patches 4 and 5 to a later patch set=
=2E

Best regards
Thomas

> And then you could also push the patch that removes the cursor stuff
> so we do not need to look at that anymore.
>=20
> 	Sam
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.c  | 27 ++++++++++----------
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++--
>>  drivers/gpu/drm/mgag200/mgag200_main.c | 34 ++++++++++++++++---------=
-
>>  3 files changed, 37 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/m=
gag200/mgag200_drv.c
>> index c2f0e4b40b052..ad12c1b7c66cc 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -51,6 +51,7 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>> =20
>>  static int mga_pci_probe(struct pci_dev *pdev, const struct pci_devic=
e_id *ent)
>>  {
>> +	struct mga_device *mdev;
>>  	struct drm_device *dev;
>>  	int ret;
>> =20
>> @@ -60,31 +61,28 @@ static int mga_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	dev =3D drm_dev_alloc(&driver, &pdev->dev);
>> -	if (IS_ERR(dev)) {
>> -		ret =3D PTR_ERR(dev);
>> +	mdev =3D devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
>> +	if (!mdev) {
>> +		ret =3D -ENOMEM;
>>  		goto err_pci_disable_device;
>>  	}
>> =20
>> -	dev->pdev =3D pdev;
>> -	pci_set_drvdata(pdev, dev);
>> -
>> -	ret =3D mgag200_driver_load(dev, ent->driver_data);
>> +	ret =3D mgag200_device_init(mdev, &driver, pdev, ent->driver_data);
>>  	if (ret)
>> -		goto err_drm_dev_put;
>> +		goto err_pci_disable_device;
>> +
>> +	dev =3D mdev->dev;
>> =20
>>  	ret =3D drm_dev_register(dev, ent->driver_data);
>>  	if (ret)
>> -		goto err_mgag200_driver_unload;
>> +		goto err_mgag200_device_fini;
>> =20
>>  	drm_fbdev_generic_setup(dev, 0);
>> =20
>>  	return 0;
>> =20
>> -err_mgag200_driver_unload:
>> -	mgag200_driver_unload(dev);
>> -err_drm_dev_put:
>> -	drm_dev_put(dev);
>> +err_mgag200_device_fini:
>> +	mgag200_device_fini(mdev);
>>  err_pci_disable_device:
>>  	pci_disable_device(pdev);
>>  	return ret;
>> @@ -93,9 +91,10 @@ static int mga_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
>>  static void mga_pci_remove(struct pci_dev *pdev)
>>  {
>>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
>> +	struct mga_device *mdev =3D to_mga_device(dev);
>> =20
>>  	drm_dev_unregister(dev);
>> -	mgag200_driver_unload(dev);
>> +	mgag200_device_fini(mdev);
>>  	drm_dev_put(dev);
>>  }
>> =20
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index 632bbb50465c9..1ce0386669ffa 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -200,8 +200,9 @@ int mgag200_modeset_init(struct mga_device *mdev);=

>>  void mgag200_modeset_fini(struct mga_device *mdev);
>> =20
>>  				/* mgag200_main.c */
>> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags);=

>> -void mgag200_driver_unload(struct drm_device *dev);
>> +int mgag200_device_init(struct mga_device *mdev, struct drm_driver *d=
rv,
>> +			struct pci_dev *pdev, unsigned long flags);
>> +void mgag200_device_fini(struct mga_device *mdev);
>> =20
>>  				/* mgag200_i2c.c */
>>  struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index 010b309c01fc4..070ff1f433df2 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/pci.h>
>> =20
>>  #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> =20
>>  #include "mgag200_drv.h"
>> @@ -96,17 +97,21 @@ static int mga_vram_init(struct mga_device *mdev)
>>   */
>> =20
>> =20
>> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>> +int mgag200_device_init(struct mga_device *mdev, struct drm_driver *d=
rv,
>> +			struct pci_dev *pdev, unsigned long flags)
>>  {
>> -	struct mga_device *mdev;
>> +	struct drm_device *dev =3D mdev->dev;
>>  	int ret, option;
>> =20
>> -	mdev =3D devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNE=
L);
>> -	if (mdev =3D=3D NULL)
>> -		return -ENOMEM;
>> +	dev =3D drm_dev_alloc(drv, &pdev->dev);
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>>  	dev->dev_private =3D (void *)mdev;
>>  	mdev->dev =3D dev;
>> =20
>> +	dev->pdev =3D pdev;
>> +	pci_set_drvdata(pdev, dev);
>> +
>>  	mdev->flags =3D mgag200_flags_from_driver_data(flags);
>>  	mdev->type =3D mgag200_type_from_driver_data(flags);
>> =20
>> @@ -123,12 +128,15 @@ int mgag200_driver_load(struct drm_device *dev, =
unsigned long flags)
>>  	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
>>  				     mdev->rmmio_size, "mgadrmfb_mmio")) {
>>  		drm_err(dev, "can't reserve mmio registers\n");
>> -		return -ENOMEM;
>> +		ret =3D -ENOMEM;
>> +		goto err_drm_dev_put;
>>  	}
>> =20
>>  	mdev->rmmio =3D pcim_iomap(dev->pdev, 1, 0);
>> -	if (mdev->rmmio =3D=3D NULL)
>> -		return -ENOMEM;
>> +	if (mdev->rmmio =3D=3D NULL) {
>> +		ret =3D -ENOMEM;
>> +		goto err_drm_dev_put;
>> +	}
>> =20
>>  	/* stash G200 SE model number for later use */
>>  	if (IS_G200_SE(mdev)) {
>> @@ -139,7 +147,7 @@ int mgag200_driver_load(struct drm_device *dev, un=
signed long flags)
>> =20
>>  	ret =3D mga_vram_init(mdev);
>>  	if (ret)
>> -		return ret;
>> +		goto err_drm_dev_put;
>> =20
>>  	mdev->bpp_shifts[0] =3D 0;
>>  	mdev->bpp_shifts[1] =3D 1;
>> @@ -174,17 +182,17 @@ int mgag200_driver_load(struct drm_device *dev, =
unsigned long flags)
>>  	drm_mode_config_cleanup(dev);
>>  	mgag200_cursor_fini(mdev);
>>  	mgag200_mm_fini(mdev);
>> +err_drm_dev_put:
>> +	drm_dev_put(dev);
>>  err_mm:
>>  	dev->dev_private =3D NULL;
>>  	return ret;
>>  }
>> =20
>> -void mgag200_driver_unload(struct drm_device *dev)
>> +void mgag200_device_fini(struct mga_device *mdev)
>>  {
>> -	struct mga_device *mdev =3D to_mga_device(dev);
>> +	struct drm_device *dev =3D mdev->dev;
>> =20
>> -	if (mdev =3D=3D NULL)
>> -		return;
>>  	mgag200_modeset_fini(mdev);
>>  	drm_mode_config_cleanup(dev);
>>  	mgag200_cursor_fini(mdev);
>> --=20
>> 2.26.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MwvMYuD77ai7Cqs2OZTyvDLoY38Pto4Ev--

--zIIc3PTvrlmoPyW8GokxhDdJHUNaKZDcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6ybk8ACgkQaA3BHVML
eiNepwf/Xb4x31pgUZqY8aEVlONmlpYZIVoXcweooScCDCsxCXGqiSbvsuvZxtcU
AYccjEyzueM9NUH5NOQvBTgcOvgu8r6Szm0noHiaJYCCA80M5MJeH8hscSbbd7Nx
xdvjgifCs+yyCIIt9iU0AjwNf6EM8gygPm6SWBVN6v9Wujve/cLNp9QyBcwjN/K4
aqdQemJbo2pjqggXkdu+jWiP3EMEot8bTtv9RFhWJ4DXoGohjacuRNb7kuXXvoAS
U9IIwu2VejRFY20oCRM7DwLBaoq1KfJhPi6O8E1qBKXQmAiAW6RjxuvC2G7vEuy5
c3SK5WNGNJvc9pL3/LdeNOsE54CgUg==
=d2/c
-----END PGP SIGNATURE-----

--zIIc3PTvrlmoPyW8GokxhDdJHUNaKZDcS--

--===============0605279353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0605279353==--
