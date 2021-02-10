Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB888316ADF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D590D6ECAC;
	Wed, 10 Feb 2021 16:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401D6ECAA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:14:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60C8DAC97;
 Wed, 10 Feb 2021 16:14:55 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
 <20200629090657.GN3278063@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
Message-ID: <31669899-3047-92aa-6b2a-a87b7177251f@suse.de>
Date: Wed, 10 Feb 2021 17:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20200629090657.GN3278063@phenom.ffwll.local>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1669086393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1669086393==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hTWJvh9mbW2PYokMdITrAxucsWu2BYmiL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hTWJvh9mbW2PYokMdITrAxucsWu2BYmiL
Content-Type: multipart/mixed; boundary="nWtHMFgY1dvd8mTqzNrNT8JMJTVAcvKNb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Message-ID: <31669899-3047-92aa-6b2a-a87b7177251f@suse.de>
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
 <20200629090657.GN3278063@phenom.ffwll.local>
In-Reply-To: <20200629090657.GN3278063@phenom.ffwll.local>

--nWtHMFgY1dvd8mTqzNrNT8JMJTVAcvKNb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.06.20 um 11:06 schrieb Daniel Vetter:
>=20
>> +					   ARRAY_SIZE(simplekms_formats),
>> +					   simplekms_format_modifiers,
>> +					   connector);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_mode_config_reset(dev);
>=20
> This breaks fastboot. I think ideally we'd have the state represent
> everything is on, and allocate an fb + buffer with the current contents=
 of
> the framebuffer. Since we can allocate an fb that matches this shouldn'=
t
> be a problem, just a raw memcpy_fromio should do the job.
>=20
> Having a nice new simplekms drm driver and then losing fastboot feels l=
ike
> slightly off tradeoff.
>=20
> Maybe in a follow-up patch, but before fbcon setup? Since ideally fbcon=

> also takes over the already existing framebuffer we allocated, so that =
as
> long as nothing clears the fb (i.e. fbcon is quiet) we'd preserve the
> original framebuffer throughout the boot-up sequence.

I recently looked at how to implement this and it seems fairly complicate=
d.

What we want it to adopt the current mode config into fbcon (and=20
probably other in-kernel clients). The kernel client code uses it's own=20
file instance to allocate the framebuffer objects against. So we cannot=20
read-out the framebuffer state here. We'd ideally do this in the fbdev co=
de.

I read through the proposal for read-out helpers. i915 seems to have=20
lots of special cases. Can we adopt a simplified version that is just=20
good enough to get the initial state for fbdev?

Best regards
Thomas

