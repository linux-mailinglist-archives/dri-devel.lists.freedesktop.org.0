Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0616EB46
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 17:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D706EB42;
	Tue, 25 Feb 2020 16:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815576EB40;
 Tue, 25 Feb 2020 16:21:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBFEBB1BA;
 Tue, 25 Feb 2020 16:21:55 +0000 (UTC)
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>
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
Message-ID: <34074e40-a387-d4b7-a158-22c3f9160019@suse.de>
Date: Tue, 25 Feb 2020 17:21:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0890535007=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0890535007==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QMVIA3zE0V882w7y34I10uDDzcME7UlfX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QMVIA3zE0V882w7y34I10uDDzcME7UlfX
Content-Type: multipart/mixed; boundary="5V10SwBId8ThybYn3z7mowAnlFkOIfUkR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Message-ID: <34074e40-a387-d4b7-a158-22c3f9160019@suse.de>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>
In-Reply-To: <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>

--5V10SwBId8ThybYn3z7mowAnlFkOIfUkR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.20 um 17:06 schrieb Ilia Mirkin:
> On Tue, Feb 25, 2020 at 10:59 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> Non-KMS drivers store state in struct drm_driver. This bloats the
>> structure for KMS drivers and prevents it from being declared with
>> 'static const' qualifiers. Moving the non-KMS state into a separate
>> data structure resolves this.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_drv.c             | 4 ++++
>>  drivers/gpu/drm/i810/i810_drv.c       | 4 ++++
>>  drivers/gpu/drm/mga/mga_drv.c         | 4 ++++
>>  drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++++
>>  drivers/gpu/drm/r128/r128_drv.c       | 4 ++++
>>  drivers/gpu/drm/savage/savage_drv.c   | 4 ++++
>>  drivers/gpu/drm/sis/sis_drv.c         | 4 ++++
>>  drivers/gpu/drm/tdfx/tdfx_drv.c       | 4 ++++
>>  drivers/gpu/drm/via/via_drv.c         | 4 ++++
>>  include/drm/drm_drv.h                 | 3 +++
>>  include/drm/drm_legacy.h              | 6 ++++++
>>  11 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7b1a628d1f6e..4ba0df097602 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -625,6 +625,10 @@ int drm_dev_init(struct drm_device *dev,
>>         if (WARN_ON(!parent))
>>                 return -EINVAL;
>>
>> +       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
>> +           WARN_ON(!driver->legacy))
>> +               return -EINVAL;
>> +
>>         kref_init(&dev->ref);
>>         dev->dev =3D get_device(parent);
>>         dev->driver =3D driver;
>> diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i8=
10_drv.c
>> index 0e53a066d4db..55f17f00bae9 100644
>> --- a/drivers/gpu/drm/i810/i810_drv.c
>> +++ b/drivers/gpu/drm/i810/i810_drv.c
>> @@ -56,6 +56,9 @@ static const struct file_operations i810_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D i810_legacy_state {
>=20
> Does this compile? I might have assumed this would need to be

I compiled an tested this patchset. But apparently I sent an old patch
or something went wrong somewhere.  Thanks for pointing this out. I'll
resend a fixed version.

Best regards
Thomas

>=20
> static struct drm_legacy_state i810_legacy_state =3D {
>=20
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER=
_LEGACY,
>>         .dev_priv_size =3D sizeof(drm_i810_buf_priv_t),
>> @@ -71,6 +74,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &i810_legacy_state,
>>  };
>>
>>  static struct pci_driver i810_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_d=
rv.c
>> index 71128e6f6ae9..4865982d949c 100644
>> --- a/drivers/gpu/drm/mga/mga_drv.c
>> +++ b/drivers/gpu/drm/mga/mga_drv.c
>> @@ -53,6 +53,9 @@ static const struct file_operations mga_driver_fops =
=3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D mga_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_LEGACY |
>> @@ -78,6 +81,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &mga_legacy_state,
>>  };
>>
>>  static struct pci_driver mga_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/n=
ouveau/nouveau_drm.c
>> index 6b1629c14dd7..c88cf32e521c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -1103,6 +1103,11 @@ nouveau_driver_fops =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>> +static struct drm_legacy_state nouveau_legacy_state{
>> +};
>> +#endif
>> +
>>  static struct drm_driver
>>  driver_stub =3D {
>>         .driver_features =3D
>> @@ -1150,6 +1155,9 @@ driver_stub =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>> +       .legacy =3D &nouveau_legacy_state,
>> +#endif
>>  };
>>
>>  static struct pci_device_id
>> diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r1=
28_drv.c
>> index b7a5f162ebae..ecece3a48d93 100644
>> --- a/drivers/gpu/drm/r128/r128_drv.c
>> +++ b/drivers/gpu/drm/r128/r128_drv.c
>> @@ -57,6 +57,9 @@ static const struct file_operations r128_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D r128_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_LEGAC=
Y |
>> @@ -81,6 +84,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &r128_legacy_state,
>>  };
>>
>>  int r128_driver_load(struct drm_device *dev, unsigned long flags)
>> diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/sav=
age/savage_drv.c
>> index 799bd11adb9c..c0a7146fbde1 100644
>> --- a/drivers/gpu/drm/savage/savage_drv.c
>> +++ b/drivers/gpu/drm/savage/savage_drv.c
>> @@ -47,6 +47,9 @@ static const struct file_operations savage_driver_fo=
ps =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D savage_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER=
_LEGACY,
>> @@ -65,6 +68,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &savage_legacy_state,
>>  };
>>
>>  static struct pci_driver savage_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_d=
rv.c
>> index 2c54b33abb54..1c794a82c8e6 100644
>> --- a/drivers/gpu/drm/sis/sis_drv.c
>> +++ b/drivers/gpu/drm/sis/sis_drv.c
>> @@ -99,6 +99,9 @@ static void sis_driver_postclose(struct drm_device *=
dev, struct drm_file *file)
>>         kfree(file_priv);
>>  }
>>
>> +static struct drm_legacy_state =3D sis_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_USE_AGP | DRIVER_LEGACY,
>>         .load =3D sis_driver_load,
>> @@ -116,6 +119,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &sis_legacy_state,
>>  };
>>
>>  static struct pci_driver sis_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/td=
fx_drv.c
>> index ab699bf0ac5c..17aa93d82d6b 100644
>> --- a/drivers/gpu/drm/tdfx/tdfx_drv.c
>> +++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
>> @@ -56,6 +56,9 @@ static const struct file_operations tdfx_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D tdfx_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_LEGACY,
>>         .fops =3D &tdfx_driver_fops,
>> @@ -65,6 +68,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &tdfx_legacy_state,
>>  };
>>
>>  static struct pci_driver tdfx_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_d=
rv.c
>> index 5da38082821f..22113d93ecdd 100644
>> --- a/drivers/gpu/drm/via/via_drv.c
>> +++ b/drivers/gpu/drm/via/via_drv.c
>> @@ -71,6 +71,9 @@ static const struct file_operations via_driver_fops =
=3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D via_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_LEGACY,
>> @@ -97,6 +100,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &via_legacy_state,
>>  };
>>
>>  static struct pci_driver via_pci_driver =3D {
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 97109df5beac..94078af0cc28 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -40,6 +40,7 @@ struct dma_buf_attachment;
>>  struct drm_display_mode;
>>  struct drm_mode_create_dumb;
>>  struct drm_printer;
>> +struct drm_legacy_state;
>>
>>  /**
>>   * enum drm_driver_feature - feature flags
>> @@ -599,6 +600,8 @@ struct drm_driver {
>>         const struct file_operations *fops;
>>
>>         /* Everything below here is for legacy driver, never use! */
>> +       struct drm_legacy_state *legacy;
>> +
>>         /* private: */
>>
>>         /* List of devices hanging off this driver with stealth attach=
=2E */
>> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
>> index dcef3598f49e..c98a29e1c2b3 100644
>> --- a/include/drm/drm_legacy.h
>> +++ b/include/drm/drm_legacy.h
>> @@ -49,6 +49,12 @@ struct pci_driver;
>>   * you're doing it terribly wrong.
>>   */
>>
>> +/**
>> + * State for non-KMS drivers.
>> + */
>> +struct drm_legacy_state {
>> +};
>> +
>>  /**
>>   * DMA buffer.
>>   */
>> --
>> 2.25.0
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--5V10SwBId8ThybYn3z7mowAnlFkOIfUkR--

--QMVIA3zE0V882w7y34I10uDDzcME7UlfX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5VSZ8ACgkQaA3BHVML
eiNlogf/dVKmk+42yLd3D/olzk7T6Uv7wsxQhHKr7uerjfuCv2ctsHy6MGv2d4td
2OACTbVmEeyHLk3TpqaggkMQQKTxCD1zcrBw1ed+oWGurjjW3NNrE91v4gPLOjMV
Jzz6/jpTtuKhnrdfpLBIT2yTvg5kV5+MUD9MNkviH5c3BWuTiFJJjFo2bT4q7kF1
i54DwXBr0evcDUlWIATK80NPTdx2n7vog64bc4laqMZS5tFvuWNV+W1CZliAJLzy
VAIv2S1G0lprsv/egIwB8r1C1680DNdFZGmvVOrXo7uWGJX0dHNTbvQkZY1eczLu
w3Kk6zoZSBaBb8PYkM/AHm3tG2gl5A==
=Txbh
-----END PGP SIGNATURE-----

--QMVIA3zE0V882w7y34I10uDDzcME7UlfX--

--===============0890535007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0890535007==--
