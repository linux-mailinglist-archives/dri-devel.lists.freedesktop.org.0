Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBD98D08A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D6610E6E7;
	Wed,  2 Oct 2024 09:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="B1s0I5yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6110E6E7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:55:37 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 09E911C00AB; Wed,  2 Oct 2024 11:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1727862936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xVFQhl1IXGjm6FdN7IB9MwRQN5m8UNmBJeC5esI3Mos=;
 b=B1s0I5yPlzF/d6xsKvaj4iLqlUQ4x9YntyJ1Ek7CDFsjz+WTvoPMQLi2iQue/utjDMVgLv
 8LrHbMff704Y5pYOWpfKFaPwH8sXpoeI/zKfvPE4CD8Wxcs1GpL0hfEg5eYWDiq6yVndZP
 Bk8u5fhKxQEozgzogxP83uKYhV3ACU8=
Date: Wed, 2 Oct 2024 11:55:35 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
Message-ID: <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uaKVhuXPT4+1FXsI"
Content-Disposition: inline
In-Reply-To: <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uaKVhuXPT4+1FXsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "tuxedo_nb04_wmi_ab",
> > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table =3D tuxedo_nb04_wmi_ab_device_ids,
> > +	.probe =3D probe,
> > +	.remove =3D remove,
> > +	.no_singleton =3D true,
> > +};
> > +
> > +// We don't know if the WMI API is stable and how unique the GUID is f=
or this ODM. To be on the safe
> > +// side we therefore only run this driver on tested devices defined by=
 this list.
>=20
> Please limit comment length to 80 chars and since you need multiple lines=
=20
> here anyway, use the usual /* */ multiline comment formatting.

This driver needs to be split into generic part + hw specific part,
and reasonable kernel/user API needs to be defined for the generic
part. It is really too soon to tweak comment lengths.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--uaKVhuXPT4+1FXsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv0YlwAKCRAw5/Bqldv6
8uc3AJ9YfvVjpyV7vAX/h5mxLaYK816TWgCfXnY6WH/URGZR58rYfQMlwSibVb4=
=GCLD
-----END PGP SIGNATURE-----

--uaKVhuXPT4+1FXsI--