>=20
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Init / Cleanup
>> + */
>> +
>> +static void simplekms_device_cleanup(struct simplekms_device* sdev)
>> +{
>> +	struct drm_device *dev =3D &sdev->dev;
>> +
>> +	drm_dev_unregister(dev);
>=20
> I'd inline this, I guess there was once more before you switched
> everything over to devm_
>=20
>> +}
>> +
>> +static struct simplekms_device *
>> +simplekms_device_create(struct drm_driver *drv, struct platform_devic=
e *pdev)
>> +{
>> +	struct simplekms_device *sdev;
>> +	int ret;
>> +
>> +	sdev =3D devm_drm_dev_alloc(&pdev->dev, drv, struct simplekms_device=
,
>> +				  dev);
>> +	if (IS_ERR(sdev))
>> +		return ERR_CAST(sdev);
>> +	sdev->pdev =3D pdev;
>> +
>> +	ret =3D simplekms_device_init_fb(sdev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +	ret =3D simplekms_device_init_mm(sdev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +	ret =3D simplekms_device_init_modeset(sdev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return sdev;
>> +}
>> +
>> +/*
>> + * DRM driver
>> + */
>> +
>> +DEFINE_DRM_GEM_FOPS(simplekms_fops);
>> +
>> +static struct drm_driver simplekms_driver =3D {
>> +	DRM_GEM_SHMEM_DRIVER_OPS,
>> +	.name			=3D DRIVER_NAME,
>> +	.desc			=3D DRIVER_DESC,
>> +	.date			=3D DRIVER_DATE,
>> +	.major			=3D DRIVER_MAJOR,
>> +	.minor			=3D DRIVER_MINOR,
>> +	.driver_features	=3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>> +	.fops			=3D &simplekms_fops,
>> +};
>> +
>> +/*
>> + * Platform driver
>> + */
>> +
>> +static int simplekms_probe(struct platform_device *pdev)
>> +{
>> +	struct simplekms_device *sdev;
>> +	struct drm_device *dev;
>> +	int ret;
>> +
>> +	sdev =3D simplekms_device_create(&simplekms_driver, pdev);
>> +	if (IS_ERR(sdev))
>> +		return PTR_ERR(sdev);
>> +	dev =3D &sdev->dev;
>> +
>> +	ret =3D drm_dev_register(dev, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int simplekms_remove(struct platform_device *pdev)
>> +{
>> +	struct simplekms_device *sdev =3D platform_get_drvdata(pdev);
>> +
>> +	simplekms_device_cleanup(sdev);
>=20
> If you add the ->disable hook then a comment here that we don't want to=

> shut down to allow fastboot would be nice.
>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver simplekms_platform_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "simple-framebuffer", /* connect to sysfb */
>> +	},
>> +	.probe =3D simplekms_probe,
>> +	.remove =3D simplekms_remove,
>> +};
>> +
>> +module_platform_driver(simplekms_platform_driver);
>> +
>> +MODULE_DESCRIPTION(DRIVER_DESC);
>> +MODULE_LICENSE("GPL v2");
>> --=20
>> 2.27.0
>>
>=20
> Cheers, Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--nWtHMFgY1dvd8mTqzNrNT8JMJTVAcvKNb--

--hTWJvh9mbW2PYokMdITrAxucsWu2BYmiL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAkBn4FAwAAAAAACgkQlh/E3EQov+Bo
aBAApTkgXbTbi+2ZBiInPRSrqo8wbvH/gDXacx0OxjhfFgZdwrmBoqm7ov0fK+C9rMw2pUccP1IR
Jx3JHF5Lhiyui2H3FD+IiP5pMrvTQX+mXh5mmxWBMBi7FeGLfyCC8gzr3NkEJzpiz3IifrfF1FZa
+G+/j2yRloGa+aUDO8CAF/xgU1ZMb9Dz/5bNiXKC1Zu+sV7u5NymJTtUwXwsJyVGl4KWEuPFtKRo
s6pYy+5v0MZw6YpivYoqcBxxc6SteanCVb0046liZUQi1pB4zwsdCV9JB8IgjyVnotqVT0ZVg6vO
7DiFFrILjGAqyKCZw1Z1zefWlffJyFiy5g83dm3Eh3eY+ZEUU1Kna63VBbccTYbVZvRqcbTZRR8q
HQ8qN3D2HheGnRI5jGMwgdUSgE/r7ICGFSmey2I03KM74CZC58P6oiLGcwtjJgpESMnuYqIGeBSI
7kXtmFcwgn/cmSR8m0mNShuYziT+H4fPKquqRFkg6b+r42zyS8d9KB3mkZT8dGNwn9z+1rIdeDlr
ayDCwjTUiUI8XH8+tR4PfHdrkJKvyfZHq8j7lN04x50xpDP2luiHSn7XcGsv+WpxVt7pTByn3uUb
OYCQN3WQg29Txe9OxUZfZTlWs3S9rwbRyhFZqhlwIDWvxKrqmweJvA8nf7PfR3VqrRwlwDzIPdfH
vIU=
=ZOVn
-----END PGP SIGNATURE-----

--hTWJvh9mbW2PYokMdITrAxucsWu2BYmiL--

--===============1669086393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1669086393==--
