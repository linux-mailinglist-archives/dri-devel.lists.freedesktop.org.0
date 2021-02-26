Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33761326887
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 21:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AE86E0D4;
	Fri, 26 Feb 2021 20:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2296E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 20:33:16 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 29B5B1C0B8A; Fri, 26 Feb 2021 21:33:13 +0100 (CET)
Date: Fri, 26 Feb 2021 21:33:12 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210226203312.GA3379@duo.ucw.cz>
References: <20210226092648.4584-1-tzimmermann@suse.de>
 <YDkBuu0AhZy+C/Y/@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YDkBuu0AhZy+C/Y/@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>, hdegoede@redhat.com, stern@rowland.harvard.edu,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 sean@poorly.run, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1161214712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1161214712==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> > +	struct device *dmadev;
> > +	struct drm_gem_object *obj;
> > +
> > +	if (!dev_is_usb(dev->dev))
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	dmadev =3D usb_intf_get_dma_device(to_usb_interface(dev->dev));
> > +	if (drm_WARN_ONCE(dev, !dmadev, "buffer sharing not supported"))
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	obj =3D drm_gem_prime_import_dev(dev, dma_buf, dmadev);
> > +
> > +	put_device(dmadev);
>=20
> Just realized there's another can of worms here because dma_buf_attach
> does not refcount the struct device. But the dma_buf can easily outlive
> the underlying device, at least right now.
>=20
> We should probably require that devices get rid of all their mappings in
> their hotunplug code.
>=20
> Ofc now that we pick some random other device struct this gets kinda
> worse.
>=20
> Anyway, also just another pre-existing condition that we should worry
> about here. It's all still a very bad hack.

This is actually regression fix if I understand this correctly. Bug
means udl is unusable, so that's kind of bad.

Should we revert the original commit causing this while this get
sorted out?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDlbCAAKCRAw5/Bqldv6
8j4pAJ4pMO1Nkx0d7xHie+0D2+0Scx6kHgCeOO4KKjPOZuK7ZRg1nTfB7wz7+Rc=
=n8h1
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============1161214712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1161214712==--
